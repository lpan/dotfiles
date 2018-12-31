import json

from linker.exceptions import InvalidMapping
from linker.exceptions import InvalidSrc
from linker.exceptions import InvalidDst

from linker.models import File
from linker.models import Directory


def run():
    with open('./mapping.json') as f:
        mappings = json.load(f)

    dotfiles = []
    for m in mappings['files']:
        try:
            dotfiles.append(File(m))
        except (InvalidMapping, InvalidSrc) as e:
            print('skipped entry {}: {}'.format(m, e))

    for m in mappings['directories']:
        try:
            dotfiles.append(Directory(m))
        except (InvalidMapping, InvalidSrc) as e:
            print('skipped entry {}: {}'.format(m, e))

    for df in dotfiles:
        try:
            df.link()
        except (InvalidSrc, InvalidDst) as e:
            print('skipped linking {}: {}'.format(df, e))


if __name__ == '__main__':
    run()
