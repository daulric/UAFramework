local module = {}

local Storage = {}

function module.createStorage(id: string)
    local self = {}

    function self:dump(...)
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

    function self:delete()
        if Storage[id] == nil then
            warn("there is nothing stored with", id)
            return
        end
    
        Storage[id] = nil
    end

    function self:grab()
        if Storage[id] == nil then
            warn("there is nothing stored")
            return
        end
    
        return Storage[id]
    end

    function self:find(key)
        if Storage[id] == nil then
            warn("this is nothing stored")
            return
        end
    
        for _, value in pairs(Storage[id]) do
            if key == value then
                return value
            else
                warn("couldn't find", key)
            end
        end
    end

    function self:mapStorage(...)
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

    return self
end

function module:GetStoredValues()
    return Storage
end

return module