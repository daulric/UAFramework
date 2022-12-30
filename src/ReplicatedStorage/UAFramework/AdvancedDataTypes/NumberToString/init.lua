local module = {}

local Abbreviations = {
	K = 4,
	M = 7,
	B = 10,
	T = 13,
	Qa = 16,
	Qu = 19,
}

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

return module