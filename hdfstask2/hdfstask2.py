import sys
from hdfs import Config

client = Config().get_client()

argv = sys.argv
file_name = str(argv[1])

with client.read(file_name) as reader_manager:
    data = reader_manager.read(10)
    print(data.decode("utf-8"))


