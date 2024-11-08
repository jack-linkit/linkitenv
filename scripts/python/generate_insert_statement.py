import csv
import sys

def generate_insert_statement(table_name, csv_file):
    with open(csv_file, mode='r') as file:
        csv_reader = csv.DictReader(file)
        
        # Get the column names from the CSV header
        columns = csv_reader.fieldnames
        
        # Initialize a list to accumulate the values for each batch of inserts
        batch_values = []
        
        # Loop through the rows in the CSV file and create INSERT statements
        for row in csv_reader:
            # Construct the values part of the insert statement
            values = []
            for col in columns:
                value = row[col]
                
                # Handle string values by wrapping them in quotes, escape single quotes
                if isinstance(value, str):
                    value = value.replace("'", "''")  # Escape single quotes
                    value = f"'{value}'"
                elif value == '':  # Handle empty strings as NULL
                    value = 'NULL'
                
                values.append(value)
            
            # Add the values to the batch
            batch_values.append(f"({', '.join(values)})")
            
            # If we've reached 1000 rows, generate an insert statement
            if len(batch_values) == 1000:
                insert_statement = f"INSERT INTO {table_name} ({', '.join(columns)}) VALUES {', '.join(batch_values)};"
                print(insert_statement)
                # Clear the batch for the next set of rows
                batch_values = []
        
        # If there are remaining rows after the loop, generate an insert statement for them
        if batch_values:
            insert_statement = f"INSERT INTO {table_name} ({', '.join(columns)}) VALUES {', '.join(batch_values)};"
            print(insert_statement)

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python generate_insert.py <table_name> <csv_file>")
        sys.exit(1)

    table_name = sys.argv[1]
    csv_file = sys.argv[2]
    
    generate_insert_statement(table_name, csv_file)

