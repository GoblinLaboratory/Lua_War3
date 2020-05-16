require "ECS\\Model\\Factory"
UnitManager = {UnitList = {}}
function UnitManager:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    --
    --
    return o
end

UnitManager.__index = UnitManager

-- 单件模式
function UnitManager:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end
-- 根据单位ID 从单位列表查找单位
function UnitManager:GetUnit(id)
    if self:IsUnit(id) == false then self:AddUnit(id) end

    for i, v in ipairs(self.UnitList) do
        if v.ID == id then return self.UnitList[i] end
    end
end
-- 添加单位
function UnitManager:AddUnit(id)
    if self:IsUnit(id) == false then
        local F = Factory:Instance()
        local x = F:UnitFactory()
        x.ID = id
        table.insert(self.UnitList, x)
    end
end
-- 移除单为
function UnitManager:RemoveUnit(id)
    for i = #self.UnitList, 1, -1 do
        if self.UnitList[i].ID == id then table.remove(self.UnitList, i) end
    end
end
-- 判断单位是否存在
function UnitManager:IsUnit(id)
    for i = #self.UnitList, 1, -1 do
        if self.UnitList[i].ID == id then return true end
    end
    return false
end
-- 更新
function UnitManager:Update()
    -- statements
end
return UnitManager
