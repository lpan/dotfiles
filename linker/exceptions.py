class InvalidMapping(Exception):
    """
    mapping.json is invalid
    """


class SrcNotExist(Exception):

    def __init__(self, path):
        super().__init__('{} does not exist'.format(path))


class DstExists(Exception):

    def __init__(self, path):
        super().__init__('{} already exists'.format(path))
