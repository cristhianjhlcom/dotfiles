import random

def greet(name):
    random_number = random.randint(1, 10)
    return f"Hello {name}, {random_number}"


print(greet("Cristian"))
print(greet("Jesus"))
print(greet("Ihasaku"))

