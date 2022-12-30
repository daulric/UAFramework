local module = {}

local Storage = {}

function module.createStorage(id: string)
	local self = {}

	for index, _ in (Storage) do
		if index == id then
			warn("there is already an id")
			return self
		end
	end

	function self:dump(Data)

		if (typeof(Data) ~= "table") then
			print("this is not a table! ID:", id)
			return
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

	function self:UpdateStorage(handler)
		local oldData = Storage[id]
		local Data

		if oldData == nil then
			Data = handler()
		end

		Data = handler(oldData)
		Storage[id] = Data

	end
	
	function self:Sort(handler)
		if (typeof(Storage[id]) ~= "table") then
			print("this is not a table! ID:", id)
			return
		end
		
		table.sort(Storage[id], function(a, b)
			return handler(a, b)
		end)
		
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