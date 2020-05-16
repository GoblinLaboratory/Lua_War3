--附魔

Enchantments = {

}
function Enchantments:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    --
    --
    return o
end

Enchantments.__index=Enchantments

return Enchantments