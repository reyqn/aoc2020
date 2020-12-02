import strutils, sets, sequtils, algorithm

proc calc(a: seq[int], n: int = 0): seq[int] = 
    var b: seq[int]
    for val in a:
        b.add(2020 - n - val)
    result = b

var a = toSeq(lines("input.txt")).map(parseInt)
sort(a)

var result = toSeq(a.toHashSet * calc(a).toHashSet)
echo result[0] * result[1]

for val in a:
    result = toSeq(a.toHashSet * calc(a, val).toHashSet)
    if (result.len > 0):
        echo val * result[0] * result[1]
        break