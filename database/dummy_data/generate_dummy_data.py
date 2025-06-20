import uuid
import random
import clipboard

address_components = [
 [str(i) for i in range(1, 20)],
 ["place", "otherplace"],
 ["way", "street", "ave"]
]

def generate_address():
 return " ".join(
  random.choice(address_component)
  for address_component in address_components
 )

def generate_property():
 bedroom_count = random.randint(1, 5)
 bathroom_count = random.randint(1, 5)
 room_count = bedroom_count + bathroom_count
 return (
  uuid.uuid4(),
  generate_address(),
  random.randint(100, 10000),
  random.randint(1, 3),
  bedroom_count,
  bathroom_count,
  room_count,
  random.choices(['a', 'h'], weights=[1, 9], k=1)[0]
 )
 
def generate_property_listing(property_id):
 return (
  uuid.uuid4(),
  property_id,
  random.randint(500000, 50000000),
  random.choices(['s', 'r', 'a'], [7, 2, 1])[0]
 )

def generate_property_text(property):
 return f" (\n  UUID_TO_BIN('{property[0]}'),\n  '{property[1]}',\n  {property[2]},\n  {property[3]},\n  {property[4]},\n  {property[5]},\n  {property[6]},\n  '{property[7]}'\n )"
def generate_property_listing_text(property_listing):
 return f" (\n  UUID_TO_BIN('{property_listing[0]}'),\n  UUID_TO_BIN('{property_listing[1]}'),\n  {property_listing[2]},\n  '{property_listing[3]}'\n )"

properties = [
 [str(entry) for entry in generate_property()]
 
 for _ in range(100)
]
property_listings = [
 [str(entry) for entry in generate_property_listing(property[0])]
 
 for property in properties
]

ps = ',\n'.join(generate_property_text(property) for property in properties)
clipboard.copy(ps)
print(ps)
pls = ',\n'.join(generate_property_listing_text(property_listing) for property_listing in property_listings)
clipboard.copy(pls)