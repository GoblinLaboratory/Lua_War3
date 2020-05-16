BL = require "ECS\\Blizzard"
TriggerCondition = {}
TriggerCondition["无"] = function()
    -- statements
    return true
end
TriggerCondition["物理伤害"] = function()
    -- statements
    print(Blizzard.DamageType)
    if Blizzard.DamageType == "物理伤害" then
        -- statements
        print(3)
        return true
    else
        --魔法伤害
        print(4)
        return false
    end
end
TriggerCondition["魔法伤害"] = function()
    -- statements
    if Blizzard.DamageType == "魔法伤害" then
        -- statements
        return true
    else
        --魔法伤害
        return false
    end
end
TriggerCondition["攻击伤害"] = function()
    -- statements
    if Blizzard.DamageSource == "攻击伤害" then
        -- statements
        print(1)
        return true
    else
        -- 技能伤害
        print(2)
        return false
    end
end
TriggerCondition["技能伤害"] = function()
    -- statements
    if Blizzard.DamageSource == "技能伤害" then
        -- statements
        return true
    else
        -- 技能伤害
        return false
    end
end
TriggerCondition["近战伤害"] = function()
    -- statements
    if Blizzard.DamageCategory == "近战伤害" then
        -- statements
        return true
    else
        -- 远程伤害
        return false
    end
end
TriggerCondition["远程伤害"] = function()
    -- statements
    if Blizzard.DamageCategory == "远程伤害" then
        -- statements
        return true
    else
        -- 远程伤害
        return false
    end
end
return TriggerCondition
