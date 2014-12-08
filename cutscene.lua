--STORYTELLING a.k.a. cutscenes. these things will all mingle a lot in the final game, so make the algorithms very flexible!

function startScript(script)
	runningScript = true
	currentScript = script
	csli = 1 -- "current script line index"
	
	doNextScriptLine()
	
	-- event.spriteId = newEvent(eventDataRaw[1])
end

function doNextScriptLine()
	if currentScript[csli] then
		line = currentScript[csli]	
		_type = type(line)
	
		-- read closely, because this is weird!
		if _type == "function" then
			-- if it's a function, do it and pass the NEXT script element as the argument...
			-- ...and then check the return value. if it's true, recurse to have the next script line start instantly.
			if currentScript[csli](currentScript[csli+1]) then
				csli = csli + 2
				doNextScriptLine()
			else
				csli = csli + 2
			end
		else
			print("ERROR, "..type(currentScript[csli]).." found in event script where there should have been a function.")
			print(currentScript[csli])
			runningScriptLine = false
			runningScript = false
		end
	else
		runningScriptLine = false
		runningScript = false
		-- print "SCRIPT OVER"
	end	
end

------------------------------------------------------------------------------------------------------

-- shortcuts used in eventDataRaw; each either does something instantly or sets up an animation for the next
-- each returns...
	-- true if it happens instantly and needs to trigger the next script line immediately (e.g. scorePlus_, shock_, vanish)
	-- false if it wants the script to wait until its action is done (e.g. wait, hop, say)
	-- CONVENTION: foo returns false (as in "do foo."), foo_ returns true (as in "do foo and...")
	
function stop(arg)
	runningScriptLine = false
	runningScript = false
	
	return false
end

function skip(lines)
	csli = csli + lines * 2
	
	return true
end

-- TODO still kinda just a proof of concept. maybe change to use a menuStack object?
function choose(menu)
	startPromptAndMenuScroll(menu)
	
	return false
end

function textMenu(params)
	print("textMenu")
	
	addMenu(TextMenu, params)
end
	
-- slightly hacky, but it works!
function wait(sec)
	globalActors.waiter.translatorFunction = waitTranslator
	globalActors.waiter.finishFunction = stopActor
	globalActors.waiter.distanceFromTarget = sec
	
	actorsShifting = actorsShifting + 1
	
	return false
end

function warp(dest)
	print ("warp")
	startWarpTo(dest)
	
	return false
end

--TODO sayUpper and sayLower to explicitly state where the text box goes (for cutscenes). allow to calculate if not specified (for overworld objects)
function say(dialog)
	print "say"
	if type(dialog) == "table" then
		startTextScroll(dialog, true)
	elseif type(dialog) == "string" then
		startTextScroll({dialog}, true)
	else
		print("ERROR in say(), argument must be string or table of strings")
	end
	
	return false
end

function think(dialog)
	print "think"
	if type(dialog) == "table" then
		startTextScroll(dialog, false)
	elseif type(dialog) == "string" then
		startTextScroll({dialog}, false)
	else
		print("ERROR in say(), argument must be string or table of strings")
	end
	
	return false
end

-- TODO
-- function walk(args) 
-- 	-- event name
-- 	-- direction
-- 	-- number of steps
-- 	-- run next line, true or false
-- end

-- TODO is it possible to have emotes that rest automatically and don't hold up scripts? like shockFor1Sec_()? (probably, but later)

function shock_(name)
	actor = getActorByName(name)
	
	actor.emotion = "shock"
	
	return true
end

function noEmote_(name)
	actor = getActorByName(name)
	
	actor.emotion = nil
	
	return true
end

function hop(name, continue) -- continue = nil if not passed, and that's ok...? lua's so weird.
	actor = getActorByName(name)
	
	if not actor then 
		print("don't know an actor called "..name)
		return false
	end
	
	actor.translatorFunction = hopTranslator
	actor.finishFunction = actorArrive
	actor.timeElapsed = 0
	actor.distanceFromTarget = 0
	actor.targetPos = actor.currentPos
	actorsShifting = actorsShifting + 1
	
	return continue 
end
function hop_(name)
	return hop(name, true)
end

function vanish_(name)
	actor = getActorByName(name)
	
	if actor then
		print("found "..name)
		actor.currentPos.x = -100 -- whatever.
		setActorXY(actor)
	end
	
	return true
end

function collect_(name)
	progress[name] = true
	saveData()
	playSFX("item")
	
	if name == "remote" then 
		HUDOpacity = 63 
	end --you are terrible.

	return vanish_(name)
end

function sayProgressMessage(z)
	local msg = {
		"Floor 1 Materials:"..
			"\n Notes 1..."..gotEmOrMissing("notes 1")..". Notes 2..."..gotEmOrMissing("notes 2").."."..
			"\n Notes 3..."..gotEmOrMissing("notes 3")..". Notes 4..."..gotEmOrMissing("notes 4")..".",
		"Floor 2 Materials:"..
			"\n Notes 5..."..gotEmOrMissing("notes 5")..". Notes 6..."..gotEmOrMissing("notes 6").."."..
			"\n Notes 7..."..gotEmOrMissing("notes 7")..". Notes 8..."..gotEmOrMissing("notes 8")..".",
		"Floor 3 Materials:"..
			"\n Notes 9..."..gotEmOrMissing("notes 9")..". Notes 10..."..gotEmOrMissing("notes 10").."."..
			"\n Notes 11..."..gotEmOrMissing("notes 11")..". Notes 12..."..gotEmOrMissing("notes 12")..".",
		"Floor 4 Materials:"..
			"\n Notes 13..."..gotEmOrMissing("notes 13")..". Notes 14..."..gotEmOrMissing("notes 14").."."..
			"\n Notes 15..."..gotEmOrMissing("notes 15")..". Notes 16..."..gotEmOrMissing("notes 16")..".",
	}
	
	say(msg)
end

function gotEmOrMissing(item)
	if progress[item] then
		return "got 'em"
	else
		return "MISSING"
	end
end

function sayShirtProgressMessage(z)
	local msg = {
		"Floor 1 Special Materials:"..
			"\n Material R..."..acquiredOrMissing("shirt 2")..".",
		"Floor 2 Special Materials:"..
			"\n Material G..."..acquiredOrMissing("shirt 3").."."..
			"\n Material W..."..acquiredOrMissing("shirt 8")..".",
		"Floor 3 Special Materials:"..
			"\n Material B..."..acquiredOrMissing("shirt 4").."."..
			"\n Material M..."..acquiredOrMissing("shirt 6")..".",
		"Floor 4 Special Materials:"..
			"\n Material C..."..acquiredOrMissing("shirt 5").."."..
			"\n Material Y..."..acquiredOrMissing("shirt 7").."."..
			"\n Material K..."..acquiredOrMissing("shirt 9")..".",
		-- "??? Materials"
			-- "\nMaterial X..."..acquiredOrMissing("shirt 0")
	}
	
	say(msg)
end

function acquiredOrMissing(item)
	if progress[item] then
		return "acquired"
	else
		return "MISSING"
	end
end

-- obvs for testing, but who knows? might morph into incrementProgress() or something in final game. :)
function scorePlus_(amt)
	score = score + amt
	print( "score up'd by "..amt)
	return true
end

function darkenOverlay_(color)
	blackOverlayOpacity = 255
	
	return true
end

function fadeIn(sec)
	-- local sec = sec or 0.5
	
	-- blackOverlayOpacity = 255
	globalActors.fader.translatorFunction = fadeInTranslator
	globalActors.fader.finishFunction = stopActor
	globalActors.fader.distanceFromTarget = sec
	
	actorsShifting = actorsShifting + 1
	
	return false
end

function fadeOut(sec)
	-- local sec = sec or 0.5
	
	-- blackOverlayOpacity = 255
	globalActors.fader.translatorFunction = fadeOutTranslator
	globalActors.fader.finishFunction = stopActor
	globalActors.fader.distanceFromTarget = sec
	
	actorsShifting = actorsShifting + 1
	
	return false
end

------------------------------------------------------------------------------------------------------

--hacko jacko

function makeBlock1_(color)
	blocks[#blocks+1] = Block(color,{x=9,y=7})
end
function makeBlock2_(color)
	blocks[#blocks+1] = Block(color,{x=11,y=8})
end
function makeBlock3_(color)
	blocks[#blocks+1] = Block(color,{x=8,y=9})
end

function darken(opacity)
	blackOverlayOpacity = opacity
end

function faceHero(direction)
	globalActors.hero.facing = direction
end