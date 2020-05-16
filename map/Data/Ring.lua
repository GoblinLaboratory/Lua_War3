local items = 
{
    { Id = 1, KeyName = "戒指", Explain = "无", Types = "戒指", Position = "戒指", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 30, Magic = 0, HPRecoverySpeed = 5, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 2, KeyName = "指环", Explain = "无", Types = "戒指", Position = "戒指", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 0, Magic = 20, HPRecoverySpeed = 0, MagicRecoverySpeed = 20, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 3, KeyName = "之戒", Explain = "无", Types = "戒指", Position = "戒指", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 30, Magic = 0, HPRecoverySpeed = 5, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 4, KeyName = "徽记", Explain = "无", Types = "戒指", Position = "戒指", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 0, Magic = 20, HPRecoverySpeed = 0, MagicRecoverySpeed = 20, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 5, KeyName = "黄金戒指", Explain = "无", Types = "戒指", Position = "戒指", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 30, Magic = 0, HPRecoverySpeed = 5, MagicRecoverySpeed = 20, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 6, KeyName = "白银戒指", Explain = "无", Types = "戒指", Position = "戒指", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 0, Magic = 20, HPRecoverySpeed = 5, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 7, KeyName = "月光石戒指", Explain = "无", Types = "戒指", Position = "戒指", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 30, Magic = 0, HPRecoverySpeed = 2, MagicRecoverySpeed = 20, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 8, KeyName = "红宝石戒指", Explain = "无", Types = "戒指", Position = "戒指", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 0, Magic = 20, HPRecoverySpeed = 3, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 9, KeyName = "蓝宝石戒指", Explain = "无", Types = "戒指", Position = "戒指", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 30, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 15, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 10, KeyName = "黄宝石戒指", Explain = "无", Types = "戒指", Position = "戒指", Power = 0, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 0, Magic = 20, HPRecoverySpeed = 2, MagicRecoverySpeed = 10, AttackSpeed = 0, MoveSpeed = 0, },
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
}

local keyItems = 
{
    ["戒指"] = items[1],
    ["指环"] = items[2],
    ["之戒"] = items[3],
    ["徽记"] = items[4],
    ["黄金戒指"] = items[5],
    ["白银戒指"] = items[6],
    ["月光石戒指"] = items[7],
    ["红宝石戒指"] = items[8],
    ["蓝宝石戒指"] = items[9],
    ["黄宝石戒指"] = items[10],
}

local data = { Items = items, IdItems = idItems, KeyItems = keyItems, }
function data:getById(id)
    return self.IdItems[id]
end
function data:getByKey(key)
    return self.KeyItems[key]
end
return data
