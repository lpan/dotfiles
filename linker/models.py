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
        if not os.path.isfile(self._src):
            raise SrcNotExist(self._src)

        if os.path.isfile(self._dst):
            raise DstExists(self._dst)

    def link(self):
        self._check()

        os.symlink(self._src, self._dst)
        print('linked {} to {}'.format(self._src, self._dst))
