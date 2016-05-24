import json, os

from utils.confirmation import confirm

from models.file import File

def get_data(path, env):
    """Extract information from the files.json
    string path -- the relative path of the json file
    string env -- the environment, one of ['osx', 'desktop', 'server']
    return array<File>
    """

    files = []

    with open(path) as files_data:
        # Load an array of config files to variable files
        buffer = json.load(files_data)

    for file in buffer['data']:
        if env in file['env']:
            files.append(File(file['name'], file['location'], file['env'], env))

    return files

def check_file_exists(path):
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
    array<File> files -- a collection of File objects
    """
    for file in files:
        if (check_file_exists(file.dst)):
            # if file exists, ask user if he wants to replace it
            if (not confirm(file.name + " already exists. Replace it?",
                            file.name + " will be replaced",
                            file.name + " will be kept")):
                # if user says no, this particular file will be ignored
                file.ignore()
            else:
                file.will_be_replaced()

def make_symlinks(files, path):
    """
    Delete old files then make symbolic links
    array<File> files -- a collection of File objects
    string path -- the absolute path of the repository
    """
    for file in files:
        if (not file.ignored):
            # Proceed only if it is not ignored
            if (file.to_be_replaced):
                # If the file will be replaced, remove the old one
                file.delete()
            # Create the symbolic link
            file.link(path)
