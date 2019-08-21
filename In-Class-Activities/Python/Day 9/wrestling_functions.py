import os
import csv

# Path to collect data from the Resources folder
path = os.path.join("Resources\WWE-Data-2016.csv")

# Define the function and have it accept the 'wrestlerData' as its sole parameter
def print_percentages(wrestler_data):
    name = str(wrestler_data[0])
    wins = int(wrestler_data[1])
    losses = int(wrestler_data[2])
    draws = int(wrestler_data[3])

# Find the total number of matches wrestled
    total_matches = wins + losses + draws
# Find the percentage of matches won
    win_percent = (wins / total_matches) * 100
# Find the percentage of matches lost
    loss_percent = (losses / total_matches) * 100
# Find the percentage of matches drawn
    draw_percent = (draws / total_matches) * 100

    if loss_percent > 50:
        type_of_wrestler = "Jobber"
    else:
        type_of_wrestler = "Superstar"


# Print out the wrestler's name and their percentage stats
    print(f"Stats for {name}")
    print(f"WIN PERCENT: {str(win_percent)}")
    print(f"LOSS PERCENT: {str(loss_percent)}")
    print(f"DRAW PERCENT: {str(draw_percent)}")
    print(f"{name} is a {type_of_wrestler}")

# Read in the CSV file
with open(path, 'r') as csvfile:

    # Split the data on commas
    csvreader = csv.reader(csvfile, delimiter=',')

    # Prompt the user for what wrestler they would like to search for
    name_to_check = input("What wrestler do you want to look for? ")

    # Loop through the data
    for row in csvreader:

        # If the wrestler's name in a row is equal to that which the user input, run the 'print_percentages()' function
        if(name_to_check == row[0]):
            print_percentages(row)
