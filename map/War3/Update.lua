local CJ = require "jass.common"
local BJ = require "blizzard"
require "EventTemplate"
--local japi = require "jass.japi"

-- 更新事件
local trig_Update = CJ.CreateTrigger()

BJ.TriggerRegisterTimerEventPeriodic(trig_Update, 1.00)

CJ.TriggerAddCondition(trig_Update, CJ.Condition(function() return true end))

CJ.TriggerAddAction(trig_Update, function()
    local ev = EventTemplate:Instance()
    ev.Update:Fire()
end)

-- 单位准备施放技能
local trig_EVENT_PLAYER_UNIT_SPELL_CHANNEL = CJ.CreateTrigger()
BJ.TriggerRegisterAnyUnitEventBJ(trig_EVENT_PLAYER_UNIT_SPELL_CHANNEL, CJ.EVENT_PLAYER_UNIT_SPELL_CHANNEL)
CJ.TriggerAddCondition(trig_EVENT_PLAYER_UNIT_SPELL_CHANNEL, CJ.Condition(function() return true end))
CJ.TriggerAddAction(trig_EVENT_PLAYER_UNIT_SPELL_CHANNEL, function()
    local ev = EventTemplate:Instance()
    ev.EVENT_PLAYER_UNIT_SPELL_CHANNEL:Fire()
end)
-- 开始施放技能
local trig_EVENT_PLAYER_UNIT_SPELL_CAST = CJ.CreateTrigger()
BJ.TriggerRegisterAnyUnitEventBJ(trig_EVENT_PLAYER_UNIT_SPELL_CAST, CJ.EVENT_PLAYER_UNIT_SPELL_CAST)
CJ.TriggerAddCondition(trig_EVENT_PLAYER_UNIT_SPELL_CAST, CJ.Condition(function() return true end))
CJ.TriggerAddAction(trig_EVENT_PLAYER_UNIT_SPELL_CAST, function()
    local ev = EventTemplate:Instance()
    ev.EVENT_PLAYER_UNIT_SPELL_CAST:Fire()
end)
-- 发动技能效果
local trig_EVENT_PLAYER_UNIT_SPELL_EFFECT = CJ.CreateTrigger()
BJ.TriggerRegisterAnyUnitEventBJ(trig_EVENT_PLAYER_UNIT_SPELL_EFFECT, CJ.EVENT_PLAYER_UNIT_SPELL_EFFECT)
CJ.TriggerAddCondition(trig_EVENT_PLAYER_UNIT_SPELL_EFFECT, CJ.Condition(function() return true end))
CJ.TriggerAddAction(trig_EVENT_PLAYER_UNIT_SPELL_EFFECT, function()
    local ev = EventTemplate:Instance()
    ev.EVENT_PLAYER_UNIT_SPELL_EFFECT:Fire()
end)
-- 施放技能结束
local trig_EVENT_PLAYER_UNIT_SPELL_FINISH = CJ.CreateTrigger()
BJ.TriggerRegisterAnyUnitEventBJ(trig_EVENT_PLAYER_UNIT_SPELL_FINISH, CJ.EVENT_PLAYER_UNIT_SPELL_FINISH)
CJ.TriggerAddCondition(trig_EVENT_PLAYER_UNIT_SPELL_FINISH, CJ.Condition(function() return true end))
CJ.TriggerAddAction(trig_EVENT_PLAYER_UNIT_SPELL_FINISH, function()
    local ev = EventTemplate:Instance()
    ev.EVENT_PLAYER_UNIT_SPELL_FINISH:Fire()
end)
-- 停止施放技能
local trig_EVENT_PLAYER_UNIT_SPELL_ENDCAST = CJ.CreateTrigger()
BJ.TriggerRegisterAnyUnitEventBJ(trig_EVENT_PLAYER_UNIT_SPELL_ENDCAST, CJ.EVENT_PLAYER_UNIT_SPELL_ENDCAST)
CJ.TriggerAddCondition(trig_EVENT_PLAYER_UNIT_SPELL_ENDCAST, CJ.Condition(function() return true end))
CJ.TriggerAddAction(trig_EVENT_PLAYER_UNIT_SPELL_ENDCAST, function()
    local ev = EventTemplate:Instance()
    ev.EVENT_PLAYER_UNIT_SPELL_ENDCAST:Fire()
end)
-- 单位被攻击-- 单位发动攻击
local trig_EVENT_PLAYER_UNIT_ATTACKED = CJ.CreateTrigger()
BJ.TriggerRegisterAnyUnitEventBJ(trig_EVENT_PLAYER_UNIT_ATTACKED, CJ.EVENT_PLAYER_UNIT_ATTACKED)
CJ.TriggerAddCondition(trig_EVENT_PLAYER_UNIT_ATTACKED, CJ.Condition(function() return true end))
CJ.TriggerAddAction(trig_EVENT_PLAYER_UNIT_ATTACKED, function()
    local ev = EventTemplate:Instance()
    ev.EVENT_PLAYER_UNIT_ATTACKED:Fire()
    ev.EVENT_PLAYER_UNIT_ATTACK:Fire()
end)
-- 单位发动攻击
-- local trig_EVENT_PLAYER_UNIT_ATTACKED = CJ.CreateTrigger()
-- BJ.TriggerRegisterAnyUnitEventBJ(trig_EVENT_PLAYER_UNIT_ATTACKED, CJ.EVENT_PLAYER_UNIT_ATTACKED)
-- CJ.TriggerAddCondition(trig_EVENT_PLAYER_UNIT_ATTACKED, CJ.Condition(function() return true end))
-- CJ.TriggerAddAction(trig_EVENT_PLAYER_UNIT_ATTACKED, function()
--     local ev = EventTemplate:Instance()
--     ev.EVENT_PLAYER_UNIT_ATTACKED:Fire()
-- end)