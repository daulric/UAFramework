return function(Time)
	local minute = tostring(math.floor(Time/60))
	local sec = math.floor(Time%60)

	if sec < 10 then
		sec = "0".. tostring(math.floor(Time%60))
	end

	return minute..":"..sec
end