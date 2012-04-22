player = {
	img = love.graphics.newImage("img/test.png"),
	x = 300,
	y = 300,
	width = 21,
	height = 24,
	moveSpeed = 100,
	jumpSpeed = 150,
	yVel = 0,
	jumping = false,
	falling = false,
	currPlat = nil
}

--because lua can't parse "true" or "false" out of booleans
function player:isJumping()
	if(player.jumping) then
		return "true"
	else
		return "false"
	end
end
function player:isFalling()
	if(player.falling) then
		return "true"
	else
		return "false"
	end
end