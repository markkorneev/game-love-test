function love.load()
	nya = love.graphics.newImage("001.png")
	x = 50
	y = 50
	speed = 1000
end

function love.update(dt)
	if love.keyboard.isDown("right") then
		x = x + (speed * dt)
	elseif love.keyboard.isDown("left") then
		x = x - (speed * dt)
	end
	if love.keyboard.isDown("down") then
		y = y + (speed * dt)
	elseif love.keyboard.isDown("up") then
		y = y - (speed * dt)
	end

	love.mouse.setVisible(false)
end

function love.draw()
	love.graphics.draw(nya, x, y)
end
