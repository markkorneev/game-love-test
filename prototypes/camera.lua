local Camera = {}

function Camera.new()
	local instance = {}
	
	-- instance properties
	instance.x = 0 -- read only
	instance.y = 0 -- read only
	instance.zoom = 1 -- read only
	
	setmetatable(instance, { __index = Camera })
	return instance
end

function Camera:setPos(x, y)
	self.x = x
	self.y = y
end

function Camera:setX(x)
	self.x = x
end

function Camera:setY(y)
	self.y = y
end

function Camera:setZoom(zoom)
	self.zoom = zoom
end

function Camera:getDrawData(element)
	
	local screenW, screenH = love.window.getDimensions()
	
	return {
		zoom = self.zoom,
		x = (screenW/2) + (element.x * self.zoom) - (self.x),
		y = (screenH/2) + (element.y * self.zoom) - (self.y)
	}
end

function Camera:followY(y, offset)
	local screenH = love.window.getHeight()
	self:setY((y + (screenH/2)) - (offset * screenH / 100))
end

return Camera
