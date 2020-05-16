require "Lib\\Guid"
Object = {ID = 0,GUID = 0}

function Object:new(o)
    o = o or {}
    setmetatable(o, self)
    -- o.__index = self
    -----
    o.ID = 0
    o.GUID = Guid.New()
    -----
    return o
end
Object.__index = Object
return Object