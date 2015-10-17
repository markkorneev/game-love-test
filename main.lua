require "objects/player"
require "objects/enemy"
require "keybind"

function love.load()
	love.graphics.getBackgroundColor(0,0,0)
	
	-- Loading Classes
	player.load()
	enemy.load()
	keybind.load()
end

function love.update(dt)
	UPDATE_PLAYER(dt)
	UPDATE_ENEMY(dt)
	UPDATE_KEYBIND(dt)
	
	love.mouse.setVisible(false)
end

function love.draw()
	DRAW_PLAYER()
	DRAW_ENEMY()
end