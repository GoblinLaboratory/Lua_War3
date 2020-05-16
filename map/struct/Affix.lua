--词缀
Affix = {
    ID = 0,
    Name= "无",
    Attribute= "无",
    Value = 0,
    Level = 0,
}

function Affix:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self

    self:Int()

    return o
end
Affix.__index = Affix


return Affix