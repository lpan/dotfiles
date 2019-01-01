import os
import tempfile
import unittest

from linker.models import Directory
from linker.models import File

from linker.exceptions import InvalidSrc
from linker.exceptions import InvalidMapping


class Base(unittest.TestCase):

    def setUp(self):
        temp = tempfile.mkdtemp()
        os.chdir(temp)

        os.mkdir('files')
        os.mkdir('home')

        self.src = os.path.join(temp, 'files')
        self.home = os.path.join(temp, 'home')

    def touch(self, path):
        open(path, 'w').close()


class TestFile(Base):

    def test_happy_path(self):
        src = os.path.join(self.src, 'hello.txt')
        dst = os.path.join(self.home, 'hello.txt')

        self.touch(src)

        mapping = {
            'src': 'hello.txt',
            'dst': dst,
        }

        f = File(mapping)
        f.link()

        self.assertTrue(os.path.islink(dst))
        self.assertEqual(os.readlink(dst), src)

    def test_src_not_exist(self):
        dst = os.path.join(self.home, 'hello.txt')

        mapping = {
            'src': 'hello.txt',
            'dst': dst,
        }

        with self.assertRaises(InvalidSrc):
            File(mapping)


class TestDirectory(Base):

    def test_happy_path(self):
        src_dir = os.path.join(self.src, 'bin')
        dst_dir = os.path.join(self.home, 'bin')

        os.mkdir(src_dir)

        src = os.path.join(src_dir, 'hello.txt')
        dst = os.path.join(dst_dir, 'hello.txt')

        self.touch(src)

        mapping = {
            'src': 'bin',
            'dst': dst_dir,
        }

        d = Directory(mapping)
        d.link()

        self.assertTrue(os.path.islink(dst))
        self.assertEqual(os.readlink(dst), src)

    def test_dir_not_exist(self):
        dst_dir = os.path.join(self.home, 'bin')

        mapping = {
            'src': 'bin',
            'dst': dst_dir,
        }

        with self.assertRaises(InvalidSrc):
            Directory(mapping)
