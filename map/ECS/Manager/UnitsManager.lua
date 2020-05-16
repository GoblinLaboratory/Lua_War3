-- 文件名为 UnitsManager.lua
-- 定义一个名为 UnitsManager 的模块
-- 单位属性管理器
require "ECS\\Model\\Factory"
require "ECS\\Manager\\HeroManager"
require "ECS\\Manager\\UnitManager"
require "ECS\\Blizzard"
require "ECS\\Global"
UnitsManager = {HM = {}, UM = {}}

-- function UnitsManager:new(o)
--     o = o or {}
--     setmetatable(o, self)
--     self.__index = self
--     --
--     -- o.HM = HeroManager:Instance()
--     -- o.UM = UnitManager:Instance()
--     --
--     return o
-- end

-- UnitsManager.__index = UnitsManager

-- -- 单件模式
-- function UnitsManager:Instance()
--     if self.instance == nil then self.instance = self:new() end
--     return self.instance
-- end
-- 根据单位ID 从单位列表查找单位
function UnitsManager.GetUnit(id)
    if Blizzard.IdHreo(id) == true then
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
-- 添加单位

function UnitsManager.AddUnit(id)
    if Blizzard.IdHreo(id) == true then
        -- statements
        local HM = HeroManager:Instance()
        HM:AddUnit(id)
    else
        local UM = UnitManager:Instance()
        UM:AddUnit(id)
    end
end
-- 移除单为
function UnitsManager.RemoveUnit(id)
    if Blizzard.IdHreo(id) == true then
        -- statements
        local HM = HeroManager:Instance()
        HM:RemoveUnit(id)
    else
        local UM = UnitManager:Instance()
        UM:RemoveUnit(id)
    end
end
-- 装备系统
-- 获取装备
function UnitsManager.GetEquipment(id, Custom)
    -- return self.ItemsList[Custom].Dota
    if Blizzard.IdHreo(id) == true then
        -- statements
        local u = UnitsManager.GetUnit(id)
        return u["WeaponryComponent"][Custom]
    end
end
-- 设置装备数据
function UnitsManager.SetWeaponry(id, item1)
    if Blizzard.IdHreo(id) == true then
        -- statements
        local u = UnitsManager.GetUnit(id)
        u["WeaponryComponent"][item1["Base"]["自定义值"].Value] =
            Global.clone(item1)
            print("tj wupin sk")
        for i = #item1["Skill"], 1, -1 do
            -- statements
            print("i:"..i)
            print("tj wupin sk1111")
            u["SkillComponent"]:TriggerAddEvent(item1["Skill"][i])
        end
        Global.AddPrototype(u, item1)
    end

end
-- 清空装备数据
function UnitsManager.RemoveWeaponry(id, item1)
    if Blizzard.IdHreo(id) == true then
        -- statements
        local u = UnitsManager.GetUnit(id)
        local F = Factory:Instance()
        u["WeaponryComponent"][item1["Base"]["自定义值"].Value] =
            F:WeaponryFactory()
        for i = #item1["Skill"], 1, -1 do
            -- statements
            u["SkillComponent"]:TriggerRemoveEvent(item1["Skill"][i])
        end
        Global.RemovePrototype(u, item1)
    end

end
-- 单位添加buff
function UnitsManager.AddBuff(id, e)
    local u = UnitsManager.GetUnit(id)
    u["BuffComponent"]:AddBuff(e)
end
-- 单位移除buff
function UnitsManager.RemoveBuff(id, e)
    local u = UnitsManager.GetUnit(id)
    u["BuffComponent"]:RemoveBuff(e)
end
-- 更新
function UnitsManager.Update()
    -- statements
    local HM = HeroManager:Instance()
    HM:Update()
    local UM = UnitManager:Instance()
    UM:Update()
end
-- -- 添加单位基础属性
-- function UnitsManager.SetBasicsAttribute(id,Type, Num)
--     if CJ.IsHeroUnitId(CJ.GetUnitTypeId(id)) == true then
--         -- statements
--         local HM = HeroManager:Instance()
--         local u = HM:GetUnit(id)
--         u:SetBasicsAttribute(Type, Num)
--     else
--         local UM = UnitManager:Instance()
--         local u = UM:GetUnit(id)
--         u:SetBasicsAttribute(Type, Num)
--     end
-- end
-- -- 添加单位扩展属性
-- function UnitsManager.SetExtendAttribute(id,Type, Num)
--     if CJ.IsHeroUnitId(CJ.GetUnitTypeId(id)) == true then
--         -- statements
--         local HM = HeroManager:Instance()
--         local u = HM:GetUnit(id)
--         u:SetExtendAttribute(Type, Num)
--     end
-- end
-- function UnitsManager.SetResistanceAttribute(id,Type, Num)
--     if CJ.IsHeroUnitId(CJ.GetUnitTypeId(id)) == true then
--         -- statements
--         local HM = HeroManager:Instance()
--         local u = HM:GetUnit(id)
--         u:SetResistanceAttribute(Type, Num)
--     else
--         local UM = UnitManager:Instance()
--         local u = UM:GetUnit(id)
--         u:SetResistanceAttribute(Type, Num)
--     end
-- end

-- 开始施放技能
-- 发动技能效果
-- 施放技能结束
-- 停止施放技能
-- 单位被攻击
-- 单位发动攻击
return UnitsManager
