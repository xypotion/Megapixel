-- TODO pretty hacky/devvy for now, but this is the gist of it. 1 = collide, 0 = clear
-- * should have as many members as there are chipsets
-- * each member should have as many members as there are in quadsets.map (1 per tile type)
-- collisionMaps = {}
-- collisionMaps[1] = {0,0,1,0,0,1,1} --normal chipset
-- collisionMaps[2] = {0,1,1,0,0,1,1} --"castle" derpset
collisionMatrix = {false,true} -- false assumed otherwise

G = "green"
B = "blue"
R = "red"
C = "cyan"
M = "magenta"
Y = "yellow"
W = "white"
K = "black"
X = nil

mapDataRaw = {
	--1: FIRST FLOOR, hub of operations
	{
		tileData = {
			{3,3,3,3,3,3,3,3,3,3,3,1},
			{2,2,2,2,2,2,2,2,2,2,2,3},
			{1,1,2,2,2,2,2,2,2,2,2,2},
			{3,3,2,2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,7,7,7,2,2,2},
			{2,2,2,2,2,7,7,7,7,2,2,2},
			{2,2,2,2,2,2,2,2,2,2,2,2},
			{4,1,2,2,2,2,2,2,2,2,2,2},
			{1,1,2,2,2,2,2,2,2,2,2,2},
			{1,1,1,2,2,2,2,2,2,2,2,1},
			{1,1,1,1,4,1,1,1,1,4},
		},
		startAt = {x=2,y=2,default=1},
		blocks = {
			{X,X,X,X,X,X,X,X,R},
			{X,X,X,B},
			{X,X,M,X,R},
			{X,X,X,X,X,X,X,X,X,X,X,Y},
			{X,X,X,X,X,X,X,X,X,X,G},
			{X},
			{X},
			{X,X,B,X,X,X,X,X,X,X,K},
			{X,X,X,G}
		},
		blocksAt = {x=2,y=3},
		localActorPointers = {
			--papers
			--[[
			{x=7,y=5,id=2001},
			{x=8,y=5,id=2002},
			{x=9,y=5,id=2003},
			{x=10,y=5,id=2004},
			{x=7,y=6,id=2005},
			{x=8,y=6,id=2006},
			{x=9,y=6,id=2007},
			{x=10,y=6,id=2008},
			{x=7,y=8,id=2009},
			{x=8,y=8,id=2010},
			{x=9,y=8,id=2011},
			{x=10,y=8,id=2012},
			{x=7,y=9,id=2013},
			{x=8,y=9,id=2014},
			{x=9,y=9,id=2015},
			{x=10,y=9,id=2016},
			]]
			
			--doors
			{x=6,y=2,id=313},
			{x=11,y=2,id=320},
			{x=6,y=12,id=306},
			{x=11,y=12,id=316},
			
			--elevators:
			{x=2,y=9,id=121}, --to office
			{x=2,y=5,id=201}, --to floor 2
			
			--exits:
			{x=2,y=2,id=100}, --without notes
			-- {x=3,y=2,id=171}, --without notes
			
			--other
			{x=7,y=7,id=1}, --remote!
			-- {x=10,y=5,id=5}, --victory key
			
			--pre-remote PCs:
			{x=8,y=6,id=9}, --pc a
			{x=9,y=6,id=9}, --pc b
			{x=10,y=6,id=9}, --pc c
			-- {x=8,y=7,id=8}, --pc d
			{x=9,y=7,id=8}, --pc e
			{x=10,y=7,id=8}, --pc f
			
			--post-remote PCs:
			{x=8,y=6,id=10}, --pc a
			{x=9,y=6,id=11}, --pc b
			{x=10,y=6,id=12}, --pc c
			-- {x=8,y=7,id=11}, --pc d
			{x=9,y=7,id=13}, --pc e
			{x=10,y=7,id=14}, --pc f
		},
		warpDrop = {wid=1,mx=10,my=5,facing="s"}
	},
	--2: SECOND FLOOR
	{
		tileData = {
			{1,1,1,3,3,3,3,3,3,3,3,1},
			{1,1,3,2,2,2,2,2,2,2,2,3},
			{1,1,2,2,2,2,2,2,2,2,2,2},
			{3,3,2,2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,7,7,6,2,2,2,2},
			{2,2,2,2,2,2,2,2,2,2,2,2},
			{1,1,2,2,2,2,2,2,2,2,2,2},
			{1,1,2,2,2,2,2,2,2,2,2,2},
			{1,1,1,2,2,2,2,2,2,2,2,1},
			{1,1,1,1,4,1,1,1,1,4},
		},
		startAt = {x=2,y=2,default=1},
		blocks = {
			{X,X,X,X,X,R},
			{X,X,X,W,Y,X,X,X,X,X,M},
			{X,X,Y,X,X,X,X,X,B,B,K},
			{X,X,M,X,X,X,R},
			{X,X,X,X,X,X,X,X,X,X,G},
			{B,X,G,G},
			{X,X,X,X,X,X,X,X,Y},
			{X,X,X,X,W,X,X,X,X,X,R},
			{X,X,X,K}
		},
		blocksAt = {x=2,y=3},
		localActorPointers = {
			--doors
			{x=6,y=2,id=307},
			{x=11,y=2,id=315},
			{x=6,y=12,id=314},
			{x=11,y=12,id=305},
			
			-- {x=2,y=8,id=121},			--
			{x=2,y=5,id=202}, -- to floor 1
			-- {x=2,y=9,id=223}, -- to floor 3

			-- {x=10,y=5,id=5},
		},
		warpDrop = {wid=1,mx=10,my=5,facing="s"}
	},
	--3: THIRD FLOOR
	{
		tileData = {
			{1,1,1,3,3,3,3,3,3,3,3,1},
			{1,1,3,2,2,2,2,2,2,2,2,3},
			{1,1,2,2,2,2,2,2,2,2,2,2},
			{3,3,2,2,2,7,7,8,2,2,2,2},
			{2,2,2,2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2,2,2,2},
			{4,1,2,2,2,2,2,2,2,2,2,2},
			{1,1,2,2,2,2,2,2,2,2,2,2},
			{1,1,1,2,2,2,2,2,2,2,2,1},
			{1,1,1,1,4,1,1,1,1,4},
		},
		startAt = {x=2,y=2,default=1},
		localActorPointers = {
			--doors
			{x=6,y=2,id=309},
			{x=11,y=2,id=310},
			{x=6,y=12,id=308},
			{x=11,y=12,id=318},
			
			-- {x=2,y=8,id=121},			--
			-- {x=2,y=9,id=232}, -- to floor 2
			{x=2,y=5,id=203}, -- to floor 4

			-- {x=10,y=5,id=5},
		},
		warpDrop = {wid=1,mx=10,my=5,facing="s"}
	},
	--4: FOURTH FLOOR
	{
		tileData = {
			{1,1,1,3,3,3,3,3,3,3,3,1},
			{1,1,3,2,2,2,2,2,2,2,2,3},
			{1,1,6,2,2,2,2,2,2,2,2,6},
			{3,3,2,2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,7,7,2,2,2,2},
			{2,2,2,2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2,2,2,2},
			{1,1,2,2,2,2,2,2,2,2,2,2},
			{1,1,6,2,2,2,2,2,2,2,2,6},
			{1,1,1,2,2,2,2,2,2,2,2,1},
			{1,1,1,1,4,1,1,1,1,4},
		},
		startAt = {x=2,y=2,default=1},
		blocks = {
			{X,X,R,X,K,X,X,K,X,M},
			{X,X,K,X,X,K,X,X,K,G},
			{X,X,X,K,X,X,K,X,Y,K},
			{B,K,X,X,X,X,X,K,X,X,K},
			{X,X,K,X,X,K,C,X,X,X,Y},
			{K,X,X,M,X,X,K,X,X,K},
			{X,K,X,X,K,X,X,K,X,X,K},
			{X,X,K,X,X,K,C,X,K},
			{X,X,X,X,X,X,K}
		},
		blocksAt = {x=3,y=3},
		localActorPointers = {
			--doors
			{x=6,y=2,id=317},
			{x=11,y=2,id=311},
			{x=6,y=12,id=319},
			{x=11,y=12,id=312},
			
			-- {x=2,y=8,id=121},			--
			{x=2,y=5,id=204}, -- to floor 1
			-- {x=2,y=9,id=223}, -- to floor 3

			{x=9,y=6,id=15},
		},
		warpDrop = {wid=1,mx=10,my=5,facing="s"} --TODO wait, this is where reset drops you? hmm
	},
	
--puzzles:
-- floor 1: 6,13,16,20(R)
-- floor 2: 5,7(W),14(G),15
-- floor 3: 8,9(M),10,18(B)
-- floor 4: 11(Y),12(K),17,19(C)

	{
		tileData = {
			{3,3,3,1,1,1,1,1,1,3,3,3},
			{6,2,6,3,3,3,3,3,3,6,2,6},
			{2,2,2,2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2,2,2,2},
			{2,2,2,1,1,1,1,1,1,2,2,2}
		}, 
		startAt = {x=2,y=6,default=1},
		blocks = {
			{R,K,C,C,K,R},
			{G,K,M,M,K,G},
			{B,K,Y,Y,K,B},
		},
		blocksAt = {x=5,y=8},
		localActorPointers = {
			{x=3,y=6,id=355}, -- exit
			{x=12,y=7,id=1001},
			-- {x=2,y=9,id=903}
		}
	},--5: silly first puzzle (doors 305, 355, notes 1001) **
	{
		tileData = {
			{3,3,3,3},
			{2,2,2,2},
			{2,8,2,8},
			{2,7,7,7},
			{2,2,8,2},
			{2,7,7,7},
			{2,8,2,8},
			{2,7,7,7},
			-- {2,3,3,2},
			{2,2,2,2}
		}, 
		startAt = {x=2,y=2,default=1},
		blocks = {
			{G},
			{B},
			{R},
			{G},
			{B},
			{K}
		},
		blocksAt = {x=2,y=4},
		localActorPointers = {
			{x=5,y=2,id=356}, -- exit
			{x=5,y=10,id=1002},
		}
	},--6: narrow puzzle, pretty easy * oldest baby puzzle, kinda
	{
		tileData = {
			{3,3,3,3,3,3,3},
			{2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2},
			{1,1,4,1,2,2,2},
		}, 
		startAt = {x=4,y=3,default=1},
		blocks = {
			{X,X,C,W,W,W,W},
			{X,C,W,W,W,W,W},
			{C,W,W,W,W,W,W},
			{W,W,W,W,W,W,W},
			{W,W,W,W,W,W,C},
			{W,W,X,W,W,C,R},
			{X,X,X,X,C,R,R}
		},
		blocksAt = {x=4,y=4},
		localActorPointers = {
			{x=6,y=10,id=357}, -- exit
			{x=4,y=4,id=1003},
			{x=10,y=4,id=909}
		}
	},--7: white puzzle *** shirt candidate: white, hidden under a white block! maybe upper right corner. IF you put white shirt here, move to level 2 or 3
	{
		tileData = {
			{1,3,3,3,3,3,3,3,1},
			{3,2,2,2,2,2,2,2,3},
			{2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2},
			{2,2,2,2,8,2,2,2,2},
			{1,2,2,2,2,2,2,2},
		}, 
		startAt = {x=2,y=4,default=1},
		blocks = {
			{X,K,K,K,K,K,},
			{K,Y,X,K,X,G,K},
			{K,X,C,K,M,X,K},
			{K,K,K,W,K,K,K},
			{K,X,M,K,C,X,K},
			{K,G,X,K,X,Y,K},
			{X,K,K,K,K,K},
		},
		blocksAt = {x=2,y=5},
		localActorPointers = {
			{x=10,y=5,id=358}, -- exit
			{x=4,y=6,id=1004},
		}
	},--8: black grate puzzle **** shirt candidate: black? hmm. kinda no place for it...
	{
		tileData = {
			{3,3,3,3,3,3,3,3},
			{2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2},
			{2,2,2,6,2,2,2},
			{2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,3},
			{2,2,2,2,2,2,2,2},
			{1,1,1,1,1,1,1,4},
		}, 
		startAt = {x=2,y=4,default=1},
		blocks = {
			{Y,Y,C,M,C,Y,C},
			{X},
			{C,M,Y,X,M,M,Y},
			{X},
			{M,Y,C,Y,C,C,M}
		},
		blocksAt = {x=2,y=6},
		localActorPointers = {
			{x=9,y=12,id=359}, -- exit
			{x=9,y=5,id=907},
			{x=2,y=10,id=1005},
		}
	},--9: 3 CMY rows w/ no fusion puzzle (needs notes) **** shirt candidate: magenta
	{
		tileData = {
			{1,1,3,3,3,1,1},
			{3,3,2,2,2,3,3},
			{2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2},
			{6,2,6,2,6,2,6},
			{2,2,2,2,2,2,2},
			{2,6,2,6,2,6,2},
			{2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2},
			{1,1,1,4}
		}, 
		startAt = {x=2,y=3,default=1},
		blocks = {
			{X,B,G,R,B,G},
			{X,B,G,R,B,G},
			{X},
			{X},
			{X,Y,X,M,X,C},
			{Y,C,M,Y,C,M,Y},
			{C,X,Y,X,M,X,C},
		},
		blocksAt = {x=2,y=5},
		localActorPointers = {
			{x=5,y=14,id=360}, -- exit
			{x=5,y=4,id=1006},
			-- {x=5,y=8,id=6},
		}
	},--10: plant rows puzzle ***
	{
		tileData = {
			{3,3,3,3,3,3,3,3,3,3,3},
			{2,2,2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2,2,2},
			{2,2,2,2,6,2,6,2,2,2,2},
			{2,2,2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2,2,2},
			{2},
			{4}
		}, 
		startAt = {x=3,y=3,default=1},
		blocks = {
			{R,R,R,R,R,R,R,R,R},
			{R,C,C,C,C,X,C,C,R},
			{R,C,W,W,C,C,W,W,R},
			{R,C,C,C,C,C,C,C,R},
			{R,C,C,X,X,X,C,C,R},
			{R,B,B,G,G,G,B,B,R},
			{R,B,B,B,B,B,B,B,R},
			{R,R,R,R,R,R,R,R,R},
		},
		blocksAt = {x=4,y=4},
		localActorPointers = {
			{x=3,y=13,id=361}, -- exit
			{x=8,y=8,id=1007},
			{x=9,y=5,id=908},
		}
	},--11: painting puzzle *** shirt candidate: yellow = sun! :D and WOW that shirt took me a long time to get. jesus. hardest puzzle yet? *****
	-- steps for shirt: red right 1, magenta left 1, blue down 1, up 1, green left 1, down 1, all the way right, yellow out of the way
	-- blue down 1, right all the way, down 1 again, red left 2, right 2, yellow to top right, green to top and 3 from right (making a second yellow),
	-- move character into middle left area, move yellow down and left, finally chunk red left 2 and down 1 onto cyan (gap must be where shirt sits). whew.
	{
		tileData = {
			{3,1,1,1,1,1,1,1,1,1,1,1,3},
			{2,3,3,3,3,3,3,3,3,3,3,3,2},
			{2,2,2,2,2,2,2,2,2,2,2,6,2},
			{2,2,2,2,2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2,2,2,2,2},
		}, 
		startAt = {x=2,y=4,default=1},
		blocks = {
			{X,W,W,W,X,X,G,X,K,X,K,X,K},
			{X,W,W,W,X,X,B,X,K,K,K,K,K},
			{X,W,W,W,X,X,R,X,K,K,K,K,K},
			{X,X,W,X,X,X,X,X,X,K,K,K},
			{X,X,W,X,X,X,R,X,X,K,K,K},
			{X,W,W,W,X,X,B,X,X,K,K,K},
			{W,W,W,W,W,X,G,X,K,K,K,K,K},
		},
		blocksAt = {x=2,y=6},
		localActorPointers = {
			{x=2,y=4,id=362}, -- exit
			{x=11,y=6,id=1008},
			{x=14,y=5,id=902},
			-- {x=5,y=8,id=6},
		}
	},--12: white pawn vs black rook ** if no shirts, **** if shirts. black shirt here?
	{
		tileData = {
			{3,3,3,3,3,3,3,3,3,3},
			{2,2,2,2,2,2,2,2,2,2},
			{2,2,2,1,1,1,1,2,2,2},
			{2,2,2,1,1,1,1,2,2,2},
			{2,2,2,1,1,1,1,2,2,2},
			{6,6,6,3,3,3,3,2,2,2},
			{2,2,2,2,2,2,2,2,2,2},
			{1,4}
		}, 
		startAt = {x=4,y=2,default=1},
		blocks = {
			{R,X,X,R},
			{X,X,X,X,Y,M,Y},
			{X},
			{X},
			{X,X,X,X,M,Y,M},
		},
		blocksAt = {x=7,y=3},
		localActorPointers = {
			{x=5,y=9,id=363},
			{x=5,y=5,id=1009},
		}
	},--13: baby puzzle "red shift" (needs stuff) * great place to offer R-for-reset hint!
	{
		tileData = {
			{3,3,3,3,3,3,3,3,3},
			{2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2},
			{2,2,6,2,6,2,6,2,2},
			{2,2,2,2,2,2,2,2,2},
			{2,2,6,2,2,2,6,2,2},
			{2,2,2,2,2,2,2,2,2},
			{2,2,6,2,6,2,6,2,2},
			{2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2},
		}, 
		startAt = {x=2,y=4,default=1},
		blocks = {
			{X,X,X,K,X,K},
			{X,W,X,K,X,K,X,W},
			{X,X,X,K,X,K},
			{G,G,G,X,X,X,B,B,B},
			{},
			{G,G,G,X,X,X,B,B,B},
			{X,X,X,R,X,R},
			{X,W,X,R,X,R,X,W},
			{X,X,X,R,X,R},
		},
		blocksAt = {x=2,y=5},
		localActorPointers = {
			{x=6,y=4,id=364}, -- exit
			{x=6,y=9,id=1010},
			-- {x=5,y=8,id=6},
		}
	},--14: + stripes puzzle *** shirt candidate, place behind black blocks in a side corridor (red?)
	{
		tileData = {
			{1,1,1,1,3},
			{1,1,1,3,2,3},
			{1,1,3,2,2,2,3},
			{1,3,6,2,2,2,6,3,1,1,1,3},
			{3,2,2,6,2,6,2,2,3,3,3,2,3},
			{2,2,2,2,2,2,2,2,2,2,2,2,2},
			{1,2,2,6,2,6,2,2,1,1,1,2},
			{1,1,6,2,2,2,6},
			{1,1,1,2,2,2},
			{1,1,1,1,2,},
			{1,1,1,1,4}
		}, 
		startAt = {x=2,y=4,default=1},
		blocks = {
			{X,X,X,X,G,X,X,X,X,X,X,M},
			{R,R,X,G,G,G,X,B,B,X,M,X,M},
			{X,X,X,X,G,X,X,X,X,X,X,M},
		},
		blocksAt = {x=2,y=8},
		localActorPointers = {
			{x=6,y=14,id=365}, -- exit
			{x=6,y=5,id=1011},
			{x=13,y=9,id=904},
		}
	},--15: green X (needs stuff) **, shirt candidate (green), maybe a blacked-in side corridor
	{
		tileData = {
			{3,3,3,3,3},
			{2,2,2,2,6},
			{2,2,2,2,2},
			{2,2,2,2,2},
			{2,2,2,2,2},
			{6,2,2,2,2},
		}, 
		startAt = {x=6,y=5,default=1},
		blocks = {
			{X,X,K},
			{X,K,W,K},
			{K,W,X,W,K},
			{X,K,W,K},
			{X,X,K},
		},
		blocksAt = {x=6,y=6},
		localActorPointers = {
			{x=6,y=5,id=366}, -- exit
			{x=10,y=10,id=1012},
			-- {x=5,y=8,id=6},
		}
	},--16: baby white-vs-black (NEEDS STUFF) *
	{
		tileData = {
			{1,1,3,3,3,3,3,3,3,3,3},
			{1,1,2,2,2,2,2,2,2,2,2},
			{},
			{1,1,3,3,3,3,3,3,3,3,3},
			{1,1,2,2,2,2,2,2,2,2,2},
			{1,1,2,2,2,2,2,2,2,2,2},
			{3,3,2,2,2,2,2,2,2,2,2},
			{6,2,2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2,2,2},
			{4,1,2,2,2,2,2,2,2,2,2},
			{1,1,2,2,2,2,2,2,2,2,2},
			{1,1,2,2,2,2,2,2,2,2,2},
		}, 
		startAt = {x=2,y=2,default=1},
		blocks = {
			{X,Y,X,M,C,Y,X,M},
			{},
			{},
			{X,G,X,X,K,X,X,B},
			{B,R,X,K,K,K,X,R,G},
			{X,X,K,K,K,K,K},
			{X,K,K,K,K,K,K,K},
			{K,K,K,K,W,K,K,K,K},
			{X,K,K,K,K,K,K,K},
			{X,X,K,K,K,K,K},
			{G,R,X,K,K,K,X,R,B},
			{X,B,X,X,K,X,X,G},
		},
		blocksAt = {x=4,y=3},
		localActorPointers = {
			{x=2,y=12,id=367}, -- exit
			{x=8,y=10,id=1013},
			-- {x=5,y=8,id=6},
		}
	},--17: donut in the gas pump (needs door) ***** MAYBE shirt candidate, but i looked at it for a while and couldn't see how
	{
		tileData = {
			{3,3,3,3,3,3,3,3,3},
			{6,2,2,2,2,2,2,2,8},
			{2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2,3,3},
			{2,2,2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,6},
		}, 
		startAt = {x=4,y=2,default=1},
		blocks = {
			{X,K,K,K,K,K,K,K},
			{K,K,K,W,W,W,K,K,K},
			{K,K,K,R,Y,G,K,K,K},
			{K,W,M,W,W,W,C,W,K},
			{K,W,B,W,X,W,B,W,K},
			{K,W,C,W,W,W,M,W,K},
			{K,K,K,G,Y,R,K,K,K},
			{K,K,K,W,W,W,K,K,K},
			{X,K,K,K,K,K,K,K},
			
		},
		blocksAt = {x=4,y=3},
		localActorPointers = {
			{x=14,y=5,id=368}, -- exit
			{x=8,y=7,id=1014},
			{x=4,y=11,id=905},
		}
	},--18: rainbow ring *** (needs stuff, also reverse map?) possible shirt candidate in lower corner
	{
		tileData = {
			{3,3,3,3,3,3,3,3,3,3,1,3,3},
			{2,2,2,2,2,2,2,2,2,2,3,2,2},
			{2,2,2,2,2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2,2,1,3,3},
			{2,2,2,2,2,2,2,2,2,2,1,2,8},
			{2,2,2,2,2,2,2,2,2,2,1,7,7},
			{2,2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2,2,1,3,3},
			{2,2,2,2,2,2,2,2,2,2,1,2,2},
			{2,2,2,2,2,2,2,2,2,2,1,2,2},
			{2,2,2,2,2,2,2,2,2,2,3,2,2},
			{2,2,2,2,2,2,2,2,2,2,2,2,2},
		}, 
		startAt = {x=2,y=2,default=1},
		blocks = {
			{X,R,R},
			{X,R,R},
			{X},
			{X},
			{X},
			{X,X,X,G,X,X,C,X,M},
			{X,X,C,G,G,G,C,C,M,M},
			{X,C,C,M,B,B,C,Y,Y,M},
			{X,K,C,M,M,B,B,B,Y,Y,X,X,Y},
			{X,K,G,G,M,B,Y,B,R,R,X,Y,Y},
			{X,K,G,R,R,Y,Y,B,R,R,X,Y},
			{X,K,G,R,R,Y,K,K,K,K}
		},
		blocksAt = {x=2,y=3},
		localActorPointers = {
			{x=14,y=2,id=369}, -- exit
			{x=14,y=13,id=1015},
			{x=13,y=11,id=906},
		}
	},--19: tetris blocks (needs door) **** cyan shirt where notes are, move notes down, may need to cycle colors to get cyan in there nicely :/
	{
		tileData = {
			{1,1,3,3,3,3,3},
			{1,3,8,2,2,2,8,3},
			{1,7,7,2,2,2,7,7},
			{3,2,2,2,2,2,2,2,3},
			{2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2,2},
			{1,1,1,1,4,1,1,1,1},
		},
		startAt = {x=2,y=2,default=1},
		blocks = {
			{X,X,R},
			{X,R,X,R},
			{R,X,X,X,R},
			{R,X,X,X,R},
			{B,B,B,B,B},
			{Y,Y,Y,Y,Y},
			{K,K,K,K,K},
			{R,X,X,X,R},
			{R,X,X,X,R}
		},
		blocksAt = {x=4,y=3},
		
		localActorPointers = {
			{x=6,y=12,id=370}, -- exit
			{x=6,y=5,id=1016},
			{x=6,y=3,id=903},
		}
	},--20: baby puzzle: line collapse * shirt in corner (cyan? green?)
	
	--other rooms:
	{
		tileData = {
			{3,3,3,3},
			{2,2,2,2},
			{2,2,2,2},
			{2,8,2,2},
			{7,7,2,2},
			{1,1,6,6},
		}, 
		startAt = {x=8,y=6,default=1},
		blocks = {},
		blocksAt = {x=4,y=3},
		localActorPointers = {
			{x=10,y=6,id=171}, -- exit
			-- {x=8,y=7,id=1001}, --TODO no
			{x=9,y=10,id=6},
			{x=9,y=10,id=7},
		}
	},--21: your office at start
	{
		tileData = {{1}}, 
		startAt = {x=1,y=1,default=1},
		localActorPointers = {}
	},--22: title screen blankness
	{
		-- {
		tileData = {
			{3,3,3,3,3,3},
			{2,2,2,2,2,2,3,3},
			{2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2},
			{2,2,2,2,2,2,2,2},
		},
		startAt = {x=2,y=2,default=1},
		blocks = {
			{G,G,X,G,R},
			{X,B,G,B,B},
			{K,K,W}
		},
		blocksAt = {x=2,y=3},
		localActorPointers = {
			{x=8,y=5,id=1},
			-- {x=13,y=2,id=2}
		}
	},--23: old test room :)
	{
		tileData = {
			{3,3,3,3},
			{2,2,2,2},
			{2,2,2,2},
			{2,8,2,2},
			{7,7,2,2},
			{1,1,6,6},
		}, 
		startAt = {x=8,y=6,default=1},
		blocks = {
			{X,G},
			{X,X,X,B},
			{R},
			-- {X,X,G},
		},
		blocksAt = {x=8,y=7},
		localActorPointers = {
			{x=10,y=6,id=171}, -- exit
			-- {x=8,y=7,id=1001}, --TODO no
			{x=9,y=10,id=6},
			{x=9,y=10,id=7},
		}
	}--24: your office permanent
}

-- ideas:
	-- black, white, and blue locked in corners; 3x3 yin-yang of blue and black with notes in middle; 1 green and 1 red on sides
	--13: a big mess that collapses nicely into a spiral for player to walk through :) white can actually become an obstruction? lone W locked up?
	--13.5: spiral of white with B/Y obstructions; white is locked by plants and cannot move, so forming more white with B+Y is dangerous
	--14: * spiral of black; given just enough colors to make a white, which is needed to break a wall, since the spiral path can never be cleared & traversed?
	--16: lone R/G/B blocks must pass through C/M/Y corridors to form a white; white is locked up, so you have to get RGB through safely by shifting CMY
	--17: * something using tetris pieces! maybe hero is locked in top area by a "descending 1x4" of black blocks
	--18: white is locked up by a lone block in a closet AND is blocking in notes; must use magenta to clear a path?
	--don't forget to use desks and plants to give rooms more flavor and challenge!

--[[names of rooms?:
	cafeteria
	kitchen
	bathroom
	lab = where clear shirt is found?
	conference room = chess
	lounge = painting
]]

numberOfMaps = #mapDataRaw