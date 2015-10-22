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
		monsert.setPos(v.x, v.y)
		instance:addElement(monster)
	end
	]]--
	
	instance.player = Player.new({ camera = instance.camera })
	instance:addElement(instance.player)
	
	return instance
end

function LevelFirst:update(dt)
	self.camera:followY(self.player.y, 95)
	Level.update(self, dt)
end

function LevelFirst:draw()
	Level.draw(self)
end

return LevelFirst
