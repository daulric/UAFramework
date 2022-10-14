local module = {}

function module:IsEven(num)
	local Factor = (num % 2)

	if Factor == 0 then
		return true
	end

	return false
	
end

return module