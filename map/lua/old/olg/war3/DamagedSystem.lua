local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
require "ItemSystem"
require "GameManager"
require "Global"

local trig_DamagedSystem = CJ.CreateTrigger()

BJ.TriggerRegisterAnyUnitEventBJ(trig_DamagedSystem, CJ.EVENT_PLAYER_UNIT_ATTACKED)
local s1 = ItemSystem:Instance()
local GM = GameManager:Instance()

CJ.TriggerAddCondition(trig_DamagedSystem, CJ.Condition(
	function ()
		return true
	end
))

CJ.TriggerAddAction(trig_DamagedSystem,
    function () 
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
            CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '被攻击了') 
            if 0 ~= japi.EXGetEventDamageData(2) then
                CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '攻击伤害') 
            end
            if 0 ~= japi.EXGetEventDamageData(1) then
                CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '物理伤害') 
            end
            if 0 ~= japi.EXGetEventDamageData(3) then
                CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '范围伤害') 
            end
            CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, CJ.GetEventDamage()) 
            japi.EXSetEventDamage(999)
            CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, CJ.GetEventDamage()) 
            CJ.DestroyTrigger(CJ.GetTriggeringTrigger())
           end
        )
        
	end
)
