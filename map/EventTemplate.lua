
local el = require 'EventLib'

EventTemplate = {}

function EventTemplate:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function EventTemplate:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end
-- 更新
EventTemplate.Update = el:new("Update")
-- 单位发动攻击
EventTemplate.EVENT_PLAYER_UNIT_ATTACK = el:new("EVENT_PLAYER_UNIT_ATTACK")
-- 单位被攻击
EventTemplate.EVENT_PLAYER_UNIT_ATTACKED = el:new("EVENT_PLAYER_UNIT_ATTACKED")
-- 单位受到伤害
EventTemplate.Damaged = el:new("Damaged")
-- 单位造成伤害
EventTemplate.Damag = el:new("Damag")
-- 单位准备施放技能
EventTemplate.EVENT_PLAYER_UNIT_SPELL_CHANNEL = el:new("EVENT_PLAYER_UNIT_SPELL_CHANNEL")
-- 开始施放技能
EventTemplate.EVENT_PLAYER_UNIT_SPELL_CAST = el:new("EVENT_PLAYER_UNIT_SPELL_CAST")
-- 发动技能效果
EventTemplate.EVENT_PLAYER_UNIT_SPELL_EFFECT = el:new("EVENT_PLAYER_UNIT_SPELL_EFFECT")
-- 施放技能结束
EventTemplate.EVENT_PLAYER_UNIT_SPELL_FINISH = el:new("EVENT_PLAYER_UNIT_SPELL_FINISH")
-- 停止施放技能
EventTemplate.EVENT_PLAYER_UNIT_SPELL_ENDCAST = el:new("EVENT_PLAYER_UNIT_SPELL_ENDCAST")
-- 单位添加buff
EventTemplate.Add_Buff = el:new("Add_Buff")
-- 单位移除buff
EventTemplate.Remove_Buff = el:new("Remove_Buff")
-- 任意单位受到伤害事件
EventTemplate.AnyUnitDamaged = el:new("AnyUnitDamaged")
-- 英雄添加属性
EventTemplate.HeroAddPrototype = el:new("HeroAddPrototype")
-- 英雄移除属性
EventTemplate.HeroRemovePrototype = el:new("HeroRemovePrototype")
-- 设置单位Bonus属性
EventTemplate.SetPrototype = el:new("SetPrototype")
----------------------
-- 设置单位基础属性
EventTemplate.SetBasicsAttribute = el:new("SetBasicsAttribute")
-- 添加单位扩展属性
EventTemplate.SetExtendAttribute = el:new("SetExtendAttribute")
-- 添加单位抗性属性
EventTemplate.SetResistanceAttribute = el:new("SetResistanceAttribute")
----------------------
-- 治疗单位Treatment
EventTemplate.Treatment = el:new("Treatment")
-- 单位接收治疗
-- 额外治疗
EventTemplate.AdditionalTreatment = el:new("AdditionalTreatment")
-- 魔法回复
EventTemplate.Evil = el:new("Evil")
-- 单位伤害
EventTemplate.Damage = el:new("Damage")
-- 额外伤害
EventTemplate.AdditionalDamage = el:new("AdditionalDamage")
-- 攻击吸血
EventTemplate.BloodSucking = el:new("BloodSucking")
-- 暴击
EventTemplate.Crit = el:new("Crit")
----------------------
----------------------
-- function EventTemplate:RegisterAnyUnitDamagedEvent(handler)
-- AnyUnitDamaged:connect(handler)
-- end

-- function EventTemplate:FireAnyDamagedUnitEvent()
-- AnyUnitDamaged:Fire()
-- end
-- 任意单位接受治疗事件
EventTemplate.AnyUnitTreatmented = el:new("AnyUnitTreatmented")

return EventTemplate
