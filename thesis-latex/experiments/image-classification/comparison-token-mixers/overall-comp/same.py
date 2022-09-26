from os import listdir
from os.path import isfile, join

onlyfiles = [f for f in listdir(".") if isfile(join(".", f))]

hashes = []
for file in onlyfiles:
    with open(file, "r") as content:
        hashed_file = hash(content.read())

        hashes.append(hashed_file)

for i in range(len(hashes)):
    for j in range(i, len(hashes)):
        if hashes[i] == hashes[j] and i != j:
            print("Two files match!!")
