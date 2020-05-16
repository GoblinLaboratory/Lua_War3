local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
require "ItemSystem"
require "GameManager"
require "Global"
require "EventTemplate"
--CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '允许') 
local trig_AnyDamagedSystem = CJ.CreateTrigger()

BJ.TriggerRegisterEnterRectSimple(trig_AnyDamagedSystem, BJ.GetPlayableMapRect() )

local s1 = ItemSystem:Instance()
local GM = GameManager:Instance()
local ev = EventTemplate:Instance()

CJ.TriggerAddCondition(trig_AnyDamagedSystem, CJ.Condition(
    function ()
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,'护甲='.. CJ.GetUnitState(CJ.GetTriggerUnit(), CJ.ConvertUnitState(0x20))) 
		return true
	end
))

CJ.TriggerAddAction(trig_AnyDamagedSystem,
    function () 
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '注册伤害事件1') 
        
        --创建一个触发器
        local rTrg = CJ.CreateTrigger()
        CJ.TriggerRegisterUnitEvent( rTrg , CJ.GetTriggerUnit(), CJ.EVENT_UNIT_DAMAGED )
        CJ.TriggerAddCondition(rTrg, CJ.Condition(
            function ()
                return true
            end
           ))

        CJ.TriggerAddAction(rTrg ,
           function () 
            
            ev.AnyUnitDamaged:Fire()--发送消息
            --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '受到伤害') 
            if 0 ~= japi.EXGetEventDamageData(2) then
                --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '攻击伤害') 
            end
            if 0 ~= japi.EXGetEventDamageData(1) then
                --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '物理伤害') 
            end
            if 0 ~= japi.EXGetEventDamageData(3) then
                --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '范围伤害') 
            end
           -- CJ.DestroyTrigger(CJ.GetTriggeringTrigger())
           --CJ.DestroyTrigger( CJ.GetTriggeringTrigger() )
           end
        )
        
	end
)
