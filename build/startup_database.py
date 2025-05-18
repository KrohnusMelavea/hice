from typing import IO
import os
import json
from common import *

DATABASE_PATH = "c:/vendor/mysql/bin/mysqld.exe"
DATABASE_KEY = "database"

def startup_database(file_handler:IO, processes:dict):
 pid = startup_process(DATABASE_PATH, cwd="/".join(DATABASE_PATH.split("/")[:-2]))
 processes[DATABASE_KEY] = pid
 save_processes(file_handler, processes)

def main():
 if os.path.exists(PROCESSES_PATH):
  with open(PROCESSES_PATH, "r+") as file_handler:
   processes_raw = file_handler.read()
   processes = json.loads(processes_raw)
   if not process_exists(processes, DATABASE_KEY):
    startup_database(file_handler, processes)
 else:
  with open(PROCESSES_PATH, "w") as file_handler:
   processes = dict()
   startup_database(file_handler, processes)

if __name__ == "__main__":
 main()