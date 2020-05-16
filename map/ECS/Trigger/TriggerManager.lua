local CJ = require "jass.common"
local BJ = require "blizzard"
-- local japi = require "jass.japi"
local UM = require "ECS\\Manager\\UnitsManager"
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
TriggerManager.EVENT_PLAYER_UNIT_SPELL_CHANNEL =
    function()
        -- statements
        local u = CJ.GetTriggerUnit()
        local us = UM.GetUnit(u)
        us["SkillComponent"].CHANNEL()
    end
-- 开始施放技能
TriggerManager.EVENT_PLAYER_UNIT_SPELL_CAST =
    function()
        -- statements
        local u = CJ.GetTriggerUnit()
        local us = UM.GetUnit(u)
        us["SkillComponent"].CAST()
    end
-- 发动技能效果
TriggerManager.EVENT_PLAYER_UNIT_SPELL_EFFECT =
    function()
        -- statements
        local u = CJ.GetTriggerUnit()
        local us = UM.GetUnit(u)
        us["SkillComponent"].EFFECT()
    end
-- 施放技能结束
TriggerManager.EVENT_PLAYER_UNIT_SPELL_FINISH =
    function()
        -- statements
        local u = CJ.GetTriggerUnit()
        local us = UM.GetUnit(u)
        us["SkillComponent"].FINISH()
    end
-- 停止施放技能
TriggerManager.EVENT_PLAYER_UNIT_SPELL_ENDCAST =
    function()
        -- statements
        local u = CJ.GetTriggerUnit()
        local us = UM.GetUnit(u)
        us["SkillComponent"].ENDCAST()
    end
-- 单位被攻击
TriggerManager.EVENT_PLAYER_UNIT_ATTACKED =
    function()
        -- statements
        -- print("ttt")
        local u = BJ.GetAttackedUnitBJ()
        local us = UM.GetUnit(u)
        us["SkillComponent"].ATTACKED()
    end
-- 单位发动攻击
TriggerManager.EVENT_PLAYER_UNIT_ATTACK =
    function()
        -- statements
        -- print("ssss")
        local u = CJ.GetAttacker()
        local us = UM.GetUnit(u)
        us["SkillComponent"].ATTACK()
    end
-- 单位受到伤害
TriggerManager.Damaged = function()
    local u = CJ.GetTriggerUnit()
    local us = UM.GetUnit(u)
    us["SkillComponent"].Damaged()
end
-- 单位造成伤害
TriggerManager.Damag = function()
    -- statements
    local u = CJ.GetEventDamageSource()
    local us = UM.GetUnit(u)
    us["SkillComponent"].Damag()
end
return TriggerManager
