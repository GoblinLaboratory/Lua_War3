local CJ = require "jass.common"
local BJ = require "blizzard"
require "EventTemplate"
--local japi = require "jass.japi"
require "ECS\\Manager\\UnitsManager"
require "ECS\\Model\\Maths"
-- 任意单位伤害

local trig_AnyDamagedSystem = CJ.CreateTrigger()

-- 任意单位进入地图
BJ.TriggerRegisterEnterRectSimple(trig_AnyDamagedSystem, BJ.GetPlayableMapRect())

local ev = EventTemplate:Instance()

CJ.TriggerAddCondition(trig_AnyDamagedSystem,
                       CJ.Condition(function() return true end))

CJ.TriggerAddAction(trig_AnyDamagedSystem, function()
    CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '注册伤害事件')
    local UM = UnitsManager
    UM.AddUnit(CJ.GetTriggerUnit())
    if CJ.IsHeroUnitId(CJ.GetUnitTypeId(CJ.GetTriggerUnit())) == true then
        -- local HM = HeroManager:Instance()
        -- 添加装备栏
        local j = "ZBL" ..
                      tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(CJ.GetTriggerUnit())) -
                                   1)
        CJ.UnitAddAbility(CJ.GetTriggerUnit(), Maths.GetId(j))
    end
    -- 创建一个触发器
    local rTrg = CJ.CreateTrigger()
    CJ.TriggerRegisterUnitEvent(rTrg, CJ.GetTriggerUnit(), CJ.EVENT_UNIT_DAMAGED)
    -- 添加条件
    CJ.TriggerAddCondition(rTrg, CJ.Condition(function() return true end))

    CJ.TriggerAddAction(rTrg, function()
        -- 发送消息
        ev.AnyUnitDamaged:Fire() -- 发送消息
        print("fasongxiaoxi")
        -- CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '发送消息')
        -- damageType = CJ.ConvertDamageType(japi.EXGetEventDamageData(4))
        -- CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '单位受到伤害')
        --    if 0 ~= japi.EXGetEventDamageData(2) then
        --        CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '攻击伤害')
        --    else
        --        CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '不是攻击伤害')
        --    end
        --       if 0 ~= japi.EXGetEventDamageData(1) then
        --           CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '物理伤害')
        --      else
        --           CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '魔法伤害')
        --       end
        --    if 0 ~= japi.EXGetEventDamageData(3) then
        --        CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '远程伤害')
        --    else
        --        CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '近战伤害')
        --    end
    end)

end)
