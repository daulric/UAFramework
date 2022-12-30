local Abbreviations = {
	K = 4,
	M = 7,
	B = 10,
	T = 13,
	Qa = 16,
	Qu = 19,
}

return function(number)
	if not (type(number) == "number") then
		return "error: "..number
	end

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
		return "$"..text
	else
		return "$"..text
	end
end