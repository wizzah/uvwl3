platform = class:new()

function platform:init(x, y, dir, floor, ceil)
	self.x = x
	self.y = y

	self.img = love.graphics.newImage("img/plat.png")
	self.width = 100
	self.height = 25

	self.moveSpeed = 50
	if(dir < 0) then
		self.moveSpeed = self.moveSpeed * -1
	end
	self.floor = floor
	self.ceil = ceil
end

function platform:update(dt)
	self.y = self.y + self.moveSpeed * dt
	if(self.y <= self.ceil or self.y >= self.floor) then
		self.moveSpeed = self.moveSpeed * -1
	end
end

function platform:draw()
	love.graphics.draw(self.img, self.x, self.y)
end