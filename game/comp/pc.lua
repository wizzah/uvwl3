pc = class:new()

function pc:init(x, y)
	self.x = x
	self.y = y

	
	--self.img = love.graphics.newImage("img/test.png") --old and busted
	--self.img = love.graphics.newImage("img/testsheet.png") --less busted
	self.img = love.graphics.newImage("img/realsprites.png") --new hotness
	
	self.width = 42 --24
	self.height = 126 --24

	self.moveSpeed = 100
	self.jumpSpeed = 150
	self.yVel = 0

	self.jumping = false
	self.falling = true
	self.currPlat = nil

	self.spriteW = 42 --24
	self.spriteH = 126 --24
	self.imgW = 168 --72
	self.imgH = 252 --48

	self.quads = {
		l = {
			love.graphics.newQuad(0, 0, self.spriteW, self.spriteH, self.imgW, self.imgH);
			love.graphics.newQuad(self.spriteW, 0, self.spriteW, self.spriteH, self.imgW, self.imgH);
			love.graphics.newQuad(self.spriteW * 2, 0, self.spriteW, self.spriteH, self.imgW, self.imgH);
		};
		r = {
			love.graphics.newQuad(0, self.spriteH, self.spriteW, self.spriteH, self.imgW, self.imgH);
			love.graphics.newQuad(self.spriteW, self.spriteH, self.spriteW, self.spriteH, self.imgW, self.imgH);
			love.graphics.newQuad(self.spriteW * 2, self.spriteH, self.spriteW, self.spriteH, self.imgW, self.imgH);
		};
	}

	self.iterator = 1
	self.max = 3
	self.timer = 0
	self.direction = "r"
end

function pc:update(dt)
	if(self.currPlat) then
		self.y = self.y + self.currPlat.moveSpeed * dt
	end
	self.timer = self.timer + dt
	if self.timer > 0.2 then --arbitrary?
		self.timer = 0
		self.iterator = self.iterator + 1
		if self.iterator > self.max then
			self.iterator = 1
		end
	end
end

function pc:draw()
	--love.graphics.draw(self.img, self.x, self.y)
	love.graphics.drawq(self.img, self.quads[self.direction][self.iterator], self.x, self.y)
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