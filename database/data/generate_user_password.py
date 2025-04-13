import random
import string
import clipboard

mysql_permitted_special_characters = "#!~%^*_-+=?{}()<>|.,;"
mysql_password_character_set = (
 string.ascii_letters +
 string.digits +
 mysql_permitted_special_characters
)
mysql_password = ''.join(random.sample(mysql_password_character_set, k=32))

clipboard.copy(mysql_password)
print(mysql_password)
