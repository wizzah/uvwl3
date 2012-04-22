platform = {
	img = love.graphics.newImage("img/plat.png"),
	x = 0,
	y = 500,
	width = 100,
	height = 25
}

function platform:new (o)
	o = o or {}   -- create object if user does not provide one
	setmetatable(o, self)
	self.__index = self
	return o
end