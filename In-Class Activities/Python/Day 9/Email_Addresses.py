import os
import csv

path = os.path.join("Resources/03-Python_Day9_Email_Resources_employees.csv")

new_employee_data = []

with open(path) as csvfile:
    reader = csv.DictReader(csvfile, delimiter = ',')

    for row in reader:
        email = row['first_name'] + "." + row['last_name'] + "@example.com"
        dictionary = {"first_name": row['first_name'], "last_name": row['last_name'], "ssn": row['ssn'], "email": email}

        new_employee_data.append(dictionary)

write_path = os.path.join("In-class activities", "python", "day 9", "output_emailaddresses.csv")

with open(write_path, 'w') as write_file:
    fieldnames = ["last_name", "first_name", "ssn", "email"]
    writer = csv.DictWriter(write_file, fieldnames=fieldnames)
    writer.writeheader
    writer.writerows(new_employee_data)




