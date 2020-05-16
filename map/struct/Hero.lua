require "struct\\BaseAttribute"
require "struct\\MixedAttribute"
require "struct\\AttackAdditionalProperties"
require "struct\\DefenseAdditionalAttributes"
Item = require "struct\\Item"
require "AttributeSystem\\AttributeSystem"
-- 英雄类

Hero = {
    -- 单位ID 在游戏中的ID
    ID = 0,
    -- 单位名称
    Name = '无',
    -- 单位类型ID
    Types = 0,
    -- 单位等级
    level = 0,
    -- 英雄模板
    Template = "",
    -- 属性
    Base_Attribute = {},
    Mixed_Attribute = {},
    Attack_AdditionalProperties = {},
    Defense_AdditionalAttributes = {},
    -- 装备列表
    ItemsList = {
        -- 主手武器
        ["A"] = {
            ID = "A",
            -- 判断值
            Existence = false,
            Dota = {}
        },
        -- 副手武器
        ["B"] = {
            ID = "B",
            -- 判断值
            Existence = false,
            Dota = {}
        },
        -- 头部装备
        ["C"] = {
            ID = "C",
            -- 判断值
            Existence = false,
            Dota = {}
        },
        -- 胸部装备
        ["D"] = {
            ID = "D",
            -- 判断值
            Existence = false,
            Dota = {}
        },
        -- 腰部装备
        ["E"] = {
            ID = "E",
            -- 判断值
            Existence = false,
            Dota = {}
        },
        -- 腿部装备
        ["F"] = {
            ID = "F",
            -- 判断值
            Existence = false,
            Dota = {}
        },
        -- 手部装备
        ["G"] = {
            ID = "G",
            -- 判断值
            Existence = false,
            Dota = {}
        },
        -- 脚部装备
        ["H"] = {
            ID = "H",
            -- 判断值
            Existence = false,
            Dota = {}
        },
        -- 项链
        ["I"] = {
            ID = "I",
            -- 判断值
            Existence = false,
            Dota = {}
        },
        -- 戒指
        ["J"] = {
            ID = "J",
            -- 判断值
            Existence = false,
            Dota = {}
        },
        -- 披风
        ["K"] = {
            ID = "K",
            -- 判断值
            Existence = false,
            Dota = {}
        }
    }

}

function Hero:new(o)
    o = o or {}
    setmetatable(o, self)
    --

    --
    return o
end
function Hero:Int()
    self.Base_Attribute = BaseAttribute:new(nil)
    self.Mixed_Attribute = MixedAttribute:new(nil)
    self.Attack_AdditionalProperties = AttackAdditionalProperties:new(nil)
    self.Defense_AdditionalAttributes = DefenseAdditionalAttributes:new(nil)
    -- 主手武器
    self.ItemsList["A"].Dota = Item:new(nil)
    self.ItemsList["A"].Dota:Int()
    -- 副手武器
    self.ItemsList["B"].Dota = Item:new(nil)
    self.ItemsList["B"].Dota:Int()
    -- 头部装备
    self.ItemsList["C"].Dota = Item:new(nil)
    self.ItemsList["C"].Dota:Int()
    -- 胸部装备
    self.ItemsList["D"].Dota = Item:new(nil)
    self.ItemsList["D"].Dota:Int()
    -- 腰部装备
    self.ItemsList["E"].Dota = Item:new(nil)
    self.ItemsList["E"].Dota:Int()
    -- 腿部装备
    self.ItemsList["F"].Dota = Item:new(nil)
    self.ItemsList["F"].Dota:Int()
    -- 手部装备
    self.ItemsList["G"].Dota = Item:new(nil)
    self.ItemsList["G"].Dota:Int()
    -- 脚部装备
    self.ItemsList["H"].Dota = Item:new(nil)
    self.ItemsList["H"].Dota:Int()
    -- 项链
    self.ItemsList["I"].Dota = Item:new(nil)
    self.ItemsList["I"].Dota:Int()
    -- 戒指
    self.ItemsList["J"].Dota = Item:new(nil)
    self.ItemsList["J"].Dota:Int()
    -- 披风
    self.ItemsList["K"].Dota = Item:new(nil)
    self.ItemsList["K"].Dota:Int()
end
function Hero:SetItem(item1)
    self.ItemsList[item1.CustomValue].Dota:SetPrototype(item1)
    self:AddPrototype(item1)
end
function Hero:IntItem(item1)
    self.ItemsList[item1.CustomValue].Dota:Int()
    self:RemovePrototype(item1)
end
-- 获取装备
function Hero:GetEquipment(Custom) return self.ItemsList[Custom].Dota end
-- 添加属性
function Hero:AddPrototype(item1)
    self.Base_Attribute:AddPrototype(item1.Base_Attribute)
    self.Mixed_Attribute:AddPrototype(item1.Mixed_Attribute)
    self.Attack_AdditionalProperties:AddPrototype(
        item1.Attack_AdditionalProperties)
    self.Defense_AdditionalAttributes:AddPrototype(
        item1.Defense_AdditionalAttributes)
    AttributeSystem:AddPrototype(self.ID, item1)
end
function Hero:RemovePrototype(item1)
    self.Base_Attribute:RemovePrototype(item1.Base_Attribute)
    self.Mixed_Attribute:RemovePrototype(item1.Mixed_Attribute)
    self.Attack_AdditionalProperties:RemovePrototype(
        item1.Attack_AdditionalProperties)
    self.Defense_AdditionalAttributes:RemovePrototype(
        item1.Defense_AdditionalAttributes)
    AttributeSystem:RemovePrototype(self.ID, item1)
end
Hero.__index = Hero

return Hero

-- h = Hero:new(nil)
-- i = Item:new(nil)
-- i.CustomValue = "K"
-- h:SetItem(i)
-- h:IntItem(i)
