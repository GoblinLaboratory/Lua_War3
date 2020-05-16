--require "Attribute\\Effects\\Action"
Effects = {
    -- 名称
    Name = 0,
    -- ID
    ID = 1,
    -- 说明文本
    Explain = 0,
    -----------------------------------------
    -- 是否为增益
    Beneficial = true,
    -- 是否能够叠加
    SuperPosition = false,
    -- 值
    Value = 0,
    OriginalValue = 0,
    -- 持续时间
    Duration = 0,
    Tag = 0,
    Action = {}
}
----------
-- function Effects:Update()
-- end
----------
function Effects:new(o)
    o = o or {}
    setmetatable(o, self)
    -----
    o.Value = 0
    o.OriginalValue = 0
    o.Duration = 0
    -----
    return o
end
Effects.__index = Effects
return Effects
