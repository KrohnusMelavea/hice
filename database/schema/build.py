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

schema_scripts = (
 "TB_DatabaseUser.sql",
 "FN_GetCurrentDatabaseUserId.sql",
 "TB_User.sql",
 "TB_Session.sql",
 "FN_Login.sql",
 "FN_Logout.sql",
 "TB_File.sql",
 "TB_Property.sql",
 "TB_PropertyListing.sql",
 "TB_PropertySale.sql",
 "TB_Chat.sql",
 "TB_ChatMessage.sql",
 "TB_ChatMessageFile.sql",
 "TB_ChatMessageProperty.sql",
 "TB_UserHistory.sql",
 "TB_SessionHistory.sql",
 "TB_PropertyHistory.sql",
 "TB_PropertyListingHistory.sql",
 "TB_ChatMessageHistory.sql",
 "TB_ChatMessageFileHistory.sql",
 "TB_ChatMessagePropertyHistory.sql",
 "TG_UserInsert.sql",
 "TG_UserUpdate.sql",
 "TG_SessionInsert.sql",
 "TG_SessionUpdate.sql",
 "TG_PropertyInsert.sql",
 "TG_PropertyUpdate.sql",
 "TG_PropertyListingInsert.sql",
 "TG_PropertyListingUpdate.sql",
 "TG_PropertySaleInsert.sql",
 "TG_ChatMessageInsert.sql",
 "TG_ChatMessageUpdate.sql",
 "TG_ChatMessageFileInsert.sql",
 "TG_ChatMessageFileUpdate.sql",
 "TG_ChatMessagePropertyInsert.sql",
 "TG_ChatMessagePropertyUpdate.sql",
)
data_scripts = (
 "mysql.user.sql",
 "TB_DatabaseUser.sql"
)

schema_connection = mysql.connector.Connect(
 host="127.0.0.1",
 user="root",
 autocommit=False
)
schema_connection.cmd_query("DROP DATABASE IF EXISTS DB_Hice")
schema_connection.cmd_query("CREATE DATABASE DB_Hice CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci'")
schema_connection.cmd_init_db("DB_Hice")
schema_execution_start = time.time()
cursor = schema_connection.cursor()
for script in schema_scripts:
 try:
  start_execute_time = time.time()
  cursor.execute(read_schema_script(script))
  print(f"Executed Schema Script (\"{script}\"): {int((time.time() - start_execute_time) * 1000)}ms")
 except Exception as error:
  print(f"Failed to Execute Schema Script (\"{script}\"):\n{error}")
cursor.close()
print(f"Total Schema Execution Time: {int((time.time() - schema_execution_start) * 1000)}ms")

data_execution_start = time.time()
schema_connection.start_transaction()
cursor = schema_connection.cursor()
for script in data_scripts:
 try:
  start_execute_time = time.time()
  cursor.execute(read_data_script(script))
  print(f"Executed Data Script (\"{script}\"): {int((time.time() - start_execute_time) * 1000)}ms")
 except Exception as error:
  print(f"Failed to Execute Data Script (\"{script}\"):\n{error}")
schema_connection.rollback()
print(f"Total Data Execution Time: {int((time.time() - data_execution_start) * 1000)}ms")

schema_connection.disconnect()
schema_connection.close()