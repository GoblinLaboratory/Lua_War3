require "struct\\BaseAttribute"
require "struct\\MixedAttribute"
require "struct\\AttackAdditionalProperties"
require "struct\\DefenseAdditionalAttributes"
json = require "Lib\\Json\\json"
-- 物品类

Item = {
    -- 物品ID
    ID = 0,
    -- 物品名称
    Name = '无',
    -- 物品类型
    Types = '无',
    -- 物品品质
    Quality = '无',
    -- 位置
    Position = '无',
    -- 星
    Star = "★★★★☆",
    -- 词缀
    Affix = '词缀',
    -- 强化
    Strengthen = 0,
    -- 物品图标
    Icon = '无',
    -- 物品自定义值
    CustomValue = 'ZiDingYi',
    -- 物品说明
    Explain = '无',
    -- 装备等级
    level = 0,
    Base_Attribute = {},
    Mixed_Attribute = {},
    Attack_AdditionalProperties = {},
    Defense_AdditionalAttributes = {}
}

function Item:new(o)
    o = o or {}
    setmetatable(o, self)
    --
    
    --self:Int()
    --
    return o
end

Item.__index = Item

function Item:Int()
    self.Base_Attribute=BaseAttribute:new(nil)
    self.Mixed_Attribute= MixedAttribute:new(nil)
    self.Attack_AdditionalProperties=AttackAdditionalProperties:new(nil)
    self.Defense_AdditionalAttributes= DefenseAdditionalAttributes:new(nil)
     -- 物品ID
     self.ID = 0
     -- 物品名称
     self.Name = '无'
     -- 物品类型
     self.Types = '无'
     -- 物品品质
     self.Quality = '无'
     -- 位置
     self.Position = '无'
     -- 星
     self.Star = "★★★★☆"
     -- 词缀
     self.Affix = '词缀'
     -- 强化
     self.Strengthen = 0
     -- 物品图标
     self.Icon = '无'
     -- 物品自定义值
     self.CustomValue = 'ZiDingYi'
     -- 物品说明
     self.Explain = '无'
     -- 装备等级
     self.level = 0
     self.Base_Attribute:Int()
     self.Mixed_Attribute:Int()
     self.Attack_AdditionalProperties:Int()
     self.Defense_AdditionalAttributes:Int()
end
function Item:SetPrototype(item1)
    print("属性6", item1.Mixed_Attribute.AttackPower)
    -- 物品名称
    self.Name = item1.Name
    -- 物品类型
    self.Types = item1.Types
    -- 物品品质
    self.Quality = item1.Quality
    -- 位置
    self.Position = item1.Position
    -- 星
    self.Star = item1.Star
    -- 词缀
    self.Affix = item1.Affix
    -- 强化
    self.Strengthen = item1.Strengthen
    -- 物品图标
    self.Icon = item1.Icon
    -- 物品自定义值
    self.CustomValue = item1.CustomValue
    -- 物品说明
    self.Explain = item1.Explain
    -- 装备等级
    self.level = item1.level
    self.Base_Attribute:SetPrototype(item1.Base_Attribute)
    self.Mixed_Attribute:SetPrototype(item1.Mixed_Attribute)
    print("测试2"..item1.Mixed_Attribute.AttackPower)
    self.Attack_AdditionalProperties:SetPrototype(item1.Attack_AdditionalProperties)
    self.Defense_AdditionalAttributes:SetPrototype(item1.Defense_AdditionalAttributes)
end
function Item:GetJson()
    ------------
    local decoded = "{" .. "\"Itme\"" .. ":" .. json.encode(self) .. "," ..
                  "\"Base_Attribute\"" .. ":" ..
                  json.encode(self.Base_Attribute) .. "," ..
                  "\"Mixed_Attribute\"" .. ":" ..
                  json.encode(self.Mixed_Attribute) .. "," ..
                  "\"Attack_AdditionalProperties\"" .. ":" ..
                  self.Attack_AdditionalProperties:GetJson() .."," ..
                  "\"Defense_AdditionalAttributes\"" .. ":" ..
                  self.Defense_AdditionalAttributes:GetJson() ..
                 "}"
    return decoded
    ------------
end
-- function Item:SetPrototype(item1)
-- end

-- function Item:CoverPrototype(item1)
-- end
-- function Item:ClearPrototype()
-- end
return Item

-- 测试代码
-- function Item:print ()
-- print("输出： ",self.Base_Attribute.Power)
-- end

-- myshape = Item:new(nil)
-- myshape.Base_Attribute.Power = 10
-- myshape:print()
-- decoded = json.encode(myshape)
-- --print(decoded)
-- print(myshape:GetJson())

