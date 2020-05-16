json = require "Lib\\json\\json"
require "Attribute\\Attribute"
require "Attribute\\Term"
require "Attribute\\AttributeDota"
--require "Attribute\\Effects\\Effects"
require "Attribute\\Effects\\AttackEffects"
Factory = {
    ResistanceAttribute = "",
    ResistanceAttributedecoded = {},
    BasicsAttribute = {},
    BasicsAttributedecoded = {},
    ExtendAttribute = {},
    ExtendAttributebutedecoded = {},
    BasicsInformation = {},
    Rarity = {},
    --攻击特效
    --AttackEffectsData = {},
    --AttackEffectsdecoded = {}
}

function Factory:new(o)
    o = o or {}
    setmetatable(o, self)
    --
    local Dota = AttributeDota:Instance()
    -- print(Dota.BasicsInformation)
    o.BasicsInformation = self:SetAttribute(Dota.BasicsInformation)
    o.BasicsAttribute = self:SetAttribute(Dota.BasicsAttribute)
    o.ExtendAttribute = self:SetAttribute(Dota.ExtendAttribute)
    o.ResistanceAttribute = self:SetAttribute(Dota.ResistanceAttribute)
    o.BasicsAttributedecoded = json.decode(Dota.BasicsAttribute)
    o.ExtendAttributedecoded = json.decode(Dota.ExtendAttribute)
    o.ResistanceAttributedecoded = json.decode(Dota.ResistanceAttribute)
    --攻击特效
    --o.AttackEffectsdecoded = json.decode(Dota.AttackEffects)
    --
    return o
end
Factory.__index = Factory
function Factory:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end

function Factory:SetAttribute(Str)
    local o = Attribute:new(nil)
    local decoded = json.decode(Str)
    for i = #decoded, 1, -1 do
        -- print(decoded[i].Name)
        o[decoded[i].Name] = Term:new(nil)
        o[decoded[i].Name].Name = decoded[i].Name
        o[decoded[i].Name].Explain = decoded[i].Explain
        o[decoded[i].Name].Value = decoded[i].Value
        o[decoded[i].Name].Probability = decoded[i].Probability
        o[decoded[i].Name].Duration = decoded[i].Duration
    end
    -----
    return o
end
-- function Factory:AttackEffectsFactory()
--     local o = AttackEffects:new(nil)
--     for i = #self.AttackEffectsdecoded, 1, -1 do
--         -- print(decoded[i].Name)
--         o[self.AttackEffectsdecoded[i].Name] = Term:new(nil)
--         o[self.AttackEffectsdecoded[i].Name].Name = self.AttackEffectsdecoded[i].Name
--         o[self.AttackEffectsdecoded[i].Name].ID = self.AttackEffectsdecoded[i].ID
--         o[self.AttackEffectsdecoded[i].Name].Value = 0
--         o[self.AttackEffectsdecoded[i].Name].Probability = 0
--         o[self.AttackEffectsdecoded[i].Name].Duration = 0
--     end
--     return o
-- end
function Factory:SetTerm()
    local o = Term:new(nil)
    o.Name = ""
    o.Explain = ""
    o.Value = 0
    o.Probability = 0
    o.Duration = 0
    -----
    return o
end
function Factory:BasicsInformationFactory()
    local name = self:clone(self.BasicsInformation)
    return name
end
function Factory:BasicsAttributeFactory()
    local name = self:clone(self.BasicsAttribute)
    return name
end
function Factory:ExtendAttributeFactory()
    local name = self:clone(self.ExtendAttribute)
    return name
end
function Factory:ResistanceAttributeFactory()
    local name = self:clone(self.ResistanceAttribute)
    return name
end

-- 拷贝类
function Factory:clone(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for key, value in pairs(object) do
            new_table[_copy(key)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(object))
    end
    return _copy(object)
end

return Factory
-- m = Factory:Instance()
-- print(m.BasicsAttribute["移动速度"].value)
-- mm = m:BasicsInformationFactory()

-- print(mm["ID"].value)
-- -- m.BasicsAttribute["移动速度"].value = 10
-- -- print(m.BasicsAttribute["移动速度"].value)
-- -- print(m.BasicsAttribute["移动速度"].Explain)
-- -- print(json.encode(m))
-- for i = 10000, 1, -1 do
--     m1 = Factory:Instance()
--     mm1 = m1:BasicsInformationFactory()
--     print(mm1["ID"].value)
-- end
