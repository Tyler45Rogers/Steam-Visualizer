import csv
import re
from tqdm import tqdm

dirtyFilePath = "steamCopy.csv"
cleanFilePath = "steam_copy_cleaned.csv"

# Define the regex pattern for weird characters
wacky_pattern = re.compile(r'[Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]')

# First, count total rows to set tqdm total (optional, for better accuracy)
with open(dirtyFilePath, newline='', encoding='utf-8') as f:
    total_rows = sum(1 for _ in f)

# Now process with progress bar
with open(dirtyFilePath, newline='', encoding='utf-8') as dirtyFile, \
     open(cleanFilePath, mode='w', newline='', encoding='utf-8') as cleanFile:

    reader = csv.reader(dirtyFile)
    writer = csv.writer(cleanFile)

    for row in tqdm(reader, total=total_rows, desc="Cleaning CSV"):
        joined_row = ' '.join(row)
        if not wacky_pattern.search(joined_row):
            writer.writerow(row)

#This script did not work :(