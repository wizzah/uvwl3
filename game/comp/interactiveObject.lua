interactiveObject = class:new()

function interactiveObject:init()
	
end

function interactiveObject:update(dt)
	
end

function interactiveObject:draw()
	love.graphics.draw(self.img, self.x, self.y)
end

function interactiveObject:interactWithPlayer()
end