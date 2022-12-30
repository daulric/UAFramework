return function (...: number)
    local NewTable = table.pack(...)
    NewTable.n = nil
    local sum = 0;

    for index, value in pairs(NewTable) do
        sum = sum + value
    end

    print(NewTable)
    return sum
end