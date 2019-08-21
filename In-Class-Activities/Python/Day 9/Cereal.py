import os
import csv
#currentDir = os.getcwd()

path = "C:/Users/prern_000/Documents/Data Analytics/Resources/Resources_cereal.csv"

with open(path, newline='') as cereal_file:
    reader = csv.reader(cereal_file, delimiter = ',')
    next(reader)

    for row in reader:
        if float(row[7]) >= 5.0:
            print(row[0])