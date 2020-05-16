BL = require "ECS\\Blizzard"
require "ECS\\Trigger\\Action"
Crit = { -- ID
    ID = 1,
    -- 几率
    Probability = 0,
    -- 值
    Value = 0,
    -- 持续时间
    Duration = 0,
    -- 触发事件
    Trigger = "单位造成伤害",
    -- ["触发条件"] = function()
    TriggerCondition = 0,
    -- ["触发动作"] = {},
    TriggerAction = 0,
    Fire = 0
}
function Crit:new(o)
    o = o or {}
    setmetatable(o, self)
    -- o.__index = self
    -----
    -- ID
    o.ID = 1
    -- 几率
    o.Probability = 0
    o.Value = 0
    o.Duration = 0
    o.Trigger = "单位造成伤害"
    o.TriggerCondition = function()
        -- statements
        if BL.GetDamageSource() == true and BL.GetDamageType() == true then
            -- statements
            return true
        else
            return false
        end
    end
    o.TriggerAction = function()
        -- statements
        Action["暴击"](o.Value)
    end
    o.Fire = function()
        -- statements
        if o.TriggerCondition() == true then
            -- statements
            o.TriggerAction()
        end
    end
    -----
    return o
end
Crit.__index = Crit
return Crit
