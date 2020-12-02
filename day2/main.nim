import strutils, strscans

var partOne, partTwo, first, second: int = 0
var letter, password: string
for line in lines ("input.txt"):
    if line.scanf("$i-$i $w: $w", first, second, letter, password):
        let count = password.count(letter)
        if (count >= first and count <= second):
            partOne+=1
        if (password[first-1] == letter[0] xor password[second-1] == letter[0]):
            partTwo+=1

echo partOne, "\n", partTwo