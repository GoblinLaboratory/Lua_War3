json = require "Lib\\json\\json"
require "ECS\\Data\\AttributeData"
require "ECS\\Struct\\Data"
require "ECS\\Struct\\Object"
require "ECS\\Component\\WeaponryComponent"
require "ECS\\Component\\SkillComponent"
require "ECS\\Component\\BuffComponent"
require "ECS\\Global"
Factory = {["Base"] = {}, ["Unit"] = {}, ["Hero"] = {}, ["Weaponry"] = {}}

function Factory:new(o)
    o = o or {}
    setmetatable(o, self)
    --
    o["Base"] = self:SetAttribute(AttributeData.Base)
    o["Unit"] = self:SetAttribute(AttributeData.Unit)
    o["Hero"] = self:SetAttribute(AttributeData.Hero)
    o["Extra"] = self:SetAttribute(AttributeData.Extra)
    o["Weaponry"] = self:SetAttribute(AttributeData.Weaponry)
    -- 组件工厂
    o["WeaponryComponent"] = self:SetWeaponryComponentAttribute()
    --
    return o
end
Factory.__index = Factory
function Factory:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end

function Factory:SetAttribute(Str)
    local o = {}
    local decoded = json.decode(Str)
    for i = #decoded, 1, -1 do
        o[decoded[i].Name] = Data:new(nil)
        o[decoded[i].Name].Name = decoded[i].Name
        o[decoded[i].Name].Explain = decoded[i].Explain
        o[decoded[i].Name].Value = 0
    end
    -----
    return o
end
function Factory:IntAttribute(str)
    -- local Name = {}
    local Name = Global.clone(self[str])
    return Name
end
function Factory:ObjectFactory()
    local name = Object:new()
    name["Base"] = Global.clone(self["Base"])
    return name
end
function Factory:UnitFactory()
    local name = self:ObjectFactory()
    name["Unit"] = Global.clone(self["Unit"])
    name["Extra"] = Global.clone(self["Extra"])
    name["SkillComponent"] = SkillComponent:new()
    name["BuffComponent"] = BuffComponent:new()
    return name
end
function Factory:HeroFactory()
    local name = self:UnitFactory()
    name["Hero"] = Global.clone(self["Hero"])
    name["WeaponryComponent"] = self:WeaponryComponentFactory()
    return name
end
function Factory:WeaponryFactory()
    local name = Object:new()
    name["Base"] = Global.clone(self["Base"])
    name["Unit"] = Global.clone(self["Unit"])
    name["Extra"] = Global.clone(self["Extra"])
    name["Hero"] = Global.clone(self["Hero"])
    name["Weaponry"] = Global.clone(self["Weaponry"])
    name["Skill"] = WeaponryComponent:new()
    return name
end
-- 组件工厂
function Factory:SetWeaponryComponentAttribute()
    local o = WeaponryComponent:new()
    local decoded = json.decode(AttributeData.WeaponryType)
    for i = #decoded, 1, -1 do
        o[decoded[i].Name] = {}
    end
    -----
    return o
end
function Factory:WeaponryComponentFactory()
    local name = Global.clone(self["WeaponryComponent"])
    for  k, v in pairs(name) do
        --statements
        name[k] = self:WeaponryFactory()
    end
    return name
end

return Factory

-- F = Factory:Instance()
-- -- print(F.Unit["生命值"].Explain)
-- -- o = F:WeaponryFactory()
-- -- print(o["Base"]["自定义值"].Value)
-- -- o["Base"]["自定义值"].Value = "sd"
-- -- print(o["Base"]["自定义值"].Value)
-- for i = 10, 1, -1 do
--     local o = F:HeroFactory()
--     -- print(o["Hero"]["力量"].Value)
--     -- o["Hero"]["力量"].Value = 10
--     -- print(o["Hero"]["力量"].Value)
--     -- o["Hero"] = F:IntAttribute("Hero")
--     print(o["WeaponryComponent"]["Mainhandweapon"]["Unit"]["攻击力"].Value)
--     for  k, v in pairs(o["WeaponryComponent"]["Mainhandweapon"]["Unit"]) do
--         --statements
--         --print("k:"..k)
--         --print("v:"..v)
--     end
--     -- for j = #o["WeaponryComponent"], 1, -1 do
--     --     print(o["WeaponryComponent"][j].key)
--     -- end
--     -- for j = #o["WeaponryComponent"]["Mainhandweapon"], 1, -1 do
--     --     print(o["WeaponryComponent"]["Mainhandweapon"][j])
--     -- end
--     -- print(o.GUID)
-- end
