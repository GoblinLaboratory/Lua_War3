require "Item"
require "Hero"
require "Bonus"

GameManager = { 
    YingXiong ={}
 }

function GameManager:new(o)  
    o = o or {}  
    setmetatable(o,self)  
    self.__index = self  
    local x = Bonus:Instance()  
    x:Int()
    ----------
    for i= 1 ,10 do
        self.YingXiong[i] = Hero:new()
        --setmetatable(self.YingXiong[i],Hero) 

        --self.YingXiong[i]:Int()
        
        self.YingXiong[i].WanJiaID = i
    end
    return o  
end  

function GameManager:Instance()  
    if self.instance == nil then  
        self.instance = self:new()  
    end  
    return self.instance  
end 

function  GameManager:GetHero(id)
	for i=#self.YingXiong, 1, -1 do 
        if self.YingXiong[i].WanJiaID == id then 
            --print(self.YingXiong[i].name)
            return self.YingXiong[i]
        end         
    end 
end

function  GameManager:printArea ()
	print("....................................................")
end
return GameManager

