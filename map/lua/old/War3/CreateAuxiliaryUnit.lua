local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"

local CreateAuxiliaryUnittrigint = CJ.CreateTrigger()

BJ.TriggerRegisterTimerEventSingle(CreateAuxiliaryUnittrigint, 1.1 )
CJ.TriggerAddCondition(trigint, CJ.Condition(
	function ()
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, "初始化，请不要进行任何操作") 
		return true
	end
))

CJ.TriggerAddAction(CreateAuxiliaryUnittrigint,
    function () 
        local GM = GameManager:Instance()
        --创建天赋马甲
        local tfmj = "e001"
        BJ.CreateNUnitsAtLoc( 1, Global:GetId(tfmj),CJ.Player(0), BJ.GetRectCenter(BJ.GetPlayableMapRect()), 270.0 )    
        GM.Maji_ID["玩家1"].FuWen_Maji = BJ.GetLastCreatedUnit()     
        BJ.CreateNUnitsAtLoc( 1, Global:GetId(tfmj),CJ.Player(1), BJ.GetRectCenter(BJ.GetPlayableMapRect()), 270.0 )    
        GM.Maji_ID["玩家2"].FuWen_Maji = BJ.GetLastCreatedUnit()  
        BJ.CreateNUnitsAtLoc( 1, Global:GetId(tfmj),CJ.Player(2), BJ.GetRectCenter(BJ.GetPlayableMapRect()), 270.0 ) 
        GM.Maji_ID["玩家3"].FuWen_Maji = BJ.GetLastCreatedUnit()     
        BJ.CreateNUnitsAtLoc( 1, Global:GetId(tfmj),CJ.Player(3), BJ.GetRectCenter(BJ.GetPlayableMapRect()), 270.0 )  
        GM.Maji_ID["玩家4"].FuWen_Maji = BJ.GetLastCreatedUnit()    
        BJ.CreateNUnitsAtLoc( 1, Global:GetId(tfmj),CJ.Player(4), BJ.GetRectCenter(BJ.GetPlayableMapRect()), 270.0 )  
        GM.Maji_ID["玩家5"].FuWen_Maji = BJ.GetLastCreatedUnit()    
        BJ.CreateNUnitsAtLoc( 1, Global:GetId(tfmj),CJ.Player(5), BJ.GetRectCenter(BJ.GetPlayableMapRect()), 270.0 ) 
        GM.Maji_ID["玩家6"].FuWen_Maji = BJ.GetLastCreatedUnit()     
        BJ.CreateNUnitsAtLoc( 1, Global:GetId(tfmj),CJ.Player(6), BJ.GetRectCenter(BJ.GetPlayableMapRect()), 270.0 ) 
        GM.Maji_ID["玩家7"].FuWen_Maji = BJ.GetLastCreatedUnit()     
        BJ.CreateNUnitsAtLoc( 1, Global:GetId(tfmj),CJ.Player(7), BJ.GetRectCenter(BJ.GetPlayableMapRect()), 270.0 ) 
        GM.Maji_ID["玩家8"].FuWen_Maji = BJ.GetLastCreatedUnit()     
        BJ.CreateNUnitsAtLoc( 1, Global:GetId(tfmj),CJ.Player(8), BJ.GetRectCenter(BJ.GetPlayableMapRect()), 270.0 ) 
        GM.Maji_ID["玩家9"].FuWen_Maji = BJ.GetLastCreatedUnit()     
        BJ.CreateNUnitsAtLoc( 1, Global:GetId(tfmj),CJ.Player(9), BJ.GetRectCenter(BJ.GetPlayableMapRect()), 270.0 )  
        GM.Maji_ID["玩家10"].FuWen_Maji = BJ.GetLastCreatedUnit()    
        BJ.CreateNUnitsAtLoc( 1, Global:GetId(tfmj),CJ.Player(10), BJ.GetRectCenter(BJ.GetPlayableMapRect()), 270.0 ) 
        GM.Maji_ID["玩家11"].FuWen_Maji = BJ.GetLastCreatedUnit()     
        BJ.CreateNUnitsAtLoc( 1, Global:GetId(tfmj),CJ.Player(11), BJ.GetRectCenter(BJ.GetPlayableMapRect()), 270.0 )  
        GM.Maji_ID["玩家12"].FuWen_Maji = BJ.GetLastCreatedUnit()    

        --创建装备马甲
        local mj = "e002"
        local p = CJ.Location(10, 19)
        --BJ.CreateNUnitsAtLoc( 1, Global:GetId(mj),1, CJ.GetUnitLoc(gg_unit_n005_0015), 270.0 )
        --local ZbMJ =  BJ.GetLastCreatedUnit()
        -- for i= 1 ,12 do
        --     BJ.CreateNUnitsAtLoc( 1, Global:GetId(mj),CJ.Player(i-1), BJ.GetRectCenter(BJ.GetPlayableMapRect()), 270.0 )
        --     local ZbMJ =  BJ.GetLastCreatedUnit()
        --     CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWA"..tostring(i-1) ))
        --     CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWB"..tostring(i-1) ))
        --     CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWC"..tostring(i-1)) )
        --     CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWD"..tostring(i-1)) )
        --     CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWE"..tostring(i-1)) )
        --     CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWF"..tostring(i-1)) )
        --     CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWG"..tostring(i-1)) )
        --     CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWH"..tostring(i-1)) )
        --     CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWI"..tostring(i-1)) )
        --     CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWJ"..tostring(i-1)) )
        --     CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWK"..tostring(i-1)) )
        --     CJ.UnitAddAbility( ZbMJ, Global:GetId("Avul") )
            
        --     GM.Maji_ID["玩家"..tostring(i)].Equipment_Maji = ZbMJ
            
        -- end
        local i = 1
        CJ.TimerStart(CJ.CreateTimer(), 0.3, true, 
        function () 
            if i == 13 then
                CJ.DestroyTimer(CJ.GetExpiredTimer())
            else
                BJ.CreateNUnitsAtLoc( 1, Global:GetId(mj),CJ.Player(i-1), BJ.GetRectCenter(BJ.GetPlayableMapRect()), 270.0 )     
                local ZbMJ =  BJ.GetLastCreatedUnit()       
                CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWA"..tostring(i-1) ))        
                CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWB"..tostring(i-1) ))        
                CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWC"..tostring(i-1)) )         
                CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWD"..tostring(i-1)) )         
                CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWE"..tostring(i-1)) )          
                CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWF"..tostring(i-1)) )         
                CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWG"..tostring(i-1)) )        
                CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWH"..tostring(i-1)) )          
                CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWI"..tostring(i-1)) )          
                CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWJ"..tostring(i-1)) )          
                CJ.UnitAddAbility( ZbMJ, Global:GetId("ZWK"..tostring(i-1)) )           
                CJ.UnitAddAbility( ZbMJ, Global:GetId("Avul") )
            
                GM.Maji_ID["玩家"..tostring(i)].Equipment_Maji = ZbMJ
                i = i + 1						
            end
        end
    )
	end
)