return function (...: number)
    local NewTable = table.pack(...)
    NewTable.n = nil
    local Total = 1

    for index, value in pairs(NewTable) do
        Total = (Total * value)
    end

    return Total

end