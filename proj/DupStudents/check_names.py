import csv
import sys
import os
import textdistance
import tempfile


fd, path = tempfile.mkstemp()
with open(path, 'w') as f:
    f.write(sys.stdin.read())

with open(path, 'r', encoding='utf-8-sig') as csvfile:
    reader = csv.DictReader(csvfile, quotechar='"', fieldnames=['District', 'DistrictID', 'Original Name', 'Duplicate Name', 'Original StudentID', 'Original Local ID (Code)', 'Original StateID (AltCode)', 'Duplicate StudentID', 'Duplicate Local ID (Code)', 'Duplicate StateID (AltCode)', 'Levenstein Distance', 'Jaccard Index', 'Sorensen-Dice Coefficient', 'Has Matching Word'])
    writer = csv.DictWriter(sys.stdout, fieldnames=reader.fieldnames)
    for row in reader:
        orig_name = row['Original Name'].lower()
        dup_name = row['Duplicate Name'].lower()
        # levenshtein = textdistance.jaccard(orig_name, dup_name))
        has_matching_word = 0
        for w1 in orig_name.split(' '):
            w1 = w1.replace(',', '')
            print(f'{w1}')
            for w2 in dup_name.split(' '):
                w2 = w2.replace(',', '')
                print(f'\t{w2}')
                if w1 == w2:
                    has_matching_word = 1
        print(has_matching_word)
        row['Has Matching Word'] = has_matching_word
        writer.writerow(row)
        
