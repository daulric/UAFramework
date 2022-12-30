return function (num1: number, num2: number)
    local number = (num1 - num2)
    return number % 1 >= 0.5 and math.ceil(number) or math.floor(number)
end