require "EventTemplate"
require "War3\\DamagedSystemTrigger"
require "Global"
require "Game"
require "War3\\UI"
require "AttributeSystem\\Bonus"
require "AttributeSystem\\AttributeSystem"
require "ECS\\Manager\\UnitsManager"
require "ECS\\Trigger\\ActionComponent"
require "Algorithm\\OngoingDamage"
require "ECS\\Trigger\\TriggerManager"
EventManager = {}

function EventManager:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    --
    local ev = EventTemplate:Instance()
    -- 更新
    ev.Update:connect(OngoingDamage.Update)
    ev.Update:connect(UnitsManager.Update)
    -- 事件
    -- 单位准备施放技能
    ev.EVENT_PLAYER_UNIT_SPELL_CHANNEL:connect(
        TriggerManager.EVENT_PLAYER_UNIT_SPELL_CHANNEL)
    -- 开始施放技能
    ev.EVENT_PLAYER_UNIT_SPELL_CAST:connect(
        TriggerManager.EVENT_PLAYER_UNIT_SPELL_CAST)
    -- 发动技能效果
    ev.EVENT_PLAYER_UNIT_SPELL_EFFECT:connect(
        TriggerManager.EVENT_PLAYER_UNIT_SPELL_EFFECT)
    -- 施放技能结束
    ev.EVENT_PLAYER_UNIT_SPELL_FINISH:connect(
        TriggerManager.EVENT_PLAYER_UNIT_SPELL_FINISH)
    -- 停止施放技能
    ev.EVENT_PLAYER_UNIT_SPELL_ENDCAST:connect(
        TriggerManager.EVENT_PLAYER_UNIT_SPELL_ENDCAST)
    -- 单位被攻击
    ev.EVENT_PLAYER_UNIT_ATTACKED:connect(
        TriggerManager.EVENT_PLAYER_UNIT_ATTACKED)
    -- 单位发动攻击
    ev.EVENT_PLAYER_UNIT_ATTACK:connect(TriggerManager.EVENT_PLAYER_UNIT_ATTACK)
    -- 单位受到伤害
    ev.Damaged:connect(TriggerManager.Damaged)
    -- 单位造成伤害
    ev.Damag:connect(TriggerManager.Damag)
    ev.AnyUnitDamaged:connect(DamagedSystemTrigger.f)
    -- 单位受到伤害
    ev.SetPrototype:connect(AttributeSystem.SetPrototype)
    -- 单位添加buff
    ev.Add_Buff:connect(UnitsManager.AddBuff)
    -- 单位移除buff
    ev.Remove_Buff:connect(UnitsManager.RemoveBuff)
    -- 设置单位属性
    -- ev.SetBasicsAttribute:connect(UnitsManager.SetBasicsAttribute)
    -- ev.SetExtendAttribute:connect(UnitsManager.SetExtendAttribute)
    -- ev.SetResistanceAttribute:connect(UnitsManager.SetResistanceAttribute)
    -- 治疗单位Treatment
    ev.Treatment:connect(ActionComponent.Treatment)
    -- 单位接收治疗
    -- 额外治疗
    ev.AdditionalTreatment:connect(ActionComponent.AdditionalTreatment)
    -- 魔法回复
    ev.Evil:connect(ActionComponent.Evil)
    -- 单位伤害
    ev.Damage:connect(ActionComponent.Damage)
    -- 额外伤害
    ev.AdditionalDamage:connect(ActionComponent.AdditionalDamage)
    -- 攻击吸血
    ev.BloodSucking:connect(ActionComponent.BloodSucking)
    -- 暴击
    ev.Crit:connect(ActionComponent.Crit)
    print("EventInt")
    --
    return o
end

EventManager.__index = EventManager

-- 单件模式
function EventManager:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end

return EventManager
