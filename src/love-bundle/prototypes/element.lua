
local Element = {
	
	isVisible = true,
	
	x = 0,
	y = 0,
	
	speed = 0,
	
	rotate = 0,
	
	originX = 50,
	originY = 50,
	
	camera = nil,
	
	depth = 10,
}

--[[
	`sprite` is required
--]]
function Element.new(opts)
	
	local instance = {}
	
	setmetatable(instance, { __index = Element })
	
	-- instance properties
	
	if opts.isVisible then instance.isVisible = opts.isVisible end
	
	if opts.x then instance.x = opts.x end
	if opts.y then instance.y = opts.y end
	
	if opts.speed then instance.speed = opts.speed end
	
	instance.sprite = love.graphics.newImage(
		"sprites/" .. opts.sprite .. ".png"
	)
	
	-- radians
	if opts.rotate then instance.rotate = opts.rotate end
	
	if opts.originX then instance.originX = opts.originX end
	if opts.originY then instance.originY = opts.originY end
	
	if opts.camera then instance.camera = opts.camera end
	
	if opts.depth then instance.depth = opts.depth end
	
	return instance
end

function Element:absPos(x, y)
	self.x = x
	self.y = y
end

function Element:absX(x)
	self.x = x
end

function Element:absY(y)
	self.y = y
end

function Element:relPos(x, y)
	self.x = self.x + x
	self.y = self.y + y
end

function Element:relX(x)
	self.x = self.x + x
end

function Element:relY(y)
	self.y = self.y + y
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
