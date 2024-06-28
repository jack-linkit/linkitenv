import sys

data = sys.stdin.read()

print(','.join(data.splitlines())[:-1])