require "Attribute"
require "Equipment"
Unit = {
    --是英雄
    IsHroe = false,
    --种族
    Race = "默认",
    --是建筑
    IsBluid = false,
    --玩家ID
    PlayerID = 0,
    --英雄单位类型
    UnitType = 0,
    --英雄单位ID
    UnitID = 0,
    --属性
    Attributes = {},

    --装备表
    Equipments = {

    },
    --状态
    --防御姿态
    defend = false,
    --攻击次数记录
    UnAttackNumber = false,
    AttackNumber = 0,
}

function Unit:new(o)  
    o = o or {}  
    setmetatable(o,self)  
	self.__index = self 
	----
    
	-----
    return o  
end 
Unit.__index=Unit

function Unit:Int()  
    --setmetatable(self.Attributes,Attribute)  
    self.Attributes = Attribute:new()

    self.Equipments = Equipment:new()
    self.Equipments:Int() 
end

--穿戴装备
function Unit:SetItemprototype(item1)  
	self:AddAttribute(item1.Attributes)
	local i = item1.Uis.Custom
	
	local x = self:GetEquipment(i)
	
    x:SetPrototype(item1)
    --print(x.name)
    return x
end

--获取装备数据
function  Unit:GetEquipment(id)
	--print(#self.ZhuangBei)
	--for i=#self.Equipments, 1, -1 do 
        --if self.Equipments[i].Uis.Custom  == id then 
            --return self.Equipments[i]
        --end         
    --end 
    return self.Equipments:GetEquipment(id)
end

function Unit:RemoveItemprototype(item1)  
	local i = item1.Uis.Custom
	--print(item1.Name)
	local x = self:GetEquipment(i)

    self:RemoveAttribute(x.Attributes )
    x:ClearPrototype()
    x.Uis.Custom = i
    return x
end

--增加属性
function  Unit:AddAttribute(Attribute_s)
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

function  Unit:RemoveAttribute(Attribute_s)
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

return Unit