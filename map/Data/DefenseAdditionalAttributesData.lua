local items = 
{
    { Id = 1, KeyName = "伤害减免", Explain = "说明", Types = "前缀", DamageRelief = 20, PhysicalDamageAbsorption = 0, SpellDamageRelief = 0, FireResistance = 0, SherbetResistance = 0, ShadowResistance = 0, SacredResistance = 0, PoisonResistance = 0, ThunderResistance = 0, VertigoResistance = 0, Block = 0, Dodge = 0, },
    { Id = 2, KeyName = "物理伤害吸收", Explain = "说明", Types = "前缀", DamageRelief = 0, PhysicalDamageAbsorption = 20, SpellDamageRelief = 0, FireResistance = 0, SherbetResistance = 0, ShadowResistance = 0, SacredResistance = 0, PoisonResistance = 0, ThunderResistance = 0, VertigoResistance = 0, Block = 0, Dodge = 0, },
    { Id = 3, KeyName = "法术伤害吸收", Explain = "说明", Types = "前缀", DamageRelief = 0, PhysicalDamageAbsorption = 0, SpellDamageRelief = 30, FireResistance = 0, SherbetResistance = 0, ShadowResistance = 0, SacredResistance = 0, PoisonResistance = 0, ThunderResistance = 0, VertigoResistance = 0, Block = 0, Dodge = 0, },
    { Id = 4, KeyName = "火焰抗性", Explain = "说明", Types = "前缀", DamageRelief = 0, PhysicalDamageAbsorption = 0, SpellDamageRelief = 0, FireResistance = 30, SherbetResistance = 0, ShadowResistance = 0, SacredResistance = 0, PoisonResistance = 0, ThunderResistance = 0, VertigoResistance = 0, Block = 0, Dodge = 0, },
    { Id = 5, KeyName = "冰霜抗性", Explain = "说明", Types = "前缀", DamageRelief = 0, PhysicalDamageAbsorption = 0, SpellDamageRelief = 0, FireResistance = 0, SherbetResistance = 30, ShadowResistance = 0, SacredResistance = 0, PoisonResistance = 0, ThunderResistance = 0, VertigoResistance = 0, Block = 0, Dodge = 0, },
    { Id = 6, KeyName = "暗影抗性", Explain = "说明", Types = "前缀", DamageRelief = 0, PhysicalDamageAbsorption = 0, SpellDamageRelief = 0, FireResistance = 0, SherbetResistance = 0, ShadowResistance = 30, SacredResistance = 0, PoisonResistance = 0, ThunderResistance = 0, VertigoResistance = 0, Block = 0, Dodge = 0, },
    { Id = 7, KeyName = "神圣抗性", Explain = "说明", Types = "前缀", DamageRelief = 0, PhysicalDamageAbsorption = 0, SpellDamageRelief = 0, FireResistance = 0, SherbetResistance = 0, ShadowResistance = 0, SacredResistance = 30, PoisonResistance = 0, ThunderResistance = 0, VertigoResistance = 0, Block = 0, Dodge = 0, },
    { Id = 8, KeyName = "毒抗性", Explain = "说明", Types = "前缀", DamageRelief = 0, PhysicalDamageAbsorption = 0, SpellDamageRelief = 0, FireResistance = 0, SherbetResistance = 0, ShadowResistance = 0, SacredResistance = 0, PoisonResistance = 30, ThunderResistance = 0, VertigoResistance = 0, Block = 0, Dodge = 0, },
    { Id = 9, KeyName = "雷抗性", Explain = "说明", Types = "前缀", DamageRelief = 0, PhysicalDamageAbsorption = 0, SpellDamageRelief = 0, FireResistance = 0, SherbetResistance = 0, ShadowResistance = 0, SacredResistance = 0, PoisonResistance = 0, ThunderResistance = 30, VertigoResistance = 0, Block = 0, Dodge = 0, },
    { Id = 10, KeyName = "眩晕抗性", Explain = "说明", Types = "前缀", DamageRelief = 0, PhysicalDamageAbsorption = 0, SpellDamageRelief = 0, FireResistance = 0, SherbetResistance = 0, ShadowResistance = 0, SacredResistance = 0, PoisonResistance = 0, ThunderResistance = 0, VertigoResistance = 30, Block = 0, Dodge = 0, },
    { Id = 11, KeyName = "格挡", Explain = "说明", Types = "前缀", DamageRelief = 0, PhysicalDamageAbsorption = 0, SpellDamageRelief = 0, FireResistance = 0, SherbetResistance = 0, ShadowResistance = 0, SacredResistance = 0, PoisonResistance = 0, ThunderResistance = 0, VertigoResistance = 0, Block = 30, Dodge = 0, },
    { Id = 12, KeyName = "闪避", Explain = "说明", Types = "前缀", DamageRelief = 0, PhysicalDamageAbsorption = 0, SpellDamageRelief = 0, FireResistance = 0, SherbetResistance = 0, ShadowResistance = 0, SacredResistance = 0, PoisonResistance = 0, ThunderResistance = 0, VertigoResistance = 0, Block = 0, Dodge = 30, },
}

local idItems = 
{
    [1] = items[1],
    [2] = items[2],
    [3] = items[3],
    [4] = items[4],
    [5] = items[5],
    [6] = items[6],
    [7] = items[7],
    [8] = items[8],
    [9] = items[9],
    [10] = items[10],
    [11] = items[11],
    [12] = items[12],
}

local keyItems = 
{
    ["伤害减免"] = items[1],
    ["物理伤害吸收"] = items[2],
    ["法术伤害吸收"] = items[3],
    ["火焰抗性"] = items[4],
    ["冰霜抗性"] = items[5],
    ["暗影抗性"] = items[6],
    ["神圣抗性"] = items[7],
    ["毒抗性"] = items[8],
    ["雷抗性"] = items[9],
    ["眩晕抗性"] = items[10],
    ["格挡"] = items[11],
    ["闪避"] = items[12],
}

local data = { Items = items, IdItems = idItems, KeyItems = keyItems, }
function data:getById(id)
    return self.IdItems[id]
end
function data:getByKey(key)
    return self.KeyItems[key]
end
return data
