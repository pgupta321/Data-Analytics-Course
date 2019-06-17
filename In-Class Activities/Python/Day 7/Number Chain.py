print('This is the Number Chain app.')

run = 'Y'
while run == 'Y':
    number = int(input('How many numbers? '))
    for x in range(1,number + 1):
        print(x)

    run = input('Would you like to continue? Y/N')