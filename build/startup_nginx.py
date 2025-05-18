from typing import IO
import os
import json
from common import *

NGINX_PATH = "c:/vendor/nginx/nginx.exe"
NGINX_KEY = "nginx"

def startup_nginx(file_handler:IO, processes:dict):
 pid = startup_process(NGINX_PATH, cwd="/".join(NGINX_PATH.split("/")[:-1]))
 processes[NGINX_KEY] = pid
 save_processes(file_handler, processes)

def main():
 if os.path.exists(PROCESSES_PATH):
  with open(PROCESSES_PATH, "r+") as file_handler:
   processes_raw = file_handler.read()
   processes = json.loads(processes_raw)
   if not process_exists(processes, NGINX_KEY):
    startup_nginx(file_handler, processes)
 else:
  with open(PROCESSES_PATH, "w") as file_handler:
   processes = dict()
   startup_nginx(file_handler, processes)

if __name__ == "__main__":
 main()