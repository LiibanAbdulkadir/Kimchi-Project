def Removetext(NumberString):
    numberFilter = filter(str.isdigit, NumberString)
    result = "".join(numberFilter)
    return int(result)

