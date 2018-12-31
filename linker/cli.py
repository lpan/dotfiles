import json

from linker.exceptions import DstExists
from linker.exceptions import SrcNotExist
from linker.models import File


def run():
    with open('./mapping.json') as f:
        files = [File(m) for m in json.load(f)['files']]

    for f in files:
        try:
            f.link()
        except (SrcNotExist, DstExists) as e:
            print('skipped linking {}: {}'.format(f, str(e)))


if __name__ == '__main__':
    run()
