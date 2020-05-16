local CJ = require "jass.common"
local BJ = require "blizzard"
-- local japi = require "jass.japi"
require "Global"
require "EventTemplate"
require "math"

ActionComponent = {}

-- 吸血效果
-- 参数 u 吸血触发单位 ,v 吸血数值
function ActionComponent.BloodSucking(u, v)
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
-- 参数 u 被治疗单位 ,v 治疗值
function ActionComponent.ZhiLiao(u, v)
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
function ActionComponent.Treatment(u, v)
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
-- 额外治疗
function ActionComponent.AdditionalTreatment(u, v)
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
-- 魔法回复
function ActionComponent.Evil(u, v)
    if CJ.GetUnitState(u, CJ.UNIT_STATE_MANA) ~=
        CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_MANA) then
        local sm = CJ.GetUnitState(u, CJ.UNIT_STATE_MANA) + v
        if sm > CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_MANA) then
            CJ.SetUnitState(u, CJ.UNIT_STATE_MANA,
                            CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_MANA))
        else
            CJ.SetUnitState(u, CJ.UNIT_STATE_MANA, sm)
        end
        CJ.DestroyEffect(CJ.AddSpecialEffectTarget(
                             'Abilities\\Spells\\Items\\AIma\\AImaTarget.mdl',
                             u, 'origin'))
    end
end
-- 魔法流失
function ActionComponent.ManaLeak(u, v)
    if CJ.GetUnitState(u, CJ.UNIT_STATE_MANA) ~= 0 then
        local sm = CJ.GetUnitState(u, CJ.UNIT_STATE_MANA) - v
        if sm < 0 then
            CJ.SetUnitState(u, CJ.UNIT_STATE_MANA, 0)
        else
            CJ.SetUnitState(u, CJ.UNIT_STATE_MANA, sm)
        end
        CJ.DestroyEffect(CJ.AddSpecialEffectTarget(
                             'Abilities\\Spells\\Items\\AIma\\AImaTarget.mdl',
                             u, 'origin'))
    end
end
-- 单位造成伤害
function ActionComponent.Damage(t, u, v)
    CJ.UnitDamageTarget(t, u, v, true, false, CJ.ATTACK_TYPE_NORMAL,
                        CJ.DAMAGE_TYPE_NORMAL, CJ.WEAPON_TYPE_WHOKNOWS)
end
-- 单位造成额外伤害
function ActionComponent.AdditionalDamage(t, u, v)
    CJ.UnitDamageTarget(t, u, v, true, false, CJ.ATTACK_TYPE_NORMAL,
                        CJ.DAMAGE_TYPE_NORMAL, CJ.WEAPON_TYPE_WHOKNOWS)
end
-- 火焰伤害
-- 马甲施放技能 -- 单位目标

function ActionComponent.CastUnit(u, SpellTargetUnit, v, s)
    local P = CJ.GetUnitLoc(SpellTargetUnit)
    BJ.CreateNUnitsAtLoc(1, Global:GetId('e001'), CJ.Player(
                             BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(u)) - 1),
                         P, CJ.bj_UNIT_FACING)
    local z = BJ.GetLastCreatedUnit()
    CJ.ShowUnit(z, false)
    -- 隐藏单位
    CJ.UnitApplyTimedLife(z, Global:GetId('BHwe'), 1)
    -- 设置生命周期
    CJ.UnitAddAbility(z, Global:GetId(v))
    -- 添加技能
    CJ.SetUnitAbilityLevel(z, Global:GetId(v), 1)
    CJ.IssueTargetOrder(z, s, SpellTargetUnit)
end
return ActionComponent
