import random
options = ['Rock', 'Paper', 'Scissors']

run = 'Y'
while run == 'Y':
    computer_choice = random.choice(options)
    print('Let"s play Rock, Paper, Scissors!')
    user_choice = input('Choose Rock, Paper, or Scissors: ')

    if user_choice not in options:
        print('Follow directions. Choose Rock, Paper, or Scissors.')

    if user_choice == "Rock":
        if computer_choice == 'Rock':
            print('We tie! I chose rock.')
        elif computer_choice == 'Paper':
            print('You win! I chose paper.')
        elif computer_choice == 'Scissors':
            print('You lose! I chose scissors.')

    if user_choice == "Paper":
        if computer_choice == 'Rock':
            print('You win! I chose rock.')
        elif computer_choice == 'Paper':
            print('We tie! I chose paper.')
        elif computer_choice == 'Scissors':
            print('You lose! I chose scissors.')

    if user_choice == "Scissors":
        if computer_choice == 'Rock':
            print('You lose! I chose rock.')
        elif computer_choice == 'Paper':
            print('You win! I chose paper.')
        elif computer_choice == 'Scissors':
            print('We tie! I chose scissors.')

    run = input('Play again (Y/N)?')

    if run == 'N':
        print("Thanks for playing!")
