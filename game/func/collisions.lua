function checkOnPlatforms(pc, arr)
	for key, plat in pairs(arr) do
		if( (pc.x + pc.width) >= plat.x
		and pc.x <= (plat.x + plat.width)  
		and ((pc.y + pc.height) >= plat.y
		and (pc.y + pc.height <= plat.y + plat.height)))
		then
			pc.currPlat = plat
			return true
		end
	end
	return false
end