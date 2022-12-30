local module = {}
local UserProfiles = {}
local DataStoreService =  game:GetService("DataStoreService")


function module.createUserDB(name: string)
	local Database = DataStoreService:GetDataStore(name)

	UserProfiles[name] = {}
	local DBProfile = UserProfiles[name]

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

function module:PrintAll()
	print("Profiles:", UserProfiles)
end

return module