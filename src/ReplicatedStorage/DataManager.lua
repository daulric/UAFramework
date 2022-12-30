local DataStoreService = game:GetService("DataStoreService")
local DataStore = DataStoreService:GetDataStore("MyDataManager")

local module = {}

function module.new(Name)
    local self = setmetatable(module, {})
    self.DB = DataStoreService:GetDataStore(tostring(Name))
    return self
end

function module:UpdateData(key, handler)
    

end