local items = 
{
    { Id = 1, KeyName = "之冠", Explain = "无", Types = "头部布甲", Position = "头部装备", Power = 0, Agility = 0, Lntelligence = 2, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 3, MagicResistance = 20, Health = 0, Magic = 20, HPRecoverySpeed = 0, MagicRecoverySpeed = 10, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 2, KeyName = "遮阳帽", Explain = "无", Types = "头部布甲", Position = "头部装备", Power = 0, Agility = 0, Lntelligence = 3, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 2, MagicResistance = 20, Health = 0, Magic = 20, HPRecoverySpeed = 0, MagicRecoverySpeed = 10, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 3, KeyName = "之环", Explain = "无", Types = "头部布甲", Position = "头部装备", Power = 0, Agility = 0, Lntelligence = 2, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 2, MagicResistance = 20, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 10, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 4, KeyName = "头巾", Explain = "无", Types = "头部布甲", Position = "头部装备", Power = 0, Agility = 0, Lntelligence = 3, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 1, MagicResistance = 20, Health = 0, Magic = 20, HPRecoverySpeed = 0, MagicRecoverySpeed = 10, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 5, KeyName = "头冠", Explain = "无", Types = "头部布甲", Position = "头部装备", Power = 0, Agility = 0, Lntelligence = 2, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 1, MagicResistance = 20, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 10, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 6, KeyName = "头饰", Explain = "无", Types = "头部布甲", Position = "头部装备", Power = 0, Agility = 0, Lntelligence = 2, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 1, MagicResistance = 20, Health = 0, Magic = 20, HPRecoverySpeed = 0, MagicRecoverySpeed = 10, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 7, KeyName = "帽子", Explain = "无", Types = "头部布甲", Position = "头部装备", Power = 0, Agility = 0, Lntelligence = 2, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 1, MagicResistance = 20, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 10, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 8, KeyName = "罩帽", Explain = "无", Types = "头部布甲", Position = "头部装备", Power = 0, Agility = 0, Lntelligence = 2, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 1, MagicResistance = 20, Health = 0, Magic = 20, HPRecoverySpeed = 0, MagicRecoverySpeed = 10, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 9, KeyName = "头饰", Explain = "无", Types = "头部布甲", Position = "头部装备", Power = 0, Agility = 0, Lntelligence = 2, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 1, MagicResistance = 20, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 10, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 10, KeyName = "面罩", Explain = "无", Types = "头部布甲", Position = "头部装备", Power = 0, Agility = 0, Lntelligence = 2, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 1, MagicResistance = 20, Health = 0, Magic = 20, HPRecoverySpeed = 0, MagicRecoverySpeed = 15, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 11, KeyName = "兜帽", Explain = "无", Types = "头部布甲", Position = "头部装备", Power = 0, Agility = 0, Lntelligence = 2, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 1, MagicResistance = 20, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 10, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 12, KeyName = "软帽", Explain = "无", Types = "头部布甲", Position = "头部装备", Power = 0, Agility = 0, Lntelligence = 2, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 1, MagicResistance = 20, Health = 0, Magic = 20, HPRecoverySpeed = 0, MagicRecoverySpeed = 20, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 13, KeyName = "头盔", Explain = "无", Types = "头部皮甲", Position = "头部装备", Power = 0, Agility = 2, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 2, MagicResistance = 20, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 5, MoveSpeed = 0, },
    { Id = 14, KeyName = "皮盔", Explain = "无", Types = "头部皮甲", Position = "头部装备", Power = 0, Agility = 3, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 2, MagicResistance = 20, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 5, MoveSpeed = 0, },
    { Id = 15, KeyName = "战盔", Explain = "无", Types = "头部皮甲", Position = "头部装备", Power = 0, Agility = 2, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 2, MagicResistance = 20, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 10, MoveSpeed = 0, },
    { Id = 16, KeyName = "护盔", Explain = "无", Types = "头部皮甲", Position = "头部装备", Power = 0, Agility = 3, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 2, MagicResistance = 20, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 10, MoveSpeed = 0, },
    { Id = 17, KeyName = "宝冠", Explain = "无", Types = "头部板甲", Position = "头部装备", Power = 2, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 3, MagicResistance = 20, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 18, KeyName = "坚盔", Explain = "无", Types = "头部板甲", Position = "头部装备", Power = 3, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 4, MagicResistance = 20, Health = 20, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 19, KeyName = "之盔", Explain = "无", Types = "头部板甲", Position = "头部装备", Power = 2, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 4, MagicResistance = 20, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 20, KeyName = "之笼", Explain = "无", Types = "头部板甲", Position = "头部装备", Power = 3, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 4, MagicResistance = 20, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 21, KeyName = "战冠", Explain = "无", Types = "头部板甲", Position = "头部装备", Power = 2, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 4, MagicResistance = 20, Health = 20, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 22, KeyName = "护目镜", Explain = "无", Types = "头部板甲", Position = "头部装备", Power = 3, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 4, MagicResistance = 20, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 23, KeyName = "宝冠", Explain = "无", Types = "头部板甲", Position = "头部装备", Power = 2, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 4, MagicResistance = 20, Health = 20, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 24, KeyName = "王冠", Explain = "无", Types = "头部板甲", Position = "头部装备", Power = 3, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 4, MagicResistance = 20, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 25, KeyName = "面甲", Explain = "无", Types = "头部板甲", Position = "头部装备", Power = 2, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 4, MagicResistance = 20, Health = 20, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
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
    [14] = items[14],
    [15] = items[15],
    [16] = items[16],
    [17] = items[17],
    [18] = items[18],
    [19] = items[19],
    [20] = items[20],
    [21] = items[21],
    [22] = items[22],
    [23] = items[23],
    [24] = items[24],
    [25] = items[25],
}

local keyItems = 
{
    ["之冠"] = items[1],
    ["遮阳帽"] = items[2],
    ["之环"] = items[3],
    ["头巾"] = items[4],
    ["头冠"] = items[5],
    ["头饰"] = items[6],
    ["帽子"] = items[7],
    ["罩帽"] = items[8],
    ["头饰"] = items[9],
    ["面罩"] = items[10],
    ["兜帽"] = items[11],
    ["软帽"] = items[12],
    ["头盔"] = items[13],
    ["皮盔"] = items[14],
    ["战盔"] = items[15],
    ["护盔"] = items[16],
    ["宝冠"] = items[17],
    ["坚盔"] = items[18],
    ["之盔"] = items[19],
    ["之笼"] = items[20],
    ["战冠"] = items[21],
    ["护目镜"] = items[22],
    ["宝冠"] = items[23],
    ["王冠"] = items[24],
    ["面甲"] = items[25],
}

local data = { Items = items, IdItems = idItems, KeyItems = keyItems, }
function data:getById(id)
    return self.IdItems[id]
end
function data:getByKey(key)
    return self.KeyItems[key]
end
return data
