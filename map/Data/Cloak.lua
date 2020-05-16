local items = 
{
    { Id = 1, KeyName = "披风", Explain = "无", Types = "披风", Position = "披风", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 30, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 2, KeyName = "毛皮", Explain = "无", Types = "披风", Position = "披风", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 30, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 3, KeyName = "斗篷", Explain = "无", Types = "披风", Position = "披风", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 35, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 4, KeyName = "之幕", Explain = "无", Types = "披风", Position = "披风", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 30, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 5, KeyName = "裹衣", Explain = "无", Types = "披风", Position = "披风", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 35, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
}

local idItems = 
{
    [1] = items[1],
    [2] = items[2],
    [3] = items[3],
    [4] = items[4],
    [5] = items[5],
}

local keyItems = 
{
    ["披风"] = items[1],
    ["毛皮"] = items[2],
    ["斗篷"] = items[3],
    ["之幕"] = items[4],
    ["裹衣"] = items[5],
}

local data = { Items = items, IdItems = idItems, KeyItems = keyItems, }
function data:getById(id)
    return self.IdItems[id]
end
function data:getByKey(key)
    return self.KeyItems[key]
end
return data
