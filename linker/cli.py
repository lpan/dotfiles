import json

from linker.exceptions import DstExists
from linker.exceptions import SrcNotExist
from linker.models import Dotfile


def run():
    with open('./mapping.json') as f:
        mappings = json.load(f)['files']

    files = [Dotfile(m) for m in mappings]

    for f in files:
        try:
            f.link()
        except (SrcNotExist, DstExists) as e:
            print('skipped linking {}: {}'.format(f, str(e)))


if __name__ == '__main__':
    run()
