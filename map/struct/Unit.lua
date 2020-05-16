require "struct\\BaseAttribute"
require "struct\\MixedAttribute"
require "struct\\AttackAdditionalProperties"
require "struct\\DefenseAdditionalAttributes"
-- 单位类

Unit = {
    -- 单位ID 在游戏中的ID
    ID = 0,
    -- 单位名称
    Name = '无',
    -- 单位类型ID
    Types = '无',
    -- 单位等级
    level = 0,
    -- 属性
    --Base_Attribute = {},
    Mixed_Attribute = {},
    --Attack_AdditionalProperties = {},
    --Defense_AdditionalAttributes = {},
    -- 装备列表
   

}

function Unit:new(o)
    o = o or {}
    setmetatable(o, self)
    --
    --setmetatable(self.Base_Attribute, BaseAttribute)
    setmetatable(self.Mixed_Attribute, MixedAttribute)
    --setmetatable(self.Attack_AdditionalProperties, AttackAdditionalProperties)
    --setmetatable(self.Defense_AdditionalAttributes, DefenseAdditionalAttributes)
    --
    return o
end
Unit.__index = Unit

return Unit
