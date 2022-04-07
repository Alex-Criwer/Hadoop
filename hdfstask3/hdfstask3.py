import sys
from hdfs import Config

client = Config().get_client()

argv = sys.argv
block = str(argv[1])
answer = block.split(':')[1].lstrip().split(' ')[0]
print(answer)


