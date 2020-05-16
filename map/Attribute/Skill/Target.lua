Target = {
    -- 触发单位
    TriggerUnit = 0,
    -- 目标单位
    TargetUnit = 0,
}
function Target:new(o)
    o = o or {}
    setmetatable(o, self)
    -- o.__index = self
    -----
    o.TriggerUnit = 0
    o.TargetUnit = 0
    -----
    return o
end
Target.__index = Target
return Target