import uuid
import clipboard

uuidv4 = f"0x{str(uuid.uuid4()).replace('-', '')}"

clipboard.copy(uuidv4)
print(uuidv4)