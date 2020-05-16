--单位状态机

UnitState = {
    --是否被净化
    Purify = false,
    --是否被眩晕
    --是否中毒
    --是否燃烧
    --是否被冰冻
    --是否被麻痹
}

function UnitState:new(o)
    o = o or {}
    setmetatable(o, self)
    --
    --
    return o
end
UnitState.__index = UnitState

return UnitState