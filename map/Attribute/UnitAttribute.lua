require "Attribute\\Attribute"
UnitAttribute = {
    -- 状态机
    Fsms = 0,
    ID = 0,
    -- 说明
    BasicsInformation = {},
    -- 单位基础属性
    BasicsAttribute = {},
    -- 抗性
    ResistanceAttribute = {}
}

function UnitAttribute:new(o)
    o = o or {}
    setmetatable(o, self)
    ----
    o.Fsms = FSM:new()
    local Factory = Factory:Instance()
    o.ID = 0
    -- o.BasicsInformation = BasicsInformation:new(nil)
    o.BasicsInformation = Factory:BasicsInformationFactory()
    o.BasicsAttribute = Factory:BasicsAttributeFactory()
    o.ResistanceAttribute = Factory:ResistanceAttributeFactory()
    -----
    return o
end
UnitAttribute.__index = UnitAttribute
-- function UnitAttribute:SetItem(item1) end
-- -- 清空装备数据
-- function UnitAttribute:IntItem(item1) end
-- -- 获取装备
-- function UnitAttribute:GetEquipment(Custom) return end
-- 添加属性
function UnitAttribute:SetBasicsAttribute(Type, Num)
    self.BasicsAttribute[Type].Value = self.BasicsAttribute[Type].Value + Num
    if Type == "生命值" or Type == "生命回复速度" or Type ==
        "魔法值" or Type == "魔法回复速度" or Type == "护甲" or Type ==
        "攻击力" or Type == "攻击速度" or Type == "移动速度" then
        -- statements
        local ev = EventTemplate:Instance()
        ev.SetPrototype:Fire(self.ID, Type, Num) -- 发送消息
    end
end
function UnitAttribute:SetResistanceAttribute(Type, Num)
    self.ResistanceAttribute[Type].Value = self.ResistanceAttribute[Type].Value + Num
end
-- 添加技能
function UnitAttribute:AddSkill(t)
    self.Fsms:TriggerAddEvent(t, t.Trigger)
end
-- 移除技能
function UnitAttribute:RemoveSkill(t,tag)
    self.Fsms:TriggerRemoveEvent(t, t.Trigger,tag)
end
return UnitAttribute

