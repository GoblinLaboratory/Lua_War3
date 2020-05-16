require "Attribute\\Attribute"
require "Attribute\\AttributeDota"
require "Attribute\\BasicsInformation"
require "Attribute\\Factory"
ItemAttribute = {
    ID = 0,
    -- 说明
    BasicsInformation = {},
    -- 单位基础属性
    BasicsAttribute = {},
    -- 扩展属性
    ExtendAttribute = {},
    -- 抗性
    ResistanceAttribute = {},
    -- 攻击特效
    AttackEffects = {},
    -- 技能列表
    SkillList = {}
}

function ItemAttribute:new(o)
    o = o or {}
    setmetatable(o, self)
    ----
    local Factory = Factory:Instance()
    o.ID = 0
    o.SkillList = {}
    -- o.BasicsInformation = BasicsInformation:new(nil)
    o.BasicsInformation = Factory:BasicsInformationFactory()
    o.BasicsAttribute = Factory:BasicsAttributeFactory()
    o.ExtendAttribute = Factory:ExtendAttributeFactory()
    o.ResistanceAttribute = Factory:ResistanceAttributeFactory()
    --o.AttackEffects = Factory:AttackEffectsFactory()
    -----
    return o
end
ItemAttribute.__index = ItemAttribute
return ItemAttribute

-- test
-- m = ItemAttribute:new(nil)
-- print(m.BasicsAttribute["移动速度"].value)
-- m.BasicsAttribute["移动速度"].value = 10
-- print(m.BasicsAttribute["移动速度"].value)
-- print(m.BasicsAttribute["移动速度"].Explain)
-- print(json.encode(m))
-- for i = 10000, 1, -1 do
--     m = ItemAttribute:new(nil)
-- end
