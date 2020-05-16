local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
require "GameManager"
require "Global"
require "EventTemplate"
require "math"


UnitState = {}

--吸血效果
function UnitState:XiXue(u,v)
    if CJ.GetUnitState(u, CJ.UNIT_STATE_LIFE) ~= CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_LIFE) then
        local sm = CJ.GetUnitState(u, CJ.UNIT_STATE_LIFE) + v
        if sm >CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_LIFE) then 
            CJ.SetUnitState( u, CJ.UNIT_STATE_LIFE, CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_LIFE) )
        else
            CJ.SetUnitState( u, CJ.UNIT_STATE_LIFE,sm )

        end
        CJ.DestroyEffect(CJ.AddSpecialEffectTarget("Abilities\\Spells\\Undead\\VampiricAura\\VampiricAuraTarget.mdl", u, "origin"))
    end
end

--治疗效果
function UnitState:ZhiLiao(u,v)
    if CJ.GetUnitState(u, CJ.UNIT_STATE_LIFE) ~= CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_LIFE) then
        local sm = CJ.GetUnitState(u, CJ.UNIT_STATE_LIFE) + v
        if sm >CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_LIFE) then 
            CJ.SetUnitState( u, CJ.UNIT_STATE_LIFE, CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_LIFE) )
        else
            CJ.SetUnitState( u, CJ.UNIT_STATE_LIFE,sm )

        end
        CJ.DestroyEffect(CJ.AddSpecialEffectTarget("Abilities\\Spells\\Human\\Heal\\HealTarget.mdl", u, "origin"))
    end
end

return UnitState