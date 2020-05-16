-- 属性
Term = {
    -- 绑定单位
    -- 名称
    Name = "无",
    -- ID
    ID = 0,
    -- 说明
    Explain = "无",
    -- 值
    Value = 0,
    -- 几率
    Probability = 0,
    -- 持续时间
    Duration = 0
}
function Term:new(o)
    o = o or {}
    setmetatable(o, self)
    -- o.__index = self
    -----
    -- 名称
    o.Name = "无"
    o.ID = 0
    -- 说明
    o.Explain = "无"
    -- 值
    o.value = 0
    -- 几率
    o.Probability = 0
    -- 持续时间
    o.Duration = 0
    -----
    return o
end
Term.__index = Term
return Term

-- test
-- m = Character:new(nil)
-- decoded = json.encode(m)
-- print(decoded)
-- print(m.value)
