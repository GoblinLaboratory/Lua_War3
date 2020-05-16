local CJ = require "jass.common"
local BJ = require "blizzard"
require "EquipmentSystem"
require "GameManager"

local trig_ChoiceHero = CJ.CreateTrigger()
BJ.TriggerRegisterAnyUnitEventBJ(trig_ChoiceHero, CJ.EVENT_PLAYER_UNIT_SELL)
local s1 = EquipmentSystem:Instance()
local GM = GameManager:Instance()
CJ.TriggerAddCondition(trig_ChoiceHero, CJ.Condition(
	function ()
		-- |xxxx|不是一个标准的lua语法，而是ydwe lua的扩展语法，值和jass里'xxxx'一样
		-- 注意，在lua里'xxxx'是一个字符串，和"xxxx"一样。
		if (CJ.IsUnitType(CJ.GetSoldUnit(), CJ.UNIT_TYPE_HERO) == true and CJ.GetUnitTypeId(CJ.GetBuyingUnit()) == s1:GetId("e000") ) then
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
        CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, mj ) 
        BJ.CreateNUnitsAtLoc( 1, s1:GetId(mj),CJ.GetOwningPlayer(SU), Pi, 270.0 )
        local ZbMJ =  BJ.GetLastCreatedUnit()

        CJ.UnitAddAbility( ZbMJ, s1:GetId("ZWA"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1)) )
        CJ.UnitAddAbility( ZbMJ, s1:GetId("ZWB"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1)) )
        CJ.UnitAddAbility( ZbMJ, s1:GetId("ZWC"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1)) )
        CJ.UnitAddAbility( ZbMJ, s1:GetId("ZWD"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1)) )
        CJ.UnitAddAbility( ZbMJ, s1:GetId("ZWE"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1)) )
        CJ.UnitAddAbility( ZbMJ, s1:GetId("ZWF"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1)) )
        CJ.UnitAddAbility( ZbMJ, s1:GetId("ZWG"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1)) )
        CJ.UnitAddAbility( ZbMJ, s1:GetId("ZWH"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1)) )
        CJ.UnitAddAbility( ZbMJ, s1:GetId("ZWI"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1)) )
        CJ.UnitAddAbility( ZbMJ, s1:GetId("ZWJ"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1)) )
        CJ.UnitAddAbility( ZbMJ, s1:GetId("ZWK"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1)) )


        GM:GetHero(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))).Equipment_Maji_ID = ZbMJ
       
        GM:GetHero(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))).heroID = SU

        --创建技能符文马甲
        local mj1 = "e001"
        BJ.CreateNUnitsAtLoc( 1, s1:GetId(mj1),CJ.GetOwningPlayer(SU), Pi, 270.0 )
        local ZbMJ1 =  BJ.GetLastCreatedUnit()

        CJ.UnitAddAbility( ZbMJ1, s1:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."A") )
        CJ.UnitAddAbility( ZbMJ1, s1:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."B") )
        CJ.UnitAddAbility( ZbMJ1, s1:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."C") )
        CJ.UnitAddAbility( ZbMJ1, s1:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."D") )
        CJ.UnitAddAbility( ZbMJ1, s1:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."E") )
        CJ.UnitAddAbility( ZbMJ1, s1:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."F") )
        CJ.UnitAddAbility( ZbMJ1, s1:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."G") )
        CJ.UnitAddAbility( ZbMJ1, s1:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."H") )
        CJ.UnitAddAbility( ZbMJ1, s1:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."I") )
        CJ.UnitAddAbility( ZbMJ1, s1:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."J") )
        CJ.UnitAddAbility( ZbMJ1, s1:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."K") )
        CJ.UnitAddAbility( ZbMJ1, s1:GetId("FW"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1).."L") )

        --添加工程升级
        local j = "ZBL"..tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))-1)
        CJ.UnitAddAbility( SU, s1:GetId(j) )
     
	end
)