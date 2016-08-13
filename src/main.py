import sys
import os

from utils.confirmation import confirm
from utils.environment import get_env
from utils.fs import get_data, ignore_files, make_symlinks

# sort of a hack, get the last command line arg
ENV = get_env(sys.argv[-1])

# files => a list of file objects
files = get_data("../files/files.json", ENV)

# call ignore() on certain files
ignore_files(files)

# call remove_old() and link() on certain files
make_symlinks(files, os.path.join(os.getcwd(), ".."))
