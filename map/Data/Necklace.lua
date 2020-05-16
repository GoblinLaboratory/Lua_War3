local items = 
{
    { Id = 1, KeyName = "坠饰", Explain = "无", Types = "项链", Position = "项链", Power = 0, Agility = 0, Lntelligence = 2, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 20, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 2, KeyName = "项圈", Explain = "无", Types = "项链", Position = "项链", Power = 0, Agility = 1, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 0, Magic = 50, HPRecoverySpeed = 5, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 3, KeyName = "项链", Explain = "无", Types = "项链", Position = "项链", Power = 2, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 0, Magic = 30, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 10, MoveSpeed = 0, },
    { Id = 4, KeyName = "符咒", Explain = "无", Types = "项链", Position = "项链", Power = 0, Agility = 1, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 20, Magic = 0, HPRecoverySpeed = 5, MagicRecoverySpeed = 20, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 5, KeyName = "颈饰", Explain = "无", Types = "项链", Position = "项链", Power = 0, Agility = 0, Lntelligence = 2, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 10, },
    { Id = 6, KeyName = "护符", Explain = "无", Types = "项链", Position = "项链", Power = 0, Agility = 2, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 7, KeyName = "珠宝", Explain = "无", Types = "项链", Position = "项链", Power = 2, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 5, MagicRecoverySpeed = 20, AttackSpeed = 0, MoveSpeed = 10, },
    { Id = 8, KeyName = "烙印", Explain = "无", Types = "项链", Position = "项链", Power = 0, Agility = 2, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 0, Magic = 20, HPRecoverySpeed = 5, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 9, KeyName = "勋章", Explain = "无", Types = "项链", Position = "项链", Power = 0, Agility = 0, Lntelligence = 2, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 20, Magic = 20, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 10, KeyName = "之链", Explain = "无", Types = "项链", Position = "项链", Power = 0, Agility = 2, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 0, Magic = 30, HPRecoverySpeed = 5, MagicRecoverySpeed = 20, AttackSpeed = 10, MoveSpeed = 0, },
    { Id = 11, KeyName = "魔晶珠串", Explain = "无", Types = "项链", Position = "项链", Power = 2, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 20, Magic = 0, HPRecoverySpeed = 5, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 12, KeyName = "徽章", Explain = "无", Types = "项链", Position = "项链", Power = 0, Agility = 2, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 0, Magic = 30, HPRecoverySpeed = 0, MagicRecoverySpeed = 20, AttackSpeed = 0, MoveSpeed = 10, },
    { Id = 13, KeyName = "之腾", Explain = "无", Types = "项链", Position = "项链", Power = 0, Agility = 0, Lntelligence = 2, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 15, MoveSpeed = 10, },
    { Id = 14, KeyName = "之石", Explain = "无", Types = "项链", Position = "项链", Power = 0, Agility = 2, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 0, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 20, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 15, KeyName = "之眼", Explain = "无", Types = "项链", Position = "项链", Power = 2, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 0, Magic = 30, HPRecoverySpeed = 5, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 10, },
    { Id = 16, KeyName = "之力", Explain = "无", Types = "项链", Position = "项链", Power = 0, Agility = 2, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 0, Magic = 20, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 10, MoveSpeed = 0, },
    { Id = 17, KeyName = "徽记", Explain = "无", Types = "项链", Position = "项链", Power = 0, Agility = 0, Lntelligence = 2, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 20, Magic = 20, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 18, KeyName = "之心", Explain = "无", Types = "项链", Position = "项链", Power = 0, Agility = 2, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 20, Magic = 10, HPRecoverySpeed = 0, MagicRecoverySpeed = 20, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 19, KeyName = "印记", Explain = "无", Types = "项链", Position = "项链", Power = 2, Agility = 0, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 0, Magic = 30, HPRecoverySpeed = 5, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 20, KeyName = "之牙", Explain = "无", Types = "项链", Position = "项链", Power = 0, Agility = 2, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 0, Magic = 20, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 20, MoveSpeed = 10, },
    { Id = 21, KeyName = "之星", Explain = "无", Types = "项链", Position = "项链", Power = 0, Agility = 0, Lntelligence = 2, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 20, Magic = 0, HPRecoverySpeed = 0, MagicRecoverySpeed = 20, AttackSpeed = 0, MoveSpeed = 0, },
    { Id = 22, KeyName = "之泪", Explain = "无", Types = "项链", Position = "项链", Power = 0, Agility = 2, Lntelligence = 0, Constitution = 0, Spirit = 0, will = 0, lucky = 0, AttackPower = 0, Armor = 0, MagicResistance = 0, Health = 0, Magic = 20, HPRecoverySpeed = 0, MagicRecoverySpeed = 0, AttackSpeed = 0, MoveSpeed = 0, },
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
}

local keyItems = 
{
    ["坠饰"] = items[1],
    ["项圈"] = items[2],
    ["项链"] = items[3],
    ["符咒"] = items[4],
    ["颈饰"] = items[5],
    ["护符"] = items[6],
    ["珠宝"] = items[7],
    ["烙印"] = items[8],
    ["勋章"] = items[9],
    ["之链"] = items[10],
    ["魔晶珠串"] = items[11],
    ["徽章"] = items[12],
    ["之腾"] = items[13],
    ["之石"] = items[14],
    ["之眼"] = items[15],
    ["之力"] = items[16],
    ["徽记"] = items[17],
    ["之心"] = items[18],
    ["印记"] = items[19],
    ["之牙"] = items[20],
    ["之星"] = items[21],
    ["之泪"] = items[22],
}

local data = { Items = items, IdItems = idItems, KeyItems = keyItems, }
function data:getById(id)
    return self.IdItems[id]
end
function data:getByKey(key)
    return self.KeyItems[key]
end
return data
