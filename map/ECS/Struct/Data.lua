Data = {Name = 0, Value = 0, Explain = 0}

function Data:new(o)
    o = o or {}
    setmetatable(o, self)
    -- o.__index = self
    -----
    o.Name = 0
    o.Value = 0
    o.Explain = 0
    -----
    return o
end
Data.__index = Data
return Data
