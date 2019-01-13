import abc
import os

from linker.exceptions import InvalidMapping
from linker.exceptions import InvalidSrc
from linker.exceptions import InvalidDst


class Dotfile(abc.ABC):
    """
    A Dotfile can be a regular UNIX file or a directory. It has to be declared
    in /mapping.json and exists in /files/
    """

    def __init__(self, mapping):
        try:
            src = mapping['src']
            dst = mapping['dst']
        except KeyError as e:
            raise InvalidMapping('key {} not found in entry'.format(e))

        self._name = os.path.basename(src)

        self._src = os.path.join(os.getcwd(), 'files', src)
        self._dst = os.path.expandvars(dst)

        self._verify_src()

    def __str__(self):
        return self._name

    @abc.abstractmethod
    def _verify_src(self):
        pass

    @abc.abstractmethod
    def _link(self):
        pass

    def link(self):
        # verify src again just in case
        self._verify_src()
        self._link()


class File(Dotfile):
    """
    File represents a regular file
    """

    def _verify_src(self):
        src = self._src

        if not os.path.isfile(src):
            msg = '{} not exists or is not a regular file'.format(src)
            raise InvalidSrc(msg)

    def _link(self):
        src, dst = self._src, self._dst

        if os.path.exists(dst):
            msg = '{} already exists'.format(dst)
            raise InvalidDst(msg)

        # remove dst if it is a broken symlink
        if os.path.islink(dst) and not os.path.exists(os.readlink(dst)):
            os.remove(dst)

        # create parent directories if they don't exist already
        try:
            os.makedirs(os.path.dirname(dst), exist_ok=True)
        except Exception as e:
            msg = 'cannot create dst directory: {}'.format(e)
            raise InvalidDst(msg)

        os.symlink(src, dst)
        print('linked {} to {}'.format(self._src, self._dst))


class Directory(Dotfile):
    """
    Directory represents a "file" that can contain other files
    """

    def __init__(self, mapping):
        super().__init__(mapping)

        self._children = []
        for name in os.listdir(self._src):
            m = mapping.copy()
            m['src'] = os.path.join(mapping['src'], name)
            m['dst'] = os.path.join(mapping['dst'], name)

            self._children.append(File(m))

    def _verify_src(self):
        src = self._src

        if not os.path.isdir(src):
            msg = '{} not exists or is not a directory'.format(src)
            raise InvalidSrc(msg)

    def _link(self):
        dst = self._dst

        if os.path.exists(dst) and not os.path.isdir(dst):
            raise InvalidDst('{} is not a directory'.format(dst))

        for c in self._children:
            try:
                c.link()
            except (InvalidSrc, InvalidDst) as e:
                print('skipped linking {}: {}'.format(c, e))
