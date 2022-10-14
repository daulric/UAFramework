local module = {}

function module:ConvertToMoney(number: number)
	if not (type(number) == "number") then
		return "error: "..number
	end
	
	local Abbreviations = {
		K = 4,
		M = 7,
		B = 10,
		Qa = 13
	}
	
	local text = tostring(math.floor(number))
	local dummyText = ""
	
	local chosenAbbreviation
	
	for abbreviation, digits in pairs(Abbreviations) do
		if #text >= digits and #text < (digits + 3) then
			chosenAbbreviation = abbreviation
			break
		end
	end
	
	if  chosenAbbreviation then
		local digits = Abbreviations[chosenAbbreviation]
		local rounded = math.floor(number / 10 ^ (digits - 2)) * 10 ^ (digits - 2)
		text = string.format("%.1f", rounded / 10 ^ (digits - 1))..chosenAbbreviation
		return text
	else
		return text
	end
end

function module:ConvertToTime(Time: number)
	local minute = tostring(math.floor(Time/60))
	local sec = math.floor(Time%60)

	if sec < 10 then
		sec = "0".. tostring(math.floor(Time%60))
	end

	return minute..":"..sec
end

return module