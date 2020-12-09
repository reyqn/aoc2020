import tables, strscans, strutils, sets

proc partOne(revTabl: Table[string, seq[string]], color: string, colors: var HashSet[string]): int =
    if revTabl.hasKey(color):
        for contained in revTabl[color]:
            if not colors.containsOrIncl(contained):
                result += 1 + revTabl.partOne(contained, colors)

proc partTwo(tabl: Table[string, seq[(int, string)]], bag: (int, string)): int =
    if tabl.hasKey(bag[1]):
        for contained in tabl[bag[1]]:
            result += contained[0]*bag[0] + tabl.partTwo((contained[0]*bag[0], contained[1]))

var tabl: Table[string, seq[(int, string)]]
var revTabl: Table[string, seq[string]]
var colors: HashSet[string]
var container, color:string
var num:int

for line in lines("input.txt"):
    if scanf(line, "$* bags contain", container):
        for bags in line[container.len+14..^1].split(", "):
            if scanf(bags, "$i $* bag", num, color):
                if revTabl.hasKeyOrPut(color, @[container]):
                    revTabl[color].add(container)
                if tabl.hasKeyOrPut(container, @[(num, color)]):
                    tabl[container].add((num, color))

echo revTabl.partOne("shiny gold", colors), "\n", tabl.partTwo((1, "shiny gold"))