import strutils, sequtils, tables

let table = zip(toSeq('a'..'z'), newSeq[bool](26)).toTable
var partOne, partTwo = 0

let input = readFile "input.txt"
for question in input.split("\p\p"):
    var answers = table
    var allAns = table
    for line in question.splitLines:
        for c in line:
            answers[c] = true
    for val in allAns.keys:
        allAns[val] = question.count(val) == question.splitLines.len
    partOne += toSeq(answers.values).countIt(it == true)
    partTwo += toSeq(allAns.values).countIt(it == true)

echo partOne, "\n", partTwo