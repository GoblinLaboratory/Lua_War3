local CJ = require 'jass.common'
local BJ = require 'blizzard'
local japi = require 'jass.japi'
require 'ItemManager'
require 'Item'
require 'GameManager'
require 'Global'
require 'UnitManager'
require 'Controlinterface'

local trig_ManyHeroItemSystem = CJ.CreateTrigger()

BJ.TriggerRegisterPlayerSelectionEventBJ(trig_ManyHeroItemSystem, CJ.Player(0), true)
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_ManyHeroItemSystem, CJ.Player(1), true)
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_ManyHeroItemSystem, CJ.Player(2), true)
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_ManyHeroItemSystem, CJ.Player(3), true)
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_ManyHeroItemSystem, CJ.Player(4), true)
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_ManyHeroItemSystem, CJ.Player(5), true)
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_ManyHeroItemSystem, CJ.Player(6), true)
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_ManyHeroItemSystem, CJ.Player(7), true)
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_ManyHeroItemSystem, CJ.Player(8), true)
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_ManyHeroItemSystem, CJ.Player(9), true)
---------------
local GM = GameManager:Instance()
local UM = UnitManager:Instance()
local CI = Controlinterface:Instance()
---------------

CJ.TriggerAddCondition(
    trig_ManyHeroItemSystem,
    CJ.Condition(
        function()

            local id = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(CJ.GetTriggerUnit()))--触发玩家ID
            --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,CJ.GetUnitName(CJ.GetTriggerUnit()))
            return CJ.IsUnitType(CJ.GetTriggerUnit(), CJ.UNIT_TYPE_HERO) == true and
                CJ.GetUnitAbilityLevel(CJ.GetTriggerUnit(), Global:GetId('ZBL' .. tostring(id - 1))) > 0 and
                BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(CJ.GetTriggerUnit())) ==
                    BJ.GetConvertedPlayerId(CJ.GetTriggerPlayer())
        end
    )
)

CJ.TriggerAddAction(
    trig_ManyHeroItemSystem,
    function()
        local IM = ItemManager:Instance()

        local u = CJ.GetTriggerUnit() -- 触发单位
        local id = BJ.GetConvertedPlayerId(CJ.GetTriggerPlayer())
         --触发玩家ID

        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,CJ.GetUnitName(CJ.GetTriggerUnit()))
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,"物品栏测试")
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,CJ.GetUnitName(UM:GetUnit(u).UnitID))

        local mj = GM.Players[id].EquipmentId
        GM.Players[id].Hero_ID = u
        local s = string.byte('A', 1)
        for i = 1, 11 do
            --self.Equipment[i] = Item:new()
            --self.Equipment[i]:Int()
            --self.Equipment[i].Uis.Custom = string.char(s)
            local xd = UM:GetUnit(u):GetEquipment(string.char(s)) --获取已装备的物品数据
            if xd.Uis.Name ~= '无' then
                local mjjn = 'ZW' .. string.char(s) .. tostring(id - 1)

                -- CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,xd.Uis.Custom)
                --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,IM:GetName(xd))
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(mj, Global:GetId(mjjn)), 1, 215, IM:GetName(xd))
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(mj, Global:GetId(mjjn)), 1, 218, IM:GetExplain(xd))
                japi.EXSetAbilityDataString(japi.EXGetUnitAbility(mj, Global:GetId(mjjn)), 1, 204, xd.Uis.Art)
            end

            s = s + 1
        end
    end
)
