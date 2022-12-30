local module = {}

function module:printTable(t)
	local str = ""
	print(string.format("local tab = {\n%s}", t))
end

return module
