local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
require "Global"
require "EventTemplate"
require "math"

UnitState = {}

-- 吸血效果
--参数 u 吸血触发单位 ,v 吸血数值
function UnitState:XiXue(u, v)
    if CJ.GetUnitState(u, CJ.UNIT_STATE_LIFE) ~=
        CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_LIFE) then
        local sm = CJ.GetUnitState(u, CJ.UNIT_STATE_LIFE) + v
        if sm > CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_LIFE) then
            CJ.SetUnitState(u, CJ.UNIT_STATE_LIFE,
                            CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_LIFE))
        else
            CJ.SetUnitState(u, CJ.UNIT_STATE_LIFE, sm)

        end
        CJ.DestroyEffect(CJ.AddSpecialEffectTarget(
                             "Abilities\\Spells\\Undead\\VampiricAura\\VampiricAuraTarget.mdl",
                             u, "origin"))
    end
end

-- 治疗效果
--参数 u 被治疗单位 ,v 治疗值
function UnitState:ZhiLiao(u, v)
    if CJ.GetUnitState(u, CJ.UNIT_STATE_LIFE) ~=
        CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_LIFE) then
        local sm = CJ.GetUnitState(u, CJ.UNIT_STATE_LIFE) + v
        if sm > CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_LIFE) then
            CJ.SetUnitState(u, CJ.UNIT_STATE_LIFE,
                            CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_LIFE))
        else
            CJ.SetUnitState(u, CJ.UNIT_STATE_LIFE, sm)

        end
        CJ.DestroyEffect(CJ.AddSpecialEffectTarget(
                             "Abilities\\Spells\\Human\\Heal\\HealTarget.mdl",
                             u, "origin"))
    end
end

--火焰伤害
return UnitState
