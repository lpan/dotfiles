import os

from linker.exceptions import InvalidMapping
from linker.exceptions import SrcNotExist
from linker.exceptions import DstExists


class Dotfile:

    def __init__(self, mapping):
        try:
            self._name = mapping['name']
            dst = mapping['dst']
        except KeyError:
            raise InvalidMapping

        cwd = os.getcwd()

        self._src = os.path.join(cwd, 'files', self._name)
        self._dst = os.path.expandvars(dst)

    def __str__(self):
        return self._name

    def _check(self):
        src, dst = self._src, self._dst

        if not os.path.isfile(src):
            raise SrcNotExist(src)

        if os.path.isfile(dst):
            raise DstExists(dst)

        # remove dst if it is a broken symlink
        if os.path.islink(dst) and not os.path.exists(os.readlink(dst)):
            os.remove(dst)

    def link(self):
        self._check()

        os.symlink(self._src, self._dst)
        print('linked {} to {}'.format(self._src, self._dst))
