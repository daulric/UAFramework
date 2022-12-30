return function(...)
	local GetData = table.pack(...)
	local sum = 0
	
	for i, v in pairs(GetData) do
		if not (type(...) == "number") then
			warn("There is no number", "Please fix!")
			return
		end
		
		if i ~= "n" then
			sum = (sum + v)
		end
	end
	
	local GetTotal = (sum / GetData.n)
	
	return GetTotal % 1 >= 0.5 and math.ceil(GetTotal) or math.floor(GetTotal)
	
end