local LevelFirst = require "levels/level_1"

local curLevel = nil

function love.load()
	love.graphics.getBackgroundColor(0,0,0)
	love.mouse.setVisible(false)
	
	curLevel = LevelFirst.new()
end

function love.update(dt)
	
	-- Game exit
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
	
	curLevel:update(dt)
end

function love.draw()
	curLevel:draw()
end
