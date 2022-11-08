local module = {}

function module:IsEven(num)
	local Factor = (num % 2)

	if Factor == 0 then
		return true
	end

	return false
	
end

function module:GetAverage(...)
	return require(script.GetAverage)(...)
end

function module:Add(...: number)
	return require(script.Add)(...)
end

function module:Multiply(...: number)
	return require(script.Multiply)(...)
end

return module