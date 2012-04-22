require "comp/pc"
require "comp/platform"
require "func/collisions"

function love.load()
	objects = {player}
	plats = {}
	offset = 10
	for i=0, 10, 2 do
		p = platform:new{}
		p.x = i * 100 + offset
		table.insert(plats, p)
		offset = offset + 10
	end

	grav = 5
	unsaturated = false
end

function love.update(dt)
	if(love.keyboard.isDown("right")) then
		player.x = player.x + player.moveSpeed * dt
		if(not checkOnPlatforms(player, plats)) then
			player.falling = true
		end
	end
	if(love.keyboard.isDown("left")) then
		player.x = player.x - player.moveSpeed * dt
		if(not checkOnPlatforms(player, plats)) then
			player.falling = true
		end
	end

	if(player.jumping or player.falling) then
		player.y = player.y - player.yVel * dt
		player.yVel = player.yVel - grav

		if(player.jumping) then
			if(player.yVel <= 0) then
				player.jumping = false
				player.falling = true
			end
		elseif(player.falling) then
			if (checkOnPlatforms(player, plats)) then
				player.yVel = 0
				player.y = player.currPlat.y - player.height
				player.falling = false
			end
		end
	end
end

function love.keypressed(key, unicode)
	if(key=="escape") then
		love.event.push("quit")
	elseif(key=="up") then
		if(not player.jumping and not player.falling) then
			player.yVel = player.jumpSpeed
			player.jumping = true
		end
	elseif(key==" ") then
		if(unsaturated) then 
			unsaturated = false
			love.graphics.setColor(255,255,255,255)
		else 
			unsaturated = true 
		end
	end
end

function love.draw()
	for key, val in pairs(objects) do
		love.graphics.draw(val.img, val.x, val.y)
	end
	for key, val in pairs(plats) do
		love.graphics.draw(val.img, val.x, val.y)
	end
	if(unsaturated) then
		love.graphics.setColor(200,200,200,150)
		love.graphics.rectangle("fill",0,0,800,600)
	end
end
