import strutils, sequtils, algorithm

proc tribonacci(n: int): int =
    let start = [1,1,2]
    if n <= 2:
        result = start[n]
    else:
        result = tribonacci(n - 1) + tribonacci(n - 2) + tribonacci(n - 3)

var input = toSeq(lines("input.txt")).map(parseInt)
input.add(0)
sort(input)

var parsed: seq[seq[int]]
var curr = -3
for jolt in input:
    case jolt-curr:
    of 1:
        parsed[parsed.high].add(jolt-curr)
    else:
        parsed.add(@[jolt-curr])
    curr = jolt

echo parsed.concat().count(1)*(parsed.concat.count(3))
echo parsed.mapIt(it.len-1).mapIt(tribonacci(it)).foldl(a*b)