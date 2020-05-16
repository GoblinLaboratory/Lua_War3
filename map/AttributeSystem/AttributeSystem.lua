require "AttributeSystem\\Bonus"
require "Attribute\\Attribute"
require "Attribute\\AttributeDota"
require "Attribute\\BasicsInformation"
require "Attribute\\Factory"
require "Attribute\\ItemAttribute"

AttributeSystem = {
    Types = {
        ["护甲"] = 1,
        ["攻击力"] = 2,
        ["魔法回复速度"] = 3,
        ["生命回复速度"] = 4,
        ["攻击速度"] = 5,
        ["生命值"] = 6,
        ["魔法值"] = 7,
        ["力量"] = 8,
        ["敏捷"] = 9,
        ["智力"] = 10,
        ["移动速度"] = 11
    }
}
AttributeSystem.SetPrototype = function(u, Type, Number)
    if Number ~= 0 then
        local bu = Bonus:Instance()
        -- statements
        if AttributeSystem.Types[Type] < 11 then
            -- statements
            bu:UnitAddBonus(u, AttributeSystem.Types[Type], Number)
        elseif AttributeSystem.Types[Type] == 11 then
            -- statements
            bu:SetUnitSeed(u, Number)
        else
            print("无法添加这项属性。")
        end

    end

end
-- function AttributeSystem:SetPrototype(u, Type,Number)
--     local bu = Bonus:Instance()
--     bu:UnitAddBonus(u, self.Types[Type], Number)
-- end
-- function AttributeSystem:new(o)
--     o = o or {}
--     setmetatable(o, self)
--     --
--     --
--     return o
-- end
-- AttributeSystem.__index = AttributeSystem
-- function AttributeSystem:Instance()
--     if self.instance == nil then self.instance = self:new() end
--     return self.instance
-- end

return AttributeSystem
