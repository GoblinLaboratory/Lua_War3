require "ECS\\Model\\Factory"
require "ECS\\Model\\Maths"
require "ECS\\Model\\RandomWeaponry"
require "ECS\\Global"
WeaponryManager = {
    -- 装备ID列表
    IDList = {},
    -- 使用中的ID
    UseIDList = {},
    -- 生成的装备库.itme表
    Dota = {}
}
function WeaponryManager:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    --
    --self:Int()
    o:Int()
    --
    return o
end

WeaponryManager.__index = WeaponryManager

-- 单件模式
function WeaponryManager:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end
-------------------------------------
-- 初始化物品池
function WeaponryManager:Int()
    local x = "ZB00"
    for i = 0, 899 do
        table.insert(self.IDList, Maths.GetId(x))
        x = Maths.GetNextStrId(x)
        -- Global.Log(i)
    end
end
-- 从物品池获得一个物品ID
function WeaponryManager:GetEquipment()
    local n = #self.IDList
    local s = #self.UseIDList

    table.insert(self.UseIDList, self.IDList[n])
    -- 删除最后一个元素
    table.remove(self.IDList)

    return self.UseIDList[s + 1]
end
-- 将回收的物品ID加入物品池
function WeaponryManager:SetEquipment(num1)
    local count = 0
    for i = #self.IDList, 1, -1 do
        if self.IDList[i] == num1 then count = 1 end
    end
    if count == 0 then table.insert(self.IDList, num1) end
    ------------------------------------
    for i = #self.UseIDList, 1, -1 do
        if self.UseIDList[i] == num1 then table.remove(self.UseIDList, i) end
    end
end
-- 根据物品ID获得物品数据
function WeaponryManager:GetDota(num1)
    for i = #self.Dota, 1, -1 do
        if self.Dota[i].ID == num1 then return self.Dota[i] end
    end
    return 0
end
-- 删除指定物品
function WeaponryManager:Remove(item)
    self:SetEquipment(item.ID)
    for i = #self.Dota, 1, -1 do
        if self.Dota[i].ID == item.ID then table.remove(self.Dota, i) end
    end
end
-- 删除指定ID物品
function WeaponryManager:RemoveID(ID)
    self:SetEquipment(ID)
    for i = #self.Dota, 1, -1 do
        if self.Dota[i].ID == ID then table.remove(self.Dota, i) end
    end
end
-- 创建随机物品
-- 参数 lucky:物品爆率, level:装备等级
function WeaponryManager:CreateItemDota(lucky, level)
    local item1 = RandomWeaponry.CreateWeaponry(lucky, level)
    item1.ID = self:GetEquipment()

    table.insert(self.Dota, item1)
    return item1
end
-- -- 创建物品
function WeaponryManager:CreateAppointItem(xd)
    local item1 = Global.clone(xd)
    item1.ID = self:GetEquipment()
    table.insert(self.Dota, item1)
    return item1
end
-- 获取名字
-- 获取物品名称
function WeaponryManager:GetName(items1)
    local Ys = " "
    if (items1["Weaponry"]["品质"].Value == "普通") then
        -- 灰|cffC0C0C0r
        Ys = "|cffC0C0C0"
    elseif (items1["Weaponry"]["品质"].Value == "精良") then
        -- 白
        Ys = "|cffFFFFFF"
    elseif (items1["Weaponry"]["品质"].Value == "优秀") then
        -- 绿
        Ys = "|cff00FF00"
    elseif (items1["Weaponry"]["品质"].Value == "稀有") then
        -- 蓝
        Ys = "|c000000FF"
    elseif (items1["Weaponry"]["品质"].Value == "史诗") then
        -- 紫
        Ys = "|c77700077"
    elseif (items1["Weaponry"]["品质"].Value == "传说") then
        -- 橙
        Ys = "|cffFF7D36"
    elseif (items1["Weaponry"]["品质"].Value == "远古") then
        -- 青
        Ys = "|c000EEEEE"
    elseif (items1["Weaponry"]["品质"].Value == "不朽") then
        -- 金
        Ys = "|cffFFD700"
    elseif (items1["Weaponry"]["品质"].Value == "神器") then
        -- 红
        Ys = "|cFFF00000"
    end
    local Ep = Ys .. items1["Base"]["Name"].Value .. "(" ..
                   items1["Weaponry"]["品质"].Value .. ")" .. "|r"
    return Ep
end
-- 获取说明
function WeaponryManager:GetExplain(item1)
    local Ep = "" -- "|n"
    -- 物品等级
    Ep = Ep .. "|cffcc99ff" .. "物品等级" .. "   " ..
             tostring(item1["Base"]["等级"].Value) .. "      " ..
             item1["Base"]["Types"].Value .. "|r|n"
    -- 添加攻击力
    if (item1["Unit"]["攻击力"].Value ~= 0) then
        Ep = Ep .. "提升" .. item1["Unit"]["攻击力"].Value ..
                 "点攻击力" .. "|n"
    end
    if (item1["Unit"]["法术强度"].Value ~= 0) then
        Ep = Ep .. "提升" .. item1["Unit"]["法术强度"].Value ..
                 "点法术强度" .. "|n"
    end
    -- 添加护甲
    if (item1["Unit"]["护甲"].Value ~= 0) then
        Ep = Ep .. "提升" .. item1["Unit"]["护甲"].Value .. "点护甲" ..
                 "|n"
    end
    -- 添加属性
    local Attribute = false
    if (item1["Hero"]["力量"].Value ~= 0) then
        Ep = Ep .. "|cffffff00" .. "+" .. item1["Hero"]["力量"].Value ..
                 "力量" .. "|r" .. "   "
        Attribute = true
    end
    if (item1["Hero"]["敏捷"].Value ~= 0) then
        Ep = Ep .. "|cffffff00" .. "+" .. item1["Hero"]["敏捷"].Value ..
                 "敏捷" .. "|r" .. "   "
        Attribute = true
    end
    if (item1["Hero"]["智力"].Value ~= 0) then
        Ep = Ep .. "|cffffff00" .. "+" .. item1["Hero"]["智力"].Value ..
                 "智力" .. "|r" .. "   "
        Attribute = true
    end
    if Attribute == true then Ep = Ep .. "|n" end
    -- 添加混合属性
    local UAttribute = false
    -- 生命值
    if (item1["Unit"]["生命值"].Value ~= 0) then
        Ep = Ep .. "|cffffff00" .. "+" .. item1["Unit"]["生命值"].Value ..
                 "点生命值" .. "|r" .. "   "
        UAttribute = true
    end
    -- 魔法值
    if (item1["Unit"]["魔法值"].Value ~= 0) then
        Ep =
            Ep .. "|cffffff00" .. "增加" .. item1["Unit"]["魔法值"].Value ..
                "点魔法值" .. "|r" .. "   "
        UAttribute = true
    end
    if UAttribute == true then Ep = Ep .. "|n" end
    -- 添加魔法抗性
    if (item1["Unit"]["魔法抗性"].Value ~= 0) then
        Ep = Ep .. "|cffcc99ff" .. "增加" ..
                 item1["Unit"]["魔法抗性"].Value .. "%魔法抗性" ..
                 "|r|n"
    end
    -- 添加生命恢复速度
    if (item1["Unit"]["生命回复速度"].Value ~= 0) then
        Ep = Ep .. "|cffcc99ff" .. "增加" ..
                 item1["Unit"]["生命回复速度"].Value ..
                 "点每秒生命回复速度" .. "|r|n"
    end
    -- 添加魔法恢复速度
    if (item1["Unit"]["魔法回复速度"].Value ~= 0) then
        Ep = Ep .. "|cffcc99ff" .. "增加" ..
                 item1["Unit"]["魔法回复速度"].Value ..
                 "%魔法回复速度" .. "|r|n"
    end
    -- 增加攻击速度
    if (item1["Unit"]["攻击速度"].Value ~= 0) then
        Ep = Ep .. "|cffcc99ff" .. "增加" ..
                 item1["Unit"]["攻击速度"].Value .. "点攻击速度" ..
                 "|r|n"
    end
    -- 增加移动速度
    if (item1["Unit"]["移动速度"].Value ~= 0) then
        Ep = Ep .. "|cffcc99ff" .. "增加" ..
                 item1["Unit"]["移动速度"].Value .. "点移动速度" ..
                 "|r|n"
    end
    -- 防御属性
    -- 增加伤害减免
    if (item1["Extra"]["伤害减免"].Value ~= 0) then
        Ep = Ep .. "|cffcc99ff" .. "降低" ..
                 item1["Extra"]["伤害减免"].Value .. "点所受伤害。" ..
                 "|r|n"
    end
    -- 增加物理伤害吸收
    if (item1["Extra"]["物理伤害吸收"].Value ~= 0) then
        Ep = Ep .. "|cffcc99ff" .. "降低" ..
                 item1["Extra"]["物理伤害吸收"].Value ..
                 "点所受物理伤害。" .. "|r|n"
    end
    -- 增加物理伤害吸收
    if (item1["Extra"]["法术伤害吸收"].Value ~= 0) then
        Ep = Ep .. "|cffcc99ff" .. "降低" ..
                 item1["Extra"]["法术伤害吸收"].Value ..
                 "点所受魔法伤害。" .. "|r|n"
    end
    -- 技能
    -- for i = #item1.SkillList, 1, -1 do
    --     -- statements
    --     Ep = Ep .. "|cffffff00" .. item1.SkillList[i]:GetExplain() .. "|r" ..
    --              "   "
    -- end
    Ep = Ep .. "|n"
    return Ep
end
-- 获取图标
function WeaponryManager:GetIcon(item1)
    -- statements
    return item1["Weaponry"]["图标"].Value
end
return WeaponryManager
-- im = WeaponryManager:Instance()
-- for i = 1, 100 do
--     -- statements
--     local name1 = im:CreateItemDota(10, 45)
--     -- print(name1["Base"]["等级"].Value)
--     -- print(name1["Weaponry"]["词缀"].Value)
--     -- print(name1["Base"]["Name"].Value)
--     -- print(name1["Hero"]["力量"].Value)
--     -- print(name1["Unit"]["攻击力"].Value)
--     -- print(name1["Weaponry"]["图标"].Value)
--     print(im:GetName(name1))
--     print(im:GetExplain(name1))
--     print(name1.ID)
--     --print("i" .. i)
-- end
