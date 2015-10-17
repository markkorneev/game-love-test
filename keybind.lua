keybind = {}

function keybind.load()
	keybind.keys = {
	quit = "escape"
	}
end

function keybind.quit(dt)
	-- Game exit
	if love.keyboard.isDown(keybind.keys.quit) then
		love.event.quit()
	end
end

function UPDATE_KEYBIND(dt)
	keybind.quit(dt)
end