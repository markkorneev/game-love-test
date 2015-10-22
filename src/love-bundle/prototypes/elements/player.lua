local Element = require "prototypes/element"

local Player = {}

setmetatable(Player, { __index = Element })

function Player.new(opts)
	opts = opts or {}
	
	if not opts.sprite then
		opts.sprite = "player"
	end
	
	local instance = Element.new( opts )
	
	-- instance properties
	
	setmetatable(instance, { __index = Player })
	return instance
end

function Player:update(dt)
	Element.update(self, dt)
end

function Player:draw()
	Element.draw(self)
end

return Player
