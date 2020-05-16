local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
require "GameManager"
require "UnitManager"
require "ItemManager"
require "Bonus"

local trigint = CJ.CreateTrigger()
local GM = GameManager:Instance()
--初始化单位管理器
local UM = UnitManager:Instance()
--初始化物品管理器
local IM = ItemManager:Instance()

BJ.TriggerRegisterTimerEventSingle(trigint, 1.1 )
CJ.TriggerAddCondition(trigint, CJ.Condition(
	function ()
		return true
	end
))

CJ.TriggerAddAction(trigint,
	function () 
        
        CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, "初始化，请不要进行任何操作")
		GM:Initialization()  

		

		--初始化万能属性系统
		local bu = Bonus:Instance()  
		bu:Int() 

		--初始化物品管理器
		IM:Int() 

	end
)