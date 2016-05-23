import json, os

from utils.confirmation import confirm

from models.file import File

def get_data(path):
    """Extract information from the files.json
    string path -- the relative path of the json file
    return array<File>
    """

    files = []

    with open(path) as files_data:
        # Load an array of config files to variable files
        buffer = json.load(files_data)

    for file in buffer['data']:
        files.append(File(file['name'], file['location'], file['env']))

    return files

def check_file_exist(path):
    """
    Check if a file exists
    path -- full path of a file or directory
    return bool
    """
    if (os.path.exists(path)):
        return True

    return False

def ignore_files(files):
    """
    Check if a file already exists in the given path.
    If so, ask user if he or she wants to replace it.
    Call ignore() on file if not to replace
    File file -- file object
    """
    for file in files:
        print(file.name)
        exists = os.path.exists(file.location)
        if (not confirm(file.name + " already exists. Replace it?",
                        file.name + " will be replaced by the new one",
                        file.name + " will be kept")):
            file.ignore()
