import strutils, sets

type op = tuple[instruction: string, number: int]

proc calc(prog: seq[op]): int =
    var test: HashSet[int]
    var pos, acc = 0
    while(not test.containsOrIncl(pos)):
        case prog[pos].instruction:
        of "jmp": pos+=prog[pos].number-1
        of "acc": acc+=prog[pos].number
        pos+=1
        if pos >= prog.len:
            echo acc
            break
    return acc

var prog: seq[op]
for line in lines("input.txt"):
    prog.add((line[0..2], line[4..^1].parseInt))

echo prog.calc

for op in prog.mitems:
    if op.instruction in ["nop", "jmp"]:
        op.instruction = if op.instruction == "nop": "jmp" else: "nop"
    else:
        continue
    discard prog.calc
    op.instruction = if op.instruction == "nop": "jmp" else: "nop"