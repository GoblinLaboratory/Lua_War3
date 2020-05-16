json = require "Lib\\json\\json"
-- 防御附加属性
DefenseReliefTypes = {
    "伤害减免1", "物理伤害吸收2", "法术伤害减免3",
    "火焰抗性4", "冰霜抗性5", "暗影抗性6", "神圣抗性7",
    "毒属性抗性8", "雷属性抗性9", "眩晕抗性10", "格挡11",
    "闪避12"
}

DefenseAdditionalAttributes = {
    -- 伤害减免
    DamageRelief = {
        Type = "DamageRelief",
        -- 判断值
        Existence = false,
        -- 伤害类型
        DamageReliefType = DefenseReliefTypes[1],
        -- 伤害减免百分比
        DamageValue = 0
    },
    -- 物理伤害吸收
    PhysicalDamageAbsorption = {
        Type = "PhysicalDamageAbsorption",
        -- 判断值
        Existence = false,
        -- 伤害类型
        DamageReliefType = DefenseReliefTypes[2],
        -- 伤害吸收值
        DamageValue = 0
    },
    -- 法术伤害减免
    SpellDamageRelief = {
        Type = "SpellDamageRelief",
        -- 判断值
        Existence = false,
        -- 伤害类型
        DamageReliefType = DefenseReliefTypes[3],
        -- 伤害减免值
        DamageValue = 0
    },
    -- 火焰抗性
    FireResistance = {
        Type = "FireResistance",
        -- 判断值
        Existence = false,
        -- 伤害类型
        DamageReliefType = DefenseReliefTypes[4],
        -- 伤害减免百分比
        DamageValue = 0
    },
    -- 冰霜抗性
    SherbetResistance = {
        Type = "SherbetResistance",
        -- 判断值
        Existence = false,
        -- 伤害类型
        DamageReliefType = DefenseReliefTypes[5],
        -- 伤害减免百分比
        DamageValue = 0
    },
    -- 暗影抗性
    ShadowResistance = {
        Type = "ShadowResistance",
        -- 判断值
        Existence = false,
        -- 伤害类型
        DamageReliefType = DefenseReliefTypes[6],
        -- 伤害减免百分比
        DamageValue = 0
    },
    -- 神圣抗性
    SacredResistance = {
        Type = "SacredResistance",
        -- 判断值
        Existence = false,
        -- 伤害类型
        DamageReliefType = DefenseReliefTypes[7],
        -- 伤害减免百分比
        DamageValue = 0
    },
    -- 毒属性抗性
    PoisonResistance = {
        Type = "PoisonResistance",
        -- 判断值
        Existence = false,
        -- 伤害类型
        DamageReliefType = DefenseReliefTypes[8],
        -- 伤害减免百分比
        DamageValue = 0
    },
    -- 雷属性抗性
    ThunderResistance = {
        Type = "ThunderResistance",
        -- 判断值
        Existence = false,
        -- 伤害类型
        DamageReliefType = DefenseReliefTypes[9],
        -- 伤害减免百分比
        DamageValue = 0
    },
    -- 眩晕抗性
    VertigoResistance = {
        Type = "VertigoResistance",
        -- 判断值
        Existence = false,
        -- 伤害类型
        DamageReliefType = DefenseReliefTypes[10],
        -- 伤害减免百分比
        DamageValue = 0
    },
    -- 格挡
    Block = {
        Type = "Block",
        -- 判断值
        Existence = false,
        -- 伤害类型
        DamageReliefType = DefenseReliefTypes[11],
        -- 格挡几率
        BlockValue = 0
    },
    -- 闪避
    Dodge = {
        Type = "Dodge",
        -- 判断值
        Existence = false,
        -- 伤害类型
        DamageReliefType = DefenseReliefTypes[12],
        -- 闪避几率
        DodgeValue = 0
    }
}

-- 创建DefenseAdditionalAttributes类
function DefenseAdditionalAttributes:new(o)
    o = o or {}
    setmetatable(o, self)
    --
    self:Int()
    --
    return o
end
DefenseAdditionalAttributes.__index = DefenseAdditionalAttributes

function DefenseAdditionalAttributes:Int()
    --
    self.DamageRelief.Type = "DamageRelief"
    self.DamageRelief.Existence = false
    self.DamageRelief.DamageReliefType = DefenseReliefTypes[1]
    self.DamageRelief.DamageValue = 0
    --
    self.PhysicalDamageAbsorption.Type = "PhysicalDamageAbsorption"
    self.PhysicalDamageAbsorption.Existence = false
    self.PhysicalDamageAbsorption.DamageReliefType = DefenseReliefTypes[2]
    self.PhysicalDamageAbsorption.DamageValue = 0
    --
    self.SpellDamageRelief.Type = "SpellDamageRelief"
    self.SpellDamageRelief.Existence = false
    self.SpellDamageRelief.DamageReliefType = DefenseReliefTypes[3]
    self.SpellDamageRelief.DamageValue = 0
    --
    self.FireResistance.Type = "FireResistance"
    self.FireResistance.Existence = false
    self.FireResistance.DamageReliefType = DefenseReliefTypes[4]
    self.FireResistance.DamageValue = 0
    --
    self.SherbetResistance.Type = "SherbetResistance"
    self.SherbetResistance.Existence = false
    self.SherbetResistance.DamageReliefType = DefenseReliefTypes[5]
    self.SherbetResistance.DamageValue = 0
    --
    self.ShadowResistance.Type = "ShadowResistance"
    self.ShadowResistance.Existence = false
    self.ShadowResistance.DamageReliefType = DefenseReliefTypes[6]
    self.ShadowResistance.DamageValue = 0
    --
    self.SacredResistance.Type = "SacredResistance"
    self.SacredResistance.Existence = false
    self.SacredResistance.DamageReliefType = DefenseReliefTypes[7]
    self.SacredResistance.DamageValue = 0
    --
    self.PoisonResistance.Type = "PoisonResistance"
    self.PoisonResistance.Existence = false
    self.PoisonResistance.DamageReliefType = DefenseReliefTypes[8]
    self.PoisonResistance.DamageValue = 0
    --
    self.ThunderResistance.Type = "ThunderResistance"
    self.ThunderResistance.Existence = false
    self.ThunderResistance.DamageReliefType = DefenseReliefTypes[9]
    self.ThunderResistance.DamageValue = 0
    --
    self.VertigoResistance.Type = "VertigoResistance"
    self.VertigoResistance.Existence = false
    self.VertigoResistance.DamageReliefType = DefenseReliefTypes[10]
    self.VertigoResistance.DamageValue = 0
    --
    self.Block.Type = "Block"
    self.Block.Existence = false
    self.Block.DamageReliefType = DefenseReliefTypes[11]
    self.Block.BlockValue = 0
    --
    self.Dodge.Type = "Dodge"
    self.Dodge.Existence = false
    self.Dodge.DamageReliefType = DefenseReliefTypes[12]
    self.Dodge.DodgeValue = 0
end
function DefenseAdditionalAttributes:SetPrototype(item1)
    --
    if item1.DamageRelief.DamageValue ~= 0 then
        -- self.DamageRelief.Type = "DamageRelief"
        self.DamageRelief.Existence = true
        -- self.DamageRelief.DamageReliefType = DefenseReliefTypes[1]
        self.DamageRelief.DamageValue = item1.DamageRelief.DamageValue
    end
    --
    if item1.PhysicalDamageAbsorption.DamageValue ~= 0 then
        -- self.PhysicalDamageAbsorption.Type = "PhysicalDamageAbsorption"
        self.PhysicalDamageAbsorption.Existence = true
        -- self.PhysicalDamageAbsorption.DamageReliefType = DefenseReliefTypes[2]
        self.PhysicalDamageAbsorption.DamageValue =
            item1.PhysicalDamageAbsorption.DamageValue
    end
    --
    if item1.SpellDamageRelief.DamageValue ~= 0 then
        -- self.SpellDamageRelief.Type = "SpellDamageRelief"
        self.SpellDamageRelief.Existence = true
        -- self.SpellDamageRelief.DamageReliefType = DefenseReliefTypes[3]
        self.SpellDamageRelief.DamageValue = item1.SpellDamageRelief.DamageValue
    end
    --
    if item1.FireResistance.DamageValue ~= 0 then
        -- self.FireResistance.Type = "FireResistance"
        self.FireResistance.Existence = true
        -- self.FireResistance.DamageReliefType = DefenseReliefTypes[4]
        self.FireResistance.DamageValue = item1.FireResistance.DamageValue
    end
    --
    if item1.SherbetResistance.DamageValue ~= 0 then
        -- self.SherbetResistance.Type = "SherbetResistance"
        self.SherbetResistance.Existence = true
        -- self.SherbetResistance.DamageReliefType = DefenseReliefTypes[5]
        self.SherbetResistance.DamageValue = item1.SherbetResistance.DamageValue
    end
    --
    if item1.ShadowResistance.DamageValue ~= 0 then
        -- self.ShadowResistance.Type = "ShadowResistance"
        self.ShadowResistance.Existence = true
        -- self.ShadowResistance.DamageReliefType = DefenseReliefTypes[6]
        self.ShadowResistance.DamageValue = item1.ShadowResistance.DamageValue
    end
    --
    if item1.SacredResistance.DamageValue ~= 0 then
        -- self.SacredResistance.Type = "SacredResistance"
        self.SacredResistance.Existence = true
        -- self.SacredResistance.DamageReliefType = DefenseReliefTypes[7]
        self.SacredResistance.DamageValue = item1.SacredResistance.DamageValue
    end
    --
    if item1.PoisonResistance.DamageValue ~= 0 then
        -- self.PoisonResistance.Type = "PoisonResistance"
        self.PoisonResistance.Existence = true
        -- self.PoisonResistance.DamageReliefType = DefenseReliefTypes[8]
        self.PoisonResistance.DamageValue = item1.PoisonResistance.DamageValue
    end
    --
    if item1.ThunderResistance.DamageValue ~= 0 then
        -- self.ThunderResistance.Type = "ThunderResistance"
        self.ThunderResistance.Existence = true
        -- self.ThunderResistance.DamageReliefType = DefenseReliefTypes[9]
        self.ThunderResistance.DamageValue = item1.ThunderResistance.DamageValue
    end
    --
    if item1.VertigoResistance.DamageValue ~= 0 then
        -- self.VertigoResistance.Type = "VertigoResistance"
        self.VertigoResistance.Existence = true
        -- self.VertigoResistance.DamageReliefType = DefenseReliefTypes[10]
        self.VertigoResistance.DamageValue = item1.VertigoResistance.DamageValue
    end
    --
    if item1.Block.BlockValue ~= 0 then
        -- self.Block.Type = "Block"
        self.Block.Existence = true
        -- self.Block.DamageReliefType = DefenseReliefTypes[11]
        self.Block.BlockValue = item1.Block.BlockValue
    end
    --
    if item1.Dodge.DodgeValue ~= 0 then
        -- self.Dodge.Type = "Dodge"
        self.Dodge.Existence = true
        -- self.Dodge.DamageReliefType = DefenseReliefTypes[12]
        self.Dodge.DodgeValue = item1.Dodge.DodgeValue
    end
end
-- 添加属性
function DefenseAdditionalAttributes:AddPrototype(item1)
    --
    if item1.DamageRelief.DamageValue ~= 0 then
        -- self.DamageRelief.Type = "DamageRelief"
        self.DamageRelief.Existence = true
        -- self.DamageRelief.DamageReliefType = DefenseReliefTypes[1]
        self.DamageRelief.DamageValue = self.DamageRelief.DamageValue +
                                            item1.DamageRelief.DamageValue
    end
    --
    if item1.PhysicalDamageAbsorption.DamageValue ~= 0 then
        -- self.PhysicalDamageAbsorption.Type = "PhysicalDamageAbsorption"
        self.PhysicalDamageAbsorption.Existence = true
        -- self.PhysicalDamageAbsorption.DamageReliefType = DefenseReliefTypes[2]
        self.PhysicalDamageAbsorption.DamageValue =
            self.PhysicalDamageAbsorption.DamageValue +
                item1.PhysicalDamageAbsorption.DamageValue
    end
    --
    if item1.SpellDamageRelief.DamageValue ~= 0 then
        -- self.SpellDamageRelief.Type = "SpellDamageRelief"
        self.SpellDamageRelief.Existence = true
        -- self.SpellDamageRelief.DamageReliefType = DefenseReliefTypes[3]
        self.SpellDamageRelief.DamageValue =
            self.SpellDamageRelief.DamageValue +
                item1.SpellDamageRelief.DamageValue
    end
    --
    if item1.FireResistance.DamageValue ~= 0 then
        -- self.FireResistance.Type = "FireResistance"
        self.FireResistance.Existence = true
        -- self.FireResistance.DamageReliefType = DefenseReliefTypes[4]
        self.FireResistance.DamageValue =
            self.FireResistance.DamageValue + item1.FireResistance.DamageValue
    end
    --
    if item1.SherbetResistance.DamageValue ~= 0 then
        -- self.SherbetResistance.Type = "SherbetResistance"
        self.SherbetResistance.Existence = true
        -- self.SherbetResistance.DamageReliefType = DefenseReliefTypes[5]
        self.SherbetResistance.DamageValue =
            self.SherbetResistance.DamageValue +
                item1.SherbetResistance.DamageValue
    end
    --
    if item1.ShadowResistance.DamageValue ~= 0 then
        -- self.ShadowResistance.Type = "ShadowResistance"
        self.ShadowResistance.Existence = true
        -- self.ShadowResistance.DamageReliefType = DefenseReliefTypes[6]
        self.ShadowResistance.DamageValue =
            self.ShadowResistance.DamageValue +
                item1.ShadowResistance.DamageValue
    end
    --
    if item1.SacredResistance.DamageValue ~= 0 then
        -- self.SacredResistance.Type = "SacredResistance"
        self.SacredResistance.Existence = true
        -- self.SacredResistance.DamageReliefType = DefenseReliefTypes[7]
        self.SacredResistance.DamageValue =
            self.SacredResistance.DamageValue +
                item1.SacredResistance.DamageValue
    end
    --
    if item1.PoisonResistance.DamageValue ~= 0 then
        -- self.PoisonResistance.Type = "PoisonResistance"
        self.PoisonResistance.Existence = true
        -- self.PoisonResistance.DamageReliefType = DefenseReliefTypes[8]
        self.PoisonResistance.DamageValue =
            self.PoisonResistance.DamageValue +
                item1.PoisonResistance.DamageValue
    end
    --
    if item1.ThunderResistance.DamageValue ~= 0 then
        -- self.ThunderResistance.Type = "ThunderResistance"
        self.ThunderResistance.Existence = true
        -- self.ThunderResistance.DamageReliefType = DefenseReliefTypes[9]
        self.ThunderResistance.DamageValue =
            self.ThunderResistance.DamageValue +
                item1.ThunderResistance.DamageValue
    end
    --
    if item1.VertigoResistance.DamageValue ~= 0 then
        -- self.VertigoResistance.Type = "VertigoResistance"
        self.VertigoResistance.Existence = true
        -- self.VertigoResistance.DamageReliefType = DefenseReliefTypes[10]
        self.VertigoResistance.DamageValue =
            self.VertigoResistance.DamageValue +
                item1.VertigoResistance.DamageValue
    end
    --
    if item1.Block.BlockValue ~= 0 then
        -- self.Block.Type = "Block"
        self.Block.Existence = true
        -- self.Block.DamageReliefType = DefenseReliefTypes[11]
        self.Block.BlockValue = self.Block.BlockValue + item1.Block.BlockValue
    end
    --
    if item1.Dodge.DodgeValue ~= 0 then
        -- self.Dodge.Type = "Dodge"
        self.Dodge.Existence = true
        -- self.Dodge.DamageReliefType = DefenseReliefTypes[12]
        self.Dodge.DodgeValue = self.Dodge.DodgeValue + item1.Dodge.DodgeValue
    end
end
-- 移除属性
function DefenseAdditionalAttributes:RemovePrototype(item1)
    --
    if item1.DamageRelief.DamageValue ~= 0 then
        -- self.DamageRelief.Type = "DamageRelief"
        self.DamageRelief.Existence = true
        -- self.DamageRelief.DamageReliefType = DefenseReliefTypes[1]
        self.DamageRelief.DamageValue = self.DamageRelief.DamageValue -
                                            item1.DamageRelief.DamageValue
    end
    --
    if item1.PhysicalDamageAbsorption.DamageValue ~= 0 then
        -- self.PhysicalDamageAbsorption.Type = "PhysicalDamageAbsorption"
        self.PhysicalDamageAbsorption.Existence = true
        -- self.PhysicalDamageAbsorption.DamageReliefType = DefenseReliefTypes[2]
        self.PhysicalDamageAbsorption.DamageValue =
            self.PhysicalDamageAbsorption.DamageValue -
                item1.PhysicalDamageAbsorption.DamageValue
    end
    --
    if item1.SpellDamageRelief.DamageValue ~= 0 then
        -- self.SpellDamageRelief.Type = "SpellDamageRelief"
        self.SpellDamageRelief.Existence = true
        -- self.SpellDamageRelief.DamageReliefType = DefenseReliefTypes[3]
        self.SpellDamageRelief.DamageValue =
            self.SpellDamageRelief.DamageValue -
                item1.SpellDamageRelief.DamageValue
    end
    --
    if item1.FireResistance.DamageValue ~= 0 then
        -- self.FireResistance.Type = "FireResistance"
        self.FireResistance.Existence = true
        -- self.FireResistance.DamageReliefType = DefenseReliefTypes[4]
        self.FireResistance.DamageValue =
            self.FireResistance.DamageValue - item1.FireResistance.DamageValue
    end
    --
    if item1.SherbetResistance.DamageValue ~= 0 then
        -- self.SherbetResistance.Type = "SherbetResistance"
        self.SherbetResistance.Existence = true
        -- self.SherbetResistance.DamageReliefType = DefenseReliefTypes[5]
        self.SherbetResistance.DamageValue =
            self.SherbetResistance.DamageValue -
                item1.SherbetResistance.DamageValue
    end
    --
    if item1.ShadowResistance.DamageValue ~= 0 then
        -- self.ShadowResistance.Type = "ShadowResistance"
        self.ShadowResistance.Existence = true
        -- self.ShadowResistance.DamageReliefType = DefenseReliefTypes[6]
        self.ShadowResistance.DamageValue =
            self.ShadowResistance.DamageValue -
                item1.ShadowResistance.DamageValue
    end
    --
    if item1.SacredResistance.DamageValue ~= 0 then
        -- self.SacredResistance.Type = "SacredResistance"
        self.SacredResistance.Existence = true
        -- self.SacredResistance.DamageReliefType = DefenseReliefTypes[7]
        self.SacredResistance.DamageValue =
            self.SacredResistance.DamageValue -
                item1.SacredResistance.DamageValue
    end
    --
    if item1.PoisonResistance.DamageValue ~= 0 then
        -- self.PoisonResistance.Type = "PoisonResistance"
        self.PoisonResistance.Existence = true
        -- self.PoisonResistance.DamageReliefType = DefenseReliefTypes[8]
        self.PoisonResistance.DamageValue =
            self.PoisonResistance.DamageValue -
                item1.PoisonResistance.DamageValue
    end
    --
    if item1.ThunderResistance.DamageValue ~= 0 then
        -- self.ThunderResistance.Type = "ThunderResistance"
        self.ThunderResistance.Existence = true
        -- self.ThunderResistance.DamageReliefType = DefenseReliefTypes[9]
        self.ThunderResistance.DamageValue =
            self.ThunderResistance.DamageValue -
                item1.ThunderResistance.DamageValue
    end
    --
    if item1.VertigoResistance.DamageValue ~= 0 then
        -- self.VertigoResistance.Type = "VertigoResistance"
        self.VertigoResistance.Existence = true
        -- self.VertigoResistance.DamageReliefType = DefenseReliefTypes[10]
        self.VertigoResistance.DamageValue =
            self.VertigoResistance.DamageValue -
                item1.VertigoResistance.DamageValue
    end
    --
    if item1.Block.BlockValue ~= 0 then
        -- self.Block.Type = "Block"
        self.Block.Existence = true
        -- self.Block.DamageReliefType = DefenseReliefTypes[11]
        self.Block.BlockValue = self.Block.BlockValue - item1.Block.BlockValue
    end
    --
    if item1.Dodge.DodgeValue ~= 0 then
        -- self.Dodge.Type = "Dodge"
        self.Dodge.Existence = true
        -- self.Dodge.DamageReliefType = DefenseReliefTypes[12]
        self.Dodge.DodgeValue = self.Dodge.DodgeValue - item1.Dodge.DodgeValue
    end
end
function DefenseAdditionalAttributes:GetJson()
    ------------
    local decoded = "{" .. self:TableToJson(self.DamageRelief) .. "," ..
                        self:TableToJson(self.PhysicalDamageAbsorption) .. "," ..
                        self:TableToJson(self.SpellDamageRelief) .. "," ..
                        self:TableToJson(self.FireResistance) .. "," ..
                        self:TableToJson(self.SherbetResistance) .. "," ..
                        self:TableToJson(self.ShadowResistance) .. "," ..
                        self:TableToJson(self.SacredResistance) .. "," ..
                        self:TableToJson(self.PoisonResistance) .. "," ..
                        self:TableToJson(self.ThunderResistance) .. "," ..
                        self:TableToJson(self.VertigoResistance) .. "," ..
                        self:TableToJson(self.Block) .. "," ..
                        self:TableToJson(self.Dodge) .. "}"
    return decoded
    ------------
end

function DefenseAdditionalAttributes:TableToJson(t)
    --
    local decoded = "\"" .. t.Type .. "\"" .. ":" .. json.encode(t)
    -- print(decoded)
    return decoded
    --
end

return DefenseAdditionalAttributes

-- test
-- myshape = DefenseAdditionalAttributes:new(nil)
-- -- myshape.Base_Attribute.Power = 10
-- -- myshape:print()
-- decoded = json.encode(myshape.DamageRelief)
-- --print(decoded)
-- decoded = json.encode(myshape)
-- print(myshape:GetJson())
