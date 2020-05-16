Buff = {}
function Buff:new(o)
    o = o or {}
    setmetatable(o, self)
    -- o.__index = self
    -----
    o.Name = ""
    o.BuffID = ""
    o.ID = ""
    -- 是否为增益,1为增益，0为减益
    o.Beneficial = 0
    -- 是否为光环
    -- o.Aura = 0
    -- 持续时间
    o.Duration = 0
    -- Buff来源
    o.Source = 0
    -----
    return o
end
Buff.__index = Buff
return Buff
