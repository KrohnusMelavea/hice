from typing import IO
import os
import json
from common import *

PHP_KEY = "php"

def startup_php(file_handler:IO, processes:dict):
 pid = startup_process("php-cgi.exe", "-b", "127.0.0.1:9000", "-c", "c:/vendor/php/php.ini-development", cwd="c:/vendor/php")
 processes[PHP_KEY] = pid
 save_processes(file_handler, processes)

def main():
 if os.path.exists(PROCESSES_PATH):
  with open(PROCESSES_PATH, "r+") as file_handler:
   processes_raw = file_handler.read()
   processes = json.loads(processes_raw)
   if not process_exists(processes, PHP_KEY):
    startup_php(file_handler, processes)
 else:
  with open(PROCESSES_PATH, "w") as file_handler:
   processes = dict()
   startup_php(file_handler, processes)

if __name__ == "__main__":
 main()