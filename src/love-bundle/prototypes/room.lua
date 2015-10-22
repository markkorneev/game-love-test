
local Room = {
	name = "Untitled room"
}

function Room.new()
	local instance = {}
	
	-- instance properties
	instance._elements = {}
	
	setmetatable(instance, { __index = Room })
	return instance
end

function Room:addElement(element)
	table.insert(self._elements, element)
	self:sortElementsByDepth()
end

local function sortElements(list)
	if #list == 0 then
		return list
	else
		local headEl     = nil
		local lesserEls  = {}
		local greaterEls = {}
		for i,element in ipairs(list) do
			if i == 1 then
				headEl = element
			else
				if element.depth <= headEl.depth then
					table.insert(lesserEls, element)
				else
					table.insert(greaterEls, element)
				end
			end
		end
		lesserEls  = sortElements(lesserEls)
		greaterEls = sortElements(greaterEls)
		
		local result = {}
		for i,element in ipairs(lesserEls) do
			table.insert(result, element)
		end
		table.insert(result, headEl)
		for i,element in ipairs(greaterEls) do
			table.insert(result, element)
		end
		return result
	end
end

function Room:sortElementsByDepth()
	self._elements = sortElements(self._elements)
end

function Room:update(dt)
	for i,element in ipairs(self._elements) do
		element:update(dt)
	end
end

function Room:draw()
	for i,element in ipairs(self._elements) do
		if element.isVisible then
			element:draw()
		end
	end
end

return Room
