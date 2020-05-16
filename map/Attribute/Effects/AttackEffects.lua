require "Attribute\\Effects\\Effects"
AttackEffects = {}

function AttackEffects:new(o)
    o = o or {}
    setmetatable(o, self)
    -----
    -----
    return o
end
AttackEffects.__index = AttackEffects
function AttackEffects:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end
return AttackEffects
