import csv

title = input("Which series are you looking for?")

with open("C:/Users/prern_000/Documents/Data Analytics/In-Class Activities/Python/Day 8/netflix_ratings.csv", newline='') as csvfile:

    csvreader = csv.reader(csvfile, delimiter=',')

    #csv_header = next(csvreader)
    #print(f"CSV Header: {csv_header}")

    found = False
    for row in csvreader:
        if(row[0] == title):
            print(f"{title} is rated {row[1]} with a rating of {row[6]}")
            found = True
            break

if not found:
    print("I don't know that title.")