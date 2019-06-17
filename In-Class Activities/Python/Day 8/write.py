import os
import csv

#output_path = os.path.join("C:/Users/prern_000/Documents/Data Analytics/In-class activities/python/day 8/writefile.csv")

title = []
price = []
sub_count = []
num_reviews = []
course_len = []


with open("C:/Users/prern_000/Documents/Data Analytics/In-Class Activities/Python/Day 8/Udemy_web_starter.csv", newline='', encoding='utf-8') as csvfile:
    csvreader = csv.reader(csvfile, delimiter=',')

    for row in csvreader:
        title.append(row[1])
        price.append(row[4])
        sub_count.append(row[5])
        num_reviews.append(row[6])
        newlength = row[9].split(' ')
        course_len.append(float(newlength[0]))

cleaned_csv = zip(title, price, sub_count, num_reviews, course_len)

output_file = "C:/Users/prern_000/Documents/Data Analytics/In-Class Activities/Python/Day 8/web_final.csv"

with open(output_file, 'w', newline= '') as data_file:
    csvwriter = csv.writer(data_file)

    csvwriter.writerow(["Title", "Course Price", "Subscribers", "Reviews Left", "Length of Course"])
    csvwriter.writerows(cleaned_csv)