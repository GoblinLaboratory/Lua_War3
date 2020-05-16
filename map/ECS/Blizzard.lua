local CJ = require 'jass.common'
local BJ = require 'blizzard'
local japi = require 'jass.japi'
Blizzard = {}
-- 判断单位是否为英雄
function Blizzard.IdHreo(id)
    if CJ.IsUnitType(id, CJ.UNIT_TYPE_HERO) == true then
        return true
    else
        return false
    end
end
-- 伤害来源
Blizzard.DamageSource = "攻击伤害"
-- 伤害是否为攻击伤害
function Blizzard.GetDamageSource()
    if Blizzard.DamageSource == "攻击伤害" then
        -- statements
        return true
    else
        -- 技能伤害
        return false
    end
end
-- 伤害类型
Blizzard.DamageType = "物理伤害"
-- 伤害是否为物理伤害
function Blizzard.GetDamageType()
    if Blizzard.DamageType == "物理伤害" then
        -- statements
        return true
    else
        -- 魔法伤害
        return false
    end
end
-- 伤害类别
Blizzard.DamageCategory = "近战伤害"
-- 伤害是否为物理伤害
function Blizzard.GetDamageCategory()
    if Blizzard.DamageCategory == "近战伤害" then
        -- statements
        return true
    else
        -- 远程伤害
        return false
    end
end
Blizzard["被攻击单位"] = function()
    -- statements
    return BJ.GetAttackedUnitBJ()
end
-- 两个单位之间的角度
Blizzard.AngleBetweenUnits = function(u,t)
    -- statements
    return BJ.bj_RADTODEG * CJ.Atan2(CJ.GetUnitY(t) - CJ.GetUnitY(u), CJ.GetUnitX(t) - CJ.GetUnitX(u))
end
return Blizzard
