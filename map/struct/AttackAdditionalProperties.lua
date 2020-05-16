-- 攻击附加属性
-- 攻击类型
json = require "Lib\\json\\json"
-- 伤害类型
DamageTypes = {
    "火焰属性伤害1", "冰霜属性伤害2", "暗影属性伤害3",
    "神圣伤害4", "毒属性伤害5", "雷属性伤害6", "暴击伤害7",
    "法术暴击伤害8", "法力损毁9", "重击10", "吸血11",
    "法术吸血12"
}
AttackAdditionalProperties = {
    -- 火焰伤害 引燃持续受到火焰伤害
    FireDamage = {
        Type = "FireDamage",
        -- 判断值
        Existence = false,
        -- 伤害类型
        DamageType = DamageTypes[1],
        -- 伤害值
        DamageValue = 0,
        -- 持续时间
        Duration = 0
    },
    -- 冰霜伤害  持续受到减速
    FrostDamage = {
        Type = "FrostDamage",
        -- 判断值
        Existence = false,
        -- 伤害类型
        DamageType = DamageTypes[2],
        -- 伤害值
        DamageValue = 0,
        -- 攻击速度减少百分比
        AttackSpeed = 0,
        -- 移动速度减少百分比
        MoveSpeed = 0,
        -- 持续时间
        Duration = 0
    },
    -- 暗影伤害  伤害加深
    ShadowDamage = {
        Type = "ShadowDamage",
        -- 判断值
        Existence = false,
        -- 伤害类型
        DamageType = DamageTypes[3],
        -- 伤害加深百分比
        DamageDeepened = 0,
        -- 物理伤害加深百分比
        -- AttackDeepened = 0,
        -- 魔法伤害加深百分比
        -- MagicDeepened = 0,
        -- 持续时间
        Duration = 0
    },
    -- 神圣伤害  无视护甲减免、无视魔法抗性的伤害
    HolyDamage = {
        Type = "HolyDamage",
        -- 判断值
        Existence = false,
        -- 伤害类型
        DamageType = DamageTypes[4],
        -- 伤害值
        DamageValue = 0
    },
    -- 毒属性伤害 持续受到减速,持续受到伤害
    PoisonDamage = {
        Type = "PoisonDamage",
        -- 判断值
        Existence = false,
        -- 伤害类型
        DamageType = DamageTypes[5],
        -- 伤害值
        DamageValue = 0,
        -- 攻击速度减少百分比
        AttackSpeed = 0,
        -- 移动速度减少百分比
        MoveSpeed = 0,
        -- 持续时间
        Duration = 0
    },
    -- 雷属性伤害 麻痹  净化
    ThunderDamage = {
        Type = "ThunderDamage",
        -- 判断值
        Existence = false,
        -- 伤害类型
        DamageType = DamageTypes[6],
        -- 伤害值 对召唤物造成伤害
        DamageValue = 0,
        -- 麻痹时间
        Duration = 0
    },
    -- 暴击伤害
    CriticalDamage = {
        Type = "CriticalDamage",
        -- 判断值
        Existence = false,
        -- 伤害类型
        DamageType = DamageTypes[7],
        -- 暴击倍数
        CriticalHitMultiple = 0,
        -- 暴击几率
        CriticalStrikeChance = 0
    },
    -- 法术暴击伤害
    SpellCrit = {
        Type = "SpellCrit",
        -- 判断值
        Existence = false,
        -- 伤害类型
        DamageType = DamageTypes[8],
        -- 暴击倍数
        CriticalHitMultiple = 0,
        -- 暴击几率
        CriticalStrikeChance = 0
    },
    -- 法力损毁
    ManaBreak = {
        Type = "ManaBreak",
        -- 判断值
        Existence = false,
        -- 伤害类型
        DamageType = DamageTypes[9],
        -- 伤害值
        DamageValue = 0
    },
    -- 重击
    HeavyBlow = {
        Type = "HeavyBlow",
        -- 判断值
        Existence = false,
        -- 伤害类型
        DamageType = DamageTypes[10],
        -- 伤害值
        DamageValue = 0,
        -- 重击几率
        HeavyBlowProbability = 0,
        -- 持续时间
        Duration = 0
    },
    -- 吸血
    BloodSucking = {
        Type = "BloodSucking",
        -- 判断值
        Existence = false,
        -- 伤害类型
        DamageType = DamageTypes[11],
        -- 吸血百分比
        BloodSuckingPercentage = 0
    },
    -- 法术吸血
    SpellBloodSucking = {
        Type = "SpellBloodSucking",
        -- 判断值
        Existence = false,
        -- 伤害类型
        DamageType = DamageTypes[12],
        -- 吸血百分比
        BloodSuckingPercentage = 0
    }
}

-- 创建AttackAdditionalProperties类
function AttackAdditionalProperties:new(o)
    o = o or {}
    setmetatable(o, self)
    --
    --
    return o
end
AttackAdditionalProperties.__index = AttackAdditionalProperties
function AttackAdditionalProperties:Int()
    -- 火焰伤害
    self.FireDamage.DamageValue = 0
    self.FireDamage.Duration = 0
    -- 冰霜伤害
    self.FrostDamage.DamageValue = 0
    self.FrostDamage.AttackSpeed = 0
    self.FrostDamage.MoveSpeed = 0
    self.FrostDamage.Duration = 0
    -- 暗影伤害
    self.ShadowDamage.DamageDeepened = 0
    self.ShadowDamage.Duration = 0
    -- 神圣伤害
    self.HolyDamage.DamageValue = 0
    -- 毒属性伤害
    self.PoisonDamage.DamageValue = 0
    self.PoisonDamage.AttackSpeed = 0
    self.PoisonDamage.MoveSpeed = 0
    self.PoisonDamage.Duration = 0
    -- 雷属性伤害
    self.ThunderDamage.DamageValue = 0
    self.ThunderDamage.Duration = 0
    -- 暴击伤害
    self.CriticalDamage.CriticalHitMultiple = 0
    self.CriticalDamage.CriticalStrikeChance = 0
    -- 法术暴击伤害
    self.SpellCrit.CriticalHitMultiple = 0
    self.SpellCrit.CriticalStrikeChance = 0
    -- 法力损毁
    self.ManaBreak.DamageValue = 0
    -- 重击
    self.HeavyBlow.DamageValue = 0
    self.HeavyBlow.HeavyBlowProbability = 0
    self.HeavyBlow.Duration = 0
    -- 吸血
    self.BloodSucking.BloodSuckingPercentage = 0
    -- 法术吸血
    self.SpellBloodSucking.BloodSuckingPercentage = 0
end
function AttackAdditionalProperties:SetPrototype(item1)
    -- 火焰伤害
    self.FireDamage.DamageValue = item1.FireDamage.DamageValue
    self.FireDamage.Duration = item1.FireDamage.Duration
    -- 冰霜伤害
    self.FrostDamage.DamageValue = item1.FrostDamage.DamageValue
    self.FrostDamage.AttackSpeed = item1.FrostDamage.AttackSpeed
    self.FrostDamage.MoveSpeed = item1.FrostDamage.MoveSpeed
    self.FrostDamage.Duration = item1.FrostDamage.Duration
    -- 暗影伤害
    self.ShadowDamage.DamageDeepened = item1.ShadowDamage.DamageDeepened
    self.ShadowDamage.Duration = item1.ShadowDamage.Duration
    -- 神圣伤害
    self.HolyDamage.DamageValue = item1.HolyDamage.DamageValue
    -- 毒属性伤害
    self.PoisonDamage.DamageValue = item1.PoisonDamage.DamageValue
    self.PoisonDamage.AttackSpeed = item1.PoisonDamage.AttackSpeed
    self.PoisonDamage.MoveSpeed = item1.PoisonDamage.MoveSpeed
    self.PoisonDamage.Duration = item1.PoisonDamage.Duration
    -- 雷属性伤害
    self.ThunderDamage.DamageValue = item1.ThunderDamage.DamageValue
    self.ThunderDamage.Duration = item1.ThunderDamage.Duration
    -- 暴击伤害
    self.CriticalDamage.CriticalHitMultiple =
        item1.CriticalDamage.CriticalHitMultiple
    self.CriticalDamage.CriticalStrikeChance =
        item1.CriticalDamage.CriticalStrikeChance
    -- 法术暴击伤害
    self.SpellCrit.CriticalHitMultiple = item1.SpellCrit.CriticalHitMultiple
    self.SpellCrit.CriticalStrikeChance = item1.SpellCrit.CriticalStrikeChance
    -- 法力损毁
    self.ManaBreak.DamageValue = item1.ManaBreak.DamageValue
    -- 重击
    self.HeavyBlow.DamageValue = item1.HeavyBlow.DamageValue
    self.HeavyBlow.HeavyBlowProbability = item1.HeavyBlow.HeavyBlowProbability
    self.HeavyBlow.Duration = item1.HeavyBlow.Duration
    -- 吸血
    self.BloodSucking.BloodSuckingPercentage =
        item1.BloodSucking.BloodSuckingPercentage
    -- 法术吸血
    self.SpellBloodSucking.BloodSuckingPercentage =
        item1.SpellBloodSucking.BloodSuckingPercentage
end
-- 添加属性
function AttackAdditionalProperties:AddPrototype(item1)
    -- 火焰伤害
    self.FireDamage.DamageValue = self.FireDamage.DamageValue +
                                      item1.FireDamage.DamageValue
    self.FireDamage.Duration = self.FireDamage.Duration +
                                   item1.FireDamage.Duration
    -- 冰霜伤害
    self.FrostDamage.DamageValue = self.FrostDamage.DamageValue +
                                       item1.FrostDamage.DamageValue
    self.FrostDamage.AttackSpeed = self.FrostDamage.AttackSpeed +
                                       item1.FrostDamage.AttackSpeed
    self.FrostDamage.MoveSpeed = self.FrostDamage.MoveSpeed +
                                     item1.FrostDamage.MoveSpeed
    self.FrostDamage.Duration = self.FrostDamage.Duration +
                                    item1.FrostDamage.Duration
    -- 暗影伤害
    self.ShadowDamage.DamageDeepened = self.ShadowDamage.DamageDeepened +
                                           item1.ShadowDamage.DamageDeepened
    self.ShadowDamage.Duration = self.ShadowDamage.Duration +
                                     item1.ShadowDamage.Duration
    -- 神圣伤害
    self.HolyDamage.DamageValue = self.HolyDamage.DamageValue +
                                      item1.HolyDamage.DamageValue
    -- 毒属性伤害
    self.PoisonDamage.DamageValue = self.PoisonDamage.DamageValue +
                                        item1.PoisonDamage.DamageValue
    self.PoisonDamage.AttackSpeed = self.PoisonDamage.AttackSpeed +
                                        item1.PoisonDamage.AttackSpeed
    self.PoisonDamage.MoveSpeed = self.PoisonDamage.MoveSpeed +
                                      item1.PoisonDamage.MoveSpeed
    self.PoisonDamage.Duration = self.PoisonDamage.Duration +
                                     item1.PoisonDamage.Duration
    -- 雷属性伤害
    self.ThunderDamage.DamageValue = self.ThunderDamage.DamageValue +
                                         item1.ThunderDamage.DamageValue
    self.ThunderDamage.Duration = self.ThunderDamage.Duration +
                                      item1.ThunderDamage.Duration
    -- 暴击伤害
    self.CriticalDamage.CriticalHitMultiple =
        self.CriticalDamage.CriticalHitMultiple +
            item1.CriticalDamage.CriticalHitMultiple
    self.CriticalDamage.CriticalStrikeChance =
        self.CriticalDamage.CriticalStrikeChance +
            item1.CriticalDamage.CriticalStrikeChance
    -- 法术暴击伤害
    self.SpellCrit.CriticalHitMultiple =
        self.SpellCrit.CriticalHitMultiple + item1.SpellCrit.CriticalHitMultiple
    self.SpellCrit.CriticalStrikeChance =
        self.SpellCrit.CriticalStrikeChance +
            item1.SpellCrit.CriticalStrikeChance
    -- 法力损毁
    self.ManaBreak.DamageValue = self.ManaBreak.DamageValue +
                                     item1.ManaBreak.DamageValue
    -- 重击
    self.HeavyBlow.DamageValue = self.HeavyBlow.DamageValue +
                                     item1.HeavyBlow.DamageValue
    self.HeavyBlow.HeavyBlowProbability =
        self.HeavyBlow.HeavyBlowProbability +
            item1.HeavyBlow.HeavyBlowProbability
    self.HeavyBlow.Duration = self.HeavyBlow.Duration + item1.HeavyBlow.Duration
    -- 吸血
    self.BloodSucking.BloodSuckingPercentage =
        self.BloodSucking.BloodSuckingPercentage +
            item1.BloodSucking.BloodSuckingPercentage
    -- 法术吸血
    self.SpellBloodSucking.BloodSuckingPercentage =
        self.SpellBloodSucking.BloodSuckingPercentage +
            item1.SpellBloodSucking.BloodSuckingPercentage
end
-- 移除属性
function AttackAdditionalProperties:RemovePrototype(item1)
    -- 火焰伤害
    self.FireDamage.DamageValue = self.FireDamage.DamageValue -
                                      item1.FireDamage.DamageValue
    self.FireDamage.Duration = self.FireDamage.Duration -
                                   item1.FireDamage.Duration
    -- 冰霜伤害
    self.FrostDamage.DamageValue = self.FrostDamage.DamageValue -
                                       item1.FrostDamage.DamageValue
    self.FrostDamage.AttackSpeed = self.FrostDamage.AttackSpeed -
                                       item1.FrostDamage.AttackSpeed
    self.FrostDamage.MoveSpeed = self.FrostDamage.MoveSpeed -
                                     item1.FrostDamage.MoveSpeed
    self.FrostDamage.Duration = self.FrostDamage.Duration -
                                    item1.FrostDamage.Duration
    -- 暗影伤害
    self.ShadowDamage.DamageDeepened = self.ShadowDamage.DamageDeepened -
                                           item1.ShadowDamage.DamageDeepened
    self.ShadowDamage.Duration = self.ShadowDamage.Duration -
                                     item1.ShadowDamage.Duration
    -- 神圣伤害
    self.HolyDamage.DamageValue = self.HolyDamage.DamageValue -
                                      item1.HolyDamage.DamageValue
    -- 毒属性伤害
    self.PoisonDamage.DamageValue = self.PoisonDamage.DamageValue -
                                        item1.PoisonDamage.DamageValue
    self.PoisonDamage.AttackSpeed = self.PoisonDamage.AttackSpeed -
                                        item1.PoisonDamage.AttackSpeed
    self.PoisonDamage.MoveSpeed = self.PoisonDamage.MoveSpeed -
                                      item1.PoisonDamage.MoveSpeed
    self.PoisonDamage.Duration = self.PoisonDamage.Duration -
                                     item1.PoisonDamage.Duration
    -- 雷属性伤害
    self.ThunderDamage.DamageValue = self.ThunderDamage.DamageValue -
                                         item1.ThunderDamage.DamageValue
    self.ThunderDamage.Duration = self.ThunderDamage.Duration -
                                      item1.ThunderDamage.Duration
    -- 暴击伤害
    self.CriticalDamage.CriticalHitMultiple =
        self.CriticalDamage.CriticalHitMultiple -
            item1.CriticalDamage.CriticalHitMultiple
    self.CriticalDamage.CriticalStrikeChance =
        self.CriticalDamage.CriticalStrikeChance -
            item1.CriticalDamage.CriticalStrikeChance
    -- 法术暴击伤害
    self.SpellCrit.CriticalHitMultiple =
        self.SpellCrit.CriticalHitMultiple - item1.SpellCrit.CriticalHitMultiple
    self.SpellCrit.CriticalStrikeChance =
        self.SpellCrit.CriticalStrikeChance -
            item1.SpellCrit.CriticalStrikeChance
    -- 法力损毁
    self.ManaBreak.DamageValue = self.ManaBreak.DamageValue -
                                     item1.ManaBreak.DamageValue
    -- 重击
    self.HeavyBlow.DamageValue = self.HeavyBlow.DamageValue -
                                     item1.HeavyBlow.DamageValue
    self.HeavyBlow.HeavyBlowProbability =
        self.HeavyBlow.HeavyBlowProbability -
            item1.HeavyBlow.HeavyBlowProbability
    self.HeavyBlow.Duration = self.HeavyBlow.Duration - item1.HeavyBlow.Duration
    -- 吸血
    self.BloodSucking.BloodSuckingPercentage =
        self.BloodSucking.BloodSuckingPercentage -
            item1.BloodSucking.BloodSuckingPercentage
    -- 法术吸血
    self.SpellBloodSucking.BloodSuckingPercentage =
        self.SpellBloodSucking.BloodSuckingPercentage -
            item1.SpellBloodSucking.BloodSuckingPercentage
end
function AttackAdditionalProperties:GetJson()
    ------------
    local decoded = "{" .. self:TableToJson(self.FireDamage) .. "," ..
                        self:TableToJson(self.FrostDamage) .. "," ..
                        self:TableToJson(self.ShadowDamage) .. "," ..
                        self:TableToJson(self.HolyDamage) .. "," ..
                        self:TableToJson(self.PoisonDamage) .. "," ..
                        self:TableToJson(self.ThunderDamage) .. "," ..
                        self:TableToJson(self.CriticalDamage) .. "," ..
                        self:TableToJson(self.SpellCrit) .. "," ..
                        self:TableToJson(self.ManaBreak) .. "," ..
                        self:TableToJson(self.HeavyBlow) .. "," ..
                        self:TableToJson(self.BloodSucking) .. "," ..
                        self:TableToJson(self.SpellBloodSucking) .. "}"
    return decoded
    ------------
end

function AttackAdditionalProperties:TableToJson(t)
    --
    local decoded = "\"" .. t.Type .. "\"" .. ":" .. json.encode(t)
    -- print(decoded)
    return decoded
    --
end

return AttackAdditionalProperties
-- 测试代码
-- function AttackAdditionalProperties:print ()
-- print("输出： ",self.FireDamage.DamageType)
-- end

-- myshape = AttackAdditionalProperties:new(nil)

-- myshape:print()
