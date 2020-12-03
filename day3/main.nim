var total = 1
let pairs = @[(1, 1), (1, 3), (1, 5), (1, 7), (2, 1)]

for pair in pairs:
    var posX, posY, count: int = 0
    for line in lines("input.txt"):
        posY+=1
        if (posY-1) mod pair[0] == 1:
            continue
        if line[posX] == '#':
            count+=1
        posX = (posX + pair[1]) mod line.len
    if pair == (1,3):
        echo count
    total*=count

echo total