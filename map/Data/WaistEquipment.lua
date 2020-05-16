local items = 
{
    { Id = 1, KeyName = "腰带", Explain = "无", Types = "腰部布甲", Position = "腰部装备", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 2, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 2, KeyName = "束带", Explain = "无", Types = "腰部布甲", Position = "腰部装备", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 2, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 3, KeyName = "套索", Explain = "无", Types = "腰部皮甲", Position = "腰部装备", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 2, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 4, KeyName = "护腰", Explain = "无", Types = "腰部板甲", Position = "腰部装备", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 2, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
}

local idItems = 
{
    [1] = items[1],
    [2] = items[2],
    [3] = items[3],
    [4] = items[4],
}

local keyItems = 
{
    ["腰带"] = items[1],
    ["束带"] = items[2],
    ["套索"] = items[3],
    ["护腰"] = items[4],
}

local data = { Items = items, IdItems = idItems, KeyItems = keyItems, }
function data:getById(id)
    return self.IdItems[id]
end
function data:getByKey(key)
    return self.KeyItems[key]
end
return data
