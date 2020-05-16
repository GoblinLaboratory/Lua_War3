require "Hero"

--玩家属性
Player = {
    --玩家ID
    PlayerID = 0,
    --英雄类型ID
    --UnitType = 0,
    --英雄单位数据
    Hero_ID = 0,
    --宠物ID
    --装备系统马甲
    EquipmentId = 0,
    --界面马甲
    Interface = 0,
    --0 主界面
    --1 天赋选择界面
    --2 任务界面
    --3 背包界面
    interfacevalue = 0,
}

function Player:new(o)  
    o = o or {}  
    setmetatable(o,self)  
    self.__index = self
    -----
    --setmetatable(self.Hero_Unit,Hero) 
    -----
    return o  
end 

function Player:Initialization()  
    --setmetatable(self.Hero_Unit,Hero) 
end

return Player