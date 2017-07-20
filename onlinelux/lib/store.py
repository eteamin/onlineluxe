from os import path

import random
import string
from cgi import FieldStorage

import onlinelux


STORAGE_PATH = path.abspath(path.join(path.dirname(onlinelux.__file__), 'public', 'storage'))


class StorageManager:
    """Images Storage"""

    def __init__(self):
        self.storage_path = STORAGE_PATH

    def store(self, data: FieldStorage):
        extension = self.tell_extension(data)
        filename = self.id_generator(extension, size=15)
        destination = self._specify_path(filename)

        with open(destination, mode='wb') as dest:
            content = data.file.read()
            dest.write(content)
            return filename

    def _specify_path(self, filename):
        return '{}/{}'.format(self.storage_path, filename)

    @staticmethod
    def tell_extension(file: FieldStorage):
        return file.filename.split('.')[-1]

    @staticmethod
    def id_generator(ext, size=6, chars=string.ascii_lowercase + string.digits):
        uid = ''.join(random.choice(chars) for _ in range(size))
        return '{}.{}'.format(uid, ext)
