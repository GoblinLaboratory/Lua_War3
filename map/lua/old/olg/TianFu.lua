--           0               1         2            3
--0    | wispharvest | windwalk |   whirlwind  |  webon          |
--1    |  weboff     | web      | wateryminion |  waterlemental  |
--2    |  ward       | voodoo   | volcano      |  vengenceon     |

--           0               1         2            3
--0    | FWXA        | FWXB     |   FWXC       |  FWXD           |
--1    | FWXAE       | FWXF     |   FWXG       |  FWXH           |
--2    | FWXI        | FWXJ     |   FWXK       |  FWXL          |

--           0               1         2            3
--0    |     A       |       B   |     C       |    D          |
--1    |     E       |       F   |     G       |    H          |
--2    |     I       |       J   |     K       |    L           |

local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
require "ItemSystem"
require "GameManager"
require "Global"
require "HeroDota"

local s1 = ItemSystem:Instance()
local GM = GameManager:Instance()
local HD = HeroDota:Instance()

local  function RemoveAbility(u,id)  
     --清空技能
     CJ.UnitRemoveAbility( u, Global:GetId("FW"..tostring(id-1).."A" ))
     CJ.UnitRemoveAbility( u, Global:GetId("FW"..tostring(id-1).."B" ))
     CJ.UnitRemoveAbility( u, Global:GetId("FW"..tostring(id-1).."C" ))
     CJ.UnitRemoveAbility( u, Global:GetId("FW"..tostring(id-1).."D" ))
     CJ.UnitRemoveAbility( u, Global:GetId("FW"..tostring(id-1).."E" ))
     CJ.UnitRemoveAbility( u, Global:GetId("FW"..tostring(id-1).."F" ))
     CJ.UnitRemoveAbility( u, Global:GetId("FW"..tostring(id-1).."G" ))
     CJ.UnitRemoveAbility( u, Global:GetId("FW"..tostring(id-1).."H" ))
     CJ.UnitRemoveAbility( u, Global:GetId("FW"..tostring(id-1).."I" ))
     CJ.UnitRemoveAbility( u, Global:GetId("FW"..tostring(id-1).."J" ))
     CJ.UnitRemoveAbility( u, Global:GetId("FW"..tostring(id-1).."K" ))
     CJ.UnitRemoveAbility( u, Global:GetId("FW"..tostring(id-1).."L" ))
end 

local  function IntAbility(u,id)  
    local x = Global:GetStrId(GM:GetHero(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(u))).heroType)
    local h = GM:GetHero(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(u)))
    CJ.UnitAddAbility(u, Global:GetId("FW"..tostring(id-1).."F") )
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId("FW"..tostring(id-1).."F")), 1, 215,HD[x] ["技能7"].Name)
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId("FW"..tostring(id-1).."F")), 1, 218,HD[x] ["技能7"].Explain	)	
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId("FW"..tostring(id-1).."F")), 1, 204,HD[x] ["技能7"].TuBiao )

    CJ.UnitAddAbility( u, Global:GetId("FW"..tostring(id-1).."G") )
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId("FW"..tostring(id-1).."G")), 1, 215,HD[x] ["技能6"].Name)
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId("FW"..tostring(id-1).."G")), 1, 218,HD[x] ["技能6"].Explain	)	
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId("FW"..tostring(id-1).."G")), 1, 204,HD[x] ["技能6"].TuBiao )
    
    CJ.UnitAddAbility( u, Global:GetId("FW"..tostring(id-1).."H") )
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId("FW"..tostring(id-1).."H")), 1, 215,HD[x] ["技能5"].Name)
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId("FW"..tostring(id-1).."H")), 1, 218,HD[x] ["技能5"].Explain	)	
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId("FW"..tostring(id-1).."H")), 1, 204,HD[x] ["技能5"].TuBiao )

    CJ.UnitAddAbility(u, Global:GetId("FW"..tostring(id-1).."I") )
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId("FW"..tostring(id-1).."I")), 1, 215,HD[x] ["技能1"].Name)
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId("FW"..tostring(id-1).."I")), 1, 218,HD[x] ["技能1"].Explain	)	
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId("FW"..tostring(id-1).."I")), 1, 204,HD[x] ["技能1"].TuBiao )

    CJ.UnitAddAbility( u, Global:GetId("FW"..tostring(id-1).."J") )
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId("FW"..tostring(id-1).."J")), 1, 215,HD[x] ["技能2"].Name)
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId("FW"..tostring(id-1).."J")), 1, 218,HD[x] ["技能2"].Explain	)	
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId("FW"..tostring(id-1).."J")), 1, 204,HD[x] ["技能2"].TuBiao )

    CJ.UnitAddAbility( u, Global:GetId("FW"..tostring(id-1).."K") )
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId("FW"..tostring(id-1).."K")), 1, 215,HD[x] ["技能3"].Name)
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId("FW"..tostring(id-1).."K")), 1, 218,HD[x] ["技能3"].Explain	)	
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId("FW"..tostring(id-1).."K")), 1, 204,HD[x] ["技能3"].TuBiao )        

    CJ.UnitAddAbility( u, Global:GetId("FW"..tostring(id-1).."L") )
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId("FW"..tostring(id-1).."L")), 1, 215,HD[x] ["技能4"].Name)
	japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId("FW"..tostring(id-1).."L")), 1, 218,HD[x] ["技能4"].Explain	)	
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId("FW"..tostring(id-1).."L")), 1, 204,HD[x] ["技能4"].TuBiao )

    h.JnFuWen = "主界面"
end 

local  function ReturnAbility(u,id)  
    CJ.UnitAddAbility(u, Global:GetId("FW"..tostring(id-1).."L") )
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId("FW"..tostring(id-1).."L")), 1, 215,"返回")
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId("FW"..tostring(id-1).."L")), 1, 218,"返回主界面"	)	
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId("FW"..tostring(id-1).."L")), 1, 204,"ReplaceableTextures\\CommandButtons\\BTNCancel.blp")
end

local trig_TianFu = CJ.CreateTrigger()


BJ.TriggerRegisterPlayerSelectionEventBJ(trig_TianFu, CJ.Player(0), true )
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_TianFu, CJ.Player(1), true )
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_TianFu, CJ.Player(2), true )
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_TianFu, CJ.Player(3), true )
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_TianFu, CJ.Player(4), true )
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_TianFu, CJ.Player(5), true )
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_TianFu, CJ.Player(6), true )
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_TianFu, CJ.Player(7), true )
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_TianFu, CJ.Player(8), true )
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_TianFu, CJ.Player(9), true )

CJ.TriggerAddCondition(trig_TianFu, CJ.Condition(
	function ()
		return (CJ.GetUnitTypeId(CJ.GetTriggerUnit()) == Global:GetId('e001'))
	end
))

CJ.TriggerAddAction(trig_TianFu,
    function () 
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, CJ.GetUnitName(CJ.GetTriggerUnit()) ) 
        local SU = CJ.GetTriggerUnit()  --触发单位
        local id = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(CJ.GetTriggerUnit()))--触发玩家ID
        local x = Global:GetStrId(GM:GetHero(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))).heroType)
        local h = GM:GetHero(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU)))
        CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, id  ) 
        --清空技能
        --CJ.UnitRemoveAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A" ))
        --CJ.UnitRemoveAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B" ))
        --CJ.UnitRemoveAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C" ))
        --CJ.UnitRemoveAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."D" ))
        --CJ.UnitRemoveAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."E" ))
        --CJ.UnitRemoveAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."F" ))
        --CJ.UnitRemoveAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."G" ))
        --CJ.UnitRemoveAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."H" ))
        --CJ.UnitRemoveAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."I" ))
        --CJ.UnitRemoveAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."J" ))
        --CJ.UnitRemoveAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."K" ))
        --CJ.UnitRemoveAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."L" ))
        RemoveAbility(CJ.GetTriggerUnit(),id)
        --添加技能
        --CJ.UnitAddAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A") )
        --CJ.UnitAddAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B") )
        --CJ.UnitAddAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C") )
        --CJ.UnitAddAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."D") )
        --CJ.UnitAddAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."E") )
        IntAbility(SU,id) 
	end
)

--选择技能符文

local trig_JiNengFuWen = CJ.CreateTrigger()

BJ.TriggerRegisterAnyUnitEventBJ(trig_JiNengFuWen, CJ.EVENT_PLAYER_UNIT_SPELL_CAST )

CJ.TriggerAddCondition(trig_JiNengFuWen, CJ.Condition(
	function ()
		return (CJ.GetUnitTypeId(CJ.GetTriggerUnit()) == Global:GetId('e001'))
	end
))
CJ.TriggerAddAction(trig_JiNengFuWen,
    function () 
        local SU = CJ.GetTriggerUnit()  --触发单位
        local id = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(CJ.GetTriggerUnit()))--触发玩家ID
        local h = GM:GetHero(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU)))
        local x = Global:GetStrId(GM:GetHero(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU))).heroType)
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, japi.EXGetAbilityDataString (japi.EXGetUnitAbility(SU, CJ.GetSpellAbilityId()), 1, 203)) 
        --native EXGetAbilityDataString  takes ability abil, integer level, integer data_type returns string
        --if japi.EXGetAbilityDataString (japi.EXGetUnitAbility(SU, CJ.GetSpellAbilityId()), 1, 203)== "符文-防御" then  
            --RemoveAbility(CJ.GetTriggerUnit(),id)  
        --end  

        --符文A
        if japi.EXGetAbilityDataString (japi.EXGetUnitAbility(SU, CJ.GetSpellAbilityId()), 1, 203)== "符文A[00"..tostring(id-1).."]" then  
            --RemoveAbility(CJ.GetTriggerUnit(),id)  
            if h.JnFuWen == "选择符文-技能1" then
                h["技能1符文"] = 1
                CJ.SetUnitAbilityLevel(h.heroID, Global:GetId(HD[x] ["技能1"].ID), 2 )
            elseif h.JnFuWen == "选择符文-技能2" then
                h["技能2符文"] = 1
                CJ.SetUnitAbilityLevel( h.heroID, Global:GetId(HD[x] ["技能2"].ID), 2 )
            elseif h.JnFuWen == "选择符文-技能3" then
                h["技能3符文"] = 1
                CJ.SetUnitAbilityLevel( h.heroID, Global:GetId(HD[x] ["技能3"].ID), 2 )
            elseif h.JnFuWen == "选择符文-技能4" then
                h["技能4符文"] = 1
                CJ.SetUnitAbilityLevel( h.heroID, Global:GetId(HD[x] ["技能4"].ID), 2 )
            elseif h.JnFuWen == "选择符文-技能5" then
                h["技能5符文"] = 1
                CJ.SetUnitAbilityLevel( h.heroID, Global:GetId(HD[x] ["技能5"].ID), 2 )
            elseif h.JnFuWen == "选择符文-技能6" then
                h["技能6符文"] = 1
                CJ.SetUnitAbilityLevel( h.heroID, Global:GetId(HD[x] ["技能6"].ID), 2 )
            elseif h.JnFuWen == "选择符文-技能7" then
                h["技能7符文"] = 1
                CJ.SetUnitAbilityLevel( h.heroID, Global:GetId(HD[x] ["技能7"].ID), 2 )
            end
        end 
        --符文B
        if japi.EXGetAbilityDataString (japi.EXGetUnitAbility(SU, CJ.GetSpellAbilityId()), 1, 203)== "符文B[00"..tostring(id-1).."]" then  
            --RemoveAbility(CJ.GetTriggerUnit(),id)  
            if h.JnFuWen == "选择符文-技能1" then
                h["技能1符文"] = 2
                CJ.SetUnitAbilityLevel( h.heroID, Global:GetId(HD[x] ["技能1"].ID), 3 )
            elseif h.JnFuWen == "选择符文-技能2" then
                h["技能2符文"] = 2
                CJ.SetUnitAbilityLevel( h.heroID, Global:GetId(HD[x] ["技能2"].ID), 3 )
            elseif h.JnFuWen == "选择符文-技能3" then
                h["技能3符文"] = 2
                CJ.SetUnitAbilityLevel( h.heroID, Global:GetId(HD[x] ["技能3"].ID), 3 )
            elseif h.JnFuWen == "选择符文-技能4" then
                h["技能4符文"] = 2
                CJ.SetUnitAbilityLevel(h.heroID, Global:GetId(HD[x] ["技能4"].ID), 3 )
            elseif h.JnFuWen == "选择符文-技能5" then
                h["技能5符文"] = 2
                CJ.SetUnitAbilityLevel( h.heroID, Global:GetId(HD[x] ["技能5"].ID), 3 )
            elseif h.JnFuWen == "选择符文-技能6" then
                h["技能6符文"] = 2
                CJ.SetUnitAbilityLevel( h.heroID, Global:GetId(HD[x] ["技能6"].ID), 3 )
            elseif h.JnFuWen == "选择符文-技能7" then
                h["技能7符文"] = 2
                CJ.SetUnitAbilityLevel( h.heroID, Global:GetId(HD[x] ["技能7"].ID), 3 )
            end
        end 
        --符文C
        if japi.EXGetAbilityDataString (japi.EXGetUnitAbility(SU, CJ.GetSpellAbilityId()), 1, 203)== "符文C[00"..tostring(id-1).."]" then  
           -- RemoveAbility(CJ.GetTriggerUnit(),id)  
           if h.JnFuWen == "选择符文-技能1" then
            h["技能1符文"] = 3
            CJ.SetUnitAbilityLevel( h.heroID, Global:GetId(HD[x] ["技能1"].ID), 4 )
        elseif h.JnFuWen == "选择符文-技能2" then
            h["技能2符文"] = 3
            CJ.SetUnitAbilityLevel( h.heroID, Global:GetId(HD[x] ["技能2"].ID), 4 )
        elseif h.JnFuWen == "选择符文-技能3" then
            h["技能3符文"] = 3
            CJ.SetUnitAbilityLevel( h.heroID, Global:GetId(HD[x] ["技能3"].ID), 4 )
        elseif h.JnFuWen == "选择符文-技能4" then
            h["技能4符文"] = 3
            CJ.SetUnitAbilityLevel( h.heroID, Global:GetId(HD[x] ["技能4"].ID), 4 )
        elseif h.JnFuWen == "选择符文-技能5" then
            h["技能5符文"] = 3
            CJ.SetUnitAbilityLevel( h.heroID, Global:GetId(HD[x] ["技能5"].ID), 4 )
        elseif h.JnFuWen == "选择符文-技能6" then
            h["技能6符文"] = 3
            CJ.SetUnitAbilityLevel( h.heroID, Global:GetId(HD[x] ["技能6"].ID), 4 )
        elseif h.JnFuWen == "选择符文-技能7" then
            h["技能7符文"] = 3
            CJ.SetUnitAbilityLevel( h.heroID, Global:GetId(HD[x] ["技能7"].ID), 4 )
        end
        end 
        --符文D
        if japi.EXGetAbilityDataString (japi.EXGetUnitAbility(SU, CJ.GetSpellAbilityId()), 1, 203)== "符文D[00"..tostring(id-1).."]" then  
            --RemoveAbility(CJ.GetTriggerUnit(),id)  
           
        end 

        --符文E
        if japi.EXGetAbilityDataString (japi.EXGetUnitAbility(SU, CJ.GetSpellAbilityId()), 1, 203)== "符文E[00"..tostring(id-1).."]" then  
           -- RemoveAbility(CJ.GetTriggerUnit(),id)  
           
        end 
        --符文F
        if japi.EXGetAbilityDataString (japi.EXGetUnitAbility(SU, CJ.GetSpellAbilityId()), 1, 203)== "符文F[00"..tostring(id-1).."]" then  
            RemoveAbility(CJ.GetTriggerUnit(),id)  
            if h.JnFuWen == "主界面" then
                h.JnFuWen = "选择符文-技能7"

                --添加符文
                CJ.UnitAddAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A") )
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A")), 1, 215,HD[x] ["技能7"]["符文1"].Name)
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A")), 1, 218,HD[x] ["技能7"]["符文1"].Explain	)	
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A")), 1, 204,HD[x] ["技能7"]["符文1"].TuBiao )
    
                CJ.UnitAddAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B") )
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B")), 1, 215,HD[x] ["技能7"]["符文2"].Name)
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B")), 1, 218,HD[x] ["技能7"]["符文2"].Explain	)	
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B")), 1, 204,HD[x] ["技能7"]["符文2"].TuBiao )
                CJ.UnitAddAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C") )
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C")), 1, 215,HD[x] ["技能7"]["符文3"].Name)
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C")), 1, 218,HD[x] ["技能7"]["符文3"].Explain	)	
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C")), 1, 204,HD[x] ["技能7"]["符文3"].TuBiao )

                ReturnAbility(SU,id)
            end
            
        end 
        --符文G
        if japi.EXGetAbilityDataString (japi.EXGetUnitAbility(SU, CJ.GetSpellAbilityId()), 1, 203)== "符文G[00"..tostring(id-1).."]" then  
            RemoveAbility(CJ.GetTriggerUnit(),id)  
            if h.JnFuWen == "主界面" then
                h.JnFuWen = "选择符文-技能6"

                --添加符文
                CJ.UnitAddAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A") )
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A")), 1, 215,HD[x] ["技能6"]["符文1"].Name)
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A")), 1, 218,HD[x] ["技能6"]["符文1"].Explain	)	
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A")), 1, 204,HD[x] ["技能6"]["符文1"].TuBiao )
    
                CJ.UnitAddAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B") )
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B")), 1, 215,HD[x] ["技能6"]["符文2"].Name)
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B")), 1, 218,HD[x] ["技能6"]["符文2"].Explain	)	
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B")), 1, 204,HD[x] ["技能6"]["符文2"].TuBiao )
                CJ.UnitAddAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C") )
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C")), 1, 215,HD[x] ["技能6"]["符文3"].Name)
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C")), 1, 218,HD[x] ["技能6"]["符文3"].Explain	)	
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C")), 1, 204,HD[x] ["技能6"]["符文3"].TuBiao )

                ReturnAbility(SU,id)
            end
            
        end 
        --符文H
        if japi.EXGetAbilityDataString (japi.EXGetUnitAbility(SU, CJ.GetSpellAbilityId()), 1, 203)== "符文H[00"..tostring(id-1).."]" then  
            RemoveAbility(CJ.GetTriggerUnit(),id)  
            if h.JnFuWen == "主界面" then
                h.JnFuWen = "选择符文-技能5"

                --添加符文
                CJ.UnitAddAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A") )
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A")), 1, 215,HD[x] ["技能5"]["符文1"].Name)
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A")), 1, 218,HD[x] ["技能5"]["符文1"].Explain	)	
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A")), 1, 204,HD[x] ["技能5"]["符文1"].TuBiao )
    
                CJ.UnitAddAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B") )
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B")), 1, 215,HD[x] ["技能5"]["符文2"].Name)
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B")), 1, 218,HD[x] ["技能5"]["符文2"].Explain	)	
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B")), 1, 204,HD[x] ["技能5"]["符文2"].TuBiao )
                CJ.UnitAddAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C") )
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C")), 1, 215,HD[x] ["技能5"]["符文3"].Name)
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C")), 1, 218,HD[x] ["技能5"]["符文3"].Explain	)	
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C")), 1, 204,HD[x] ["技能5"]["符文3"].TuBiao )

                ReturnAbility(SU,id)
            end
            
        end 
        --符文I
        if japi.EXGetAbilityDataString (japi.EXGetUnitAbility(SU, CJ.GetSpellAbilityId()), 1, 203)== "符文I[00"..tostring(id-1).."]" then  
            RemoveAbility(CJ.GetTriggerUnit(),id)  
            if h.JnFuWen == "主界面" then
                h.JnFuWen = "选择符文-技能1"

                --添加符文
                CJ.UnitAddAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A") )
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A")), 1, 215,HD[x] ["技能1"]["符文1"].Name)
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A")), 1, 218,HD[x] ["技能1"]["符文1"].Explain	)	
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A")), 1, 204,HD[x] ["技能1"]["符文1"].TuBiao )
    
                CJ.UnitAddAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B") )
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B")), 1, 215,HD[x] ["技能1"]["符文2"].Name)
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B")), 1, 218,HD[x] ["技能1"]["符文2"].Explain	)	
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B")), 1, 204,HD[x] ["技能1"]["符文2"].TuBiao )
                CJ.UnitAddAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C") )
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C")), 1, 215,HD[x] ["技能1"]["符文3"].Name)
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C")), 1, 218,HD[x] ["技能1"]["符文3"].Explain	)	
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C")), 1, 204,HD[x] ["技能1"]["符文3"].TuBiao )

                ReturnAbility(SU,id)
            end
            
        end 

        --符文J
        if japi.EXGetAbilityDataString (japi.EXGetUnitAbility(SU, CJ.GetSpellAbilityId()), 1, 203)== "符文J[00"..tostring(id-1).."]" then  
            RemoveAbility(CJ.GetTriggerUnit(),id)  
            if h.JnFuWen == "主界面" then
                h.JnFuWen = "选择符文-技能2"

                --添加符文
                CJ.UnitAddAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A") )
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A")), 1, 215,HD[x] ["技能2"]["符文1"].Name)
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A")), 1, 218,HD[x] ["技能2"]["符文1"].Explain	)	
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A")), 1, 204,HD[x] ["技能2"]["符文1"].TuBiao )
    
                CJ.UnitAddAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B") )
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B")), 1, 215,HD[x] ["技能2"]["符文2"].Name)
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B")), 1, 218,HD[x] ["技能2"]["符文2"].Explain	)	
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B")), 1, 204,HD[x] ["技能2"]["符文2"].TuBiao )
                CJ.UnitAddAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C") )
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C")), 1, 215,HD[x] ["技能2"]["符文3"].Name)
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C")), 1, 218,HD[x] ["技能2"]["符文3"].Explain	)	
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C")), 1, 204,HD[x] ["技能2"]["符文3"].TuBiao )

                ReturnAbility(SU,id)
            end
            
        end 

        --符文K
        if japi.EXGetAbilityDataString (japi.EXGetUnitAbility(SU, CJ.GetSpellAbilityId()), 1, 203)== "符文K[00"..tostring(id-1).."]" then  
            RemoveAbility(CJ.GetTriggerUnit(),id)  
            if h.JnFuWen == "主界面" then
                h.JnFuWen = "选择符文-技能3"

                --添加符文
                CJ.UnitAddAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A") )
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A")), 1, 215,HD[x] ["技能3"]["符文1"].Name)
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A")), 1, 218,HD[x] ["技能3"]["符文1"].Explain	)	
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A")), 1, 204,HD[x] ["技能3"]["符文1"].TuBiao )
    
                CJ.UnitAddAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B") )
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B")), 1, 215,HD[x] ["技能3"]["符文2"].Name)
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B")), 1, 218,HD[x] ["技能3"]["符文2"].Explain	)	
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B")), 1, 204,HD[x] ["技能3"]["符文2"].TuBiao )
                CJ.UnitAddAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C") )
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C")), 1, 215,HD[x] ["技能3"]["符文3"].Name)
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C")), 1, 218,HD[x] ["技能3"]["符文3"].Explain	)	
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C")), 1, 204,HD[x] ["技能3"]["符文3"].TuBiao )

                ReturnAbility(SU,id)
            end
            
        end 
        --符文L
        if japi.EXGetAbilityDataString (japi.EXGetUnitAbility(SU, CJ.GetSpellAbilityId()), 1, 203)== "符文L[00"..tostring(id-1).."]" then  
            RemoveAbility(CJ.GetTriggerUnit(),id)  
            
            if h.JnFuWen == "主界面" then
                h.JnFuWen = "选择符文-技能4"

                --添加符文
                CJ.UnitAddAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A") )
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A")), 1, 215,HD[x] ["技能4"]["符文1"].Name)
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A")), 1, 218,HD[x] ["技能4"]["符文1"].Explain	)	
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."A")), 1, 204,HD[x] ["技能4"]["符文1"].TuBiao )
    
                CJ.UnitAddAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B") )
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B")), 1, 215,HD[x] ["技能4"]["符文2"].Name)
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B")), 1, 218,HD[x] ["技能4"]["符文2"].Explain	)	
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."B")), 1, 204,HD[x] ["技能4"]["符文2"].TuBiao )
                CJ.UnitAddAbility( CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C") )
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C")), 1, 215,HD[x] ["技能4"]["符文3"].Name)
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C")), 1, 218,HD[x] ["技能4"]["符文3"].Explain	)	
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(CJ.GetTriggerUnit(), Global:GetId("FW"..tostring(id-1).."C")), 1, 204,HD[x] ["技能4"]["符文3"].TuBiao )

                ReturnAbility(SU,id)
            elseif h.JnFuWen == "选择符文-技能1" or  h.JnFuWen == "选择符文-技能2" or  h.JnFuWen == "选择符文-技能3" or  h.JnFuWen == "选择符文-技能4" or  h.JnFuWen == "选择符文-技能5" or h.JnFuWen == "选择符文-技能6" or  h.JnFuWen == "选择符文-技能7" then
                RemoveAbility(SU,id)
                IntAbility(SU,id) 
            end
            
        end 
	end
)
