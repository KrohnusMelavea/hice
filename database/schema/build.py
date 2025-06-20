import os
import time
import mysql.connector

SCHEMA_PATH = "database/schema/"
DATA_PATH = "database/data/"
DUMMY_DATA_PATH = "database/dummy_data/"

def read_file(file_path:str) -> str:
 with open(file_path, "r") as file_handler:
  return file_handler.read()
def read_schema_script(file_name:str) -> str:
 return read_file(f"{SCHEMA_PATH}{file_name}")
def read_data_script(file_name:str) -> str:
 return read_file(f"{DATA_PATH}{file_name}") 
def read_dummy_data_script(file_name:str) -> str:
 return read_file(f"{DUMMY_DATA_PATH}{file_name}")

def get_schema_script_prefix_ranking(schema_script_name: str) -> int:
 SCHEMA_SCRIPT_PREFIXES = "TB_", "FN_", "SP_", "TG_"
 return sum(
  index * schema_script_name.startswith(schema_script_prefix) 
  for index, schema_script_prefix in enumerate(SCHEMA_SCRIPT_PREFIXES)
 )

def get_script_dependencies(schema_script_names: list[str], schema_scripts: list[str]) -> list[list[int]]:
 return [
  [
   script_script_name_index
   for script_script_name_index, schema_script_name in enumerate(schema_script_names)
   if f"`{schema_script_name.split('.')[0]}`" in schema_script and schema_script_index != script_script_name_index
  ]
  for schema_script_index, schema_script in enumerate(schema_scripts)
 ]

def is_all_schema_script_dependencies_met(schema_script_execution_order: list[int], schema_script_dependencies: list[int]) -> bool:
 return sum(
  1 
  for schema_script_dependency in schema_script_dependencies 
  if schema_script_dependency in schema_script_execution_order
 ) == len(schema_script_dependencies) 
 
def get_script_execution_order(schema_script_names: list[str], schema_scripts_dependencies: list[list[str]]) -> list[int]:
 schema_script_execution_order: list[int] = []
 while len(schema_script_execution_order) != len(schema_script_names):
  before_length = len(schema_script_execution_order)
  for index, schema_script_dependencies in enumerate(schema_scripts_dependencies):
   if index not in schema_script_execution_order and is_all_schema_script_dependencies_met(schema_script_execution_order, schema_script_dependencies):
    schema_script_execution_order.append(index)
  if len(schema_script_execution_order) == before_length:
   print("No progress after iteration. Quitting.")
   break
 
 return schema_script_execution_order

schema_script_names = [file_name for file_name in os.listdir("database/schema") if file_name.endswith(".sql")]

data_scripts = (
 #"mysql.user.sql",
 "TB_DatabaseUser.sql",
 "TB_User.sql"
)
dummy_data_scripts = (
 "TB_User.sql",
 "TB_Property.sql",
 "TB_PropertyListing.sql"
)

schema_scripts = [
 read_schema_script(schema_script_name) 
 for schema_script_name in schema_script_names
]
schema_script_dependencies = get_script_dependencies(schema_script_names, schema_scripts)
schema_script_execution_order = get_script_execution_order(schema_script_names, schema_script_dependencies)

schema_script_names = [schema_script_names[index] for index in schema_script_execution_order]

schema_connection = mysql.connector.Connect(
 host="127.0.0.1",
 user="root",
 autocommit=False
)
schema_connection.cmd_query("DROP DATABASE IF EXISTS DB_Hice")
schema_connection.cmd_query("CREATE DATABASE DB_Hice CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci'")
schema_connection.cmd_init_db("DB_Hice")
cursor = schema_connection.cursor()

schema_execution_start = time.time()
for script in schema_script_names:
 try:
  start_execute_time = time.time()
  cursor.execute(read_schema_script(script))
  print(f"Executed Schema Script (\"{script}\"): {int((time.time() - start_execute_time) * 1000)}ms")
 except Exception as error:
  print(f"Failed to Execute Schema Script (\"{script}\"):\n{error}")
schema_connection.commit()
print(f"Total Schema Execution Time: {int((time.time() - schema_execution_start) * 1000)}ms")

data_execution_start = time.time()
for script in data_scripts:
 try:
  start_execute_time = time.time()
  cursor.execute(read_data_script(script))
  print(f"Executed Data Script (\"{script}\"): {int((time.time() - start_execute_time) * 1000)}ms")
 except Exception as error:
  print(f"Failed to Execute Data Script (\"{script}\"):\n{error}")
schema_connection.commit()
print(f"Total Data Execution Time: {int((time.time() - data_execution_start) * 1000)}ms")

dummy_data_execution_start = time.time()
for script in dummy_data_scripts:
 try:
  start_execute_time = time.time()
  cursor.execute(read_dummy_data_script(script))
  print(f"Executed Dummy Data Script (\"{script}\"): {int((time.time() - start_execute_time) * 1000)}ms")
 except Exception as error:
  print(f"Failed to Execute Dummy Data Script (\"{script}\"):\n{error}")
schema_connection.commit()
print(f"Total Dummy Data Execution Time: {int((time.time() - dummy_data_execution_start) * 1000)}ms")

schema_connection.disconnect()
schema_connection.close()