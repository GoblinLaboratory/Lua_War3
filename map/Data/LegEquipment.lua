local items = 
{
    { Id = 1, KeyName = "短裤", Explain = "无", Types = "腿部布甲", Position = "腿部装备", Power = 0, Agility = 0, Lntelligence = 1, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 1, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 2, KeyName = "长裤", Explain = "无", Types = "腿部布甲", Position = "腿部装备", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 1, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 3, KeyName = "褶皱裙", Explain = "无", Types = "腿部布甲", Position = "腿部装备", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 1, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 4, KeyName = "裹腿", Explain = "无", Types = "腿部布甲", Position = "腿部装备", Power = 0, Agility = 0, Lntelligence = 1, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 1, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 5, KeyName = "热裤", Explain = "无", Types = "腿部布甲", Position = "腿部装备", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 2, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 6, KeyName = "皮裤", Explain = "无", Types = "腿部皮甲", Position = "腿部装备", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 2, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 7, KeyName = "胫甲", Explain = "无", Types = "腿部皮甲", Position = "腿部装备", Power = 0, Agility = 2, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 2, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 8, KeyName = "马裤", Explain = "无", Types = "腿部皮甲", Position = "腿部装备", Power = 0, Agility = 2, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 2, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 9, KeyName = "护腿", Explain = "无", Types = "腿部板甲", Position = "腿部装备", Power = 2, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 5, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 10, KeyName = "腿甲", Explain = "无", Types = "腿部板甲", Position = "腿部装备", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 4, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 11, KeyName = "护颈", Explain = "无", Types = "腿部板甲", Position = "腿部装备", Power = 2, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 4, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 12, KeyName = "腿凯", Explain = "无", Types = "腿部板甲", Position = "腿部装备", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 4, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 13, KeyName = "胫凯", Explain = "无", Types = "腿部板甲", Position = "腿部装备", Power = 2, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 4, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
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
    [13] = items[13],
}

local keyItems = 
{
    ["短裤"] = items[1],
    ["长裤"] = items[2],
    ["褶皱裙"] = items[3],
    ["裹腿"] = items[4],
    ["热裤"] = items[5],
    ["皮裤"] = items[6],
    ["胫甲"] = items[7],
    ["马裤"] = items[8],
    ["护腿"] = items[9],
    ["腿甲"] = items[10],
    ["护颈"] = items[11],
    ["腿凯"] = items[12],
    ["胫凯"] = items[13],
}

local data = { Items = items, IdItems = idItems, KeyItems = keyItems, }
function data:getById(id)
    return self.IdItems[id]
end
function data:getByKey(key)
    return self.KeyItems[key]
end
return data
