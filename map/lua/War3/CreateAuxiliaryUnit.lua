local CJ = require 'jass.common'
local BJ = require 'blizzard'
local japi = require 'jass.japi'
require 'Global'
require 'GameManager'
require 'Attribute'
require 'UnitManager'
require 'Controlinterface'

local CreateAuxiliaryUnittrigint = CJ.CreateTrigger()

BJ.TriggerRegisterTimerEventSingle(CreateAuxiliaryUnittrigint, 1.1)
CJ.TriggerAddCondition(
    trigint,
    CJ.Condition(
        function()
            CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '初始化，请不要进行任何操作')
            return true
        end
    )
)

CJ.TriggerAddAction(
    CreateAuxiliaryUnittrigint,
    function()
        local GM = GameManager:Instance()
        local CI = Controlinterface:Instance()
        --创建靶子
        BJ.CreateNUnitsAtLoc(1, Global:GetId('hfoo'), CJ.Player(3), CJ.Location(800.0, 600.0), 270.0)
        BJ.CreateNUnitsAtLoc(1, Global:GetId('hfoo'), CJ.Player(3), CJ.Location(800.0, 600.0), 270.0)
        BJ.CreateNUnitsAtLoc(1, Global:GetId('hfoo'), CJ.Player(3), CJ.Location(800.0, 600.0), 270.0)
        BJ.CreateNUnitsAtLoc(1, Global:GetId('h007'), CJ.Player(3), CJ.Location(800.0, 600.0), 270.0)
        BJ.CreateNUnitsAtLoc(1, Global:GetId('h007'), CJ.Player(3), CJ.Location(2000.0, 20.0), 270.0)

        BJ.CreateNUnitsAtLoc(1, Global:GetId('hfoo'), CJ.Player(0), CJ.Location(2000.0, 20.0), 270.0)
        BJ.CreateNUnitsAtLoc(1, Global:GetId('hfoo'), CJ.Player(0), CJ.Location(2000.0, 20.0), 270.0)
        BJ.CreateNUnitsAtLoc(1, Global:GetId('hfoo'), CJ.Player(0), CJ.Location(2000.0, 20.0), 270.0)
        --创建装备马甲
        local mj = 'hsz2'
        local i = 1
        CJ.TimerStart(
            CJ.CreateTimer(),
            0.3,
            true,
            function()
                if i == 13 then
                    CJ.DestroyTimer(CJ.GetExpiredTimer())
                else
                    BJ.CreateNUnitsAtLoc(1, Global:GetId(mj), CJ.Player(i - 1), Global.ZBMJ_Position, 270.0)
                    --CJ.CreateUnit( Player(i-1),Global:GetId(mj), 0.00, 0.00, 270.0)
                    --创建装备马甲
                    local ZbMJ = BJ.GetLastCreatedUnit()
                    CJ.UnitAddAbility(ZbMJ, Global:GetId('ZWA' .. tostring(i - 1)))
                    CJ.UnitAddAbility(ZbMJ, Global:GetId('ZWB' .. tostring(i - 1)))
                    CJ.UnitAddAbility(ZbMJ, Global:GetId('ZWC' .. tostring(i - 1)))
                    CJ.UnitAddAbility(ZbMJ, Global:GetId('ZWD' .. tostring(i - 1)))
                    CJ.UnitAddAbility(ZbMJ, Global:GetId('ZWE' .. tostring(i - 1)))
                    CJ.UnitAddAbility(ZbMJ, Global:GetId('ZWF' .. tostring(i - 1)))
                    CJ.UnitAddAbility(ZbMJ, Global:GetId('ZWG' .. tostring(i - 1)))
                    CJ.UnitAddAbility(ZbMJ, Global:GetId('ZWH' .. tostring(i - 1)))
                    CJ.UnitAddAbility(ZbMJ, Global:GetId('ZWI' .. tostring(i - 1)))
                    CJ.UnitAddAbility(ZbMJ, Global:GetId('ZWJ' .. tostring(i - 1)))
                    CJ.UnitAddAbility(ZbMJ, Global:GetId('ZWK' .. tostring(i - 1)))
                    --CJ.UnitAddAbility( ZbMJ, Global:GetId("Avul") )

                    --GM.Maji_ID["玩家"..tostring(i)].Equipment_Maji = ZbMJ
                    GM.Players[i].EquipmentId = ZbMJ

                    --界面马甲
                    BJ.CreateNUnitsAtLoc(1, Global:GetId('hsz3'), CJ.Player(i - 1), Global.ZBMJ_Position, 270.0)
                    local JmMJ = BJ.GetLastCreatedUnit()
                    CJ.UnitAddAbility(JmMJ, Global:GetId('FW' .. tostring(i - 1) .. 'A'))
                    CJ.UnitAddAbility(JmMJ, Global:GetId('FW' .. tostring(i - 1) .. 'B'))
                    CJ.UnitAddAbility(JmMJ, Global:GetId('FW' .. tostring(i - 1) .. 'C'))
                    CJ.UnitAddAbility(JmMJ, Global:GetId('FW' .. tostring(i - 1) .. 'D'))
                    CJ.UnitAddAbility(JmMJ, Global:GetId('FW' .. tostring(i - 1) .. 'E'))
                    CJ.UnitAddAbility(JmMJ, Global:GetId('FW' .. tostring(i - 1) .. 'F'))
                    CJ.UnitAddAbility(JmMJ, Global:GetId('FW' .. tostring(i - 1) .. 'G'))
                    CJ.UnitAddAbility(JmMJ, Global:GetId('FW' .. tostring(i - 1) .. 'H'))
                    CJ.UnitAddAbility(JmMJ, Global:GetId('FW' .. tostring(i - 1) .. 'I'))
                    CJ.UnitAddAbility(JmMJ, Global:GetId('FW' .. tostring(i - 1) .. 'J'))
                    CJ.UnitAddAbility(JmMJ, Global:GetId('FW' .. tostring(i - 1) .. 'K'))
                    CJ.UnitAddAbility(JmMJ, Global:GetId('FW' .. tostring(i - 1) .. 'L'))

                    GM.Players[i].Interface = JmMJ

                    CI:Int(i)

                    i = i + 1
                end
            end
        )
    end
)
