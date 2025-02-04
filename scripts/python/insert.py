import sys
import csv
from argparse import ArgumentParser

def main():
    parser = ArgumentParser(description="Generate SQL INSERT statements from CSV or tab-delimited input.")
    parser.add_argument("tablename", nargs="?", default="[tablename]", help="Name of the table to insert into (default: '[tablename]')")
    parser.add_argument("-H", "--headers", action="store_true", help="Use the first row of the input as column headers.")
    parser.add_argument("-T", "--tab", action="store_true", help="Specify that the input is tab-delimited instead of comma-delimited.")

    args = parser.parse_args()
    tablename = args.tablename
    use_headers = args.headers
    delimiter = '\t' if args.tab else ','

    # Read from standard input
    reader = csv.reader(sys.stdin, delimiter=delimiter)

    # Initialize column names
    column_names = None
    first_insert_statement_printed = False
    rows_buffer = []

    for i, row in enumerate(reader):
        if i == 0 and use_headers:
            # Use the first row as column names
            column_names = row
            continue  # Skip processing this row as data
        elif i == 0 and not use_headers:
            # Generate default column names
            column_names = [f"Col{j + 1}" for j in range(len(row))]

        if i % 1000 == 0 or not first_insert_statement_printed:
            if rows_buffer:
                # Print the previous batch, removing the trailing comma
                print("\n".join(rows_buffer)[:-1] + ";")
                rows_buffer = []

            # Print the INSERT statement header every 1000 rows or for the first batch
            columns = ", ".join(column_names)
            print(f"INSERT INTO {tablename} ({columns}) VALUES")
            first_insert_statement_printed = True

        # Add each row as a tuple to the buffer
        rows_buffer.append(str(tuple(row)).replace("'NULL'", "NULL") + ",")

    if rows_buffer:
        # Print the final batch, removing the trailing comma
        print("\n".join(rows_buffer)[:-1] + ";")

if __name__ == "__main__":
    main()
