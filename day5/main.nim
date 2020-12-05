import intsets, sequtils, algorithm

var ids: seq[int]

for line in lines("input.txt"):
    var test = (0,128*8)
    for c in line:
        if c in {'F', 'L'}:
            test[1] = (test[0] + test[1]) div 2
        else:
            test[0] = (test[0] + test[1]) div 2
    ids.add(test[0])

sort(ids)
echo ids[^1]
echo toSeq(toSeq(ids[0]..ids[^1]).toIntSet - ids.toIntSet)[0]