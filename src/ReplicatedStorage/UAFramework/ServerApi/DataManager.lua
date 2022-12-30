local module = {}
local DataStoreService = game:GetService("DataStoreService")
local DBProfiles = {}

function module.createDB(name: string)
	local self = {}

	local DB = DataStoreService:GetDataStore(name)

	function self:RequestData(key)
		local success, data = pcall(function()
			return DB:GetAsync(key)
		end)

		if success then
			if data then
				print("Profile Retrived", "'".. key.."'", " DB Name:", name)
				return data
			end
		else
			warn("Cant Get Data From", "'".. key.."'", " DB Name:", name)
		end
	end

	function self:UpdateProfile(key, handle)
		local success, err = pcall(function()
			print("Waiting to Update", "'".. key.."'", "DB Name:", name)
			wait(7)

			DB:UpdateAsync(key, function(old)
				return handle(old)
			end)

		end)

		if success then
			print("Profile Updated", "'".. key.."'", " DB Name:", name)
			return DB:GetAsync(key)
		else
			warn("Cant Update Profile To", "'".. key.."'", " DB Name:", name)
		end
	end

	function self:QuickSave(key, value)
		local success, err = pcall(function()
			DB:SetAsync(key, value)
		end)

		if success then
			print("Profile Saved", "'".. key.."'", " DB Name:", name)
		else
			warn("Cant Save Data To", "'".. key.."'", " DB Name:", name)
		end
	end

	function self:DeleteProfile(key)
		local success, err = pcall(function()
			DB:RemoveAsync(key)
		end)

		if success then
			print("Profile Deleted", "'".. key.."'", " DB Name:", name)
		else
			warn("Cant Delete Data On", "'".. key.."'", " DB Name:", name)
		end
	end

	return self

end

function module.createUserDB(name: string)
	local Database = DataStoreService:GetDataStore(name)

	DBProfiles[name] = {}
	local DBProfile =DBProfiles[name]

	local self = {}
	local Class = {}

	function self.createUserProfile(player: Player)
		if not DBProfile[""..player.UserId] then
			self.Player = player
			DBProfile[""..player.UserId] = {}
			return self
		end
	end

	function Class:CreateTemplate(player: Player, Template)
		if not (typeof(Template) == "table") then
			warn("This is not a table", Template)
			return
		end

		local success, err = pcall(function()
			DBProfile[""..player.UserId] = Template
		end)

		if success then
			--print("Template Created For", player)
		end

	end

	function Class:CloseProfile(player: Player)
		local success, err = pcall(function()
			Database:SetAsync(player.UserId, DBProfile[""..player.UserId])
		end)

		if success then
			DBProfile[""..player.UserId] = nil
			print("data saved for", player, name.." DB")
		end
	end
	
	function Class:PrintAll()
		warn("Profiles" ,DBProfiles)
	end
	
	function self:Get()
		local success, data = pcall(function()
			return Database:GetAsync(""..self.Player.UserId)
		end)

		if success then
			if (typeof(data) ~= "table") then
				warn("this is not a table", data)
				return
			end

			if data then
				for i, v in pairs(data) do
					DBProfile["".. self.Player.UserId][i] = v
				end

				return DBProfile[""..self.Player.UserId]
			end
		end

	end

	function self:Update(player: Player, handler)
		local PreviousData = DBProfile[""..player.UserId]
		local NewData

		if PreviousData ~= nil then
			NewData = handler(PreviousData)
		end

		DBProfile[""..player.UserId] = NewData
		print("data updated for", player, name.." DB")
	end
	
	return self, Class
end

return module