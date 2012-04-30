platform = interactiveObject:new()

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
	if(self.y < self.ceil) then
		self.y = self.ceil
		self.moveSpeed = self.moveSpeed * -1
	elseif(self.y > self.floor) then
		self.y = self.floor
		self.moveSpeed = self.moveSpeed * -1
	end
end