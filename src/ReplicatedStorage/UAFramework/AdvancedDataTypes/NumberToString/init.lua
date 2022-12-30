local module = {}

function module:ConvertToMoney(number: number)
	return require(script.ConvertToMoney)(number)
end

function module:ConvertToTime(Time: number)
	return require(script.ConvertToTime)(Time)
end

function module:RoundNumber(num)
	local GetTotal = num
	return GetTotal % 1 >= 0.5 and math.ceil(GetTotal) or math.floor(GetTotal)
end

function module:Place(Setting)
	return require(script:WaitForChild("Place"))(Setting)
end

return module