--物品数据
require "Attribute"
require "UI"

Item = {
    ID = 0,
    --装备说明
    Uis = {},
    --物品等级
    Level = 0,
    --装备属性
    Attributes = {}, 
    --附魔
    Enchantments = 0,
    --附魔属性
    Enchantments1 = {}, 
    Enchantments2 = {}, 
    
    --镶嵌孔数量
    Hole = 0,
    --孔属性
    Hole1 = {}, 
    Hole2 = {}, 
    Hole3 = {}, 
    Hole4 = {}, 
    Hole5 = {}, 
    Hole6 = {}, 
    --是否为套装
    Suit = false,
    --套装属性
    SuitAttributes1 = {}, 
    SuitAttributes2 = {}, 
    SuitAttributes3 = {}, 
    SuitAttributes4 = {}, 
    SuitAttributes5 = {}, 
    SuitAttributes6 = {}, 
    

}

function Item:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    --
    
    --
    return o
end

function Item:Int()

    --setmetatable(self.Uis,UI) 
    self.Uis = UI:new()

    self.Attributes = Attribute:new()

    self.Enchantments1 = Attribute:new()
    self.Enchantments2 = Attribute:new()

    self.Hole1 = Attribute:new()
    self.Hole2 = Attribute:new()
    self.Hole3 = Attribute:new()
    self.Hole4 = Attribute:new()
    self.Hole5 = Attribute:new()
    self.Hole6 = Attribute:new()
    
    self.SuitAttributes1 = Attribute:new()
    self.SuitAttributes2 = Attribute:new()
    self.SuitAttributes3 = Attribute:new()
    self.SuitAttributes4 = Attribute:new()
    self.SuitAttributes5 = Attribute:new()
    self.SuitAttributes6 = Attribute:new()
end
function Item:SetPrototype(item1)
    self.ID = item1.ID
    self.Level = item1.Level
    self.Attributes:Set(item1.Attributes )
    self.Uis:Set(item1.Uis )
end
function Item:ClearPrototype()
    self.ID = 0
    self.Level = 0
    self.Attributes:Init()
    self.Uis:Init()
end
Item.__index=Item

return Item