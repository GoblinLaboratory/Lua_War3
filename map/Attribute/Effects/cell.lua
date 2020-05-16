cell = {
    Name = 0,
    Value = 0,
    OriginalValue = 0
}
function cell:new(o)
    o = o or {}
    setmetatable(o, self)
    -- o.__index = self
    -----
    o.Name = 0
    o.Value = 0
    o.OriginalValue = 0
    -----
    return o
end
cell.__index = cell
return cell