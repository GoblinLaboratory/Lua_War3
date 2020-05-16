Trigger = {
    -- 触发事件
    TriggerEvent = 0,
    -- 触发条件
    TriggerCondition = 0,
    -- 触发动作
    TriggerAction = 0
}
function Trigger:new(o)
    o = o or {}
    setmetatable(o, self)
    -- o.__index = self
    -----
    -----
    return o
end

function Trigger:Fire() end
Trigger.__index = Trigger
----------
-- function Effects:Update()
-- end
----------
return Trigger
