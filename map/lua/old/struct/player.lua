require "struct\\Attribute"
--
Player = {
    --玩家ID
    PlayerID = 0,
    --单位ID
    UnitType = 0,
    --单位属性
    Unit_Dota = {} ,
    --装备表
    Equipment = {

    },
    Attributes = {

    }, 
}

function Player:new(o)  
    o = o or {}  
    setmetatable(o,self)  
    self.__index = self
    -----
    setmetatable(self.Attributes,Attribute) 
    return o  
end 

r = Player:new()
r.PlayerID = 10
r.Attributes.Lucky = 100
print(r.PlayerID)
print(r.Attributes.Lucky)