-- initializes and manages pause menu/overlay
-- may eventually become the whole status menu controller, but we'll cross that bridge when we come to it

function initPauseMenuSystem()
	paused = false
	
	-- keyBlocks = {
	-- 	Block(R,{x=2,y=6}),
	-- 	Block(G,{x=4,y=6}),
	-- 	Block(Y,{x=6,y=6}),
	-- }
end

function updatePauseScreen(dt)
	tickAniKey(anikeys.minimap, dt)
end

function drawPauseOverlay()
	--dark overlay
  love.graphics.setColor(0, 0, 0, 100)
  love.graphics.rectangle('fill', 0, 0, screenWidth, screenHeight)
	
	if paused then --[[== "k" then
		--show key
		love.graphics.setColor(255,255,255,255)
		love.graphics.print("KEY:", screenWidth*2/5, screenHeight/6, 0, zoom*2, zoom*2)
		
		-- for i = 1, #keyBlocks do
		-- 	keyBlocks[i]:draw(16*zoom)
		-- end
		love.graphics.draw(images.blocks[R], quadSets.block[1], 32*zoom, 120*zoom, 0, 1, 1)
		love.graphics.draw(images.blocks[G], quadSets.block[1], 80*zoom, 120*zoom, 0, 1, 1)
		love.graphics.draw(images.blocks[Y], quadSets.block[1], 128*zoom, 120*zoom, 0, 1, 1)
		
		
	else]]
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
end

function togglePause(key)
	if paused then
		if paused then --== key then
			paused = false
			resumeBGM()
		end
	else
		paused = true --key
		pauseBGM()
	end
end