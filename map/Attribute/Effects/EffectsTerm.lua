EffectsTerm = {
    -- 绑定单位
    Unit = 0,
    -- 几率
    Probability = 0,
    -- 触发单位
    TriggerUnit = 0,
    -- 持续时间
    Duration = 0,
    -- 属性
    Attribute = {}
}

function EffectsTerm:new(o)
    o = o or {}
    setmetatable(o, self)
    -- o.__index = self
    -----

    -----
    return o
end
EffectsTerm.__index = EffectsTerm
return EffectsTerm
