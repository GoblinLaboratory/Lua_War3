--require "Global"
--require "UnitDota"
--require "Item"
require "Bonus"
require "Attribute"

Hero = {
    --玩家ID
    PlayerID = 0,
    --英雄单位类型
    UnitType = 0,
    --英雄单位ID
    UnitID = 0,
    --单位属性
    --Unit_Dota = {} ,
    --装备表
    Equipment = {

    },
    --属性
    Attributes = {}, 
}

function Hero:new(o)  
    o = o or {}  
    setmetatable(o,self)  
	self.__index = self 
	----
    --self.Unit_Dota  = {}
    
    self.Attributes = Attribute:new()
    --创建装备
    

	-----
    return o  
end 
Hero.__index=Hero
function Hero:Initialization()  
    --setmetatable(self.Attributes,Attribute)  
    self.Attributes = Attribute:new()
end

--增加属性
function  Hero:AddAttribute(Attribute_s)
    local bu = Bonus:Instance()  
    self.Attributes:Add(Attribute_s)
    --力量
    --self.Attributes.Power  =  self.Attributes.Power  +   Attribute_s.Power
    bu:UnitAddBonus(self.UnitID, 8, Attribute_s.Power)

    --敏捷
    --self.Attributes.Agile  =  self.Attributes.Agile  +   Attribute_s.Agile
    bu:UnitAddBonus(self.UnitID, 9, Attribute_s.Agile)

    --智力
    --self.Attributes.Intelligence  =  self.Attributes.Intelligence  +   Attribute_s.Intelligence
    bu:UnitAddBonus(self.UnitID, 10, Attribute_s.Intelligence)

    --生命值
    bu:UnitAddBonus(self.UnitID, 6, Attribute_s.LifeValue )

    --生命回复速度    
    bu:UnitAddBonus(self.UnitID, 4, Attribute_s.LifeRecoverySpeed  )

    --魔法值
    bu:UnitAddBonus(self.UnitID, 7, Attribute_s.MagicValue )

    --魔法回复速度
    bu:UnitAddBonus(self.UnitID, 3, Attribute_s.MagicRecoverySpeed*100 )

    --攻击力
    bu:UnitAddBonus(self.UnitID, 2, Attribute_s.AttackValue )

    --护甲
    bu:UnitAddBonus(self.UnitID, 1, Attribute_s.Armor)

    --攻击速度
    bu:UnitAddBonus(self.UnitID, 5, Attribute_s.AttackSpeed*100 )

    --移动速度
    bu:UnitSetSeed(self.UnitID,Attribute_s.MovingSpeed)  
   
end

function  Hero:RemoveAttribute(Attribute_s)
	local bu = Bonus:Instance()  
    self.Attributes:Remove(Attribute_s)
    --力量
    --self.Attributes.Power  =  self.Attributes.Power  +   Attribute_s.Power
    bu:UnitAddBonus(self.UnitID, 8, 0 - Attribute_s.Power)

    --敏捷
    --self.Attributes.Agile  =  self.Attributes.Agile  +   Attribute_s.Agile
    bu:UnitAddBonus(self.UnitID, 9, 0 - Attribute_s.Agile)

    --智力
    --self.Attributes.Intelligence  =  self.Attributes.Intelligence  +   Attribute_s.Intelligence
    bu:UnitAddBonus(self.UnitID, 10, 0 - Attribute_s.Intelligence)

    --生命值
    bu:UnitAddBonus(self.UnitID, 6, 0 - Attribute_s.LifeValue )

    --生命回复速度    
    bu:UnitAddBonus(self.UnitID, 4, Attribute_s.LifeRecoverySpeed  )

    --魔法值
    bu:UnitAddBonus(self.UnitID, 7, 0 - Attribute_s.MagicValue )

    --魔法回复速度
    bu:UnitAddBonus(self.UnitID, 3, 0 - Attribute_s.MagicRecoverySpeed*100 )

    --攻击力
    bu:UnitAddBonus(self.UnitID, 2, 0 - Attribute_s.AttackValue )

    --护甲
    bu:UnitAddBonus(self.UnitID, 1, 0 - Attribute_s.Armor)

    --攻击速度
    bu:UnitAddBonus(self.UnitID, 5, 0 - Attribute_s.AttackSpeed*100 )

    --移动速度
    bu:UnitSetSeed(self.UnitID,0 - Attribute_s.MovingSpeed)   

end

function  Hero:Test()
    print("选择的英雄ID是"..tostring(self.UnitID))
end
return Hero