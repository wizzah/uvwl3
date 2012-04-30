pc = class:new()

function pc:init(x, y)
	self.x = x
	self.y = y

	self.img = love.graphics.newImage("img/test.png")
	
	self.width = 21
	self.height = 24

	self.moveSpeed = 100
	self.jumpSpeed = 150
	self.yVel = 0

	self.jumping = false
	self.falling = true
	self.currPlat = nil
end

function pc:update(dt)
	if(self.currPlat) then
		self.y = self.y + self.currPlat.moveSpeed * dt
	end
end

function pc:draw()
	love.graphics.draw(self.img, self.x, self.y)
end

--because lua can't parse strings out of booleans
function pc:isJumping()
	if(self.jumping) then
		return "true"
	else
		return "false"
	end
end
function pc:isFalling()
	if(self.falling) then
		return "true"
	else
		return "false"
	end
end