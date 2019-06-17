flintstones = ['fred', 'wilma', 'pebbles', 'dino']

newNames = []
for name in flintstones:
    newNames.append(name.title())

print (newNames)

#same as lines 3-5: called list comprehension
newNames = [name.title() for name in flintstones]

print(newNames)

newNames = []
for name in flintstones:
    if name == 'dino':
        newNames.append(name.upper())

#same as lines 14-17
newNames = [name.upper() for x in flintstones if name =='dino']