"""
Class representation of a configuration file

"""

class File:

    def __init__(self, name, location, env):
        """
        string name -- the name of the file. eg. ".vimrc"
        string location -- the location of the fiel. eg. "~/.vimrc"
        array<string> env -- a list of environments
        """
        self.name = name
        self.location = location
        self.env = env
        # Ignore this file if it is True
        self.ignored = False

    def ignore(self):
        """
        ignore this file
        """
        self.ignored = True

    def link(self, env):
        """
        Make a symbolic link to user's home directory
        env -- environment, either "desktop", "server" or "mac"
        """

if (__name__ == '__main__'):
    f = File('name', 'path')
