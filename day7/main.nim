import tables, strscans, strutils, sequtils, sets

proc partOne(tabl: Table[string, seq[(int, string)]], colors: var HashSet[string]): void =
    for bags in tabl.pairs:
        if bags[1].anyIt(colors.contains(it[1])) and not colors.contains(bags[0]):
            colors.incl(bags[0])
            tabl.partOne(colors)

proc partTwo(tabl: Table[string, seq[(int, string)]], bag: (int, string)): int =
    if tabl.hasKey(bag[1]):
        for contained in tabl[bag[1]]:
            result += contained[0]*bag[0] + tabl.partTwo((contained[0]*bag[0], contained[1]))

var tabl: Table[string, seq[(int, string)]]
var container, color:string
var num:int

for line in lines("input.txt"):
    if scanf(line, "$* bags contain", container):
        for bags in line[container.len+14..^1].split(", "):
            if scanf(bags, "$i $* bag", num, color):
                if tabl.hasKey(container):
                    tabl[container].add((num, color))
                else:
                    tabl[container] = @[(num, color)]

var colors = toHashSet(@["shiny gold"])
tabl.partOne(colors)

echo colors.len - 1, "\n", tabl.partTwo((1, "shiny gold"))