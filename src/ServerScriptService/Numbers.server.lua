local UAF = require(game.ReplicatedStorage.UAFramework)
local Numbers = UAF.Numbers

-- Finding The Average
local Average = Numbers:GetAverage(1, 2, 3, 4)
print("the average is:", Average)

-- Check if its even
local Even = Numbers:IsEven(2)
if Even then
    print("number is event")
else
    print("number is not event")
end

-- Adding Numbers
local GetAddTotal = Numbers:Add(1, 2, 3)
print("The Total added is:", GetAddTotal)

-- Multiplying Numbers
local GetMulTotal = Numbers:Multiply(11, 22, 33)
print("The Total multiplyed is:", GetMulTotal)