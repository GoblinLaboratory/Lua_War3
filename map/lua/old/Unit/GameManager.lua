require "Hero"

GameManager = { 
    Hero_Unit_List ={},
    Maji_ID ={
        ["玩家1"] ={
            Equipment_Maji =  0,
            Hero_ID =  0,
            FuWen_Maji = 0
        },
        ["玩家10"] ={
            Equipment_Maji =  0,Hero_ID =  0,
            FuWen_Maji = 0
        },
        ["玩家2"] ={
            Equipment_Maji =  0,Hero_ID =  0,
            FuWen_Maji = 0
        },
        ["玩家3"] ={
            Equipment_Maji =  0,Hero_ID =  0,
            FuWen_Maji = 0
        },
        ["玩家4"] ={
            Equipment_Maji =  0,Hero_ID =  0,
            FuWen_Maji = 0
        },
        ["玩家5"] ={
            Equipment_Maji =  0,Hero_ID =  0,
            FuWen_Maji = 0
        },
        ["玩家6"] ={
            Equipment_Maji =  0,Hero_ID =  0,
            FuWen_Maji = 0
        },
        ["玩家7"] ={
            Equipment_Maji =  0,Hero_ID =  0,
            FuWen_Maji = 0
        },
        ["玩家8"] ={
            Equipment_Maji =  0,Hero_ID =  0,
            FuWen_Maji = 0
        },
        ["玩家9"] ={
            Equipment_Maji =  0,Hero_ID =  0,
            FuWen_Maji = 0
        },
        ["玩家11"] ={
            Equipment_Maji =  0,Hero_ID =  0,
            FuWen_Maji = 0
        },
        ["玩家12"] ={
            Equipment_Maji =  0,Hero_ID =  0,
            FuWen_Maji = 0
        },
        
    }
 }

function GameManager:new(o)  
    o = o or {}  
    setmetatable(o,self)  
    self.__index = self  
    ----------
    -- for i= 1 ,10 do
    --     self.YingXiong[i] = Hero:new()
        
    --     self.YingXiong[i].WanJiaID = i
    -- end
    return o  
end  
GameManager.__index=GameManager
function GameManager:Instance()  
    if self.instance == nil then  
        self.instance = self:new()  
    end  
    return self.instance  
end 

function  GameManager:AddHero(id)
    for i=#self.Hero_Unit_List, 1, -1 do 
        if self.Hero_Unit_List[i].UnitType == id then 
            table.remove(self.Hero_Unit_List,i) 
        end         
    end 
    
    local x = Hero:new()
    --setmetatable(x,Hero) 
    x.UnitType = id
    table.insert(self.Hero_Unit_List,x)

end

function  GameManager:GetHero(id)
	for i=#self.Hero_Unit_List, 1, -1 do 
        if self.Hero_Unit_List[i].UnitType == id then 
            --print(self.YingXiong[i].name)
            return self.Hero_Unit_List[i]
        end         
    end 
end

function  GameManager:printArea ()
	print("....................................................")
end
return GameManager

