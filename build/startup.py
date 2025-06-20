from core import *
import os
import json

DEPENDENCIES_PATH = "dependencies.json"
CALLABLES = {
 "php": startup_php,
 "nginx": startup_nginx,
 "database": startup_database
}

def read_dependencies() -> dict:
 with open(DEPENDENCIES_PATH, "r") as file_handler:
  dependencies_raw = file_handler.read()
  dependencies = json.loads(dependencies_raw)
  return dependencies

def startup(file_handler:IO, processes:dict):
 completed_processes = []
 dependencies = read_dependencies()
 while True:
  count = 0
  for key in dependencies:
   if key in completed_processes:
    continue
   
   if key in processes and psutil.pid_exists(processes[key]):
    completed_processes.append(key)
    print(f"Service ({key}) Already Running: {processes[key]}")
   elif all(dependency in completed_processes for dependency in dependencies[key]):
    CALLABLES[key](file_handler, processes)
    completed_processes.append(key)
    count += 1
    print(f"Service ({key}) Started: {processes[key]}")
  if count == 0:
   break
    
    
def main():
 print("--------- STARTUP ----------")
 if os.path.exists(PROCESSES_PATH):
  with open(PROCESSES_PATH, "r+") as file_handler:
   processes_raw = file_handler.read()
   processes = json.loads(processes_raw)
   startup(file_handler, processes)
 else:
  with open(PROCESSES_PATH, "w") as file_handler:
   processes = dict()
   startup(file_handler, processes)
 print("--------- STARTUP ----------")
   
if __name__ == "__main__":
 try:
  main()
 except Exception as exception:
  print(exception)