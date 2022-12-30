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

function module:Subtract(num1: number, num2: number)
	return require(script.Subtract)(num1, num2)
end

function module:Divide(num1: number, num2: number)
	return require(script.Divide)(num1, num2)
end

function module:GetPercentage(number: number, totalnumber: number)
	return require(script:WaitForChild("GetPercentage"))(number, totalnumber)
end

return module