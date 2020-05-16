--   █████▒█    ██  ▄████▄   ██ ▄█▀       ██████╗ ██╗   ██╗ ██████╗
-- ▓██   ▒ ██  ▓██▒▒██▀ ▀█   ██▄█▒        ██╔══██╗██║   ██║██╔════╝
-- ▒████ ░▓██  ▒██░▒▓█    ▄ ▓███▄░        ██████╔╝██║   ██║██║  ███╗
-- ░▓█▒  ░▓▓█  ░██░▒▓▓▄ ▄██▒▓██ █▄        ██╔══██╗██║   ██║██║   ██║
-- ░▒█░   ▒▒█████▓ ▒ ▓███▀ ░▒██▒ █▄       ██████╔╝╚██████╔╝╚██████╔╝
--  ▒ ░   ░▒▓▒ ▒ ▒ ░ ░▒ ▒  ░▒ ▒▒ ▓▒       ╚═════╝  ╚═════╝  ╚═════╝
--  ░     ░░▒░ ░ ░   ░  ▒   ░ ░▒ ▒░
--  ░ ░    ░░░ ░ ░ ░        ░ ░░ ░
--           ░     ░ ░      ░  ░
----------------
-- 随机属性系统
----------------
Item = require "struct\\Item"
require "math"
-- 导入数据
-- 冠名
Naming = require "Data\\Naming"
require "Lib\\table"
require "War3\\Picture"
-- 助手武器
Mainhandweapon = require "Data\\Mainhandweapon"
OffHandWeapon = require "Data\\OffHandWeapon"
HeadEquipment = require "Data\\HeadEquipment"
ChestEquipment = require "Data\\ChestEquipment"
WaistEquipment = require "Data\\WaistEquipment"
LegEquipment = require "Data\\LegEquipment"
HandEquipment = require "Data\\HandEquipment"
FootEquipment = require "Data\\FootEquipment"
Necklace = require "Data\\Necklace"
Ring = require "Data\\Ring"
Cloak = require "Data\\Cloak"
-- 词缀 前缀
EquipmentAffixData = require "Data\\EquipmentAffixData"
-- 攻击特效词缀
AttackAdditionalPropertiesDota = require "Data\\AttackAdditionalPropertiesDota"
-- 防御特效
DefenseAdditionalAttributesData =
    require "Data\\DefenseAdditionalAttributesData"
RandomItemPrototype = {}
-- 爆率
BurstRate = {
    -- 普通敌人
    OrdinaryEnemy = 1,
    -- 精英敌人
    EliteEnemy = 2,
    -- 稀有敌人
    RareEnemy = 4,
    -- 首领敌人
    LeaderEnemy = 8,
    -- 普通BOSS
    OrdinaryBOSS = 16,
    -- 精英BOSS
    EliteBOSS = 32,
    -- 世界BOSS
    WorldBOSS = 64,
    -- 天灾
    NaturalDisasters = 200,
    -- 神
    God = 500
}
-- 稀有度
EquipmentRarity = {
    Ordinary = {
        Name = "普通",
        Colar = "",
        Affix = 0,
        -- 稀有度 
        Rarity = 10000,
        -- 最大词缀数
        AffixMAx = 0,
        -- 最小词缀数
        AffixMin = 0
    },
    Excellent = {
        Name = "优秀",
        Colar = "",
        Affix = 1, -- 稀有度 
        Rarity = 2000,
        -- 最大词缀数
        AffixMAx = 2,
        -- 最小词缀数
        AffixMin = 1

    },
    Superior = {
        Name = "精良",
        Colar = "",
        Affix = 2,
        -- 稀有度 
        Rarity = 500,
        -- 最大词缀数
        AffixMAx = 4,
        -- 最小词缀数
        AffixMin = 2
    },
    Epic = {
        Name = "史诗",
        Colar = "",
        Affix = 3,
        -- 稀有度 
        Rarity = 100,
        -- 最大词缀数
        AffixMAx = 7,
        -- 最小词缀数
        AffixMin = 5
    },
    Legend = {
        Name = "传说",
        Colar = "",
        Affix = 6,
        -- 稀有度 
        Rarity = 50,
        -- 最大词缀数
        AffixMAx = 10,
        -- 最小词缀数
        AffixMin = 8
    },
    Artifact = {
        Name = "神器",
        Colar = "",
        Affix = 9,
        -- 稀有度 
        Rarity = 1,
        -- 最大词缀数
        AffixMAx = 15,
        -- 最小词缀数
        AffixMin = 12
    }
}
function RandomItemPrototype:new(o)
    o = o or {}
    setmetatable(o, self)
    --
    math.randomseed(tostring(os.time()):reverse():sub(1, 7))
    --
    return o
end
RandomItemPrototype.__index = RandomItemPrototype
-- 生成装备
function RandomItemPrototype:CreateItem(lucky, level)
    -- local item1 = {}
    -- setmetatable(item1, Item)
    local item1 = Item:new(nil)
    item1:Int()
    --------------------
    local i = math.random(1, 1100)
    if i < 151 then
        -- 掉落主手武器
        local it = Mainhandweapon.Items
        item1 = self:SetItemsprototype(item1, it)
        item1.CustomValue = "A"
    elseif i > 150 and i < 301 then
        -- 掉落副手武器
        local it = OffHandWeapon.Items
        item1 = self:SetItemsprototype(item1, it)
        item1.CustomValue = "B"
    elseif i > 300 and i < 461 then
        -- 掉落头部装备
        local it = HeadEquipment.Items
        item1 = self:SetItemsprototype(item1, it)
        item1.CustomValue = "C"
    elseif i > 460 and i < 561 then
        -- 掉落胸部装备
        local it = ChestEquipment.Items
        item1 = self:SetItemsprototype(item1, it)
        item1.CustomValue = "D"
    elseif i > 560 and i < 611 then
        -- 掉落腰部装备
        local it = WaistEquipment.Items
        item1 = self:SetItemsprototype(item1, it)
        item1.CustomValue = "E"
    elseif i > 610 and i < 711 then
        -- 掉落腿部装备
        local it = LegEquipment.Items
        item1 = self:SetItemsprototype(item1, it)
        item1.CustomValue = "F"
    elseif i > 710 and i < 811 then
        -- 掉落手部装备7
        local it = HandEquipment.Items
        item1 = self:SetItemsprototype(item1, it)
        item1.CustomValue = "G"
    elseif i > 810 and i < 911 then
        -- 掉落脚部装备
        local it = FootEquipment.Items
        item1 = self:SetItemsprototype(item1, it)
        item1.CustomValue = "H"
    elseif i > 910 and i < 961 then
        -- 掉落项链
        local it = Necklace.Items
        item1 = self:SetItemsprototype(item1, it)
        item1.CustomValue = "I"
    elseif i > 960 and i < 1020 then
        -- 掉落戒指
        local it = Ring.Items
        item1 = self:SetItemsprototype(item1, it)
        item1.CustomValue = "J"
    else
        -- 掉落披风
        local it = Cloak.Items
        item1 = self:SetItemsprototype(item1, it)
        item1.CustomValue = "K"
    end
    -- 装备冠名
    self:AddItemNaming(item1)
    -- 添加品质
    self:Rarity(item1, lucky)
    -- 添加词缀
    -- self:AddItemPrefix(item1)
    if item1.Quality == "普通" then
    elseif item1.Quality == "优秀" then
        -- 添加前缀
        self:AddItemPrefix(item1)
        -- 附加词缀
        local si = math.random(1, 2)
        for i = 1, si do self:AddItemOtherPrefix(item1) end
    elseif item1.Quality == "精良" then
        -- 添加前缀
        self:AddItemPrefix(item1)
        -- 附加词缀
        local si = math.random(2, 4)
        for i = 1, si do self:AddItemOtherPrefix(item1) end
    elseif item1.Quality == "史诗" then
        -- 添加前缀
        self:AddItemPrefix(item1)
        -- 附加词缀
        local si = math.random(5, 7)
        for i = 1, si do self:AddItemOtherPrefix(item1) end
    elseif item1.Quality == "传说" then
        -- 添加前缀
        self:AddItemPrefix(item1)
        -- 附加词缀
        local si = math.random(8, 10)
        for i = 1, si do self:AddItemOtherPrefix(item1) end
    elseif item1.Quality == "神器" then
        -- 添加前缀
        self:AddItemPrefix(item1)
        -- 附加词缀
        local si = math.random(12, 15)
        for i = 1, si do self:AddItemOtherPrefix(item1) end
    end
    -- 添加攻击特效
    local ii = math.random(1, 1000)
    if item1.Position == "主手武器" or item1.Position == "副手武器" then
        if item1.Types == "盾" then
            if ii < 200 then self:AttackProperties(item1, level) end
        end
    end
    -- 添加防御特效
    local iii = math.random(1, 1000)
    if item1.Position ~= "主手武器" then
        if item1.Position == "副手武器" and item1.Types == "盾" then
            if iii < 200 then self:DefenseAttributes(item1, level) end
        end
        if item1.Position ~= "副手武器" then
            if iii < 200 then self:DefenseAttributes(item1, level) end
        end
    end
    -- 设置装备等级
    self:SetItemsLevel(item1, level)
    -- item1:Int()
    -- 设置装备图标
    local PM = Picture:Instance()
    item1.Icon = PM:getIcon(item1.Types)
    --------------------
    return item1
end

-- 装备爆率 设置装备品质
function RandomItemPrototype:Rarity(item1, lucky)
    local i = math.random(1, 200000)
    -- print("随机： ", i)
    if i < 2 * lucky then
        -- 掉落神器1
        item1.Quality = "神器"
    elseif i > 1 * lucky and i < 501 * lucky then
        -- 掉落传说50
        item1.Quality = "传说"
    elseif i > 500 * lucky and i < 1501 * lucky then
        -- 掉落史诗100
        item1.Quality = "史诗"
    elseif i > 1500 * lucky and i < 6501 * lucky then
        -- 掉落精良500
        item1.Quality = "精良"
    elseif i > 6500 * lucky and i < 26501 * lucky then
        -- 掉落优秀2000
        item1.Quality = "优秀"
    else
        -- 掉落普通
        item1.Quality = "普通"
    end
end
-- 设置装备等级
function RandomItemPrototype:SetItemsLevel(item1, l)
    local si = math.random(l - 2, l + 3)
    item1.level = si
    local i = (si / 3 + 1) * 0.4 * 2
    -- 设置基础属性
    item1.Base_Attribute.Power = math.floor(item1.Base_Attribute.Power * i/6)
    item1.Base_Attribute.Agility = math.floor(item1.Base_Attribute.Agility * i/6)
    item1.Base_Attribute.Lntelligence = math.floor(
                                            item1.Base_Attribute.Lntelligence *
                                                i/6)
    item1.Base_Attribute.Constitution = math.floor(
                                            item1.Base_Attribute.Constitution *
                                                i/6)
    item1.Base_Attribute.Spirit = math.floor(item1.Base_Attribute.Spirit * i/6)
    item1.Base_Attribute.will = math.floor(item1.Base_Attribute.will * i/6)
    item1.Base_Attribute.lucky = math.floor(item1.Base_Attribute.lucky * i/6)
    -- 设置混合属性
    item1.Mixed_Attribute.AttackPower = math.floor(
                                            item1.Mixed_Attribute.AttackPower *
                                                i)
    item1.Mixed_Attribute.Armor = math.floor(item1.Mixed_Attribute.Armor * i)
    item1.Mixed_Attribute.MagicResistance =
        math.floor(item1.Mixed_Attribute.MagicResistance * i)
    item1.Mixed_Attribute.Health = math.floor(
                                       item1.Mixed_Attribute.Health * i * 2)
    item1.Mixed_Attribute.Magic =
        math.floor(item1.Mixed_Attribute.Magic * i * 2)
    item1.Mixed_Attribute.HPRecoverySpeed =
        math.floor(item1.Mixed_Attribute.HPRecoverySpeed * i/12)
    item1.Mixed_Attribute.MagicRecoverySpeed =
        math.floor(item1.Mixed_Attribute.MagicRecoverySpeed * i)
    if item1.Mixed_Attribute.AttackSpeed ~= 0 then
        item1.Mixed_Attribute.AttackSpeed =
            math.floor(item1.Mixed_Attribute.AttackSpeed + i/2)
    end
    if item1.Mixed_Attribute.MoveSpeed ~= 0 then
        item1.Mixed_Attribute.MoveSpeed =
            math.floor(item1.Mixed_Attribute.MoveSpeed + i/2)
    end

end
-- 设置Item基础属性 -- 设置装备底材
function RandomItemPrototype:SetItemsprototype(item1, it1)
    it = it1[math.random(1, table.getn(it1))]
    print(table.getn(it1))
    -- item1.ID = it.ID
    item1.Name = it.KeyName
    item1.Types = it.Types
    item1.Position = it.Position
    item1.Explain = it.Explain
    -- 设置基础属性
    item1.Base_Attribute.Power = it.Power
    item1.Base_Attribute.Agility = it.Agility
    item1.Base_Attribute.Lntelligence = it.Lntelligence
    item1.Base_Attribute.Constitution = it.Constitution
    item1.Base_Attribute.Spirit = it.Spirit
    item1.Base_Attribute.will = it.will
    item1.Base_Attribute.lucky = it.lucky
    -- 设置混合属性
    item1.Mixed_Attribute.AttackPower = it.AttackPower
    item1.Mixed_Attribute.Armor = it.Armor
    item1.Mixed_Attribute.MagicResistance = it.MagicResistance
    item1.Mixed_Attribute.Health = it.Health
    item1.Mixed_Attribute.Magic = it.Magic
    item1.Mixed_Attribute.HPRecoverySpeed = it.HPRecoverySpeed
    item1.Mixed_Attribute.MagicRecoverySpeed = it.MagicRecoverySpeed
    item1.Mixed_Attribute.AttackSpeed = it.AttackSpeed
    item1.Mixed_Attribute.MoveSpeed = it.MoveSpeed
    return item1
end
-- 添加基础属性 --添加装备冠名
function RandomItemPrototype:AddItemNaming(item1)
    i = math.random(1, table.getn(Naming.Items))
    it = Naming.Items[i]
    -- print("输出： ", it.KeyName)
    item1.Name = it.KeyName .. item1.Name
    -- 设置基础属性
    item1.Base_Attribute.Power = item1.Base_Attribute.Power + it.Power
    item1.Base_Attribute.Agility = item1.Base_Attribute.Agility + it.Agility
    item1.Base_Attribute.Lntelligence = item1.Base_Attribute.Lntelligence +
                                            it.Lntelligence
    item1.Base_Attribute.Constitution = item1.Base_Attribute.Constitution +
                                            it.Constitution
    item1.Base_Attribute.Spirit = item1.Base_Attribute.Spirit + it.Spirit
    item1.Base_Attribute.will = item1.Base_Attribute.will + it.will
    item1.Base_Attribute.lucky = item1.Base_Attribute.lucky + it.lucky
    -- 设置混合属性
    item1.Mixed_Attribute.AttackPower = item1.Mixed_Attribute.AttackPower +
                                            it.AttackPower

    item1.Mixed_Attribute.Armor = item1.Mixed_Attribute.Armor + it.Armor
    item1.Mixed_Attribute.MagicResistance =
        item1.Mixed_Attribute.MagicResistance + it.MagicResistance
    item1.Mixed_Attribute.Health = item1.Mixed_Attribute.Health + it.Health
    item1.Mixed_Attribute.Magic = item1.Mixed_Attribute.Magic + it.Magic
    item1.Mixed_Attribute.HPRecoverySpeed =
        item1.Mixed_Attribute.HPRecoverySpeed + it.HPRecoverySpeed
    item1.Mixed_Attribute.MagicRecoverySpeed =
        item1.Mixed_Attribute.MagicRecoverySpeed + it.MagicRecoverySpeed
    item1.Mixed_Attribute.AttackSpeed = item1.Mixed_Attribute.AttackSpeed +
                                            it.AttackSpeed
    item1.Mixed_Attribute.MoveSpeed = item1.Mixed_Attribute.MoveSpeed +
                                          it.MoveSpeed
    return item1
end
-- 添加前缀
function RandomItemPrototype:AddItemPrefix(item1)
    i = math.random(1, table.getn(EquipmentAffixData.Items))
    it = EquipmentAffixData.Items[i]

    item1.Name = it.KeyName .. "—" .. item1.Name
    -- 设置基础属性
    item1.Base_Attribute.Power = item1.Base_Attribute.Power + it.Power
    item1.Base_Attribute.Agility = item1.Base_Attribute.Agility + it.Agility
    item1.Base_Attribute.Lntelligence = item1.Base_Attribute.Lntelligence +
                                            it.Lntelligence
    item1.Base_Attribute.Constitution = item1.Base_Attribute.Constitution +
                                            it.Constitution
    item1.Base_Attribute.Spirit = item1.Base_Attribute.Spirit + it.Spirit
    item1.Base_Attribute.will = item1.Base_Attribute.will + it.will
    item1.Base_Attribute.lucky = item1.Base_Attribute.lucky + it.lucky
    -- 设置混合属性
    item1.Mixed_Attribute.AttackPower = item1.Mixed_Attribute.AttackPower +
                                            it.AttackPower
    item1.Mixed_Attribute.Armor = item1.Mixed_Attribute.Armor + it.Armor
    item1.Mixed_Attribute.MagicResistance =
        item1.Mixed_Attribute.MagicResistance + it.MagicResistance
    item1.Mixed_Attribute.Health = item1.Mixed_Attribute.Health + it.Health
    item1.Mixed_Attribute.Magic = item1.Mixed_Attribute.Magic + it.Magic
    item1.Mixed_Attribute.HPRecoverySpeed =
        item1.Mixed_Attribute.HPRecoverySpeed + it.HPRecoverySpeed
    item1.Mixed_Attribute.MagicRecoverySpeed =
        item1.Mixed_Attribute.MagicRecoverySpeed + it.MagicRecoverySpeed
    item1.Mixed_Attribute.AttackSpeed = item1.Mixed_Attribute.AttackSpeed +
                                            it.AttackSpeed
    item1.Mixed_Attribute.MoveSpeed = item1.Mixed_Attribute.MoveSpeed +
                                          it.MoveSpeed
    return item1
end
-- 设置 附加词缀
function RandomItemPrototype:AddItemOtherPrefix(item1)
    i = math.random(1, table.getn(EquipmentAffixData.Items))
    it = EquipmentAffixData.Items[i]

    item1.Affix = item1.Affix .. "—" .. it.KeyName
    -- 设置基础属性
    item1.Base_Attribute.Power = item1.Base_Attribute.Power + it.Power
    item1.Base_Attribute.Agility = item1.Base_Attribute.Agility + it.Agility
    item1.Base_Attribute.Lntelligence = item1.Base_Attribute.Lntelligence +
                                            it.Lntelligence
    item1.Base_Attribute.Constitution = item1.Base_Attribute.Constitution +
                                            it.Constitution
    item1.Base_Attribute.Spirit = item1.Base_Attribute.Spirit + it.Spirit
    item1.Base_Attribute.will = item1.Base_Attribute.will + it.will
    item1.Base_Attribute.lucky = item1.Base_Attribute.lucky + it.lucky
    -- 设置混合属性
    item1.Mixed_Attribute.AttackPower = item1.Mixed_Attribute.AttackPower +
                                            it.AttackPower
    item1.Mixed_Attribute.Armor = item1.Mixed_Attribute.Armor + it.Armor
    item1.Mixed_Attribute.MagicResistance =
        item1.Mixed_Attribute.MagicResistance + it.MagicResistance
    item1.Mixed_Attribute.Health = item1.Mixed_Attribute.Health + it.Health
    item1.Mixed_Attribute.Magic = item1.Mixed_Attribute.Magic + it.Magic
    item1.Mixed_Attribute.HPRecoverySpeed =
        item1.Mixed_Attribute.HPRecoverySpeed + it.HPRecoverySpeed
    item1.Mixed_Attribute.MagicRecoverySpeed =
        item1.Mixed_Attribute.MagicRecoverySpeed + it.MagicRecoverySpeed
    item1.Mixed_Attribute.AttackSpeed = item1.Mixed_Attribute.AttackSpeed +
                                            it.AttackSpeed
    item1.Mixed_Attribute.MoveSpeed = item1.Mixed_Attribute.MoveSpeed +
                                          it.MoveSpeed
    return item1
end

-- 设置装备特效
-- 攻击特效
function RandomItemPrototype:AttackProperties(item1, level)
    local Dg = level * 4
    i = math.random(1, table.getn(AttackAdditionalPropertiesDota.Items))
    it = AttackAdditionalPropertiesDota.Items[i]
    -- 火焰伤害
    item1.Attack_AdditionalProperties.FireDamage.DamageValue =
        it.FireDamageValue * Dg
    item1.Attack_AdditionalProperties.FireDamage.Duration =
        it.Durationoffiredamage
    -- 冰霜伤害
    item1.Attack_AdditionalProperties.FrostDamage.DamageValue =
        it.FrostDamage * Dg
    item1.Attack_AdditionalProperties.FrostDamage.AttackSpeed =
        it.Frostdamageattackspeedreduced
    item1.Attack_AdditionalProperties.FrostDamage.MoveSpeed =
        it.Frostdamagemovementspeedreduced
    item1.Attack_AdditionalProperties.FrostDamage.Duration =
        it.Frostdamageduration
    -- 暗影伤害
    item1.Attack_AdditionalProperties.ShadowDamage.DamageDeepened =
        it.Shadowdamageincreasepercentage * Dg
    item1.Attack_AdditionalProperties.ShadowDamage.Duration =
        it.Shadowdamageduration
    -- 神圣伤害
    item1.Attack_AdditionalProperties.HolyDamage.DamageValue =
        it.Holydamage * Dg
    -- 毒属性伤害
    item1.Attack_AdditionalProperties.PoisonDamage.DamageValue =
        it.Poisondamage * Dg
    item1.Attack_AdditionalProperties.PoisonDamage.AttackSpeed =
        it.Poisonattackspeedreduced
    item1.Attack_AdditionalProperties.PoisonDamage.MoveSpeed =
        it.Poisonattributemovementspeedreduced
    item1.Attack_AdditionalProperties.PoisonDamage.Duration =
        it.Poisonattackspeedreduced
    -- 雷属性伤害
    item1.Attack_AdditionalProperties.ThunderDamage.DamageValue =
        it.Damagevalueofthunderattribute * Dg
    item1.Attack_AdditionalProperties.ThunderDamage.Duration =
        it.Mineattributeduration
    -- 暴击伤害
    item1.Attack_AdditionalProperties.CriticalDamage.CriticalHitMultiple =
        math.floor(it.Criticalhitmultiple * Dg / 12)
    item1.Attack_AdditionalProperties.CriticalDamage.CriticalHitMultiple =
        it.Criticalstrikechance
    -- 法术暴击伤害
    item1.Attack_AdditionalProperties.SpellCrit.CriticalHitMultiple =
        math.floor(it.Spellcriticalhittimes * Dg / 12)
    item1.Attack_AdditionalProperties.SpellCrit.CriticalHitMultiple =
        it.SpellCriticalstrikechance
    -- 法力损毁
    item1.Attack_AdditionalProperties.ManaBreak.DamageValue =
        it.Manadamagedamage * Dg
    -- 重击
    item1.Attack_AdditionalProperties.HeavyBlow.DamageValue =
        it.Criticalhitdamage * Dg
    item1.Attack_AdditionalProperties.HeavyBlow.HeavyBlowProbability =
        it.Heavyblowprobability
    item1.Attack_AdditionalProperties.HeavyBlow.Duration = it.Thumpduration
    -- 吸血
    item1.Attack_AdditionalProperties.BloodSucking.BloodSuckingPercentage =
        it.Bloodabsorptionpercentage
    -- 法术吸血
    item1.Attack_AdditionalProperties.SpellBloodSucking.BloodSuckingPercentage =
        it.Percentageofsorcery
end
-- 添加防御特效
function RandomItemPrototype:DefenseAttributes(item1, level)
    local Bfb = math.floor(level / 3)
    local Dg = level * 4
    i = math.random(1, table.getn(DefenseAdditionalAttributesData.Items))
    it = DefenseAdditionalAttributesData.Items[i]
    -- 伤害减免
    item1.Defense_AdditionalAttributes.DamageRelief.DamageValue =
        it.DamageRelief * Dg
    -- 物理伤害吸收
    item1.Defense_AdditionalAttributes.PhysicalDamageAbsorption.DamageValue =
        math.floor(it.PhysicalDamageAbsorption * Dg)
    -- 法术伤害减免
    item1.Defense_AdditionalAttributes.SpellDamageRelief.DamageValue =
        math.floor(it.SpellDamageRelief * Dg)
    -- 火焰抗性
    if item1.Defense_AdditionalAttributes.FireResistance.DamageValue ~= 0 then
        item1.Defense_AdditionalAttributes.FireResistance.DamageValue =
            it.FireResistance + Bfb
    end
    -- 冰霜抗性
    if item1.Defense_AdditionalAttributes.SherbetResistance.DamageValue ~= 0 then
        item1.Defense_AdditionalAttributes.SherbetResistance.DamageValue =
            it.SherbetResistance + Bfb
    end
    -- 暗影抗性
    if item1.Defense_AdditionalAttributes.ShadowResistance.DamageValue ~= 0 then
        item1.Defense_AdditionalAttributes.ShadowResistance.DamageValue =
            it.ShadowResistance + Bfb
    end
    -- 神圣抗性
    item1.Defense_AdditionalAttributes.SacredResistance.DamageValue =
        math.floor(it.SacredResistance * Dg)
    -- 毒属性抗性
    if item1.Defense_AdditionalAttributes.PoisonResistance.DamageValue ~= 0 then
        item1.Defense_AdditionalAttributes.PoisonResistance.DamageValue =
            it.PoisonResistance + Bfb
    end
    -- 雷属性抗性
    if item1.Defense_AdditionalAttributes.ThunderResistance.DamageValue ~= 0 then
        item1.Defense_AdditionalAttributes.ThunderResistance.DamageValue =
            it.ThunderResistance + Bfb
    end
    -- 眩晕抗性
    if item1.Defense_AdditionalAttributes.VertigoResistance.DamageValue ~= 0 then
        item1.Defense_AdditionalAttributes.VertigoResistance.DamageValue =
            it.VertigoResistance + Bfb
    end
    -- 格挡
    if item1.Defense_AdditionalAttributes.Block.DamageValue ~= 0 then
        item1.Defense_AdditionalAttributes.Block.DamageValue = it.Block + Bfb
    end
    -- 闪避
    if item1.Defense_AdditionalAttributes.Dodge.DamageValue ~= 0 then
        item1.Defense_AdditionalAttributes.Dodge.DamageValue = it.Dodge + Bfb
    end
end

return RandomItemPrototype

-- test
-- local pu = 0
-- local you = 0
-- local jing = 0
-- local ss = 0
-- local cc = 0
-- local sq = 0
-- function RandomItemPrototype:print()
--     local item1 = self:CreateItem(1, 30)
--     -- setmetatable(item1, Item)
--     local it = Mainhandweapon.Items
--     -- item1 = self:SetItemsprototype(item1, it)
--     -- item1 = self:AddItemNaming(item1)
--     -- self:Rarity(item1, 50)
--     -- self:AddItemPrefix(item1)
--     if item1.Quality == "普通" then pu = pu + 1 end
--     if item1.Quality == "优秀" then you = you + 1 end
--     if item1.Quality == "精良" then jing = jing + 1 end
--     if item1.Quality == "史诗" then ss = ss + 1 end
--     if item1.Quality == "传说" then cc = cc + 1 end
--     if item1.Quality == "神器" then sq = sq + 1 end
--     print("输出： ", item1.Name)
-- end
-- myshape = RandomItemPrototype:new(nil)
-- -- myshape.Base_Attribute.Power = 10

-- for i = 0, 10000 do myshape:print() end
-- -- for i = 1, 1 do print("随机", math.random(1, 2)) end
-- print("普通", pu)
-- print("优秀", you)
-- print("精良", jing)
-- print("史诗", ss)
-- print("传说", cc)
-- print("神器", sq)
