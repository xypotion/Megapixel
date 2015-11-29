function saveData()
	love.filesystem.remove("megapixel.save")
	
	--settings
	love.filesystem.write("megapixel.save","EDIT THIS IF YOU WANT TO CHEAT AND MAKE MAX SAD. :'(\n")
	love.filesystem.append("megapixel.save","BODY"..hp.gender..hp.skin..hp.hair.."\n")
	love.filesystem.append("megapixel.save","MUSIC"..(playerSettings.bgmOn and "1" or "0").."\n") --basically a ternary op. weird, huh?
	love.filesystem.append("megapixel.save","SHIRT"..hp.shirt.."\n")
	
	--progress/inventory
	for k,v in pairs(progress) do
		if v then
			love.filesystem.append("megapixel.save", k.."\n")
		end
	end
	
	--funny idea: save settings and progress (and maybe even other things) to separate files! could definitely help for larger projects.
end

function loadSaveData()
	playerSettings = {
		bgmOn = true,
		textSpeed = 60,
		anyKeyAdvancesText = true,
	}
	progress = {}
	hp = {shirt = 1}
	
	local shirtTemp = 1
	for line in love.filesystem.lines("megapixel.save") do
		if line:find("BODY") then
			hp.gender = tonumber(line:sub(5,5))
			hp.skin = tonumber(line:sub(6,6))
			hp.hair = tonumber(line:sub(7,7))
			print("loaded body:")
			--tablePrint(hp)
		elseif line:find("MUSIC") then
			if line:sub(6,6) == "0" then
				playerSettings.bgmOn = false
				stopBGM()
				ping("0 found")
			else
				playerSettings.bgmOn = true
				playBGM()
			end
		elseif line:find("SHIRT") then
			 shirtTemp = tonumber(line:sub(6,6))
		elseif line:find("EDIT THIS IF") then
			print("Save loaded.")
		else
			progress[line] = true
		end
	end
	
	if progress["shirt "..shirtTemp] then
		hp.shirt = shirtTemp
	end

	finishLoadingGame()
	
	startScript(behaviorsRaw.resume)
end

function newGame()
	progress = {}
	playerSettings = {
		bgmOn = true,
		textSpeed = 60,
		anyKeyAdvancesText = true,
	}
	
	finishLoadingGame()
	
	startScript(behaviorsRaw.start)
end

function finishLoadingGame()
	playerSettings.textSpeed = 60
	playerSettings.anyKeyAdvancesText = true
	
	colorControlled = nil
	controllableColors = {R,G,B,C,M,Y,W}
	
	showKey = true
	
	windowState = 1
	
	score = 0
	
	-- playBGM()
	initHero()
	
	--TODO load/create world here?
end