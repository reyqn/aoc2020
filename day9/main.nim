import sequtils, strutils, sets

func calc(a: seq[int], n: int = 0): seq[int] = 
    var b: seq[int]
    for val in a:
        b.add(n - val)
    result = b

func partOne(input: seq[int], preamble: int): int = 
    for i in preamble..input.high:
        var test = input[i-preamble..i-1]
        let found = toSeq(test.toHashSet * calc(test, input[i]).toHashSet).filterIt(it*2!=input[i])
        if found.len == 0:
            return input[i]

func partTwo(input: seq[int], first: int): int =
    for i in 0..input.high:
        var n=0
        var sum = input[i]
        while sum < first:
            n+=1
            sum+=input[i+n]
        if sum == first:
            let res = input[i..i+n]
            return max(res) + min(res)

var input = toSeq(lines("input.txt")).map(parseInt)
let first = input.partOne(25)
echo first, "\n", input.partTwo(first)