-- 单位属性管理器
require "Attribute\\Manager\\HeroManager"
require "Attribute\\Manager\\UnitManager"
local CJ = require "jass.common"

UnitsManager = {HM = {}, UM = {}}

function UnitsManager:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    --
    -- o.HM = HeroManager:Instance()
    -- o.UM = UnitManager:Instance()
    --
    return o
end

UnitsManager.__index = UnitsManager

-- 单件模式
function UnitsManager:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end
-- 根据单位ID 从单位列表查找单位
function UnitsManager:GetUnit(id)
    if CJ.IsHeroUnitId(CJ.GetUnitTypeId(id)) == true then
        -- statements
        local HM = HeroManager:Instance()
        local u = HM:GetUnit(id)
        return u
    else
        local UM = UnitManager:Instance()
        local u = UM:GetUnit(id)
        return u
    end
end
-- 创建单位
function UnitsManager:CreateUnit(id)
    if CJ.IsHeroUnitId(CJ.GetUnitTypeId(id)) == true then
        -- statements
        local HM = HeroManager:Instance()
        HM:CreateUnit(id)
    else
        local UM = UnitManager:Instance()
        UM:CreateUnit(id)
    end
end
-- 添加单位

function UnitsManager:AddUnit(id)
    if CJ.IsHeroUnitId(CJ.GetUnitTypeId(id)) == true then
        -- statements
        local HM = HeroManager:Instance()
        HM:AddUnit(id)
    else
        local UM = UnitManager:Instance()
        UM:AddUnit(id)
    end
end
-- 移除单为
function UnitsManager:RemoveUnit(id)
    if CJ.IsHeroUnitId(CJ.GetUnitTypeId(id)) == true then
        -- statements
        local HM = HeroManager:Instance()
        HM:RemoveUnit(id)
    else
        local UM = UnitManager:Instance()
        UM:RemoveUnit(id)
    end
end
-- 添加单位基础属性
function UnitsManager.SetBasicsAttribute(id,Type, Num)
    if CJ.IsHeroUnitId(CJ.GetUnitTypeId(id)) == true then
        -- statements
        local HM = HeroManager:Instance()
        local u = HM:GetUnit(id)
        u:SetBasicsAttribute(Type, Num)
    else
        local UM = UnitManager:Instance()
        local u = UM:GetUnit(id)
        u:SetBasicsAttribute(Type, Num)
    end
end
-- 添加单位扩展属性
function UnitsManager.SetExtendAttribute(id,Type, Num)
    if CJ.IsHeroUnitId(CJ.GetUnitTypeId(id)) == true then
        -- statements
        local HM = HeroManager:Instance()
        local u = HM:GetUnit(id)
        u:SetExtendAttribute(Type, Num)
    end
end
function UnitsManager.SetResistanceAttribute(id,Type, Num)
    if CJ.IsHeroUnitId(CJ.GetUnitTypeId(id)) == true then
        -- statements
        local HM = HeroManager:Instance()
        local u = HM:GetUnit(id)
        u:SetResistanceAttribute(Type, Num)
    else
        local UM = UnitManager:Instance()
        local u = UM:GetUnit(id)
        u:SetResistanceAttribute(Type, Num)
    end
end

-- 开始施放技能
-- 发动技能效果
-- 施放技能结束
-- 停止施放技能
-- 单位被攻击
-- 单位发动攻击
return UnitsManager
