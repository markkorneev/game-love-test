require "enemy"

function love.load()

	-- Loading Class
	enemy.load()
end

function love.update(dt)
	UPDATE_ENEMY(dt)
end

function love.draw()
	DRAW_ENEMY()
end