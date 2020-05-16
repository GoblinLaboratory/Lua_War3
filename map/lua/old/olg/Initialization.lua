local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
require "ItemSystem"
require "GameManager"
require "EventTemplate"
require "Global"
require "EventTemplate"
require "DamagedSystemtest"
require "AuraManager"
require "AttackEffectManager"
require "math"

local trigint = CJ.CreateTrigger()

BJ.TriggerRegisterTimerEventSingle(trigint, 1.1 )
CJ.TriggerAddCondition(trigint, CJ.Condition(
	function ()
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, "初始化，请不要进行任何操作") 
		return true
	end
))

CJ.TriggerAddAction(trigint,
	function () 
        
        CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, "初始化，请不要进行任何操作")
		--BJ.QuestMessageBJ( CJ.GetPlayersAll(), BJ.bj_QUESTMESSAGE_UPDATED, "初始化，请不要进行任何操作" )
		math.randomseed(tostring(os.time()):reverse():sub(1, 7))
		
		local s1 = ItemSystem:Instance() 
		local GM = GameManager:Instance()
		local ev = EventTemplate:Instance()
		local Aura = AuraManager:Instance()
		local AttackEffect = AttackEffectManager:Instance()
		Aura:Start()  
		AttackEffect:Start() 
		ev.AnyUnitDamaged:connect(DamagedSystemtest.f)
	end
)