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
            files.append(File(file['name'], file['location'], file['env']))

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

def get_path(location, name):
    """
    Get the absolute path of the destination
    ('home', '.vimrc') => '/home/lawrence/.vimrc')
    ('.config/fish', 'config.fish') => 'home/lawrence/.config/fish/config.fish'
    string location -- location of the file (either "home", or a relative path)
    string name -- name of the file
    returns string (an absolute path)
    """
    if (location == 'home'):
        return os.path.join(os.environ['HOME'], name)

    return os.path.join(location, name)

def ignore_files(files):
    """
    Check if a file already exists in the given path.
    If so, ask user if he or she wants to replace it.
    Call ignore() on file if not to replace
    File file -- file object
    """
    for file in files:
        if (check_file_exists(get_path(file.location, file.name))):
            # if file exists, ask user if he wants to replace it
            if (not confirm(file.name + " already exists. Replace it?",
                            file.name + " will be replaced",
                            file.name + " will be kept")):
                # if user says no, this particular file will be ignored
                file.ignore()
