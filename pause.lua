-- initializes and manages pause menu/overlay
-- may eventually become the whole status menu controller, but we'll cross that bridge when we come to it

function initPauseMenuSystem()
	paused = false
end

function updatePauseScreen(dt)
	tickAniKey(anikeys.minimap, dt)
end

function drawPauseOverlay()
	--dark overlay
  love.graphics.setColor(0, 0, 0, 100)
  love.graphics.rectangle('fill', 0, 0, screenWidth, screenHeight)
	
	--TODO progress

	love.graphics.setColor(255,255,255,255)
	love.graphics.print("PAUSED", screenWidth/3, screenHeight/6, 0, zoom*2, zoom*2)

	love.graphics.setColor(207,207,207,255)
	love.graphics.print("ABCDEFGHIJKLMNOPQRSTUVWXYZ\n\n\n\n\n\n\nControls:", screenWidth/6, 10--[[screenHeight/3]], 0, zoom, zoom)
	--TODO un-hack (separate alphabet, actually derive letters from progress table, darken further). kinda just testing placement of alphabet
	
	love.graphics.setColor(255,255,255,255)
	love.graphics.print("\nWASD/Arrow Keys: walk, move blocks\nSpace: inspect/interact\n\nReturn: activate pixel control"
		-- .."\n[Shift]-Tab: cycle through colors\nR: reset room\nM: mute background music\nZ: toggle zoom\nEsc: exit game",
		.."\nTab[+Shift]: cycle through colors\n\nR: reset room\nM: mute background music\nZ: change window size\n\nEsc: exit game",
		screenWidth/5, screenHeight/3, 0, zoom, zoom)
		
		--TODO shirt controls
end

function togglePause()
	if paused then
		paused = false
		resumeBGM()
	else
		paused = true
		pauseBGM()
	end
end