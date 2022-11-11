local module = {}

local Storage = {}

function module:dump(id: string, ...)
    local dumppy = table.pack(...)
    dumppy.n = nil

    for index, _ in (Storage) do
        if index == id then
            warn("there is already an id")
            return
        end
    end

    Storage[id] = dumppy
end

function module:delete(id)
    if Storage[id] == nil then
        warn("there is nothing stored with", id)
        return
    end

    Storage[id] = nil
end

function module:grab(id)
    if Storage[id] == nil then
        warn("there is nothing stored")
        return
    end

    return Storage[id]

end

function module:find(id, key)
    if Storage[id] == nil then
        warn("this is nothing stored")
        return
    end

    for _, value in pairs(Storage[id]) do
        if key == value then
            return value
        end
    end
end

function module:mapStorage(id, ...)
    local pack = table.pack(...)
    pack.n = nil

    local GatherData = {}

    for _, value in pairs(Storage[id]) do
        if table.find(pack, value) then
            table.insert(GatherData, value)
        end
    end

    return GatherData

end

return module