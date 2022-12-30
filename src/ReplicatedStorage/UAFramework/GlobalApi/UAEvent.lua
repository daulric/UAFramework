local module = {}
local RemoteFunc = script:FindFirstChildOfClass("RemoteFunction")
local RemoteEvent = script:FindFirstChildOfClass("RemoteEvent")
local BindableFunc = script:FindFirstChildOfClass("BindableFunction")
local BindableEvent = script:FindFirstChildOfClass("BindableEvent")
local RS = game:GetService("RunService")

local ErrorMessage = "No Signal Passed"

local Listeners = {}

function module:ListenForEvent(id: string, func: RBXScriptSignal)
	local id = tostring(id)
	
	if not (type(func) == "function") then
		warn("This is not a function", id)
	end
	
	for i, _ in pairs(Listeners) do
		if i == id then
			warn("there is an id in use. find it and change it!", id)
			return
		end
	end
	
	if id == "" or id == " " then
		print("You cannot have space in the event")
		return
	end
	
	local listener = {
		Callback = func,
	}

	function listener:Stop()
		local ReturnSignal = {}
		Listeners[id] = nil
		warn("ID: ", id, "has been disconnected")
	end

	Listeners[id] = listener

	return listener
end

function module:DisconnectAll()
	RS.Heartbeat:Once(function()
		for i, _ in pairs(Listeners) do
			Listeners[i] = nil
		end
	end)
end

function module:SendServer(id: string, ...: any)
	RemoteEvent:FireServer(id, ...)
end

function module:SendClient(player: Player, id: string, ...)
	RemoteEvent:FireClient(player, id, ...)
end

function module:SendAllClients(id: string, ...)
	RemoteEvent:FireAllClients(id, ...)
end

function module:GetServer(id: string, ...)
	return RemoteFunc:InvokeServer(id, ...)
end

function module:GetClient(player: Player, id: string, ...)
	return RemoteFunc:InvokeClient(player, id, ...)
end

function module:FireDataToCom(id: string, ...)
	BindableEvent:Fire(id, ...)
end

function module:GetDataFromCom(id: string, ...)
	return BindableFunc:Invoke(id, ...)
end

function OnServerListen(player: Player, id: string, ...)
	if Listeners[id] == nil then
		warn(ErrorMessage, "Server_Error", id)
		return
	end

	if Listeners[id] then
		return Listeners[id].Callback(player,...)
	end
end

function OnClientListen(id: string, ...)
	if Listeners[id] == nil then
		warn(ErrorMessage, "Client_Error", id)
		return
	end

	if Listeners[id] then
		return Listeners[id].Callback(...)
	end

end

function OnComListen(id: string, ...: any)
	if Listeners[id] == nil then
		warn(ErrorMessage, "Bindable_Error", id)
		return
	end

	if Listeners[id] then
		return Listeners[id].Callback(...)
	end

end

BindableEvent.Event:Connect(OnComListen)
BindableFunc.OnInvoke = OnComListen

if RS:IsServer() then
	RemoteEvent.OnServerEvent:Connect(OnServerListen)
	RemoteFunc.OnServerInvoke = OnServerListen
elseif RS:IsClient() then
	RemoteEvent.OnClientEvent:Connect(OnClientListen)
	RemoteFunc.OnClientInvoke = OnClientListen
end

return module
