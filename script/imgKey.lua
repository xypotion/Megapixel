function loadImages()
	makeQuads()
	
	-- meh. TODO
end

--
images = {
	chipsets = {
		love.graphics.newImage("img/chipset.png"),
		-- love.graphics.newImage("img/chipset2castles??.png"),
	},
	stillActors = {love.graphics.newImage("img/sprites2.png")}, --TODO why is this a table?
	blocks = {
		green = love.graphics.newImage("img/blockG.png"),
		blue = love.graphics.newImage("img/blockB.png"),
		red = love.graphics.newImage("img/blockR.png"),
		cyan = love.graphics.newImage("img/blockC.png"),
		magenta = love.graphics.newImage("img/blockM.png"),
		yellow = love.graphics.newImage("img/blockY.png"),
		white = love.graphics.newImage("img/blockW.png"),
		black = love.graphics.newImage("img/blockK.png"),
		clear = love.graphics.newImage("img/blockClear.png"),
		greenStart = love.graphics.newImage("img/blockG.png"),
		blueStart = love.graphics.newImage("img/blockB.png"),
		redStart = love.graphics.newImage("img/blockR.png"),
	},
	title = love.graphics.newImage("img/title2.png"),
	remote = love.graphics.newImage("img/remote.png"),
	-- colorKey = love.graphics.newImage("img/colorKey.png"),
	colorKey2 = love.graphics.newImage("img/key2.png"),
	colorKey2off = love.graphics.newImage("img/key2off.png"),
	colorKey3 = love.graphics.newImage("img/key3b.png"),
	colorHint1 = love.graphics.newImage("img/key3b1.png"),
	colorHint2 = love.graphics.newImage("img/key3b2.png"),
	colorHint3 = love.graphics.newImage("img/key3b3.png"),
	colorHint4 = love.graphics.newImage("img/key3b4.png"),
	colorHint5 = love.graphics.newImage("img/key3b5.png"),
	colorHint6 = love.graphics.newImage("img/key3b6.png"),
	colorHint7 = love.graphics.newImage("img/key3b7.png"),
	-- marble = {
	-- 	love.graphics.newImage("img/marble1.png"),
	-- 	love.graphics.newImage("img/marble2.png"),
	-- 	love.graphics.newImage("img/marble6.3.png"),
	-- 	love.graphics.newImage("img/marble4.1.png"),
	-- 	love.graphics.newImage("img/marble4.2.png"),
	-- 	love.graphics.newImage("img/marble5.3.png"),
	-- 	love.graphics.newImage("img/marble6.7.png"),
	-- 	love.graphics.newImage("img/marble6.6.png"),
	-- 	love.graphics.newImage("img/marble6.9.png"),
	-- 	love.graphics.newImage("img/marble7.1.png"),
	-- 	love.graphics.newImage("img/marble8.png"),
	-- },
	characters = {
		base = 	love.graphics.newImage("img/char-base.png"),
		-- hero = love.graphics.newImage("img/humans.png"),
		skin = {
			love.graphics.newImage("img/char-african.png"),
			love.graphics.newImage("img/char-caucasian.png"),
		},
		hair = {
			love.graphics.newImage("img/char-hair-orange.png"),
			love.graphics.newImage("img/char-hair-blond.png"),
			love.graphics.newImage("img/char-hair-black.png"),
			love.graphics.newImage("img/char-hair-brown.png"),
			love.graphics.newImage("img/char-hair-white.png"),
		},
		shirts = {
			love.graphics.newImage("img/char-shirt-grey.png"),
			love.graphics.newImage("img/char-shirt-red.png"),
			love.graphics.newImage("img/char-shirt-green.png"),
			love.graphics.newImage("img/char-shirt-blue.png"),
			love.graphics.newImage("img/char-shirt-cyan.png"),
			love.graphics.newImage("img/char-shirt-magenta.png"),
			love.graphics.newImage("img/char-shirt-yellow.png"),
			love.graphics.newImage("img/char-shirt-white.png"), --#9
			love.graphics.newImage("img/char-shirt-black.png"), --#2
			love.graphics.newImage("img/char-shirt-clear.png"),
		}	
		-- elf = love.graphics.newImage("img/directional-elf-1.png"),
	},
	-- swirl = {love.graphics.newImage("img/swirl9.png")}, --eh.
	-- event = {love.graphics.newImage("img/event2.png")}
}

--
colors = {
	white = {r=255,g=255,b=255},
	blue = {r=31,g=31,b=191},
}

--
anikeys = {}
anikeys.map = {
	frame = 1,
	count = 2,
	interval = .4,
	time = 0
}
anikeys.stillActors = {
	frame = 1,
	count = 2,
	interval = .1,
	time = 0
}
anikeys.characters = {
	frame = 1,
	count = 2,
	interval = .32,
	time = 0
}
-- anikeys.swirl = {
-- 	frame = 1,
-- 	count = 8,
-- 	interval = .06,
-- 	time = 0
-- }
-- anikeys.marble = {
-- 	frame = 1,
-- 	count = 8,
-- 	interval = .06,
-- 	time = 0
-- }
-- anikeys.event = {
-- 	frame = 1,
-- 	count = 2,
-- 	interval = .1,
-- 	time = 0
-- }
-- anikeys.minimap = {
-- 	frame = 1,
-- 	count = 2,
-- 	interval = .2,
-- 	time = 0
-- }

--TODO still want to find a better place for this...
function tickAniKey(ak, dt)
	if ak.interval then --if it's nil, then it's still!
		ak.time = ak.time + dt
		if ak.time > ak.interval then
			ak.time = 0
			ak.frame = (ak.frame) % ak.count + 1
		end
	end
end

-- called at startup (from loadImages() above) and whenever zoom changes
function makeQuads()
	quadSets = {}
	
	local qs = {} --"quad size", shortcut for the last 4 of 6 arguments to newQuad in quadAt

	qs = {1,1,8,3}
	quadSets.hero = {
		{
			s = {quadAt(0,0,qs),quadAt(1,0,qs)},
			n = {quadAt(2,0,qs),quadAt(3,0,qs)},
			w = {quadAt(4,0,qs),quadAt(5,0,qs)},
			e = {quadAt(6,0,qs),quadAt(7,0,qs)},
		},
		{
			s = {quadAt(0,1,qs),quadAt(1,1,qs)},
			n = {quadAt(2,1,qs),quadAt(3,1,qs)},
			w = {quadAt(4,1,qs),quadAt(5,1,qs)},
			e = {quadAt(6,1,qs),quadAt(7,1,qs)},
		},
		{
			s = {quadAt(0,2,qs),quadAt(1,2,qs)},
			n = {quadAt(2,2,qs),quadAt(3,2,qs)},
			w = {quadAt(4,2,qs),quadAt(5,2,qs)},
			e = {quadAt(6,2,qs),quadAt(7,2,qs)},
		},
		-- shock = {quadAt(0.5,0,qs)} --TODO glad it works but it's so wrong :P (ART NEEDED)
	}
	--TODO also emotion/casting/hit/down/whatever quads used by all characters in cutscenes? anikeys may change in those cases, is the problem
	
	qs = {1,1,4,8}
	quadSets.stillActors = {
		{quadAt(0,0,qs)}, --quad=1:notes
		{quadAt(2,0,qs)}, --2:exit door
		{quadAt(1,0,qs)}, --3:door
		{quadAt(3,1,qs)}, --4:door top
		{quadAt(1,1,qs)}, --5:grey shirt, only used in pause menu
		{quadAt(3,0,qs)}, --6:key
		{quadAt(0,1,qs)}, --7:remote
		{quadAt(2,1,qs)}, --8:computer back
		--shirts:
		{quadAt(3,4,qs)}, --9:grey
		{quadAt(1,2,qs)}, --10:red
		{quadAt(2,2,qs)}, --11:green
		{quadAt(3,2,qs)}, --12:blue
		{quadAt(0,3,qs)}, --13:cyan
		{quadAt(1,3,qs)}, --14:magenta
		{quadAt(2,3,qs)}, --15:yellow
		{quadAt(0,2,qs)}, --16:white
		{quadAt(3,3,qs)}, --17:black
		{quadAt(2,4,qs)}, --18:clear
		--other:
		{quadAt(1,4,qs)}, --19:elevator
		{quadAt(0,5,qs), quadAt(1,5,qs)}, --20:computer front
	}

	quadSets.paused = quadAt(0,6,{4,2,4,8})
	
	qs = {1,1,2,1}
	quadSets.block = {quadAt(0,0,qs),quadAt(1,0,qs)}
	
	qs = {1,1,4,4}
	mapTileQuads = { --TODO integrate into quadSets
		quadAt(0,0,qs), --1: black
		quadAt(0,1,qs), --2: floor
		quadAt(0,2,qs), --3: high wall with door
		quadAt(0,3,qs), --4: bottom wall with door
		quadAt(1,0,qs), --5: top wall
		quadAt(1,1,qs), --6: plant 
		quadAt(1,2,qs), --7: desk
		quadAt(1,3,qs), --8: chair
		-- quadAt(1,3,qs), --7: daarkness
	}
	
	quadSets.title = quadAt(0,0,{15,15,15,15})
	quadSets.remote = quadAt(0,0,{2,4,2,4})
	-- quadSets.colorKey = quadAt(0,0,{2,4,2,4})
	quadSets.colorKey2 = quadAt(0,0,{4,3,4,3})
	quadSets.colorKey0 = quadAt(0,0,{4,3,4,3})

	quadSets.colorKey3 = quadAt(0,0,{8,1,8,1})
end

-- makes a quad with provided args. just saves space above ~
function quadAt(x, y, qs)
	return love.graphics.newQuad(x*tileSize, y*tileSize, qs[1]*tileSize, qs[2]*tileSize, qs[3]*tileSize, qs[4]*tileSize)
end