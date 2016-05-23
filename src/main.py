import sys, os

from utils.confirmation import confirm
from utils.environment import get_env
from utils.fs import get_data, ignore_files

# sort of a hack, get the last command line arg
# ENV = get_env(sys.argv[-1])
HOME = os.environ['HOME']

files = get_data("../files/files.json")
ignore_files(files)
