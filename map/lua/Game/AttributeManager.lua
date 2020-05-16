require "Bonus"
require "Attribute"

AttributeManager = {
    
}

function AttributeManager:new(o)  
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
AttributeManager.__index=AttributeManager
function AttributeManager:Instance()  
    if self.instance == nil then  
        self.instance = self:new()  
    end  
    return self.instance  
end 

--单位添加属性
function  AttributeManager:AddAttribute(u,a)
    local bu = Bonus:Instance()  
    --增加力量
    bu:UnitAddBonus(u, 8,  a.Power )
    --增加敏捷
    bu:UnitAddBonus(u, 9, a.Agile )
    --增加智力
    bu:UnitAddBonus(u, 10, a.Intelligence )
    --增加攻击力
    bu:UnitAddBonus(u, 2, a.AttackValue )
    --增加护甲
    bu:UnitAddBonus(u, 1, a.Armor )
    --增加生命值
    bu:UnitAddBonus(u, 6, a.LifeValue )
    --增加生命回复速度
    bu:UnitAddBonus(u, 4, a.LifeRecoverySpeed )
    --增加魔法值
    bu:UnitAddBonus(u, 7, a.MagicValue )
    --增加魔法回复速度
    bu:UnitAddBonus(u, 3, a.MagicRecoverySpeed )
    --增加攻击速度
    bu:UnitAddBonus(u, 5, a.AttackSpeed)
    --增加移动速度
    bu:UnitSetSeed(u,a.MovingSpeed)
end
--单位移除属性
function  AttributeManager:RemoveAttribute(u,a)
    local bu = Bonus:Instance()  
    --移除力量
    bu:UnitAddBonus(u, 8,  0-a.Power )
    --移除敏捷
    bu:UnitAddBonus(u, 9, 0-a.Agile )
    --移除智力
    bu:UnitAddBonus(u, 10, 0-a.Intelligence )
    --移除攻击力
    bu:UnitAddBonus(u, 2, 0-a.AttackValue )
    --移除护甲
    bu:UnitAddBonus(u, 1, 0-a.Armor )
    --移除生命值
    bu:UnitAddBonus(u, 6, 0-a.LifeValue )
    --移除生命回复速度
    bu:UnitAddBonus(u, 4, 0-a.LifeRecoverySpeed )
    --移除魔法值
    bu:UnitAddBonus(u, 7, 0-a.MagicValue )
    --移除魔法回复速度
    bu:UnitAddBonus(u, 3, 0-a.MagicRecoverySpeed )
    --移除攻击速度
    bu:UnitAddBonus(u, 5, 0-a.AttackSpeed)
    --移除移动速度
    bu:UnitSetSeed(u,0-a.MovingSpeed)
end

return AttributeManager