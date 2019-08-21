# The list of candies to print to the screen
candyList = ["Snickers", "Kit Kat", "Sour Patch Kids", "Juicy Fruit", "Swedish Fish",
             "Skittles", "Hershey Bar", "Starbursts", "M&Ms"]

# The amount of candy the user will be allowed to choose
allowance = 5

# The list used to store all of the candies selected inside of
candyCart = []

# Print out options
for i in range(len(candyList)):
    print("[" + str(i) + "] " + candyList[i])

# Ask user for candy input 5 times
for x in range(allowance):
    selection = int(input("Pick a candy number "))
    candy = candyList[selection]
    candyCart.append(candy)

print('You are taking home:')

# Print out user's candyCart
for x in range(len(candyCart)):
    print("[" + str(x) + "] " + candyCart[x])
    # another option to print candyCart
    #print(candyCart[x])