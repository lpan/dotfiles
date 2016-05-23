import json

with open("../files/files.json") as files_data:
    # Load an array of config files to variable files
    files = json.load(files_data)["data"]

print(files[0])
