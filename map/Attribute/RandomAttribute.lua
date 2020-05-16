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
require "Attribute\\ItemAttribute"
require "Lib\\table"
require "War3\\Picture"
require "Attribute\\Factory"
-- 导入数据
-- 装备冠名
Naming = require "Attribute\\Data\\Naming"
-- 装备词缀
MixedAttributeData = require "Attribute\\Data\\MixedAttributeData"
-- 主手装备
Mainhandweapon = require "Attribute\\Data\\Mainhandweapon"
-- 副手装备
OffHandWeapon = require "Attribute\\Data\\OffHandWeapon"
-- 头部
HeadEquipment = require "Attribute\\Data\\HeadEquipment"
-- 胸部
ChestEquipment = require "Attribute\\Data\\ChestEquipment"
-- 手部
HandEquipment = require "Attribute\\Data\\HandEquipment"
-- 腰部
WaistEquipment = require "Attribute\\Data\\WaistEquipment"
-- 腿部
LegEquipment = require "Attribute\\Data\\LegEquipment"
-- 脚部
FootEquipment = require "Attribute\\Data\\FootEquipment"
-- 项链
Necklace = require "Attribute\\Data\\Necklace"
-- 戒指
Ring = require "Attribute\\Data\\Ring"
-- 披风
Cloak = require "Attribute\\Data\\Cloak"
-- 技能数据
require "Attribute\\Skill\\SkillManager"
RandomAttribute = {}

function RandomAttribute:new(o)
    o = o or {}
    setmetatable(o, self)
    --
    math.randomseed(tostring(os.time()):reverse():sub(1, 7))
    --
    return o
end
RandomAttribute.__index = RandomAttribute
function RandomAttribute:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end

---------------
-- 生成装备
function RandomAttribute:CreateItem(lucky, level)
    -- local item1 = {}
    -- setmetatable(item1, Item)
    local item1 = ItemAttribute:new(nil)
   -- math.randomseed(tostring(os.time()):reverse():sub(1, 7))
    -- print(item1.BasicsInformation["自定义值"].Explain)
    ------------------
    -- 设置装备类型
    self:SetPosition(item1)
    -- 装备冠名
    self:AddItemNaming(item1)
    -- 设置装备品质
    self:Rarity(item1, lucky)
    -- print(item1.BasicsInformation["品质"].Explain)
    -- 设置装备等级
    self:SetItemsLevel(item1, level)
    local PM = Picture:Instance()
    item1.BasicsInformation["图标"].Value =
        PM:getIcon(item1.BasicsInformation["Types"].Value)
    -- 添加技能
    self:RandomSkill(item1)
    return item1
end
-- 设置装备类型
function RandomAttribute:SetPosition(item1)
    ---------------------
    local i = math.random(1, 1100)
    if i < 151 then
        -- 掉落主手武器
        local it = Mainhandweapon.Items
        item1 = self:SetItemsprototype(item1, it)
        item1.BasicsInformation["自定义值"].Value = "A"
    elseif i > 150 and i < 301 then
        -- 掉落副手武器
        local it = OffHandWeapon.Items
        item1 = self:SetItemsprototype(item1, it)
        item1.BasicsInformation["自定义值"].Value = "B"
    elseif i > 300 and i < 461 then
        -- 掉落头部装备
        local it = HeadEquipment.Items
        item1 = self:SetItemsprototype(item1, it)
        item1.BasicsInformation["自定义值"].Value = "C"
    elseif i > 460 and i < 561 then
        -- 掉落胸部装备
        local it = ChestEquipment.Items
        item1 = self:SetItemsprototype(item1, it)
        item1.BasicsInformation["自定义值"].Value = "D"
    elseif i > 560 and i < 611 then
        -- 掉落腰部装备
        local it = WaistEquipment.Items
        item1 = self:SetItemsprototype(item1, it)
        item1.BasicsInformation["自定义值"].Value = "E"
    elseif i > 610 and i < 711 then
        -- 掉落腿部装备
        local it = LegEquipment.Items
        item1 = self:SetItemsprototype(item1, it)
        item1.BasicsInformation["自定义值"].Value = "F"
    elseif i > 710 and i < 811 then
        -- 掉落手部装备7
        local it = HandEquipment.Items
        item1 = self:SetItemsprototype(item1, it)
        item1.BasicsInformation["自定义值"].Value = "G"
    elseif i > 810 and i < 911 then
        -- 掉落脚部装备
        local it = FootEquipment.Items
        item1 = self:SetItemsprototype(item1, it)
        item1.BasicsInformation["自定义值"].Value = "H"
    elseif i > 910 and i < 961 then
        -- 掉落项链
        local it = Necklace.Items
        item1 = self:SetItemsprototype(item1, it)
        item1.BasicsInformation["自定义值"].Value = "I"
    elseif i > 960 and i < 1020 then
        -- 掉落戒指
        local it = Ring.Items
        item1 = self:SetItemsprototype(item1, it)
        item1.BasicsInformation["自定义值"].Value = "J"
    else
        -- 掉落披风
        local it = Cloak.Items
        item1 = self:SetItemsprototype(item1, it)
        item1.BasicsInformation["自定义值"].Value = "K"
    end
end
-- 装备爆率 设置装备品质
function RandomAttribute:Rarity(item1, lucky)
    -- 125,000,000
    -- local i = i1*i2*i3
    local i = math.random(1, 125000000)
    -- print(i)
    -- print("随机： ", i)
    if i < 2 * lucky then
        -- 掉落神器1
        item1.BasicsInformation["品质"].Value = "神器"
        -- 添加前缀
        self:AddItemPrefix(item1)
        -- 附加词缀
        local si = math.random(22, 25)
        for i1 = 1, si do self:AddItemOtherPrefix(item1) end
    elseif i > 2 * lucky and i < 14 * lucky then
        -- 掉落不朽
        item1.BasicsInformation["品质"].Value = "不朽"
        -- 添加前缀
        self:AddItemPrefix(item1)
        -- 附加词缀
        local si = math.random(17, 19)
        for i1 = 1, si do self:AddItemOtherPrefix(item1) end
    elseif i > 13 * lucky and i < 139 * lucky then
        -- 掉落远古
        item1.BasicsInformation["品质"].Value = "远古"
        -- 添加前缀
        self:AddItemPrefix(item1)
        -- 附加词缀
        local si = math.random(12, 15)
        for i1 = 1, si do self:AddItemOtherPrefix(item1) end
    elseif i > 138 * lucky and i < 2001 * lucky then
        -- 掉落传说50
        item1.BasicsInformation["品质"].Value = "传说"
        -- 添加前缀
        self:AddItemPrefix(item1)
        -- 附加词缀
        local si = math.random(8, 10)
        for i1 = 1, si do self:AddItemOtherPrefix(item1) end
    elseif i < 5000001 * lucky and i > 2000 * lucky then
        -- 掉落史诗100
        item1.BasicsInformation["品质"].Value = "史诗"
        -- 添加前缀
        self:AddItemPrefix(item1)
        -- 附加词缀
        local si = math.random(5, 7)
        for i1 = 1, si do self:AddItemOtherPrefix(item1) end
    elseif i > 5000000 * lucky and i < 12500001 * lucky then
        -- 掉落精良500
        item1.BasicsInformation["品质"].Value = "稀有"
        -- 添加前缀
        self:AddItemPrefix(item1)
        -- 附加词缀
        local si = math.random(3, 5)
        for i1 = 1, si do self:AddItemOtherPrefix(item1) end
    elseif i > 12500000 * lucky and i < 25000001 * lucky then
        -- 掉落优秀2000
        item1.BasicsInformation["品质"].Value = "优秀"
        -- 添加前缀
        self:AddItemPrefix(item1)
        -- 附加词缀
        local si = math.random(2, 4)
        for i1 = 1, si do self:AddItemOtherPrefix(item1) end
    elseif i > 25000000 * lucky and i < 50000001 * lucky then
        -- 掉落优秀2000
        item1.BasicsInformation["品质"].Value = "精良"
        -- 添加前缀
        self:AddItemPrefix(item1)
        -- 附加词缀
        local si = math.random(1, 2)
        for i1 = 1, si do self:AddItemOtherPrefix(item1) end
    else
        -- 掉落普通
        item1.BasicsInformation["品质"].Value = "普通"
        -- 添加前缀
        -- self:AddItemPrefix(item1)
    end
    return item1
end
-- 设置Item基础属性 -- 设置装备底材
function RandomAttribute:SetItemsprototype(item1, it1)
    local it = it1[math.random(1, table.getn(it1))]
    for i = #it, 1, -1 do
        if it[i].Type == "BasicsInformation" then
            for j = #it[i], 1, -1 do
                item1.BasicsInformation[it[i][j].Type].Value = it[i][j].Value
            end
        end
        if it[i].Type == "ExtendAttribute" then
            for j = #it[i], 1, -1 do
                item1.ExtendAttribute[it[i][j].Type].Value = it[i][j].Value
            end
        end
        if it[i].Type == "BasicsAttribute" then
            for j = #it[i], 1, -1 do
                item1.BasicsAttribute[it[i][j].Type].Value = it[i][j].Value
            end
        end
        if it[i].Type == "ResistanceAttribute" then
            for j = #it[i], 1, -1 do
                item1.ResistanceAttribute[it[i][j].Type].Value = it[i][j].Value
            end
        end
    end
    return item1
end
-- 装备冠名
function RandomAttribute:AddItemNaming(item1)
    local i1 = math.random(1, table.getn(Naming.Items))
    local it = Naming.Items[i1]
    for i = #it, 1, -1 do
        if it[i].Type == "BasicsInformation" then
            for j = #it[i], 1, -1 do
                if it[i][j].Type == "Name" then
                    item1.BasicsInformation[it[i][j].Type].Value =
                        it[i][j].Value ..
                            item1.BasicsInformation[it[i][j].Type].Value
                end

            end
        end
        if it[i].Type == "ExtendAttribute" then
            for j = #it[i], 1, -1 do
                item1.ExtendAttribute[it[i][j].Type].Value =
                    it[i][j].Value + item1.ExtendAttribute[it[i][j].Type].Value
            end
        end
        if it[i].Type == "BasicsAttribute" then
            for j = #it[i], 1, -1 do
                item1.BasicsAttribute[it[i][j].Type].Value =
                    it[i][j].Value + item1.BasicsAttribute[it[i][j].Type].Value
            end
        end
        if it[i].Type == "ResistanceAttribute" then
            for j = #it[i], 1, -1 do
                item1.ResistanceAttribute[it[i][j].Type].Value =
                    it[i][j].Value +
                        item1.ResistanceAttribute[it[i][j].Type].Value
            end
        end
    end
    return item1
end

-- 添加前缀
function RandomAttribute:AddItemPrefix(item1)
    local i = math.random(1, table.getn(MixedAttributeData.Items))
    local it = MixedAttributeData.Items[i]
    for i = #it, 1, -1 do
        if it[i].Type == "BasicsInformation" then
            for j = #it[i], 1, -1 do
                if it[i][j].Type == "Name" then
                    item1.BasicsInformation[it[i][j].Type].Value =
                        it[i][j].Value ..
                            item1.BasicsInformation[it[i][j].Type].Value
                    item1.BasicsInformation["词缀"].Value = it[i][j].Value
                end

            end
        end
        if it[i].Type == "ExtendAttribute" then
            for j = #it[i], 1, -1 do
                item1.ExtendAttribute[it[i][j].Type].Value =
                    it[i][j].Value + item1.ExtendAttribute[it[i][j].Type].Value
            end
        end
        if it[i].Type == "BasicsAttribute" then
            for j = #it[i], 1, -1 do
                item1.BasicsAttribute[it[i][j].Type].Value =
                    it[i][j].Value + item1.BasicsAttribute[it[i][j].Type].Value
            end
        end
        if it[i].Type == "ResistanceAttribute" then
            for j = #it[i], 1, -1 do
                item1.ResistanceAttribute[it[i][j].Type].Value =
                    it[i][j].Value +
                        item1.ResistanceAttribute[it[i][j].Type].Value
            end
        end
    end
    return item1
end
-- 附加词缀
function RandomAttribute:AddItemOtherPrefix(item1)
    local i = math.random(1, table.getn(MixedAttributeData.Items))
    local it = MixedAttributeData.Items[i]
    for i = #it, 1, -1 do
        if it[i].Type == "BasicsInformation" then
            for j = #it[i], 1, -1 do
                if it[i][j].Type == "词缀" then
                    item1.BasicsInformation[it[i][j].Type].Value =
                        it[i][j].Value .. "  " ..
                            item1.BasicsInformation[it[i][j].Type].Value
                end

            end
            for j = #it[i], 1, -1 do
                if it[i][j].Type == "Name" then
                    item1.BasicsInformation["词缀"].Value =
                        it[i][j].Value .. "  " ..
                            item1.BasicsInformation["词缀"].Value
                end

            end
        end
        if it[i].Type == "ExtendAttribute" then
            for j = #it[i], 1, -1 do
                item1.ExtendAttribute[it[i][j].Type].Value =
                    it[i][j].Value + item1.ExtendAttribute[it[i][j].Type].Value
            end
        end
        if it[i].Type == "BasicsAttribute" then
            for j = #it[i], 1, -1 do
                item1.BasicsAttribute[it[i][j].Type].Value =
                    it[i][j].Value + item1.BasicsAttribute[it[i][j].Type].Value
            end
        end
        if it[i].Type == "ResistanceAttribute" then
            for j = #it[i], 1, -1 do
                item1.ResistanceAttribute[it[i][j].Type].Value =
                    it[i][j].Value +
                        item1.ResistanceAttribute[it[i][j].Type].Value
            end
        end
    end
    return item1
end
-- 设置装备等级
function RandomAttribute:SetItemsLevel(item1, l)
    local si = math.random(l - 2, l + 3)
    local i = (si / 3 + 1) * 0.3
    -- 设置基础属性
    item1.BasicsInformation["等级"].Value = l
    local Factory = Factory:Instance()
    for j = #Factory.BasicsAttributedecoded, 1, -1 do
        -- item1.BasicsAttribute[Factory.BasicsAttributedecoded[j].Name].Value =
        --     math.floor(item1.BasicsAttribute[Factory.BasicsAttributedecoded[j].Name].Value * i)
        if item1.BasicsAttribute[Factory.BasicsAttributedecoded[j].Name].Name ==
            "移动速度" or
            item1.BasicsAttribute[Factory.BasicsAttributedecoded[j].Name].Name ==
            "攻击速度" then
            item1.BasicsAttribute[Factory.BasicsAttributedecoded[j].Name].Value =
                math.floor(
                    item1.BasicsAttribute[Factory.BasicsAttributedecoded[j].Name]
                        .Value * i / 3)
        else
            -- statements
            item1.BasicsAttribute[Factory.BasicsAttributedecoded[j].Name].Value =
                math.floor(
                    item1.BasicsAttribute[Factory.BasicsAttributedecoded[j].Name]
                        .Value * i)
        end

    end
    for j = #Factory.ExtendAttributedecoded, 1, -1 do
        item1.ExtendAttribute[Factory.ExtendAttributedecoded[j].Name].Value =
            math.floor(item1.ExtendAttribute[Factory.ExtendAttributedecoded[j]
                           .Name].Value * i)
    end
    for j = #Factory.ResistanceAttributedecoded, 1, -1 do
        item1.ResistanceAttribute[Factory.ResistanceAttributedecoded[j].Name]
            .Value = math.floor(
                         item1.ResistanceAttribute[Factory.ResistanceAttributedecoded[j]
                             .Name].Value * i)
    end
end
-- 添加技能
function RandomAttribute:RandomSkill(item1)
    local n = math.random(1, 100)
    if n < 100 then
        -- statements
        local SM = SkillManager:Instance()
        local s = SM:RandomSkill()
        table.insert(item1.SkillList, s)
    end
end
---------------
return RandomAttribute

-- m = RandomAttribute:Instance()
-- local n1 = 0
-- local n2 = 0
-- local n3 = 0
-- local n4 = 0
-- local n5 = 0
-- local n6 = 0
-- for i = 1000, 1, -1 do
--     -- statements
--     local item1 = m:CreateItem(0.5, 100)
--     if item1.BasicsInformation["品质"].Value == "普通" then
--         n1 = n1 + 1
--     elseif item1.BasicsInformation["品质"].Value == "精良" then
--         -- 掉落优秀2000
--         n2 = n2 + 1
--     elseif item1.BasicsInformation["品质"].Value == "优秀" then
--         -- 掉落优秀2000
--         n3 = n3 + 1
--     elseif item1.BasicsInformation["品质"].Value == "稀有" then
--         -- 掉落优秀2000
--         n4 = n4 + 1
--     elseif item1.BasicsInformation["品质"].Value == "史诗" then
--         -- 掉落优秀2000
--         n5 = n5 + 1
--     else
--         n6 = n6 + 1
--     end
--     print(item1.BasicsInformation["Name"].Value)
--     -- print(item1.BasicsInformation["词缀"].Value)
--     -- print(item1.BasicsInformation["等级"].Value)
--     print("攻击力" .. item1.BasicsAttribute["攻击力"].Value)
-- end
-- print("n1" .. n1)
-- print("n2" .. n2)
-- print("n3" .. n3)
-- print("n4" .. n4)
-- print("n5" .. n5)
-- print("n6" .. n6)
