import strutils, tables, re, sequtils

var count = [0, 0]

let input = readFile "input.txt"
for line in input.split("\p\p"):
    var ids = {"byr": "", "iyr": "", "eyr": "", "hgt": "", "hcl": "", "ecl": "", "pid": ""}.toTable
    for code in line.splitWhitespace:
        let value = code.split(':')
        ids[value[0]] = value[1]
    if not toSeq(ids.values).anyIt(it == ""):
        count[0]+=1
        if parseInt(ids["byr"]) in 1920..2002 and 
            parseInt(ids["iyr"]) in 2010..2020 and
            parseInt(ids["eyr"]) in 2020..2030 and (
                ids["hgt"][^2..^1] == "cm" and parseInt(ids["hgt"][0..^3]) in 150..193 or 
                ids["hgt"][^2..^1] == "in" and parseInt(ids["hgt"][0..^3]) in 59..76
            ) and
            ids["hcl"].match(re"^#[a-f0-9]{6}$") and
            ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].contains(ids["ecl"]) and
            ids["pid"].match(re"^[0-9]{9}$"):
                count[1]+=1

echo count[0], "\n", count[1]