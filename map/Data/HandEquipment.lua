local items = 
{
    { Id = 1, KeyName = "手套", Explain = "无", Types = "手部", Position = "手部装备", Power = 0, Agility = 0, Lntelligence = 1, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 3, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 5, MoveSpeed = 0, },
    { Id = 2, KeyName = "裹手", Explain = "无", Types = "手部", Position = "手部装备", Power = 0, Agility = 0, Lntelligence = 3, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 2, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 5, MoveSpeed = 0, },
    { Id = 3, KeyName = "鬼纹手套", Explain = "无", Types = "手部", Position = "手部装备", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 3, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 5, MoveSpeed = 0, },
    { Id = 4, KeyName = "丝质手套", Explain = "无", Types = "手部", Position = "手部装备", Power = 0, Agility = 0, Lntelligence = 2, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 1, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 5, MoveSpeed = 0, },
    { Id = 5, KeyName = "羊皮手套", Explain = "无", Types = "手部", Position = "手部装备", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 2, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 5, MoveSpeed = 0, },
    { Id = 6, KeyName = "环带手套", Explain = "无", Types = "手部", Position = "手部装备", Power = 0, Agility = 0, Lntelligence = 1, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 4, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 10, MoveSpeed = 0, },
    { Id = 7, KeyName = "拳套", Explain = "无", Types = "手部", Position = "手部装备", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 2, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 10, MoveSpeed = 0, },
    { Id = 8, KeyName = "之手", Explain = "无", Types = "手部", Position = "手部装备", Power = 0, Agility = 2, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 4, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 15, MoveSpeed = 0, },
    { Id = 9, KeyName = "之爪", Explain = "无", Types = "手部", Position = "手部装备", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 2, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 15, MoveSpeed = 0, },
    { Id = 10, KeyName = "之拳", Explain = "无", Types = "手部", Position = "手部装备", Power = 0, Agility = 2, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 3, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 20, MoveSpeed = 0, },
    { Id = 11, KeyName = "护手", Explain = "无", Types = "手部", Position = "手部装备", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 2, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 25, MoveSpeed = 0, },
    { Id = 12, KeyName = "冷钢手套", Explain = "无", Types = "手部", Position = "手部装备", Power = 1, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 2, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 30, MoveSpeed = 0, },
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
    ["手套"] = items[1],
    ["裹手"] = items[2],
    ["鬼纹手套"] = items[3],
    ["丝质手套"] = items[4],
    ["羊皮手套"] = items[5],
    ["环带手套"] = items[6],
    ["拳套"] = items[7],
    ["之手"] = items[8],
    ["之爪"] = items[9],
    ["之拳"] = items[10],
    ["护手"] = items[11],
    ["冷钢手套"] = items[12],
}

local data = { Items = items, IdItems = idItems, KeyItems = keyItems, }
function data:getById(id)
    return self.IdItems[id]
end
function data:getByKey(key)
    return self.KeyItems[key]
end
return data
