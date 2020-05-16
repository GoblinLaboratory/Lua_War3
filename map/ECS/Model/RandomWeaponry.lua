require "math"
require "Lib\\table"
require "ECS\\Model\\Factory"
require "ECS\\Data\\WeaponryData"
require "War3\\Picture"
require "ECS\\Skill\\SkillManager"
RandomWeaponry = {}
-- function RandomWeaponry:new(o)
--     o = o or {}
--     setmetatable(o, self)
--     --
--     math.randomseed(tostring(os.time()):reverse():sub(1, 7))
--     --
--     return o
-- end
-- RandomWeaponry.__index = RandomWeaponry
function RandomWeaponry.CreateWeaponry(lucky, level)
    local F = Factory:Instance()
    local item1 = F:WeaponryFactory()
    -- 设置装备类型
    RandomWeaponry.SetPosition(item1)
    -- 装备冠名
    RandomWeaponry.SetNaming(item1)
    -- 设置装备品质
    RandomWeaponry.Rarity(item1, lucky)
    -- 设置装备等级
    RandomWeaponry.SetItemsLevel(item1, level)
    -- 设置技能
    RandomWeaponry.SetSkill(item1)
    -- 设置装备图标
    local PM = Picture:Instance()
    item1["Weaponry"]["图标"].Value = PM:getIcon(item1["Base"]["Types"].Value)
    -----------------------------------
    return item1
end
-- 设置装备类型
function RandomWeaponry.SetPosition(item1)
    local i = math.random(1, 1100)
    if i < 151 then
        -- 掉落主手武器
        local it = WeaponryData.Mainhandweapon
        item1 = RandomWeaponry.SetPrototype(item1, it)
        item1["Base"]["自定义值"].Value = "Mainhandweapon"
    elseif i > 150 and i < 301 then
        -- 掉落副手武器
        local it = WeaponryData.OffHandWeapon
        item1 = RandomWeaponry.SetPrototype(item1, it)
        item1["Base"]["自定义值"].Value = "OffHandWeapon"
    elseif i > 300 and i < 461 then
        -- 掉落头部装备
        local it = WeaponryData.HeadEquipment
        item1 = RandomWeaponry.SetPrototype(item1, it)
        item1["Base"]["自定义值"].Value = "HeadEquipment"
    elseif i > 460 and i < 561 then
        -- 掉落胸部装备
        local it = WeaponryData.ChestEquipment
        item1 = RandomWeaponry.SetPrototype(item1, it)
        item1["Base"]["自定义值"].Value = "ChestEquipment"
    elseif i > 560 and i < 611 then
        -- 掉落腰部装备
        local it = WeaponryData.WaistEquipment
        item1 = RandomWeaponry.SetPrototype(item1, it)
        item1["Base"]["自定义值"].Value = "WaistEquipment"
    elseif i > 610 and i < 711 then
        -- 掉落腿部装备
        local it = WeaponryData.LegEquipment
        item1 = RandomWeaponry.SetPrototype(item1, it)
        item1["Base"]["自定义值"].Value = "LegEquipment"
    elseif i > 710 and i < 811 then
        -- 掉落手部装备7
        local it = WeaponryData.HandEquipment
        item1 = RandomWeaponry.SetPrototype(item1, it)
        item1["Base"]["自定义值"].Value = "HandEquipment"
    elseif i > 810 and i < 911 then
        -- 掉落脚部装备
        local it = WeaponryData.FootEquipment
        item1 = RandomWeaponry.SetPrototype(item1, it)
        item1["Base"]["自定义值"].Value = "FootEquipment"
    elseif i > 910 and i < 961 then
        -- 掉落项链
        local it = WeaponryData.Necklace
        item1 = RandomWeaponry.SetPrototype(item1, it)
        item1["Base"]["自定义值"].Value = "Necklace"
    elseif i > 960 and i < 1020 then
        -- 掉落戒指
        local it = WeaponryData.Ring
        item1 = RandomWeaponry.SetPrototype(item1, it)
        item1["Base"]["自定义值"].Value = "Ring"
    else
        -- 掉落披风
        local it = WeaponryData.Cloak
        item1 = RandomWeaponry.SetPrototype(item1, it)
        item1["Base"]["自定义值"].Value = "Cloak"
    end
    -----------------------------------
    return item1
end
-- 装备冠名
function RandomWeaponry.SetNaming(item1)
    local it = WeaponryData.Naming[math.random(1,
                                               table.getn(WeaponryData.Naming))]
    for i = #it, 1, -1 do
        if it[i].Type == "Base" then
            -- statements
            -- item1["Base"]["Name"].Value = it[i]["Name"].Value + item1["Base"]["Name"].Value
            for j = #it[i], 1, -1 do
                if it[i][j].Type == "Name" then
                    -- statements
                    item1[it[i].Type][it[i][j].Type].Value =
                        it[i][j].Value .. item1[it[i].Type][it[i][j].Type].Value
                end
            end
        end
        if it[i].Type ~= "Base" and it[i].Type ~= "Weaponry" then
            -- statements
            for j = #it[i], 1, -1 do
                item1[it[i].Type][it[i][j].Type].Value = it[i][j].Value
            end
        end
    end
    return item1
end
-- 装备爆率 设置装备品质
function RandomWeaponry.Rarity(item1, lucky)
    local i = math.random(1, 125000000)
    if i < 2 * lucky then
        -- 掉落神器1
        item1["Weaponry"]["品质"].Value = "神器"
        -- 添加前缀
        RandomWeaponry.SetPrefixPrototype(item1)
        -- 附加词缀
        local si = math.random(22, 25)
        for i1 = 1, si do RandomWeaponry.SetAffixPrototype(item1) end
    elseif i > 2 * lucky and i < 14 * lucky then
        -- 掉落不朽
        item1["Weaponry"]["品质"].Value = "不朽"
        -- 添加前缀
        RandomWeaponry.SetPrefixPrototype(item1)
        -- 附加词缀
        local si = math.random(17, 19)
        for i1 = 1, si do RandomWeaponry.SetAffixPrototype(item1) end
    elseif i > 13 * lucky and i < 139 * lucky then
        -- 掉落远古
        item1["Weaponry"]["品质"].Value = "远古"
        -- 添加前缀
        RandomWeaponry.SetPrefixPrototype(item1)
        -- 附加词缀
        local si = math.random(12, 15)
        for i1 = 1, si do RandomWeaponry.SetAffixPrototype(item1) end
    elseif i > 138 * lucky and i < 2001 * lucky then
        -- 掉落传说50
        item1["Weaponry"]["品质"].Value = "传说"
        -- 添加前缀
        RandomWeaponry.SetPrefixPrototype(item1)
        -- 附加词缀
        local si = math.random(8, 10)
        for i1 = 1, si do RandomWeaponry.SetAffixPrototype(item1) end
    elseif i < 5000001 * lucky and i > 2000 * lucky then
        -- 掉落史诗100
        item1["Weaponry"]["品质"].Value = "史诗"
        -- 添加前缀
        RandomWeaponry.SetPrefixPrototype(item1)
        -- 附加词缀
        local si = math.random(5, 7)
        for i1 = 1, si do RandomWeaponry.SetAffixPrototype(item1) end
    elseif i > 5000000 * lucky and i < 12500001 * lucky then
        -- 掉落精良500
        item1["Weaponry"]["品质"].Value = "稀有"
        -- 添加前缀
        RandomWeaponry.SetPrefixPrototype(item1)
        -- 附加词缀
        local si = math.random(3, 5)
        for i1 = 1, si do RandomWeaponry.SetAffixPrototype(item1) end
    elseif i > 12500000 * lucky and i < 25000001 * lucky then
        -- 掉落优秀2000
        item1["Weaponry"]["品质"].Value = "优秀"
        -- 添加前缀
        RandomWeaponry.SetPrefixPrototype(item1)
        -- 附加词缀
        local si = math.random(2, 4)
        for i1 = 1, si do RandomWeaponry.SetAffixPrototype(item1) end
    elseif i > 25000000 * lucky and i < 50000001 * lucky then
        -- 掉落优秀2000
        item1["Weaponry"]["品质"].Value = "精良"
        -- 添加前缀
        RandomWeaponry.SetPrefixPrototype(item1)
        -- 附加词缀
        local si = math.random(1, 2)
        for i1 = 1, si do RandomWeaponry.SetAffixPrototype(item1) end
    else
        -- 掉落普通
        item1["Weaponry"]["品质"].Value = "普通"
        -- 添加前缀
        -- self:AddItemPrefix(item1)
    end
    return item1
end
-- 设置装备等级
function RandomWeaponry.SetItemsLevel(item1, l)
    local si = math.random(l - 2, l + 3)
    local i = (si / 3 + 1) * 0.3
    -- 设置基础属性
    item1["Base"]["等级"].Value = l

    for k, v in pairs(item1["Unit"]) do --
        if k ~= "移动速度" and k ~= "攻击速度" then
            -- statements
            item1["Unit"][k].Value = math.floor(item1["Unit"][k].Value * i)
        end
    end
    for k, v in pairs(item1["Hero"]) do --
        item1["Hero"][k].Value = math.floor(item1["Hero"][k].Value * i)
    end
    for k, v in pairs(item1["Extra"]) do --
        item1["Extra"][k].Value = math.floor(item1["Extra"][k].Value * i)
    end
end
-- 设置Item基础属性 -- 设置装备底材
function RandomWeaponry.SetPrototype(item1, it1)
    local it = it1[math.random(1, table.getn(it1))]
    for i = #it, 1, -1 do
        for j = #it[i], 1, -1 do
            item1[it[i].Type][it[i][j].Type].Value = it[i][j].Value
        end
    end
    item1["Weaponry"]["词缀"].Value = ""
    return item1
end
-- 设置技能
function RandomWeaponry.SetSkill(item1)
    --item1["Skill"]
    local s = SkillManager:Instance()
    local ss = s:CretaSkill("暴击")
    --print(ss.Name)
    table.insert(item1["Skill"], ss)
end
-- 添加前缀
function RandomWeaponry.SetPrefixPrototype(item1)
    local it =
        WeaponryData.Affix[math.random(1, table.getn(WeaponryData.Affix))]
    for i = #it, 1, -1 do
        if it[i].Type == "Base" then
            -- statements
            -- item1["Weaponry"]["词缀"].Value =item1["Weaponry"]["词缀"].Value + it["Base"]["Name"].Value
            for j = #it[i], 1, -1 do
                if it[i][j].Type == "Name" then
                    -- statements
                    item1[it[i].Type][it[i][j].Type].Value =
                        it[i][j].Value .. "-" ..
                            item1[it[i].Type][it[i][j].Type].Value
                end
            end
        end
        if it[i].Type ~= "Base" and it[i].Type ~= "Weaponry" then
            -- statements
            for j = #it[i], 1, -1 do
                item1[it[i].Type][it[i][j].Type].Value = it[i][j].Value
            end
        end
    end
    return item1
end
-- 添加词缀
function RandomWeaponry.SetAffixPrototype(item1)
    local it =
        WeaponryData.Affix[math.random(1, table.getn(WeaponryData.Affix))]
    for i = #it, 1, -1 do
        if it[i].Type == "Base" then
            -- statements
            -- item1["Weaponry"]["词缀"].Value =item1["Weaponry"]["词缀"].Value + it["Base"]["Name"].Value
            for j = #it[i], 1, -1 do
                if it[i][j].Type == "Name" then
                    -- statements
                    item1["Weaponry"]["词缀"].Value =
                        it[i][j].Value .. item1["Weaponry"]["词缀"].Value
                end
            end
        end
        if it[i].Type ~= "Base" and it[i].Type ~= "Weaponry" then
            -- statements
            for j = #it[i], 1, -1 do
                item1[it[i].Type][it[i][j].Type].Value = it[i][j].Value
            end
        end
    end
    return item1
end
return RandomWeaponry

-- local name = RandomWeaponry.CreateWeaponry(100, 60)
-- print(name["Base"]["Name"].Value)
-- for i = 1, 100 do
--     -- statements
--     local name1 = RandomWeaponry.CreateWeaponry(100, 60)
--     print(name1["Base"]["等级"].Value)
--     print(name1["Weaponry"]["词缀"].Value)
--     print(name1["Base"]["Name"].Value)
--     print(name1["Hero"]["力量"].Value)
--     print(name1["Unit"]["攻击力"].Value)
--     print(name1["Weaponry"]["图标"].Value)
--     print("i" .. i)
-- end
