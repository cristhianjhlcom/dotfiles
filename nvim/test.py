import random

def greeting(name):
    random_number = random.randint(1, 10)
    return f"Hello {name}, {random_number}"


print(greeting("Cristian"))
