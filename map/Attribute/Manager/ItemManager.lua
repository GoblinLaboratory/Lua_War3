require "math"
require "Global"
json = require "Lib\\Json\\json"
require "Attribute\\ItemAttribute"
require "Attribute\\RandomAttribute"
require "Attribute\\Factory"
-- 装备管理器
ItemsType = {
    "主手武器1", "副手武器2", "头部装备3", "胸部装备4",
    "腰部装备5", "腿部装备6", "手部装备7", "脚部装备8",
    "项链9", "戒指10", "披风11"
}
-- 装备系统
ItemManager = {
    -- 装备ID列表
    ItemIDList = {},
    -- 使用中的ID
    UseItemIDList = {},
    Item_Dota = 0,
    -- 生成的装备库.itme表
    Dota = {},
    -- 图标
    Item_TuBiao = 0,
    RandomAttributepeSystem = {}
}

function ItemManager:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.RandomAttributepeSystem = RandomAttribute:Instance()
    self:Int()
    return o
end
ItemManager.__index = ItemManager
-- 单件模式
function ItemManager:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end
-- 初始化物品池
function ItemManager:Int()
    local x = "ZB00"
    for i = 0, 899 do
        table.insert(self.ItemIDList, Global:GetId(x))
        x = Global:GetNextStrId(x)
    end
    -- self.Item_TuBiao = Picture:Instance()
end

-- 从物品池获得一个物品ID
function ItemManager:GetEquipment()
    local n = #self.ItemIDList
    local s = #self.UseItemIDList

    table.insert(self.UseItemIDList, self.ItemIDList[n])
    -- 删除最后一个元素
    table.remove(self.ItemIDList)

    return self.UseItemIDList[s + 1]
end
-- 将回收的物品ID加入物品池
function ItemManager:SetEquipment(num1)
    local count = 0
    for i = #self.ItemIDList, 1, -1 do
        if self.ItemIDList[i] == num1 then count = 1 end
    end
    if count == 0 then table.insert(self.ItemIDList, num1) end
    ------------------------------------
    for i = #self.UseItemIDList, 1, -1 do
        if self.UseItemIDList[i] == num1 then
            table.remove(self.UseItemIDList, i)
        end
    end
end
-- 根据物品ID获得物品数据
function ItemManager:GetItemDota(num1)
    for i = #self.Dota, 1, -1 do
        if self.Dota[i].ID == num1 then return self.Dota[i] end
    end
    return 0
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
-- 创建随机物品
-- 参数 lucky:物品爆率, level:装备等级
function ItemManager:CreateItemDota(lucky, level)
    local item1 = self.RandomAttributepeSystem:CreateItem(lucky, level)
    item1.ID = self:GetEquipment()

    table.insert(self.Dota, item1)
    return item1
end
-- 创建物品
function ItemManager:CreateAppointItem(xd)
    local Factory = Factory:Instance()
    local item1 = Factory:clone(xd)
    item1.ID = self:GetEquipment()
    table.insert(self.Dota, item1)
    return item1
end
-- 获取名字
-- 获取物品名称
function ItemManager:GetName(item1)
    local Ys = " "
    if (item1.BasicsInformation["品质"].Value == "普通") then
        -- 灰|cffC0C0C0r
        Ys = "|cffC0C0C0"
    elseif (item1.BasicsInformation["品质"].Value == "精良") then
        -- 白
        Ys = "|cffFFFFFF"
    elseif (item1.BasicsInformation["品质"].Value == "优秀") then
        -- 绿
        Ys = "|cff00FF00"
    elseif (item1.BasicsInformation["品质"].Value == "稀有") then
        -- 蓝
        Ys = "|c000000FF"
    elseif (item1.BasicsInformation["品质"].Value == "史诗") then
        -- 紫
        Ys = "|c77700077"
    elseif (item1.BasicsInformation["品质"].Value == "传说") then
        -- 橙
        Ys = "|cffFF7D36"
    elseif (item1.BasicsInformation["品质"].Value == "远古") then
        -- 青
        Ys = "|c000EEEEE"
    elseif (item1.BasicsInformation["品质"].Value == "不朽") then
        -- 金
        Ys = "|cffFFD700"
    elseif (item1.BasicsInformation["品质"].Value == "神器") then
        -- 红
        Ys = "|cFFF00000"
    end
    local Ep = Ys .. item1.BasicsInformation["Name"].Value .. "(" ..
                   item1.BasicsInformation["品质"].Value .. ")" .. "|r"
    return Ep
end
-- 获取说明
function ItemManager:GetExplain(item1)
    local Ys = " "
    if (item1.BasicsInformation["品质"].Value == "普通") then
        -- 灰|cffC0C0C0r
        Ys = "|cffC0C0C0"
    elseif (item1.BasicsInformation["品质"].Value == "精良") then
        -- 白
        Ys = "|cffFFFFFF"
    elseif (item1.BasicsInformation["品质"].Value == "优秀") then
        -- 绿
        Ys = "|cff00FF00"
    elseif (item1.BasicsInformation["品质"].Value == "稀有") then
        -- 蓝
        Ys = "|c000000FF"
    elseif (item1.BasicsInformation["品质"].Value == "史诗") then
        -- 紫
        Ys = "|c77700077"
    elseif (item1.BasicsInformation["品质"].Value == "传说") then
        -- 橙
        Ys = "|cffFF7D36"
    elseif (item1.BasicsInformation["品质"].Value == "远古") then
        -- 青
        Ys = "|c000EEEEE"
    elseif (item1.BasicsInformation["品质"].Value == "不朽") then
        -- 金
        Ys = "|cffFFD700"
    elseif (item1.BasicsInformation["品质"].Value == "神器") then
        -- 红
        Ys = "|cFFF00000"
    end
    local Ep = "" -- "|n"
    -- 物品等级
    Ep = Ep .. "|cffcc99ff" .. "物品等级" .. "   " ..
             tostring(item1.BasicsInformation["等级"].Value) .. "      " ..
             item1.BasicsInformation["Types"].Value .. "|r|n"
    -- 添加攻击力
    if (item1.BasicsAttribute["攻击力"].Value ~= 0) then
        Ep = Ep .. "提升" .. item1.BasicsAttribute["攻击力"].Value ..
                 "点攻击力" .. "|n"
    end
    if (item1.BasicsAttribute["法术强度"].Value ~= 0) then
        Ep = Ep .. "提升" .. item1.BasicsAttribute["法术强度"].Value ..
                 "点法术强度" .. "|n"
    end
    -- 添加护甲
    if (item1.BasicsAttribute["护甲"].Value ~= 0) then
        Ep = Ep .. "提升" .. item1.BasicsAttribute["护甲"].Value ..
                 "点护甲" .. "|n"
    end
    -- 添加属性
    local Attribute = false
    if (item1.ExtendAttribute["力量"].Value ~= 0) then
        Ep =
            Ep .. "|cffffff00" .. "+" .. item1.ExtendAttribute["力量"].Value ..
                "力量" .. "|r" .. "   "
        Attribute = true
    end
    if (item1.ExtendAttribute["敏捷"].Value ~= 0) then
        Ep =
            Ep .. "|cffffff00" .. "+" .. item1.ExtendAttribute["敏捷"].Value ..
                "敏捷" .. "|r" .. "   "
        Attribute = true
    end
    if (item1.ExtendAttribute["智力"].Value ~= 0) then
        Ep =
            Ep .. "|cffffff00" .. "+" .. item1.ExtendAttribute["智力"].Value ..
                "智力" .. "|r" .. "   "
        Attribute = true
    end
    if Attribute == true then Ep = Ep .. "|n" end
    -- 添加混合属性
    local UAttribute = false
    -- 生命值
    if (item1.BasicsAttribute["生命值"].Value ~= 0) then
        Ep = Ep .. "|cffffff00" .. "+" ..
                 item1.BasicsAttribute["生命值"].Value .. "点生命值" ..
                 "|r" .. "   "
        UAttribute = true
    end
    -- 魔法值
    if (item1.BasicsAttribute["魔法值"].Value ~= 0) then
        Ep = Ep .. "|cffffff00" .. "增加" ..
                 item1.BasicsAttribute["魔法值"].Value .. "点魔法值" ..
                 "|r" .. "   "
        UAttribute = true
    end
    if UAttribute == true then Ep = Ep .. "|n" end
    -- 添加魔法抗性
    if (item1.BasicsAttribute["魔法抗性"].Value ~= 0) then
        Ep = Ep .. "|cffcc99ff" .. "增加" ..
                 item1.BasicsAttribute["魔法抗性"].Value .. "%魔法抗性" ..
                 "|r|n"
    end
    -- 添加生命恢复速度
    if (item1.BasicsAttribute["生命回复速度"].Value ~= 0) then
        Ep = Ep .. "|cffcc99ff" .. "增加" ..
                 item1.BasicsAttribute["生命回复速度"].Value ..
                 "点每秒生命回复速度" .. "|r|n"
    end
    -- 添加魔法恢复速度
    if (item1.BasicsAttribute["魔法回复速度"].Value ~= 0) then
        Ep = Ep .. "|cffcc99ff" .. "增加" ..
                 item1.BasicsAttribute["魔法回复速度"].Value ..
                 "%魔法回复速度" .. "|r|n"
    end
    -- 增加攻击速度
    if (item1.BasicsAttribute["攻击速度"].Value ~= 0) then
        Ep = Ep .. "|cffcc99ff" .. "增加" ..
                 item1.BasicsAttribute["攻击速度"].Value ..
                 "点攻击速度" .. "|r|n"
    end
    -- 增加移动速度
    if (item1.BasicsAttribute["移动速度"].Value ~= 0) then
        Ep = Ep .. "|cffcc99ff" .. "增加" ..
                 item1.BasicsAttribute["移动速度"].Value ..
                 "点移动速度" .. "|r|n"
    end
    local UUAttribute = false
    -- 格挡
    if (item1.BasicsAttribute["格挡"].Value ~= 0) then
        Ep = Ep .. "|cffffff00" .. "提升" ..
                 item1.BasicsAttribute["格挡"].Value .. "点格挡几率。" ..
                 "|r" .. "   "
        UUAttribute = true
    end
    -- 闪避
    if (item1.BasicsAttribute["闪避"].Value ~= 0) then
        Ep = Ep .. "|cffffff00" .. "提升" ..
                 item1.BasicsAttribute["闪避"].Value .. "点闪避几率。" ..
                 "|r" .. "   "
        UUAttribute = true
    end
    if UUAttribute == true then Ep = Ep .. "|n" end
    -- 防御属性
    -- 增加伤害减免
    if (item1.ResistanceAttribute["伤害减免"].Value ~= 0) then
        Ep = Ep .. "|cffcc99ff" .. "降低" ..
                 item1.ResistanceAttribute["伤害减免"].Value ..
                 "点所受伤害。" .. "|r|n"
    end
    -- 增加物理伤害吸收
    if (item1.ResistanceAttribute["物理伤害吸收"].Value ~= 0) then
        Ep = Ep .. "|cffcc99ff" .. "降低" ..
                 item1.ResistanceAttribute["物理伤害吸收"].Value ..
                 "点所受物理伤害。" .. "|r|n"
    end
    -- 增加物理伤害吸收
    if (item1.ResistanceAttribute["法术伤害吸收"].Value ~= 0) then
        Ep = Ep .. "|cffcc99ff" .. "降低" ..
                 item1.ResistanceAttribute["法术伤害吸收"].Value ..
                 "点所受魔法伤害。" .. "|r|n"
    end
    -- 技能
    for i = #item1.SkillList, 1, -1 do
        -- statements
        Ep = Ep .. "|cffffff00" .. item1.SkillList[i]:GetExplain() .. "|r" ..
                 "   "
    end
    Ep = Ep .. "|n"
    return Ep
end
function ItemManager:GetIcon(item1)
    -- statements
    return item1.BasicsInformation["图标"].Value
end
return ItemManager
-- test
-- myshape = ItemManager:Instance()
-- for i = 100, 1, -1 do
--     -- statements
--     local item1 = myshape:CreateItemDota(200000, i)
--     print(myshape:GetName(item1))
--     print(myshape:GetExplain(item1))
--     --print(item1.AttackEffects["吸血"].Name)
-- end
