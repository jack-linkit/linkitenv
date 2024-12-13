import sys
import csv
from argparse import ArgumentParser

def main():
    parser = ArgumentParser(description="Generate SQL INSERT statements from CSV input.")
    parser.add_argument("tablename", nargs="?", default="[tablename]", help="Name of the table to insert into (default: '[tablename]')")
    parser.add_argument("-H", "--headers", action="store_true", help="Use the first row of the CSV as column headers.")
    
    args = parser.parse_args()
    tablename = args.tablename
    use_headers = args.headers

    # Read from standard input
    reader = csv.reader(sys.stdin)
    
    # Initialize column names
    column_names = None
    first_insert_statement_printed = False
    
    for i, row in enumerate(reader):
        if i == 0 and use_headers:
            # Use the first row as column names
            column_names = row
            continue  # Skip processing this row as data
        elif i == 0 and not use_headers:
            # Generate default column names
            column_names = [f"Col{j + 1}" for j in range(len(row))]

        if i % 1000 == 0 or not first_insert_statement_printed:
            # Print the INSERT statement header every 1000 rows or for the first batch
            columns = ", ".join(column_names)
            print(f"INSERT INTO {tablename} ({columns}) VALUES")
            first_insert_statement_printed = True

        # Print each row as a tuple
        print(str(tuple(row)).replace("'NULL'", "NULL") + ",")

if __name__ == "__main__":
    main()