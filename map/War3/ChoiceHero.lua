-- 玩家选择使用的英雄
local CJ = require "jass.common"
local BJ = require "blizzard"
-- local japi = require "jass.japi"
require "ECS\\Model\\Maths"
require "ECS\\Manager\\UnitsManager"
local trig_ChoiceHero = CJ.CreateTrigger()
BJ.TriggerRegisterAnyUnitEventBJ(trig_ChoiceHero, CJ.EVENT_PLAYER_UNIT_SELL)
-- local s1 = ItemSystem:Instance()
-- local GM = GameManager:Instance()
-- local HD = HeroDota:Instance()
CJ.TriggerAddCondition(trig_ChoiceHero, CJ.Condition(
                           function()
        -- |xxxx|不是一个标准的lua语法，而是ydwe lua的扩展语法，值和jass里'xxxx'一样
        -- 注意，在lua里'xxxx'是一个字符串，和"xxxx"一样。
        if (CJ.IsUnitType(CJ.GetSoldUnit(), CJ.UNIT_TYPE_HERO) == true and
            CJ.GetUnitTypeId(CJ.GetBuyingUnit()) == Maths.GetId("hsz1")) then
            return true
        else
            return false
        end
    end))

CJ.TriggerAddAction(trig_ChoiceHero, function()
    local BU = CJ.GetBuyingUnit() -- 购买者
    -- local Pi = CJ.GetUnitLoc(BU) -- 获取购买者的位置
    -- local SU = CJ.GetSoldUnit() -- 被贩卖单位
    BJ.ExplodeUnitBJ(BU) -- 使单位爆炸
    -- local UM = UnitsManager:Instance()
    -- UM:AddUnit(SU)
    -- 添加装备栏
    -- local j = "ZBL" ..
    -- tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU)) - 1)
    -- CJ.UnitAddAbility(SU, Global:GetId(j))
end)
