local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
require "Global"
require "System\\UnitsManager"
TriggerManager = {}
function TriggerManager:new(o)
    o = o or {}
    setmetatable(o, self)
    --
    --
    return o
end
TriggerManager.__index = TriggerManager
function TriggerManager:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end
-- 单位准备施放技能
TriggerManager.EVENT_PLAYER_UNIT_SPELL_CHANNEL = function ()
    -- statements
    local u = CJ.GetTriggerUnit()
    local UM = UnitsManager:Instance()
    local us = UM:GetUnit(u)
    us.Fsms.CHANNEL()
end
-- 开始施放技能
TriggerManager.EVENT_PLAYER_UNIT_SPELL_CAST = function ()
    -- statements
    local u = CJ.GetTriggerUnit()
    local UM = UnitsManager:Instance()
    local us = UM:GetUnit(u)
    us.Fsms.CAST()
end
-- 发动技能效果
TriggerManager.EVENT_PLAYER_UNIT_SPELL_EFFECT = function ()
    -- statements
    local u = CJ.GetTriggerUnit()
    local UM = UnitsManager:Instance()
    local us = UM:GetUnit(u)
    us.Fsms.EFFECT()
end
-- 施放技能结束
TriggerManager.EVENT_PLAYER_UNIT_SPELL_FINISH = function ()
    -- statements
    local u = CJ.GetTriggerUnit()
    local UM = UnitsManager:Instance()
    local us = UM:GetUnit(u)
    us.Fsms.FINISH()
end
-- 停止施放技能
TriggerManager.EVENT_PLAYER_UNIT_SPELL_ENDCAST = function ()
    -- statements
    local u = CJ.GetTriggerUnit()
    local UM = UnitsManager:Instance()
    local us = UM:GetUnit(u)
    us.Fsms.ENDCAST()
end
-- 单位被攻击
TriggerManager.EVENT_PLAYER_UNIT_ATTACKED = function ()
    -- statements
    --print("ttt")
    local u = BJ.GetAttackedUnitBJ()
    local UM = UnitsManager:Instance()
    local us = UM:GetUnit(u)
    us.Fsms.ATTACKED()
end
-- 单位发动攻击
TriggerManager.EVENT_PLAYER_UNIT_ATTACK = function ()
    -- statements
    --print("ssss")
    local u = CJ.GetAttacker()
    local UM = UnitsManager:Instance()
    local us = UM:GetUnit(u)
    us.Fsms.ATTACK()
end
return TriggerManager
