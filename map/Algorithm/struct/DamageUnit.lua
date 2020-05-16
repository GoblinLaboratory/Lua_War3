DamageUnit = {
    ID = 0,
    Killerunit = 0,
    unit = 0,
    Value = 0,
    EffectType = 0
}
function DamageUnit:new(o,id,t,u,v,e)
    o = o or {}
    setmetatable(o, self)
    -- o.__index = self
    -----

    o.ID = id
    o.Killerunit = t
    o.Value = v
    o.unit = u
    o.EffectType = e
    -----
    return o
end
DamageUnit.__index = DamageUnit
return DamageUnit