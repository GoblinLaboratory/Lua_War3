require "Item"
require "math"
require "Global"
require "ItemDota"
require "Picture"
local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"

-- 装备系统
ItemManager = {
    -- 物品池
    ItemList = {},
    -- 使用中
    UseItemList = {},
    Item_Dota = 0,
    -- 物品数据
    Dota = {},

    Item_TuBiao = 0
}

function ItemManager:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self

    -- self:Int() 

    -- math.randomseed(tostring(os.time()):reverse():sub(1, 7))
    return o
end
ItemManager.__index = ItemManager
function ItemManager:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end

-- 初始化
function ItemManager:Int()
    local x = "ZB00"
    for i = 0, 899 do
        table.insert(self.ItemList, Global:GetId(x))
        x = Global:GetNextStrId(x)

    end
    math.randomseed(tostring(os.time()):reverse():sub(1, 7))
    CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, "物品系统加载完毕。")
    self.Item_TuBiao = Picture:Instance()
    -- self.Item_Dota:Int()
end

-- 从物品池获得一个物品ID
function ItemManager:GetEquipment()
    local n = #self.ItemList
    local s = #self.UseItemList

    table.insert(self.UseItemList, self.ItemList[n])
    table.remove(self.ItemList)

    return self.UseItemList[s + 1]
    -- return Global:GetId(self.UseItemList[s+1]) 
end

-- 将物品ID加入物品池
function ItemManager:SetEquipment(num1)
    local count = 0
    for i = #self.ItemList, 1, -1 do
        if self.ItemList[i] == num1 then count = 1 end
    end
    if count == 0 then table.insert(self.ItemList, num1) end
    ------------------------------------
    for i = #self.UseItemList, 1, -1 do
        if self.UseItemList[i] == num1 then
            table.remove(self.UseItemList, i)
        end
    end
end

-- 根据物品ID获得物品数据
function ItemManager:GetItemDota(num1)
    print("参数 = " .. "   " .. tostring(num1))
    local s = #self.Dota
    -- local x 
    print("Dota" .. "   " .. tostring(s))
    for i = #self.Dota, 1, -1 do
        if self.Dota[i].ID == num1 then return self.Dota[i] end
    end
    return 0
end

----------------
-- 随机属性系统
-----------------

-- 设置物品等级
function ItemManager:SetItemlevel(item1, level)
    local l = level / 60
    local z = 1 + math.random(10, 25) / 100

    local xszd1 = 0

    if (item1.PinZhi == "普通") then
        xszd1 = math.random(0, 2)
    elseif (item1.PinZhi == "优秀") then
        xszd1 = math.random(1, 3)
    elseif (item1.PinZhi == "精良") then
        xszd1 = math.random(2, 4)
    elseif (item1.PinZhi == "史诗") then
        xszd1 = math.random(3, 5)
    elseif (item1.PinZhi == "神器") then
        xszd1 = math.random(4, 6)
    end
    local xszd = Global:getIntPart(level / 5 + xszd1)

    item1.Level = level

    item1.Attributes:Level(xszd)

end

-- 获取物品名称
function ItemManager:GetName(item1)
    local Ys = " "
    if (item1.Uis.Quality == "普通") then
        Ys = "|cffccffff"
    elseif (item1.Uis.Quality == "优秀") then
        Ys = "|cffffff00"
    elseif (item1.Uis.Quality == "精良") then
        Ys = "|cffcc99ff"
    elseif (item1.Uis.Quality == "史诗") then
        Ys = "|cff0000ff"
    elseif (item1.Uis.Quality == "神器") then
        Ys = "|cffff6800"
    end
    local Ep = Ys .. item1.Uis.Name .. "|r"
    return Ep
end

-- 获取说明
function ItemManager:GetExplain(item1)
    local Ys = " "
    if (item1.Uis.Quality == "普通") then
        Ys = "|cffccffff"
        -- CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, "1")
    elseif (item1.Uis.Quality == "优秀") then
        Ys = "|cffffff00"
        -- CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, "2")
    elseif (item1.Uis.Quality == "精良") then
        Ys = "|cffcc99ff"
        -- CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, "3")
    elseif (item1.Uis.Quality == "史诗") then
        Ys = "|cff0000ff"
    elseif (item1.Uis.Quality == "神器") then
        Ys = "|cffff6800"
    end
    local Ep = ""
    Ep = Ep .. "|cffcc99ff" .. tostring(item1.Uis.Types) .. "   " ..
             "物品等级" .. "   " .. tostring(item1.Level) .. "|r" .. "   "

    -- Ep = Ep.."ID:"..item1.ID.."|n"
    Ep = Ep .. Ys .. item1.Uis.Quality .. "|r|n"

    if (item1.Attributes.AttackValue ~= 0) then
        Ep =
            Ep .. "提升" .. item1.Attributes.AttackValue .. "点攻击力。" ..
                "|n"
    end
    if (item1.Attributes.MagicAttackIntensity ~= 0) then
        Ep = Ep .. "提升" .. item1.Attributes.MagicAttackIntensity ..
                 "点法术强度。" .. "|n"
    end
    if (item1.Attributes.Armor ~= 0) then
        Ep = Ep .. "提升" .. item1.Attributes.Armor .. "点护甲。" .. "|n"
    end
    if (item1.Attributes.MagicResistance ~= 0) then
        Ep = Ep .. "提升" .. item1.Attributes.MagicResistance ..
                 "点魔法抗性。" .. "|n"
    end

    if (item1.Attributes.Power ~= 0) then
        Ep = Ep .. "增加" .. item1.Attributes.Power .. "点力量。" .. "|n"
    end
    if (item1.Attributes.Agile ~= 0) then
        Ep = Ep .. "增加" .. item1.Attributes.Agile .. "点敏捷。" .. "|n"
    end
    if (item1.Attributes.Intelligence ~= 0) then
        Ep =
            Ep .. "增加" .. item1.Attributes.Intelligence .. "点智力。" ..
                "|n"
    end

    Ep = Ep .. "|cffffff00"
    if (item1.Attributes.LifeValue ~= 0) then
        Ep = Ep .. "增加" .. item1.Attributes.LifeValue .. "点生命。" ..
                 "|n"
    end

    if (item1.Attributes.MagicValue ~= 0) then
        Ep =
            Ep .. "增加" .. item1.Attributes.MagicValue .. "点魔法值。" ..
                "|n"
    end

    if (item1.Attributes.LifeRecoverySpeed ~= 0) then
        Ep = Ep .. "增加" .. item1.Attributes.LifeRecoverySpeed ..
                 "点的生命值恢复速度。" .. "|n"
    end

    if (item1.Attributes.MagicRecoverySpeed ~= 0) then
        Ep = Ep .. "增加" ..
                 tostring(item1.Attributes.MagicRecoverySpeed * 100) ..
                 "%的魔法值恢复速度。" .. "|n"
    end

    if (item1.Attributes.AttackSpeed ~= 0) then
        Ep = Ep .. "增加" .. tostring(item1.Attributes.AttackSpeed * 100) ..
                 "%攻击速度。" .. "|n"
    end
    if (item1.Attributes.MovingSpeed ~= 0) then
        Ep = Ep .. "增加" .. item1.Attributes.MovingSpeed ..
                 "点移动速度。" .. "|n"
    end

    if (item1.Attributes.Dodge ~= 0) then
        Ep = Ep .. "增加" .. tostring(item1.Attributes.Dodge * 100) ..
                 "%闪避。" .. "|n"
    end

    if (item1.Attributes.Block ~= 0) then
        Ep = Ep .. "增加" .. tostring(item1.Attributes.Block * 100) ..
                 "%格挡。" .. "|n"
    end

    if (item1.Attributes.MagicCriticismIntensity ~= 0) then
        Ep = Ep .. "增加" .. item1.Attributes.MagicCriticismIntensity ..
                 "点法术暴击强度。" .. "|n"
    end
    if (item1.Attributes.MagicCriticalHitProbability ~= 0) then
        Ep = Ep .. "增加" ..
                 tostring(item1.Attributes.MagicCriticalHitProbability * 100) ..
                 "%法术暴击几率。" .. "|n"
    end

    if (item1.Attributes.AttackCriticismIntensity ~= 0) then
        Ep = Ep .. "增加" .. item1.Attributes.AttackCriticismIntensity ..
                 "点攻击暴击强度。" .. "|n"
    end
    if (item1.Attributes.CriticalHitProbability ~= 0) then
        Ep = Ep .. "增加" ..
                 tostring(item1.Attributes.CriticalHitProbability * 100) ..
                 "%攻击暴击几率。" .. "|n"
    end

    if (item1.Attributes.PhysicalInjuryRelief ~= 0) then
        Ep = Ep .. "增加" ..
                 tostring(item1.Attributes.PhysicalInjuryRelief * 100) ..
                 "%普通伤害减免。" .. "|n"
    end
    if (item1.Attributes.MagicInjuryRelief ~= 0) then
        Ep = Ep .. "增加" ..
                 tostring(item1.Attributes.MagicInjuryRelief * 100) ..
                 "%魔法伤害减免。" .. "|n"
    end
    if (item1.Attributes.InjuryRelief ~= 0) then
        Ep = Ep .. "增加" .. tostring(item1.Attributes.InjuryRelief * 100) ..
                 "%伤害减免。" .. "|n"
    end

    if (item1.Attributes.AttackBloodSucking ~= 0) then
        Ep = Ep .. "增加" ..
                 tostring(item1.Attributes.AttackBloodSucking * 100) ..
                 "%攻击吸血。" .. "|n"
    end
    if (item1.Attributes.MagicBloodSucking ~= 0) then
        Ep = Ep .. "增加" ..
                 tostring(item1.Attributes.MagicBloodSucking * 100) ..
                 "%法术吸血。" .. "|n"
    end
    Ep = Ep .. "|r|n"
    -- Ep = Ep..Ys.."自定义"..item1.ZiDingYi.."|r|n"
    -- Ep = Ep.."————————————".."|n"
    -- 附魔
    if item1.Enchantments ~= 0 then
        Ep = Ep .. "|cff00ff00"
        Ep = Ep .. "附魔：无|n"
        Ep = Ep .. "附魔：无"
        Ep = Ep .. "|r|n"
    end

    --
    -- 宝石
    if item1.Hole ~= 0 then
        Ep = Ep .. "|cff993366"
        Ep = Ep .. "孔：无|n"
        Ep = Ep .. "孔：无|n"
        Ep = Ep .. "孔：无|n"
        Ep = Ep .. "孔：无"
        Ep = Ep .. "|r|n"
    end

    --
    Ep = Ep .. item1.Uis.Explain

    return Ep
end
----------------------------
-- 创建物品
function ItemManager:CreateItem(l)

    local item1 = Item:new()
    -- local item1 = {}
    -- setmetatable(item1,Item) 
    item1:Int()
    item1.Uis.Name = ItemDota[l].name
    item1.Uis.Types = ItemDota[l].Types

    item1.Uis.Custom = ItemDota[l].ZiDingYi
    item1.Uis.Explain = ItemDota[l].Explain

    -- item1.Attributes.Power = ItemDota[l].Power
    item1.Attributes:Set(ItemDota[l])

    return item1
end
-- 添加属性
function ItemManager:AddItemAttribute(item1, l)
    item1.Attributes:Add(ItemDota[l])
    return item1
end
-- 创建随机物品
function ItemManager:CreateRandomItem(level)
    local Rn = math.random(1, 2000)
    -- local Rn =5
    -- 装备类型11种
    local x1 = math.random(1, 11)
    local x2 = math.random(1, 30)
    local x3 = math.random(1, 50)
    local x4 = math.random(1, 50)
    local l = 10000 + x1 * 100 + x2
    -- 创建随机物品
    local item1 = self:CreateItem(l)
    -- 设置物品ID
    item1.ID = self:GetEquipment()
    -- 添加物品数据
    table.insert(self.Dota, item1)

    if (0 <= Rn and Rn <= 10) then
        -- 添加装备品质
        item1.Uis.Quality = "神器"
        -- 添加前缀
        item1.Uis.Name = ItemDota[x3].name .. item1.Uis.Name
        self:AddItemAttribute(item1, x3)
        -- 添加后缀
        self:AddItemAttribute(item1, math.random(1, 50))
        self:AddItemAttribute(item1, math.random(1, 50))
        self:AddItemAttribute(item1, math.random(1, 50))
        self:AddItemAttribute(item1, math.random(1, 50))
    elseif (10 <= Rn and Rn <= 50) then
        -- 添加装备品质 
        item1.Uis.Quality = "史诗"
        -- 添加前缀
        item1.Uis.Name = ItemDota[x3].name .. item1.Uis.Name
        self:AddItemAttribute(item1, x3)
        -- 添加后缀
        self:AddItemAttribute(item1, math.random(1, 50))
        self:AddItemAttribute(item1, math.random(1, 50))
        self:AddItemAttribute(item1, math.random(1, 50))
    elseif (50 <= Rn and Rn <= 150) then
        -- 添加装备品质  
        item1.Uis.Quality = "精良"
        -- 添加前缀
        item1.Uis.Name = ItemDota[x3].name .. item1.Uis.Name
        self:AddItemAttribute(item1, x3)
        -- 添加后缀
        self:AddItemAttribute(item1, math.random(1, 50))
        self:AddItemAttribute(item1, math.random(1, 50))
    elseif (150 <= Rn and Rn <= 600) then
        -- 添加装备品质
        item1.Uis.Quality = "优秀"
        -- 添加前缀
        item1.Uis.Name = ItemDota[x3].name .. item1.Uis.Name
        self:AddItemAttribute(item1, x3)
        -- 添加后缀
        self:AddItemAttribute(item1, math.random(1, 50))
    else
        -- 添加装备品质
        item1.Uis.Quality = "普通"
        -- 添加前缀
        item1.Uis.Name = ItemDota[x3].name .. item1.Uis.Name
        self:AddItemAttribute(item1, x3)

    end
    -- 添加图标
    local sj = #self.Item_TuBiao.TuBiao[item1.Uis.Types] - 1
    item1.Uis.Art = self.Item_TuBiao.TuBiao[item1.Uis.Types][math.random(1, sj)]

    -- 设置物品等级
    self:SetItemlevel(item1, level)
    -- 属性过滤
    -- self:ItemAttributeFilter(item1)  
    return item1
end

-- 删除指定物品
function ItemManager:RemoveAppointItem(item)
    self:SetEquipment(item.ID)
    for i = #self.Dota, 1, -1 do
        if self.Dota[i].ID == item.ID then table.remove(self.Dota, i) end
    end
end
-- 删除指定ID物品
function ItemManager:RemoveAppointIDItem(ID)
    self:SetEquipment(ID)
    for i = #self.Dota, 1, -1 do
        if self.Dota[i].ID == ID then table.remove(self.Dota, i) end
    end
end

-- 创建指定物品
function ItemManager:CreateAppointItem(item2)

    local item1 = Item:new()
    item1:Int()
    -- 设置数据
    item1.Attributes:Set(item2.Attributes)
    item1.Uis:Set(item2.Uis)

    item1.ID = self:GetEquipment()
    item1.Level = item2.Level
    table.insert(self.Dota, item1)

    return item1
end
return ItemManager
