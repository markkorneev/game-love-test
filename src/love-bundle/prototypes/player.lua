player = {}

function player.load()
	player.img = love.graphics.newImage("sprites/player.png")
	player.x = 50
	player.y = 1000
	player.sp = 800
	player.bullets = {}
	player.cd = 10
	player.keys = {
		right = "right",
		left = "left",
		fire = " "
	}
end

function player.fire()
	if player.cd <= 0 then
		player.cd = 10
		bullet = {}
		bullet.x = player.x + 95
		bullet.y = player.y
		bullet.sp = 1000
		table.insert(player.bullets, bullet)
	end
end

function player.draw()
	love.graphics.draw(player.img, player.x, player.y)
	
	-- draw the bullets
	for _,b in pairs(player.bullets) do
		love.graphics.rectangle("fill", b.x, b.y, 10, 10)
	end
end

-- Movement
function player.move(dt)

	-- Move right
	if love.keyboard.isDown(player.keys.right) then
		player.x = player.x + (player.sp * dt)
	-- Move left
	elseif love.keyboard.isDown(player.keys.left) then
		player.x = player.x - (player.sp * dt)
	end
end

-- Fire
function player.shoot(dt)
	-- Shoot up
	if love.keyboard.isDown(player.keys.fire) then
		player.fire()
	end
	-- Bullets move up and destroy
	for i,b in ipairs(player.bullets) do
		if b.y < -10 then
			table.remove(player.bullets, i)
		end
		b.y = b.y - (bullet.sp * dt)
	end
end

function UPDATE_PLAYER(dt)
	player.cd = player.cd - 1
	player.move(dt)
	player.shoot(dt)
end

function DRAW_PLAYER()
	player.draw()
end