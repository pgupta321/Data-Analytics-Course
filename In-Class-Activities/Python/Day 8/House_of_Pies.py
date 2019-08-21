pie_list = ["Pecan", "Apple Crisp", "Bean", "Banoffee", "Black Bun", "Blueberry", "Buko", "Burek", \
    "Tamale", "Steak"]

print("Welcome to the House of Pies Here are our pies: ")

shopping = "Yes"

while shopping == "Yes":
    print("------------------------------------------------------------------------------------------------")

#print("(1) Pecan (2) Apple Crisp (3) Bean (4) Banoffee (5) Black Bun \n (6) Blueberry (7) Buko (8) Burek"\
    #"(9) Tamale (10) Steak")

    for index, name in enumerate(pie_list, 1):
        print(f"({index}) {name}")

    #for i in range (len(pie_list)):
        #print("(" + str(i) + ")" + pie_list[i])

    pie_choice = int(input("Which pie would you like? Enter its number: "))

    pie_purchases = []
    pie_purchases.append(pie_choice)

    print("---------------------------------------------------------------------------------------------------")
    print(f"We'll have that {pie_list[pie_choice]} right out for you!")

shopping = input("Would you like to order another? Yes or No")

print("---------------------------------------------------------------------------------")
print("You have ordered" + str(len(pie_purchases)) + ".")