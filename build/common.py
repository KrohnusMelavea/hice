from typing import IO
import os
import json
import psutil
import subprocess

PROCESSES_PATH = "process_ids.json"

def process_exists(processes:dict, process_key:str) -> bool:
 if process_key not in processes:
  return False
 pid = processes[process_key]
 pid_exists = psutil.pid_exists(pid)
 return pid_exists

def startup_process(*args, cwd=os.getcwd()) -> int:
 process = subprocess.Popen(args, cwd=cwd)
 return process.pid

def save_processes(file_handler:IO, processes:dict):
 file_handler.seek(0)
 file_handler.truncate(0)
 processes_raw = json.dumps(processes)
 file_handler.write(processes_raw)