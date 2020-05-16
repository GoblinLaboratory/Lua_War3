require "Item"

Equipment = {
    Item1 = {},
    Item2 = {},
    Item3 = {},
    Item4 = {},
    Item5 = {},
    Item6 = {},
    Item7 = {},
    Item8 = {},
    Item9 = {},
    Item10 = {},
    Item11 = {},
}

function Equipment:new(o)  
    o = o or {}  
    setmetatable(o,self)  
	self.__index = self 
	----
    
	-----
    return o  
end 
Equipment.__index=Equipment
function Equipment:GetEquipment(id)
    if id == "A" then
        return self.Item1
    end
    if id == "B" then
        return self.Item2
    end
    if id == "C" then
        return self.Item3
    end
    if id == "D" then
        return self.Item4
    end
    if id == "E" then
        return self.Item5
    end
    if id == "F" then
        return self.Item6
    end
    if id == "G" then
        return self.Item7
    end
    if id == "H" then
        return self.Item8
    end
    if id == "I" then
        return self.Item9
    end
    if id == "J" then
        return self.Item10
    end
    if id == "K" then
        return self.Item11
    end
end
function Equipment:Int()  
    self.Item1 = Item:new()  
    self.Item1:Int()
    self.Item1.Uis.Custom = "A"

    self.Item2 = Item:new()
    self.Item2:Int()
    self.Item2.Uis.Custom = "B"

    self.Item3 = Item:new()
    self.Item3:Int()
    self.Item3.Uis.Custom = "C"

    self.Item4 = Item:new()
    self.Item4:Int()
    self.Item4.Uis.Custom = "D"

    self.Item5 = Item:new()
    self.Item5:Int()
    self.Item5.Uis.Custom = "E"

    self.Item6 = Item:new()
    self.Item6:Int()
    self.Item6.Uis.Custom = "F"

    self.Item7 = Item:new()
    self.Item7:Int()
    self.Item7.Uis.Custom = "G"

    self.Item8 = Item:new()
    self.Item8:Int()
    self.Item8.Uis.Custom = "H"

    self.Item9 = Item:new()
    self.Item9:Int()
    self.Item9.Uis.Custom = "I"

    self.Item10 = Item:new()
    self.Item10:Int()
    self.Item10.Uis.Custom = "J"

    self.Item11 = Item:new()
    self.Item11:Int()
    self.Item11.Uis.Custom = "K"

end

return Equipment