local module = {}

local Storage = {}

function module.createStorage(id: string)
    local self = {}

    function self:dump(Data)

        for index, _ in (Storage) do
            if index == id then
                warn("there is already an id")
                return
            end
        end

        Storage[id] = Data
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

        if not (type(Storage[id]) == "table") then
            warn("You cant request a search if its not a table", "- ID:", id)
            return
        end
    
        for index, value in pairs(Storage[id]) do
            if key == value then
                return value
            end

            if key == index then
                return value
            end

            warn("couldn't find", key)
        end
    end

    function self:UpdateStorage(handler)
        local oldData = Storage[id]
        local Data

        if oldData == nil then
            Data = handler()
        end

        Data = handler(oldData)
        Storage[id] = Data

    end

    return self
end

function module:GetStorageInfo(id)
    if Storage[id] ~= nil then
        return Storage[id]
    end

    return Storage
end

return module