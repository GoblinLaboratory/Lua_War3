require "Attribute\\HeroAttribute"
require 'Attribute\\Manager\\ItemManager'
HeroManager = {HeroList = {}}

function HeroManager:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    --
    --
    return o
end

HeroManager.__index = HeroManager

-- 单件模式
function HeroManager:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end
-- 根据单位ID 从单位列表查找单位
function HeroManager:GetUnit(id)
    if self:IsUnit(id) == false then self:AddUnit(id) end

    for i = #self.HeroList, 1, -1 do
        if self.HeroList[i].ID == id then
            -- print("..." .. self.HeroList[i].ID)
            return self.HeroList[i]
        end
    end
end
-- 创建英雄单位
function HeroManager:CreateUnit(id)
    local h = HeroAttribute:new(nil)
    h.ID = id
    print("..." .. h.ID)
    table.insert(self.HeroList, h)
end
-- 添加单位
function HeroManager:AddUnit(id)
    if self:IsUnit(id) == false then
        local x = HeroAttribute:new()
        x.ID = id
        table.insert(self.HeroList, x)
    end
end
-- 移除单位
function HeroManager:RemoveUnit(id)
    for i = #self.HeroList, 1, -1 do
        if self.HeroList[i].ID == id then table.remove(self.HeroList, i) end
    end
end
-- 判断单位是否存在
function HeroManager:IsUnit(id)
    for i = #self.HeroList, 1, -1 do
        if self.HeroList[i].ID == id then return true end
    end
    return false
end

return HeroManager
-- h = HeroManager:Instance()
-- h:AddUnit(1)
-- h:AddUnit(2)
-- m1 = h:GetUnit(1)
-- m2 = h:GetUnit(2)
-- IM = ItemManager:Instance()
-- it1 = IM:CreateItemDota(1000, 55)
-- it2 = IM:CreateItemDota(1000, 55)
-- print(IM:GetExplain(it1))
-- print(IM:GetExplain(it2))
-- m1:SetItem(it1)
-- m2:SetItem(it2)
