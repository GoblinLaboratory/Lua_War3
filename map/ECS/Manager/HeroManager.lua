require "ECS\\Model\\Factory"
require "ECS\\Global"
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
        if self.HeroList[i].ID == id then return self.HeroList[i] end
    end
end
-- 添加单位
function HeroManager:AddUnit(id)
    if self:IsUnit(id) == false then
        local F = Factory:Instance()
        local x = F:HeroFactory()
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
-- 装备系统
-- 设置装备数据
function HeroManager:SetWeaponry(id, item1)
    local u = self:GetUnit(id)
    u["WeaponryComponent"][item1["Base"]["自定义值"].Value] =
        Global.clone(item1)
    Global.AddPrototype(u, item1)
end
function HeroManager:RemoveWeaponry(id, item1)
    local u = self:GetUnit(id)
    local F = Factory:Instance()
    u["WeaponryComponent"][item1["Base"]["自定义值"].Value] =
        F:WeaponryFactory()
    Global.RemovePrototype(u, item1)
end
-- 更新
function HeroManager:Update()
    -- statements
    for i = #self.HeroList, 1, -1 do
        self.HeroList[i]["BuffComponent"]:Update()
    end
end
return HeroManager
