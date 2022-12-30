local Place = {
	[1] = "st",
	[2] = "nd",
	[3] = "rd",
	Continuing = "th"
}

return function(Setting)
	if (typeof(Setting) == "table") then
		warn("this is not a table", Setting)
		
		local Store = {}
		local Table = {}

		local chosen

		-- we get the chosen place whether it's 1st, 2nd or 3rd
		for i, v in pairs(Setting) do
			table.insert(Store, v)
		end

		for i, v in pairs(Store) do
			if i > 3 then
				Table[i..Place.Continuing] = v
			else
				Table[tostring( i..Place[i])] = v
			end
		end


		return Table
	end
	
	if (typeof(Setting) == "number") then
		local ReturnNum = ""
		if Setting > 3 then
			ReturnNum = ReturnNum..Setting..Place.Continuing
		else
			ReturnNum = ReturnNum..Setting..Place[Setting]
		end
		
		return ReturnNum
	end
	
end