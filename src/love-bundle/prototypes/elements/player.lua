
local Element = require "prototypes/element"

local Player = {
	speed = 500,
	isControlsEnabled = false,
}

setmetatable(Player, { __index = Element })

function Player.new(inputOpts)
	
	local opts = inputOpts or {}
	
	opts.sprite = opts.sprite or "player"
	
	local instance = Element.new( opts )
	
	if opts.isControlsEnabled then
		instance.isControlsEnabled = opts.isControlsEnabled
	end
	
	-- instance properties
	
	setmetatable(instance, { __index = Player })
	return instance
end

function Player:update(dt)
	Element.update(self, dt)
	
	if self.isControlsEnabled then
		if love.keyboard.isDown("left") then
			self:relX(-(self.speed * dt))
		end
		if love.keyboard.isDown("right") then
			self:relX(self.speed * dt)
		end
		if love.keyboard.isDown("up") then
			self:relY(-(self.speed * dt))
		end
		if love.keyboard.isDown("down") then
			self:relY(self.speed * dt)
		end
	end
end

function Player:draw()
	Element.draw(self)
end

return Player
