local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
require "ItemSystem"
require "GameManager"
require "Global"
require "HeroDota"


local trig_ChoiceHero = CJ.CreateTrigger()
BJ.TriggerRegisterAnyUnitEventBJ(trig_ChoiceHero, CJ.EVENT_PLAYER_UNIT_SELL)
local s1 = ItemSystem:Instance()
local GM = GameManager:Instance()
local HD = HeroDota:Instance()
CJ.TriggerAddCondition(trig_ChoiceHero, CJ.Condition(
	function ()
		-- |xxxx|不是一个标准的lua语法，而是ydwe lua的扩展语法，值和jass里'xxxx'一样
		-- 注意，在lua里'xxxx'是一个字符串，和"xxxx"一样。
		if (CJ.IsUnitType(CJ.GetSoldUnit(), CJ.UNIT_TYPE_HERO) == true and CJ.GetUnitTypeId(CJ.GetBuyingUnit()) == Global:GetId("e000") ) then
            return true
        else
            return false
        end
	end
))

CJ.TriggerAddAction(trig_ChoiceHero,
    function () 
        local BU = CJ.GetBuyingUnit() --购买者
        local Pi = CJ.GetUnitLoc(BU)
        local SU = CJ.GetSoldUnit()  --被贩卖单位
        BJ.ExplodeUnitBJ(BU)
        --创建装备马甲
        --local mj = "HSZ"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1) 
        local mj = "e002"
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, mj ) 
        BJ.CreateNUnitsAtLoc( 1, Global:GetId(mj),CJ.GetOwningPlayer(SU), Pi, 270.0 )
        local ZbMJ =  BJ.GetLastCreatedUnit()

   
        CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWA"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1)) )
        CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWB"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1)) )
        CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWC"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1)) )
        CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWD"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1)) )
        CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWE"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1)) )
        CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWF"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1)) )
        CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWG"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1)) )
        CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWH"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1)) )
        CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWI"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1)) )
        CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWJ"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1)) )
        CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWK"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1)) )


        GM:GetHero(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))).Equipment_Maji_ID = ZbMJ
        GM:GetHero(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))).heroType = CJ.GetUnitTypeId(SU)
        GM:GetHero(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))).heroID = SU

      

        --创建技能符文马甲
        local mj1 = "e001"
        BJ.CreateNUnitsAtLoc( 1, Global:GetId(mj1),CJ.GetOwningPlayer(SU), Pi, 270.0 )
        local ZbMJ1 =  BJ.GetLastCreatedUnit()

        --CJ.UnitAddAbility( ZbMJ1, Global:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."A") )
        --CJ.UnitAddAbility( ZbMJ1, Global:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."B") )
        --CJ.UnitAddAbility( ZbMJ1, Global:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."C") )
        --CJ.UnitAddAbility( ZbMJ1, Global:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."D") )
        
        CJ.UnitAddAbility( ZbMJ1, Global:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."E") )

        japi.EXSetAbilityDataString(japi.EXGetUnitAbility(ZbMJ1, Global:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."E")), 1, 215,HD["H002"] ["技能1"].Name)
		japi.EXSetAbilityDataString(japi.EXGetUnitAbility(ZbMJ1, Global:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."E")), 1, 218,HD["H002"] ["技能1"].Explain	)	
		japi.EXSetAbilityDataString(japi.EXGetUnitAbility(ZbMJ1, Global:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."E")), 1, 204,HD["H002"] ["技能1"].TuBiao )
        --CJ.UnitRemoveAbility( ZbMJ1,Global:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."E")  )
        --CJ.UnitAddAbility( ZbMJ1, Global:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."E") )
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,HD["H002"] ["技能1"].Name)
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,HD["H002"] ["技能1"].Explain)	
        --CJ.UnitAddAbility( ZbMJ1, Global:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."F") )
        --CJ.UnitAddAbility( ZbMJ1, Global:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."G") )
        --CJ.UnitAddAbility( ZbMJ1, Global:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."H") )
        CJ.UnitAddAbility( ZbMJ1, Global:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."I") )
        CJ.UnitAddAbility( ZbMJ1, Global:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."J") )
        CJ.UnitAddAbility( ZbMJ1, Global:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."K") )
        CJ.UnitAddAbility( ZbMJ1, Global:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."L") )

        --添加工程升级
        local j = "ZBL"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1)
        CJ.UnitAddAbility( SU, Global:GetId(j) )
        
	end
)