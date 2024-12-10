import sys
import csv
from datetime import datetime

def convert_to_date(date_str):
	date_format = '%m/%d/%Y'
	try:
		# Attempt to parse the string using the specified format
		date_obj = datetime.strptime(date_str, date_format)
		return date_obj
	except ValueError:
		# If parsing fails, return None or raise an exception, depending on your requirement
		return None

with sys.stdin as f:
	reader = csv.reader(f, delimiter='\t')
	for row in reader:
		for i,x in enumerate(row):
			if convert_to_date(x) is not None:
				row[i] = convert_to_date(x).strftime('%Y-%m-%d')
			row[i] = x.replace('\'', '\'\'')
		formatted_row = '\',\''.join(row)
		print(f'(\'{formatted_row}\')', end=',\n')
