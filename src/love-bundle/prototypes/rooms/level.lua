local Room = require "prototypes/room"
local Camera = require "prototypes/camera"

local Level = {}

setmetatable(Level, { __index = Room })

function Level.new()
	local instance = Room.new()
	
	-- instance properties
	instance.camera = Camera.new()
	
	setmetatable(instance, { __index = Level })
	return instance
end

function Level:update(dt)
	Room.update(self, dt)
end

function Level:draw()
	Room.draw(self)
end

return Level
