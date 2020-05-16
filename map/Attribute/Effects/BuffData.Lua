BuffData = {}
function BuffData:new(o)
    o = o or {}
    setmetatable(o, self)
    -----
    o[1] = {
        Name = "中毒",
        BuffID = "",
        ID = "",
        -- 是否为增益,1为增益，0为减益
        Beneficial = 0,
        --是够为光环
        Aura = 0,
        --持续时间
        Duration = 0
    }
    -----
    return o
end
BuffData.__index = BuffData
function BuffData:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end
return BuffData
