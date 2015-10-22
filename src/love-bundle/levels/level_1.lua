local Level = require "prototypes/rooms/level"
local Player = require "prototypes/elements/player"

local LevelFirst = {}

setmetatable(LevelFirst, { __index = Level })

function LevelFirst.new()
	local instance = Level.new()
	
	-- instance properties
	-- ...
	
	setmetatable(instance, { __index = LevelFirst })
	
	--[[
	local monsters = {
		{ x: 10, y: 20 },
		{ x: 10, y: 30 }
	}
	
	for i,v in ipairs(monsters) do
		local monster = Monster.new()
		monsert.absPos(v.x, v.y)
		instance:addElement(monster)
	end
	]]--
	
	instance.player = Player.new({
		camera = instance.camera,
		isControlsEnabled = true
	})
	instance:addElement(instance.player)
	
	-- test element
	instance.player2 = Player.new({ camera = instance.camera })
	instance.player2:absPos(-200, -200)
	instance:addElement(instance.player2)
	
	return instance
end

function LevelFirst:update(dt)
	Level.update(self, dt)
	self.camera:followY(self.player.y, 95)
end

function LevelFirst:draw()
	Level.draw(self)
end

return LevelFirst
