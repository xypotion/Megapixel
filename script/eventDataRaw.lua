math.randomseed(os.time())

-- say: start scrolling text, accepts single string or array of strings
-- warp: starts warp to given destination {wx,wy,mx,my}
-- scorePlus_: adds given value to current score

--EXAMPLE
--[[
	name = "foo" --how scripts will reference this actor in most cases. if omitted, most scripts will be unable to see or use this actor
	sc = {category="stillActors", image=1, quad=1} --"sprite construct"; when LOADED, category => anikey, category+image => image, category+quad => quad
		-- note: actors will still have their own image, anikey, and quad pointers; this is so they CAN BE ALTERED for cutscenes, etc withought messing with sc
			--TODO determine if above statement is necessary/true. emotes/complex actors cover... all of that? i think? (if you handle anikeys smartly)
		-- can also just omit if event is invisible! e.g. town exit points
	complex = false-- if false, may animate and "perform" e.g. hop--ping, but doesn't turn or emote
		-- or true: animates, but has a facing (south by default), and can emote (!!), interrupting normal animation temporarily
	collide = true -- if true, hero cannot pass through; if false, s/he can. also determines how interaction is triggered
	interactionBehavior = {say, "hello world"} -- commands in manual interaction script, listed in pairs
	interactionBehavior = interactionBehaviorsRaw[1] -- can also have shortcuts like so (TODO)
	idleBehavior = {} -- still need TODO this :)
	--that's it!
]] --TODO update this? lol

progressMsg = "bar"

behaviorsRaw = {
	title = {
		addMenu, TitleMenu
	},
	characterSelect = {
		addMenu, CharacterMenu
	},
	resume = {
		-- fadeOut, 0.5,
		-- fadeIn, 0.5,
		warp, {wid=1,mx=6,my=7,facing="s"}, --the real one
		-- warp, {wid=20,mx=1,my=8,facing="s"}, -- for testing
		say, "*yawn* It's so late...",
		say, "I have to find the research materials and get\nout of here!",
	},
	start = {
		-- fadeOut, 0.5,
		-- fadeIn, 0.5,
		warp, {wid=21,mx=9,my=9,facing="s"},
		-- skip,50,
		-- think, {"An experiment has gone awry and your lab is"
		-- 	.."\noverrun with digital matter!",
		-- 	"You will need to move and fuse megapixels"
		-- 	.."\nto find your research notes and escape the lab"
		-- 	.."\nsafely.",
		-- 	"Press RETURN to activate megapixel control."
		-- 	.."\nWASD and the arrow keys allow you to move"
		-- 	.."\nthem out of your way.",
		-- 	"When manipulating digital matter, all megapixels"
		-- 	.."\nof the same type will move as one. However, not all"
		-- 	.."\ntypes can be controlled. Press TAB to cycle through"
		-- 	.."\ncontrollable colors.",
		-- 	"Press SPACE to open doors and inspect objects."
		-- 	.."\nWASD and the arrow keys let you walk around.",
		-- 	"You can also press R to reset any room."
		-- 	.."\nGood luck!",
		-- 	},
		think, {"Working late one night at your new job..."},
		wait, 0.5,
		think, {"You are almost finished with the day's project,"
			.."\na mockup for one of the company's internal tools,"
			.."\nwhen you remember a last strange requirement."
		},
		say,"...it has to have \"extra-large pixels\"?",
		say,"What do they even mean by that?",
		say,"Do they just want me to blow up the image? They\nnever even said how \"extra-large\" they want it.",
		wait,0.5,
		say,"Fine, let's see how those jokers like this.\nScale x 999!",
		wait, 0.25,
		playSFX, "highblip",
		wait, 0.25,
		playSFX, "lowblip",
		wait, 0.25,
		playSFX, "highblip",
		wait,1,
		playSFX,"zoop",
		wait,0.2,
		darken,128,
		wait,0.05,
		darken,0,
		wait,0.05,
		darken,128,
		wait,0.05,
		darken,0,
		wait,0.05,
		darken,128,
		wait,0.05,
		darken,0,
		wait,1,
		makeBlock1_, "greenStart",
		playSFX, "phase",
		wait, 0.4,
		makeBlock2_, "blueStart",
		playSFX, "phase",
		wait, 0.4,
		makeBlock3_, "redStart",
		playSFX, "phase",
		wait, 0.4,
		wait,0.5,
		faceHero, "n",
		wait,0.25,
		say, "Aw, crap!",
		faceHero,"w",
		say, "Giant pixels again!",
		faceHero,"e",
		say, "I regret this immediately.",
		wait,0.25,
		think,"Warning...",
		wait,0.25,
		faceHero,"s",
		say,"No, I already know...",
		think,"Warning: digital matter containment breached.",
		think,"All staff must proceed to entry hall for further\ninstructions.",
		think,"Use extreme caution. Direct contact with digital\nmatter has unpredictable and possibly fatal\nresults.",
		say, "Great. Looks like I did it again, and now I'm\nthe only one in the office who can fix it.",
		say,"They trained me a little last time, but digital matter\nis weird. Better go see if I can figure this out.",
		-- say,"What the heck did I do??",
		-- say,"I'd better get out of here!\n",		
		-- say, "START\nI have to collect my notes and get out of here!",
		playBGM, 0,
		-- collect_, "remote"
	},
	blocks = {
		green = {--TODO update these a little
			say, "A green megapixel. I think this can be fused with\nblue or red digital matter to make cyan or yellow."
			.."\nIt also mixes with magenta, resulting in white\ndigital matter."
		},
		blue = {
			say, "A blue megapixel. I think this can be fused with\ngreen or red matter to make cyan or magenta."
			.."\nIt also fuses with yellow, resulting in white\ndigital matter."
		},
		red = {
			say, "A red megapixel. I think this can be fused with\nblue or green matter to make magenta or yellow."
			.."\nIt also fuses with cyan, resulting in white\ndigital matter."
		},
		cyan = {
			say, "A cyan megapixel. Hm, I think this can only be fused\nwith red, which makes white digital matter."
		},
		magenta = {
			say, "A magenta megapixel. Hm, I think this can only be fused\nwith green, which makes white digital matter."
		},
		yellow = {
			say, "A yellow megapixel. Hm, I think this can only be fused\nwith blue, which makes white digital matter."
		},
		white = {
			say, "Oh, a white megapixel! This is the only kind of\ndigital matter that can fuse with black. White"
			.."\ncan actually fuse with any color, which is useful,\nbut it's still just as dangerous as any other kind.",
		},
		black = {
			say, "Hm, black digital matter... not only can I not control\nit with my remote, but there's only one kind of"
			.."\ndigital matter that will fuse with it.",
			say, "This anomaly will require more research."
		},
		greenStart = {
			say,"An especially deadly shade of green. Yuck."
		},
		blueStart = {
			say,"A gelatinous cube! I cast Magic Missile!",
			say,"...if only."
		},
		redStart = {
			say,"Not sure why, but this one seems the most\ndangerous."
		},
	},
}

eventDataRaw = {
	--1:
	{
		name = "remote",
		sc = {category="stillActors", image=1, quadId=7},
		appearsUntilAllCollected = {"remote"},
		collide = true,
		interactionBehavior = {
			say, "What is this? A remote control?",
			think, "Instructions to Operator:",
			think, "In the event of a digital matter containment breach,\ncollect vital research materials from all rooms\nand evacuate the premises.",
			say,"They need me to find their notes?\nMust be pretty important stuff.",
			say,"Is the building going to self-destruct or something?",
			think,"In case you need to manipulate digital matter to\nobtain materials, this remote control will allow you"
			.."\nto move and fuse digital matter in your path.",
			think, "Blocks of digital matter are known as \n\"mega-pixels\".",
			say,"Why name them? Does this happen often?",
			think, "The RETURN key will activate this remote control,\nand the TAB key will let you select the color you\nwish to control.",
			think,"Mega-pixels of the same color move as one.\n",
			say,"Oh, right. You can only control one color at\na time. Control with use RETURN and TAB.",
			-- say,"And stuff that's the same color moves as one.",
			-- say,"Whatever that means.",
			think, "Digital matter is a well-understood phenomenon;\ncertain colors can and cannot be manipulated,\nand certain colors fuse with others.",
			think,"For example, as any schoolchild knows, red digital\nmatter fuses with green digital matter to create\nyellow.",
			-- think,"That yellow mega-pixel can then be fused with a\nblue mega-pixel to create a white mega-pixel.\nYellow and blue are opposing colors.",
			-- think,"Different colors of digital matter behave in\ndifferent ways. Experiment as needed and refer to\nthe key provided.",
			say, "Yeah, we didn't have this stuff when I was a kid.",
			say, "Cheeky manual.",
			think,"In case the operator in unfamiliar with the basic\nprinciples, a color key is provided.",
			think,"As always, use extreme caution.",
			say, "All right, then. Not sure if I get this.",
			say,"But I'm definitely fired if I don't collect their\nresearch materials before... the office blows up?",
			say,"I actually have no idea what will happen. Better get\ncracking, though.",
			collect_, "remote",
			wait, 1,
			warp, {wid=1,mx=6,my=7,facing="s"},
			say, "I have to find those research materials and get\nout of here.",
		}
	},
	{
		name = "elevator",
		sc = {category="stillActors", image=1, quadId=17},
		collide = true,
		interactionBehavior = {
				textMenu, {
				prompt = "Select floor (press X to cancel):",
				options = {
					{label=" 2F",skip=1},
					{label=" 3F",skip=4},
					{label=" 4F",skip=7},
				}
			},
			skip, 99,
			playSFX, "bell",
			warp,{wid=2,mx=2,my=6,facing="s"},
			skip, 99,
			playSFX, "bell",
			warp,{wid=3,mx=2,my=6,facing="s"},
			skip, 99,
			playSFX, "bell",
			warp,{wid=4,mx=2,my=6,facing="s"}

			-- -- OR make choose() support up to 6 options. that actually doesn't sound that bad.
			-- -- - ...never mind, it's actualy hard. goddammit. way to make text menus as inelegant as possible.
			-- choose, {"Select floor.", {"1st",1},{"2nd",2},{"3rd",3},{"4th",4}},
			-- wait,0.5,
			-- warp,{wid=1,mx=5,my=7,facing="s-- "}
-- 			warp,{wid=1,mx=5,my=7,facing="s"}
-- 			warp,{wid=1,mx=5,my=7,facing="s"}
			
			-- it's all a horrible hack either way! definitely rewrite menu/text stuff when you get back to chroma crisis!
		}
	},
	--3
	{
		name = "doorTo5",
		sc = {category="stillActors", image=1, quadId=2},
		collide = true,
		interactionBehavior = {
			choose, {"Leave room?", {"No", 1}, {"Yes",0}},
			warp,{wid=5,mx=3,my=7,facing="s"}
		}
	},
	--4
	{
		name = "doorTo1a",
		sc = {category="stillActors", image=1, quadId=3},
		collide = true,
		interactionBehavior = {
			choose, {"Leave room?", {"No", 1}, {"Yes",0}},
			warp,{wid=1,mx=11,my=8,facing="n"}
		}
	},
	--5
	{
		name = "victory key",
		sc = {category="stillActors", image=1, quadId=6},
		appearsIfAllCollected = {"notes 1","notes 2","notes 3","notes 4","notes 5","notes 6","notes 7","notes 8"},
		collide = true,
		interactionBehavior = {
			think, "You got them all! Good job!",
			think, "Sadly, that's all for now. I ran out of time\nto make all 16 puzzles.",
			think, "Credits:\nArt, Design, Coding: Max Wunderlich\nPlaytesting & Moral Support: Dustin Cogswell",
			think, "Sound effects made in cfxr.\n  http://thirdcog.eu/apps/cfxr",
			think, "Background track:\nJinko Eisei by Circuit Monster\nDownloaded from Jamendo.com",
			think, "Thanks to itch.io and DavidoBot for hosting\nLove Jam 2!",
			think, "And thanks to Love 2D for being awesome!\n  love2d.org",
			think, "...I plan to add the rest of the game later!\nIf you liked it and want more, follow \n@xypotion on Twitter for updates.",
			-- saveData, nil,
			-- warp,{wid=1,mx=11,my=8,facing="n"}
			wait, 2,
			say, "Hm? What's this?",
			collect_, "shirt 2",
			collect_, "shirt 3",
			collect_, "shirt 4",
			collect_, "shirt 5",
			collect_, "shirt 6",
			collect_, "shirt 7",
			collect_, "shirt 8",
			collect_, "shirt 9",
			think,"Here's a bonus for finishing this version ~\nTry pressing the number keys! :)"
		}
	},
	--6: comp at start
	{
		name = "office PC at start",
		sc = {category="stillActors", image=1, quadId=8},
		appearsUntilAllCollected = {"notes 1","notes 2","notes 3","notes 4","notes 5","notes 6","notes 7","notes 8"},
		collide = true,
		interactionBehavior = {
			say, "\"Fatal results\". Yikes."
			-- saveData, nil,
			-- warp,{wid=1,mx=11,my=8,facing="n"}
		}
	},
	--7: comp at end
	{
		name = "office PC at end",
		sc = {category="stillActors", image=1, quadId=8},
		appearsIfAllCollected = {"notes 1","notes 2","notes 3","notes 4","notes 5","notes 6","notes 7","notes 8"}, --TODO change these?
		collide = true,
		interactionBehavior = {
			say, {"You're so thorough! Thanks for playing!"},
			-- saveData, nil,
			-- TODO give last shirt? eh
			-- warp,{wid=1,mx=11,my=8,facing="n"}
		}
	},
	--8: lobby comp without remote front
	{
		name = "lobby PC w/o remote",
		sc = {category="stillActors", image=1, quadId=18},
		appearsUntilAllCollected = {"remote"},
		collide = true,
		interactionBehavior = {
			say, "It says:\n\"Access denied. Remote control required.\""
			-- saveData, nil,
			-- warp,{wid=1,mx=11,my=8,facing="n"}
		}
	},
	--9: lobby comp without remote back
	{
		name = "lobby PC w/o remote",
		sc = {category="stillActors", image=1, quadId=8},
		appearsUntilAllCollected = {"remote"},
		collide = true,
		interactionBehavior = {
			say, "It says:\n\"Access denied. Remote control required.\""
			-- saveData, nil,
			-- warp,{wid=1,mx=11,my=8,facing="n"}
		}
	},
	--10-12: back-facing lobby comps with control hints
	{
		name = "lobby PC 1",
		sc = {category="stillActors", image=1, quadId=8},
		appearsIfAllCollected = {"remote"},
		collide = true,
		interactionBehavior = {
			say, "It says:\n\"Press R to reset any room.\"",
		}
	},
	{
		name = "lobby PC 2",
		sc = {category="stillActors", image=1, quadId=8},
		appearsIfAllCollected = {"remote"},
		collide = true,
		interactionBehavior = {
			say, "It says:\n\"Press P to pause and view controls.\"",
		}
	},
	{
		name = "lobby PC 3",
		sc = {category="stillActors", image=1, quadId=8},
		appearsIfAllCollected = {"remote"},
		collide = true,
		interactionBehavior = {
			say, "It says:\n\"The game automatically saves whenever an item\nis collected. The game can be exited at any time\nwith the Esc key.\"",
		}
	},
	--13: instructions comp
	{
		name = "lobby PC 4",
		sc = {category="stillActors", image=1, quadId=18},
		appearsIfAllCollected = {"remote"},
		collide = true,
		interactionBehavior = {
			choose, {"Select manual page (X to cancel):", {"Basic puzzle controls", 0}, {"Color mixing guide", 2}},
			say, "controls!!",
			skip, 1,
			say, "colors!!"
		}
	},
	--14: progress comp
	{
		name = "lobby PC 5",
		sc = {category="stillActors", image=1, quadId=18},
		appearsIfAllCollected = {"remote"},
		collide = true,
		interactionBehavior = {
			sayProgressMessage, 0,
		}
	},
}

--special doors
eventDataRaw[171] = {
	name = "door from room 21",
	sc = {category="stillActors", image=1, quadId=3},
	collide = true,
	-- appearsUntilAllCollected = {"notes 1","notes 4"},
	interactionBehavior = {
		-- choose, {"Leave room?", {"No", 3}, {"Yes",0}},
		playSFX, "door",
		warp,{wid=1,mx=2,my=8,facing="n"},
		-- say,"Hm, what's that on the table?"
	}
}--from office
eventDataRaw[121] = {
	name = "door to room 21",
	sc = {category="stillActors", image=1, quadId=4},
	collide = true,
	-- appearsUntilAllCollected = {"notes 1","notes 4"},
	interactionBehavior = {
		-- choose, {"Leave room?", {"No", 3}, {"Yes",0}},
		playSFX, "door",
		warp,{wid=24,mx=10,my=7,facing="s"},
		-- say,"Hm, what's that on the table?"
	}
}--to office

--stairs
--[[
eventDataRaw[212] = {
	name = "1 to 2",
	-- appearsIfAllCollected = {"notes 1", "notes 2", "notes 3"}, TODO
	sc = {category="stillActors", image=1, quadId=3},
	collide = true,
	interactionBehavior = {
		choose, {"Go upstairs to floor 2?", {"No", 1}, {"Yes",0}},
		warp,{wid=2,mx=2,my=6,facing="s"}
	}
}
eventDataRaw[221] = {
	name = "2 to 1",
	sc = {category="stillActors", image=1, quadId=3},
	collide = true,
	interactionBehavior = {
		choose, {"Go downstairs to floor 1?", {"No", 1}, {"Yes",0}},
		warp,{wid=1,mx=2,my=6,facing="s"}
	}
}
eventDataRaw[223] = {
	name = "2 to 3",
	sc = {category="stillActors", image=1, quadId=4},
	collide = true,
	interactionBehavior = {
		choose, {"Go upstairs to floor 3?", {"No", 1}, {"Yes",0}},
		warp,{wid=3,mx=2,my=8,facing="n"}
	}
}
eventDataRaw[232] = {
	name = "3 to 2",
	sc = {category="stillActors", image=1, quadId=4},
	collide = true,
	interactionBehavior = {
		choose, {"Go downstairs to floor 2?", {"No", 1}, {"Yes",0}},
		warp,{wid=2,mx=2,my=8,facing="n"}
	}
}
eventDataRaw[234] = {
	name = "3 to 4",
	sc = {category="stillActors", image=1, quadId=3},
	collide = true,
	interactionBehavior = {
		choose, {"Go upstairs to floor 4?", {"No", 1}, {"Yes",0}},
		warp,{wid=4,mx=2,my=6,facing="s"}
	}
}
eventDataRaw[243] = {
	name = "4 to 3",
	sc = {category="stillActors", image=1, quadId=3},
	collide = true,
	interactionBehavior = {
		choose, {"Go downstairs to floor 3?", {"No", 1}, {"Yes",0}},
		warp,{wid=3,mx=2,my=6,facing="s"}
	}
}
]]

--elevators
eventDataRaw[201] = {
	name = "elevator",
	sc = {category="stillActors", image=1, quadId=17},
	collide = true,
	interactionBehavior = {
		textMenu, {
			prompt = "Select floor (press X to cancel):",
			options = {
				{label=" 2F",skip=1},
				{label=" 3F",skip=4},
				{label=" 4F",skip=7},
			}
		},
		skip, 99,
		playSFX, "bell",
		warp,{wid=2,mx=2,my=6,facing="s"},
		skip, 99,
		playSFX, "bell",
		warp,{wid=3,mx=2,my=6,facing="s"},
		skip, 99,
		playSFX, "bell",
		warp,{wid=4,mx=2,my=6,facing="s"}
	}
}
eventDataRaw[202] = {
	name = "elevator",
	sc = {category="stillActors", image=1, quadId=17},
	collide = true,
	interactionBehavior = {
		textMenu, {
			prompt = "Select floor (press X to cancel):",
			options = {
				{label=" 1F",skip=1},
				{label=" 3F",skip=4},
				{label=" 4F",skip=7},
			}
		},
		skip, 99,
		playSFX, "bell",
		warp,{wid=1,mx=2,my=6,facing="s"},
		skip, 99,
		playSFX, "bell",
		warp,{wid=3,mx=2,my=6,facing="s"},
		skip, 99,
		playSFX, "bell",
		warp,{wid=4,mx=2,my=6,facing="s"}
	}
}
eventDataRaw[203] = {
	name = "elevator",
	sc = {category="stillActors", image=1, quadId=17},
	collide = true,
	interactionBehavior = {
		textMenu, {
			prompt = "Select floor (press X to cancel):",
			options = {
				{label=" 1F",skip=1},
				{label=" 2F",skip=4},
				{label=" 4F",skip=7},
			}
		},
		skip, 99,
		playSFX, "bell",
		warp,{wid=1,mx=2,my=6,facing="s"},
		skip, 99,
		playSFX, "bell",
		warp,{wid=2,mx=2,my=6,facing="s"},
		skip, 99,
		playSFX, "bell",
		warp,{wid=4,mx=2,my=6,facing="s"}
	}
}
eventDataRaw[204] = {
	name = "elevator",
	sc = {category="stillActors", image=1, quadId=17},
	collide = true,
	interactionBehavior = {
		textMenu, {
			prompt = "Select floor (press X to cancel):",
			options = {
				{label=" 1F",skip=1},
				{label=" 2F",skip=4},
				{label=" 3F",skip=7},
			}
		},
		skip, 99,
		playSFX, "bell",
		warp,{wid=1,mx=2,my=6,facing="s"},
		skip, 99,
		playSFX, "bell",
		warp,{wid=2,mx=2,my=6,facing="s"},
		skip, 99,
		playSFX, "bell",
		warp,{wid=3,mx=2,my=6,facing="s"},
	}
}

--doors floor 1
eventDataRaw[306] = {
	name = "doorTo6",
	sc = {category="stillActors", image=1, quadId=4},
	collide = true,
	interactionBehavior = {
		-- choose, {"Leave room?", {"No", 3}, {"Yes",0}},
		playSFX, "door",
		warp,{wid=6,mx=5,my=3,facing="s"}
	}
}
eventDataRaw[356] = {
	name = "doorFrom6",
	sc = {category="stillActors", image=1, quadId=3},
	collide = true,
	interactionBehavior = {
		choose, {"Leave room?", {"No", 3}, {"Yes",0}},
		playSFX, "door",
		warp,{wid=1,mx=6,my=11,facing="n"}
	}
}
eventDataRaw[313] = {
	name = "doorTo13",
	sc = {category="stillActors", image=1, quadId=3},
	collide = true,
	interactionBehavior = {
		playSFX, "door",
		warp,{wid=13,mx=5,my=8,facing="n"},
	}
}
eventDataRaw[363] = {
	name = "doorFrom13",
	sc = {category="stillActors", image=1, quadId=4},
	collide = true,
	interactionBehavior = {
		choose, {"Leave room?", {"No", 3}, {"Yes",0}},
		playSFX, "door",
		warp,{wid=1,mx=6,my=3,facing="s"}
	}
}
eventDataRaw[316] = {
	name = "doorTo16",
	sc = {category="stillActors", image=1, quadId=4},
	collide = true,
	interactionBehavior = {
		playSFX, "door",
		warp,{wid=16,mx=6,my=6,facing="s"}
	}
}
eventDataRaw[366] = {
	name = "doorFrom16",
	sc = {category="stillActors", image=1, quadId=3},
	collide = true,
	interactionBehavior = {
		choose, {"Leave room?", {"No", 3}, {"Yes",0}},
		playSFX, "door",
		warp,{wid=1,mx=11,my=11,facing="n"}
	}
}
eventDataRaw[320] = {
	name = "doorTo20",
	sc = {category="stillActors", image=1, quadId=3},
	collide = true,
	interactionBehavior = {
		playSFX, "door",
		warp,{wid=20,mx=6,my=11,facing="n"},
	}
}
eventDataRaw[370] = {
	name = "doorFrom20",
	sc = {category="stillActors", image=1, quadId=4},
	collide = true,
	interactionBehavior = {
		choose, {"Leave room?", {"No", 3}, {"Yes",0}},
		playSFX, "door",
		warp,{wid=1,mx=11,my=3,facing="s"}
	}
}

--doors floor 2
eventDataRaw[305] = {
	name = "doorTo5",
	sc = {category="stillActors", image=1, quadId=4},
	collide = true,
	-- appearsUntilAllCollected = {"notes 1","notes 4"},
	interactionBehavior = {
		-- choose, {"Leave room?", {"No", 3}, {"Yes",0}},
		playSFX, "door",
		warp,{wid=5,mx=3,my=7,facing="s"},
	}
}
eventDataRaw[355] = {
	name = "doorFrom5",
	sc = {category="stillActors", image=1, quadId=3},
	collide = true,
	interactionBehavior = {
		choose, {"Leave room?", {"No", 3}, {"Yes",0}},
		playSFX, "door",
		warp,{wid=2,mx=11,my=11,facing="n"}
	}
}
eventDataRaw[307] = {
	name = "doorTo7",
	sc = {category="stillActors", image=1, quadId=3},
	collide = true,
	interactionBehavior = {
		-- choose, {"Leave room?", {"No", 3}, {"Yes",0}},
		playSFX, "door",
		warp,{wid=7,mx=6,my=9,facing="n"}
	}
}
eventDataRaw[357] = {
	name = "doorFrom7",
	sc = {category="stillActors", image=1, quadId=4},
	collide = true,
	interactionBehavior = {
		choose, {"Leave room?", {"No", 3}, {"Yes",0}},
		playSFX, "door",
		warp,{wid=2,mx=6,my=3,facing="s"}
	}
}
eventDataRaw[314] = {
	name = "doorTo14",
	sc = {category="stillActors", image=1, quadId=4},
	collide = true,
	interactionBehavior = {
		playSFX, "door",
		warp,{wid=14,mx=6,my=5,facing="s"}
	}
}
eventDataRaw[364] = {
	name = "doorFrom14",
	sc = {category="stillActors", image=1, quadId=3},
	collide = true,
	interactionBehavior = {
		choose, {"Leave room?", {"No", 3}, {"Yes",0}},
		playSFX, "door",
		warp,{wid=2,mx=6,my=11,facing="n"}
	}
}
eventDataRaw[315] = {
	name = "doorTo15",
	sc = {category="stillActors", image=1, quadId=3},
	collide = true,
	interactionBehavior = {
		playSFX, "door",
		warp,{wid=15,mx=6,my=13,facing="n"}
	}
}
eventDataRaw[365] = {
	name = "doorFrom15",
	sc = {category="stillActors", image=1, quadId=4},
	collide = true,
	interactionBehavior = {
		choose, {"Leave room?", {"No", 3}, {"Yes",0}},
		playSFX, "door",
		warp,{wid=2,mx=11,my=3,facing="s"}
	}
}

--doors floor 3
eventDataRaw[308] = {
	name = "doorTo8",
	sc = {category="stillActors", image=1, quadId=4},
	collide = true,
	interactionBehavior = {
		-- choose, {"Leave room?", {"No", 3}, {"Yes",0}},
		playSFX, "door",
		warp,{wid=8,mx=10,my=6,facing="s"}
	}
}
eventDataRaw[358] = {
	name = "doorFrom8",
	sc = {category="stillActors", image=1, quadId=3},
	collide = true,
	interactionBehavior = {
		choose, {"Leave room?", {"No", 3}, {"Yes",0}},
		playSFX, "door",
		warp,{wid=3,mx=6,my=11,facing="n"}
	}
}
eventDataRaw[309] = {
	name = "doorTo9",
	sc = {category="stillActors", image=1, quadId=3},
	collide = true,
	interactionBehavior = {
		-- choose, {"Leave room?", {"No", 3}, {"Yes",0}},
		playSFX, "door",
		warp,{wid=9,mx=9,my=11,facing="n"}
	}
}
eventDataRaw[359] = {
	name = "doorFrom9",
	sc = {category="stillActors", image=1, quadId=4},
	collide = true,
	interactionBehavior = {
		choose, {"Leave room?", {"No", 3}, {"Yes",0}},
		playSFX, "door",
		warp,{wid=3,mx=6,my=3,facing="s"}
	}
}
eventDataRaw[310] = {
	name = "doorTo10",
	sc = {category="stillActors", image=1, quadId=3},
	collide = true,
	interactionBehavior = {
		-- choose, {"Leave room?", {"No", 3}, {"Yes",0}},
		playSFX, "door",
		warp,{wid=10,mx=5,my=13,facing="n"},
	}
}
eventDataRaw[360] = {
	name = "doorFrom10",
	sc = {category="stillActors", image=1, quadId=4},
	collide = true,
	interactionBehavior = {
		choose, {"Leave room?", {"No", 3}, {"Yes",0}},
		playSFX, "door",
		warp,{wid=3,mx=11,my=3,facing="s"}
	}
}
eventDataRaw[318] = {
	name = "doorTo18",
	sc = {category="stillActors", image=1, quadId=4},
	collide = true,
	interactionBehavior = {
		playSFX, "door",
		warp,{wid=18,mx=14,my=6,facing="s"},
	}
}
eventDataRaw[368] = {
	name = "doorFrom18",
	sc = {category="stillActors", image=1, quadId=3},
	collide = true,
	interactionBehavior = {
		choose, {"Leave room?", {"No", 3}, {"Yes",0}},
		playSFX, "door",
		warp,{wid=3,mx=11,my=11,facing="n"}
	}
}

--doors floor 4
eventDataRaw[311] = {
	name = "doorTo11",
	sc = {category="stillActors", image=1, quadId=3},
	collide = true,
	interactionBehavior = {
		-- choose, {"Leave room?", {"No", 3}, {"Yes",0}},
		playSFX, "door",
		warp,{wid=11,mx=3,my=12,facing="n"},
	}
}
eventDataRaw[361] = {
	name = "doorFrom11",
	sc = {category="stillActors", image=1, quadId=4},
	collide = true,
	interactionBehavior = {
		choose, {"Leave room?", {"No", 3}, {"Yes",0}},
		playSFX, "door",
		warp,{wid=4,mx=11,my=3,facing="s"}
	}
}
eventDataRaw[312] = {
	name = "doorTo12",
	sc = {category="stillActors", image=1, quadId=4},
	collide = true,
	interactionBehavior = {
		-- choose, {"Leave room?", {"No", 3}, {"Yes",0}},
		playSFX, "door",
		warp,{wid=12,mx=2,my=5,facing="s"},
	}
}
eventDataRaw[362] = {
	name = "doorFrom12",
	sc = {category="stillActors", image=1, quadId=3},
	collide = true,
	interactionBehavior = {
		choose, {"Leave room?", {"No", 3}, {"Yes",0}},
		playSFX, "door",
		warp,{wid=4,mx=11,my=11,facing="n"}
	}
}
eventDataRaw[317] = {
	name = "doorTo17",
	sc = {category="stillActors", image=1, quadId=3},
	collide = true,
	interactionBehavior = {
		playSFX, "door",
		warp,{wid=17,mx=2,my=11,facing="n"}
	}
}
eventDataRaw[367] = {
	name = "doorFrom17",
	sc = {category="stillActors", image=1, quadId=4},
	collide = true,
	interactionBehavior = {
		choose, {"Leave room?", {"No", 3}, {"Yes",0}},
		playSFX, "door",
		warp,{wid=4,mx=6,my=3,facing="s"}
	}
}
eventDataRaw[319] = {
	name = "doorTo19",
	sc = {category="stillActors", image=1, quadId=4},
	collide = true,
	interactionBehavior = {
		playSFX, "door",
		warp,{wid=19,mx=14,my=3,facing="s"},
	}
}
eventDataRaw[369] = {
	name = "doorFrom19",
	sc = {category="stillActors", image=1, quadId=3},
	collide = true,
	interactionBehavior = {
		choose, {"Leave room?", {"No", 3}, {"Yes",0}},
		playSFX, "door",
		warp,{wid=4,mx=6,my=11,facing="n"}
	}
}
		-- warp,{wid=14,mx=6,my=5,facing="s"},
		-- warp,{wid=15,mx=6,my=5,facing="s"},
		-- warp,{wid=16,mx=7,my=12,facing="n"},
		-- warp,{wid=17,mx=2,my=11,facing="n"},

--lobby computers
eventDataRaw[400] = {
	-- name = "pre-remote"
	sc = {category="stillActors", image=1, quadId=6},
	collide = true,
	appearsUntilAllCollected = {"remote"},
	interactionBehavior = {
		say, "It just says, \"Remote required for access.\"",
	}
}
eventDataRaw[401] = {
	name = "basic controls",
	sc = {category="stillActors", image=1, quadId=6},
	collide = true,
	appearsIfAllCollected = {"remote"},
	interactionBehavior = {
		say, "There's a message on the screen. It says...",
		think, "here are the basic controls! Z/M/P/Esc/X?"
	}
}
-- one for progress
-- one for pixel controls
-- one discussing pixel fusion

--notes
eventDataRaw[1001] = {
	name = "notes 1",
	sc = {category="stillActors", image=1, quadId=1},
	appearsUntilAllCollected = {"notes 1"},
	collide = true,
	interactionBehavior = {
		collect_, "notes 1",
		say, "Got Research Notes 1! Let's take a look...",
		think, "Did you know you can pause the game with P?",
		think, "The pause screen has some useful info on it!",
	}
} -- notes 1 pickup

eventDataRaw[2001] = {
	name = "notes 1",
	sc = {category="stillActors", image=1, quadId=1},
	collide = true,
	appearsIfAllCollected = {"notes 1"},
	interactionBehavior = {
		say, "Research Notes 1, got 'em.",
	}
} -- notes 1 displayed at base

eventDataRaw[1002] = {
	name = "notes 2",
	sc = {category="stillActors", image=1, quadId=1},
	collide = true,
	appearsUntilAllCollected = {"notes 2"},
	interactionBehavior = {
		collect_, "notes 2",
		say, "Got Research Notes 2! Let's take a look...",
		think, "You can press R to reset any room."
	}
}
eventDataRaw[2002] = {
	name = "notes 2",
	sc = {category="stillActors", image=1, quadId=1},
	collide = true,
	appearsIfAllCollected = {"notes 2"},
	interactionBehavior = {
		-- say, "Research Notes 2, got 'em.",
		choose, {"Research Notes #2, got 'em.", {"Don't read.", 1}, {"Read", 0}},
		say, "You can press R to reset any room."
	}
}
eventDataRaw[1003] = {
	name = "notes 3",
	sc = {category="stillActors", image=1, quadId=1},
	collide = true,
	appearsUntilAllCollected = {"notes 3"},
	interactionBehavior = {
		collect_, "notes 3",
		say, "Got Research Notes 3! Let's take a look...",
		think, "Blue and yellow are opposites.",
		think, "Red and cyan are opposites.",
		think, "Green and magenta are opposites.",
		think, "White and black are opposites, but white also\nfuses with ANY color, while black only fuses\nwith white."
	}
}

eventDataRaw[2003] = {
	name = "notes 3",
	sc = {category="stillActors", image=1, quadId=1},
	collide = true,
	appearsIfAllCollected = {"notes 3"},
	interactionBehavior = {
		say, "Research Notes 3, got 'em.",
	}
}

eventDataRaw[1004] = {
	name = "notes 4",
	sc = {category="stillActors", image=1, quadId=1},
	collide = true,
	appearsUntilAllCollected = {"notes 4"},
	interactionBehavior = {
		collect_, "notes 4",
		say, "Got Research Notes 4! Let's take a look...",
		think, "Try pressing Z to change the screen size."
	}
}
eventDataRaw[2004] = {
	name = "notes 4",
	sc = {category="stillActors", image=1, quadId=1},
	collide = true,
	appearsIfAllCollected = {"notes 4"},
	interactionBehavior = {
		say, "Research Notes 4, got 'em.",
	}
}

eventDataRaw[1005] = {
	name = "notes 5",
	sc = {category="stillActors", image=1, quadId=1},
	appearsUntilAllCollected = {"notes 5"},
	collide = true,
	interactionBehavior = {
		collect_, "notes 5",
		say, "Got Research Notes 5! Let's take a look:...",
		think,"Did you know that the game auto-saves\nevery time you collect an item?"
	}
}
eventDataRaw[2005] = {
	name = "notes 5",
	sc = {category="stillActors", image=1, quadId=1},
	collide = true,
	appearsIfAllCollected = {"notes 5"},
	interactionBehavior = {
		say, "Research Notes 5, got 'em.",
	}
}

eventDataRaw[1006] = {
	name = "notes 6",
	sc = {category="stillActors", image=1, quadId=1},
	collide = true,
	appearsUntilAllCollected = {"notes 6"},
	interactionBehavior = {
		collect_, "notes 6",
		say, "Got Research Notes 6! Let's take a look...",
		think,"You can mute the music with M."
	}
}
eventDataRaw[2006] = {
	name = "notes 6",
	sc = {category="stillActors", image=1, quadId=1},
	collide = true,
	appearsIfAllCollected = {"notes 6"},
	interactionBehavior = {
		say, "Research Notes 6, got 'em.",
	}
}

eventDataRaw[1007] = {
	name = "notes 7",
	sc = {category="stillActors", image=1, quadId=1},
	collide = true,
	appearsUntilAllCollected = {"notes 7"},
	interactionBehavior = {
		collect_, "notes 7",
		say, "Got Research Notes 7!",
	}
}
eventDataRaw[2007] = {
	name = "notes 7",
	sc = {category="stillActors", image=1, quadId=1},
	collide = true,
	appearsIfAllCollected = {"notes 7"},
	interactionBehavior = {
		say, "Research Notes 7, got 'em.",
	}
}

eventDataRaw[1008] = {
	name = "notes 8",
	sc = {category="stillActors", image=1, quadId=1},
	collide = true,
	appearsUntilAllCollected = {"notes 8"},
	interactionBehavior = {
		collect_, "notes 8",
		say, "Got Research Notes 8!"
	}
}
eventDataRaw[2008] = {
	name = "notes 8",
	sc = {category="stillActors", image=1, quadId=1},
	collide = true,
	appearsIfAllCollected = {"notes 8"},
	interactionBehavior = {
		say, "Research Notes 8, got 'em.",
	}
}

eventDataRaw[1009] = {
	name = "notes 9",
	sc = {category="stillActors", image=1, quadId=1},
	appearsUntilAllCollected = {"notes 9"},
	collide = true,
	interactionBehavior = {
		collect_, "notes 9",
		say, "Got Research Notes 9! Let's take a look...",
		think, "You can press P to go to the Pause screen."
		-- say, "Did you know you can pause the game with P?\nThe pause screen has some useful info on it!",
		--think, "Did you know you can pause the game with P?",
		--think, "The pause screen has some useful info on it!",
	}
} -- notes 9 pickup
eventDataRaw[2009] = {
	name = "notes 9",
	sc = {category="stillActors", image=1, quadId=1},
	collide = true,
	appearsIfAllCollected = {"notes 9"},
	interactionBehavior = {
		choose, {"Research Notes #9, got 'em.", {"Don't read.", 1}, {"Read", 0}},
		think, "You can press P to go to the Pause screen."
	}
} -- notes 9 displayed at base
eventDataRaw[1010] = {
	name = "notes 10",
	sc = {category="stillActors", image=1, quadId=1},
	collide = true,
	appearsUntilAllCollected = {"notes 10"},
	interactionBehavior = {
		collect_, "notes 10",
		say, "Got Research Notes 10!",
		--think, "You can press R to reset any room."
	}
}

eventDataRaw[2010] = {
	name = "notes 10",
	sc = {category="stillActors", image=1, quadId=1},
	collide = true,
	appearsIfAllCollected = {"notes 10"},
	interactionBehavior = {
		say, "Research Notes 10, got 'em.",
	}
}

eventDataRaw[1011] = {
	name = "notes 11",
	sc = {category="stillActors", image=1, quadId=1},
	collide = true,
	appearsUntilAllCollected = {"notes 11"},
	interactionBehavior = {
		collect_, "notes 11",
		say, "Got Research Notes 11!",
		--think, "Blue and yellow are opposites.",
		--think, "Red and cyan are opposites.",
		--think, "Green and magenta are opposites.",
		--think, "White and black are opposites, but white also\nfuses with ANY color, while black only fuses\nwith white."
	}
}
eventDataRaw[2011] = {
	name = "notes 11",
	sc = {category="stillActors", image=1, quadId=1},
	collide = true,
	appearsIfAllCollected = {"notes 11"},
	interactionBehavior = {
		say, "Research Notes 11, got 'em.",
	}
}

eventDataRaw[1012] = {
	name = "notes 12",
	sc = {category="stillActors", image=1, quadId=1},
	collide = true,
	appearsUntilAllCollected = {"notes 12"},
	interactionBehavior = {
		collect_, "notes 12",
		say, "Got Research Notes 12!",
		--think, "Try pressing Z to change the screen size."
	}
}
eventDataRaw[2012] = {
	name = "notes 12",
	sc = {category="stillActors", image=1, quadId=1},
	collide = true,
	appearsIfAllCollected = {"notes 12"},
	interactionBehavior = {
		say, "Research Notes 12, got 'em.",
	}
}
eventDataRaw[1013] = {
	name = "notes 13",
	sc = {category="stillActors", image=1, quadId=1},
	appearsUntilAllCollected = {"notes 13"},
	collide = true,
	interactionBehavior = {
		collect_, "notes 13",
		say, "Got Research Notes 13! Let's take a look:...",
		--think,"Did you know that the game auto-saves\nevery time you collect an item?"
	}
}

eventDataRaw[2013] = {
	name = "notes 13",
	sc = {category="stillActors", image=1, quadId=1},
	collide = true,
	appearsIfAllCollected = {"notes 13"},
	interactionBehavior = {
		say, "Research Notes 13, got 'em.",
	}
}

eventDataRaw[1014] = {
	name = "notes 14",
	sc = {category="stillActors", image=1, quadId=1},
	collide = true,
	appearsUntilAllCollected = {"notes 14"},
	interactionBehavior = {
		collect_, "notes 14",
		say, "Got Research Notes 14! Let's take a look...",
		--think,"You can mute the music with M."
	}
}
eventDataRaw[2014] = {
	name = "notes 14",
	sc = {category="stillActors", image=1, quadId=1},
	collide = true,
	appearsIfAllCollected = {"notes 14"},
	interactionBehavior = {
		say, "Research Notes 14, got 'em.",
	}
}

eventDataRaw[1015] = {
	name = "notes 15",
	sc = {category="stillActors", image=1, quadId=1},
	collide = true,
	appearsUntilAllCollected = {"notes 15"},
	interactionBehavior = {
		collect_, "notes 15",
		say, "Got Research Notes 15!",
	}
}
eventDataRaw[2015] = {
	name = "notes 15",
	sc = {category="stillActors", image=1, quadId=1},
	collide = true,
	appearsIfAllCollected = {"notes 15"},
	interactionBehavior = {
		say, "Research Notes 15, got 'em.",
	}
}

eventDataRaw[1016] = {
	name = "notes 16",
	sc = {category="stillActors", image=1, quadId=1},
	collide = true,
	appearsUntilAllCollected = {"notes 16"},
	interactionBehavior = {
		collect_, "notes 16",
		say, "Got Research Notes 16!"
	}
}
eventDataRaw[2016] = {
	name = "notes 16",
	sc = {category="stillActors", image=1, quadId=1},
	collide = true,
	appearsIfAllCollected = {"notes 16"},
	interactionBehavior = {
		say, "Research Notes 16, got 'em.",
	}
}


--shirts
eventDataRaw[902] = {
	name = "shirt 2",
	sc = {category="stillActors",image=1,quadId=9},
	collide = true,
	appearsUntilAllCollected = {"shirt 2"},
	interactionBehavior = {
		collect_, "shirt 2",
		say, "Found a black shirt!",
		say, "Press 2 to wear it. You can change back to\nyour grey shirt by pressing 1.",
		say, "\"Black does go with everything.\""
	}
	}--black, bound for room 12
eventDataRaw[903] = {
	name = "shirt 3",
	sc = {category="stillActors",image=1,quadId=10},
	collide = true,
	appearsUntilAllCollected = {"shirt 3"},
	interactionBehavior = {
		collect_, "shirt 3",
		say, "Found a red shirt!",
		say, "Press 3 to wear it. You can change back to\nyour grey shirt by pressing 1.",
		say, "\"Red. Hot.\""
	}
}--red
eventDataRaw[904] = {
	name = "shirt 4",
	sc = {category="stillActors",image=1,quadId=11},
	collide = true,
	appearsUntilAllCollected = {"shirt 4"},
	interactionBehavior = {
		collect_, "shirt 4",
		say, "Found a green shirt!",
		say, "Press 4 to wear it. You can change back to\nyour grey shirt by pressing 1.",
		say, "\"Huh, it feels kinda springy.\""
	}
}--green
eventDataRaw[905] = {
	name = "shirt 5",
	sc = {category="stillActors",image=1,quadId=12},
	collide = true,
	appearsUntilAllCollected = {"shirt 5"},
	interactionBehavior = {
		collect_, "shirt 5",
		say, "Found a blue shirt!",
		say, "Press 5 to wear it. You can change back to\nyour grey shirt by pressing 1.",
		say, "\"Hm, cool.\""
	}
}--blue
eventDataRaw[906] = {
	name = "shirt 6",
	sc = {category="stillActors",image=1,quadId=13},
	collide = true,
	appearsUntilAllCollected = {"shirt 6"},
	interactionBehavior = {
		collect_, "shirt 6",
		say, "Found a cyan shirt!",
		say, "Press 6 to wear it. You can change back to\nyour grey shirt by pressing 1.",
		say, "\"Whew. I feel like I'm stuck in a puzzle\ngame or something.\"" --TODO
	}
}--cyan
eventDataRaw[907] = {
	name = "shirt 7",
	sc = {category="stillActors",image=1,quadId=14},
	collide = true,
	appearsUntilAllCollected = {"shirt 7"},
	interactionBehavior = {
		collect_, "shirt 7",
		say, "Found a red shirt!",
		say, "Press 7 to wear it. You can change back to\nyour grey shirt by pressing 1.",
		say, "\"Cute.\""
	}
}--magenta
eventDataRaw[908] = {
	name = "shirt 8",
	sc = {category="stillActors",image=1,quadId=15},
	collide = true,
	appearsUntilAllCollected = {"shirt 8"}, --TODO
	interactionBehavior = {
		collect_, "shirt 8",
		say, "Found a yellow shirt!",
		say, "Press 8 to wear it. You can change back to\nyour grey shirt by pressing 1.",
		say, "\"Wow, so bright.\"",
		say, "\"I'm honestly impressed.\""
	}
	}--yellow, in room 11
eventDataRaw[909] = {
	name = "shirt 9",
	sc = {category="stillActors",image=1,quadId=16},
	collide = true,
	appearsUntilAllCollected = {"shirt 9"},
	interactionBehavior = {
		collect_, "shirt 9",
		say, "Found a white shirt!",
		say, "Press 9 to wear it. You can change back to\nyour grey shirt by pressing 1.",
		say, "\"Is this cotton?\""
	}
}--white, bound for room 7?

-- TODO other shirts, including clear from a computer PLUS its dead version?
