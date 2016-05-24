"""
Class representation of a configuration file

"""

import os

class File:

    def __init__(self, name, location, envs, ENV):
        """
        string name -- the name of the file. eg. ".vimrc"
        string location -- the location of the file. eg. "home", ".config/fish/"
        array<string> envs -- a list of environments, a subset of ['osx', 'desktop', 'server']
        string ENV -- current environment. eg. "server"
        """
        self.name = name
        self.location = location
        self.envs = envs
        # the absolute path of the destination. eg. /home/lawrence/.vimrc
        self.dst = File.get_dst_path(name, location)
        # RELATIVE path of the source file
        self.src = File.get_src_path(name, ENV)
        # Ignore this file if it is True
        self.ignored = False
        # The file will be replaced if it is true
        self.to_be_replaced = False

    def ignore(self):
        """
        ignore this file
        """
        self.ignored = True

    def will_be_replaced(self):
        """
        The original file will be deleted
        """
        self.to_be_replaced = True

    def delete(self):
        """
        Delete the orignal file
        """
        try:
            os.remove(self.dst)
        except:
            print(self.dst + " does not exist")
        else:
            print(self.dst + " is deleted")

    def link(self, repo_dir):
        """
        Make a symbolic link to user's home directory
        string repo_dir -- the absolute path of the repo
        """
        print("Creating Symbolic link between " +
                self.src +
                " and " +
                self.dst)

        os.symlink(os.path.join(repo_dir, self.src), self.dst)

    @staticmethod
    def get_dst_path(name, location):
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

    @staticmethod
    def get_src_path(name, ENV):
        if (ENV == "osx"):
            folder = "desktop"
        else:
            folder = ENV
        return os.path.join('files', folder, name)


if (__name__ == '__main__'):
    f = File("name", "home", ["osx"])
    print(f.dst)
