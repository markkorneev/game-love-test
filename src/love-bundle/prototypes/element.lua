local Element = {}

--[[
	`sprite` is required
--]]
function Element.new(opts)
	
	local instance = {}
	
	
	-- instance properties
	
	instance.isVisible = true
	
	instance.x = opts.y or 0
	instance.y = opts.x or 0
	
	instance.speed = opts.speed or 0
	
	instance.sprite = love.graphics.newImage(
		"sprites/" .. opts.sprite .. ".png"
	)
	
	instance.rotate = opts.rotate or 0 -- radians
	
	instance.originX = opts.originX or 50
	instance.originY = opts.originY or 50
	
	instance.camera = opts.camera or nil
	
	
	setmetatable(instance, { __index = Element })
	return instance
end

function Element:setPos(x, y)
	self.x = x
	self.y = y
end

function Element:update(dt)
end

function Element:draw()
	
	local data = nil
	
	if self.camera then
		data = self.camera:getDrawData( self )
	else
		data = {
			x = self.x,
			y = self.y,
			zoom = 1
		}
	end
	
	love.graphics.draw(
		self.sprite,
		data.x, data.y, -- position
		math.rad(self.rotate), -- rotate
		data.zoom, data.zoom, -- scale
		
		-- origin offset
		(self.originX * self.sprite:getWidth()  / 100),
		(self.originY * self.sprite:getHeight() / 100) 
	)
end

return Element
