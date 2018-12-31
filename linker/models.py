import abc
import os

from linker.exceptions import InvalidMapping
from linker.exceptions import SrcNotExist
from linker.exceptions import DstExists


class Dotfile(abc.ABC):
    """
    A Dotfile can be a plain UNIX file or a directory. It has to be declared in
    /mapping.json and exists in /files/
    """

    def __init__(self, mapping):
        try:
            src = mapping['src']
            dst = mapping['dst']
        except KeyError:
            raise InvalidMapping

        self._name = os.path.basename(src)

        self._src = os.path.join(os.getcwd(), 'files', src)
        self._dst = os.path.expandvars(dst)

    def __str__(self):
        return self._name

    @abc.abstractmethod
    def link(self):
        pass


class File(Dotfile):
    """
    File represents a plain file
    """

    def link(self):
        src, dst = self._src, self._dst

        if not os.path.isfile(src):
            raise SrcNotExist(src)

        if os.path.isfile(dst):
            raise DstExists(dst)

        # remove dst if it is a broken symlink
        if os.path.islink(dst) and not os.path.exists(os.readlink(dst)):
            os.remove(dst)

        os.symlink(src, dst)
        print('linked {} to {}'.format(src, dst))
