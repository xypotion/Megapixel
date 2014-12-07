TextMenu = class(Menu1D)

function TextMenu:_init(params)
	self.super:_init()
	
	params = params or {}
	
	if params then
		print("making a menu with some params!")
		
		self.prompt = params.prompt or "default prompt"
		self.bgcolor = params.bgcolor or {r=0,g=0,b=0,a=0}
		self.options = params.options or {{label="default option 1", skip=0}, {label="default option 2", skip=0}}
		self.pos = params.pos or {x=10,y=10}
		self.promptLines = params.promptLines or 1
	end
	
	self.cursor = {
		pos = {y=1,x=0},
		screenPosDelta = {x=0,y=0},
	}
	
	self:updateCursorScreenPos()
end

function TextMenu:draw()
	love.graphics.setColor(255,255,255,255)
	-- love.graphics.draw(images.title, quadSets.title[1])
	--hackity hack
	love.graphics.print(self.prompt, self.pos.x * zoom, self.pos.y * zoom)
	
	for i=1, #(self.options) do
		love.graphics.print(self.options[i].label, (self.pos.x + 20) * zoom, (self.pos.y + i*20) * zoom)
	end
end

function TextMenu:updateCursorScreenPos()
	-- m = menuStack[#menuStack]
	self.cursor.screenPos = self.cursor.screenPos or {} --in case it's unset
	
	self.cursor.screenPos.x = (self.pos.x + self.cursor.pos.x * self.cursor.screenPosDelta.x) * zoom
	self.cursor.screenPos.y = (self.pos.y + (self.cursor.pos.y - 1) * self.cursor.screenPosDelta.y - 5) * zoom
	-- ping(self.cursor.screenPosDelta.y)
end

function TextMenu:confirm()
	-- if self:choice() == "Continue" then
	-- 	loadSaveData()
	-- 	self:remove()
	-- elseif self:choice() == "New Game" then
	-- 	self:remove()
	-- 	addMenu(CharacterMenu)
	-- end
	
	print("confirm ", self:choice()["skip"])
	
	skip(self:choice()["skip"])
	
	self:remove()
end

function TextMenu:cancel()
	skip(1000) -- just get out of the script (hack)
	self:remove()
end