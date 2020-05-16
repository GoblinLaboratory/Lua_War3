--酒馆选择英雄
local CJ = require 'jass.common'
local BJ = require 'blizzard'
local japi = require 'jass.japi'
require 'Global'
require 'GameManager'
require 'Attribute'
require 'UnitManager'

local trig_ChoiceHero = CJ.CreateTrigger()
BJ.TriggerRegisterAnyUnitEventBJ(trig_ChoiceHero, CJ.EVENT_PLAYER_UNIT_SELL)

---------------
local GM = GameManager:Instance()
local UM = UnitManager:Instance()
---------------

CJ.TriggerAddCondition(
    trig_ChoiceHero,
    CJ.Condition(
        function()
            if
                (CJ.IsUnitType(CJ.GetSoldUnit(), CJ.UNIT_TYPE_HERO) == true and
                    CJ.GetUnitTypeId(CJ.GetBuyingUnit()) == Global:GetId('hsz1'))
             then
                return true
            else
                return false
            end
        end
    )
)

CJ.TriggerAddAction(
    trig_ChoiceHero,
    function()
        local BU = CJ.GetBuyingUnit() --购买者
        --local Pi = CJ.GetUnitLoc(BU)
        local SU = CJ.GetSoldUnit() --被贩卖单位
        local id = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(SU)) --玩家ID
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, "玩家ID"..tostring(id) )
        --删除购买者
        --BJ.ExplodeUnitBJ(BU)
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '购买了'..CJ.GetUnitName(CJ.GetSoldUnit()))
        --添加装备栏
        local j = 'ZBL' .. tostring(id - 1)
        CJ.UnitAddAbility(SU, Global:GetId(j))

        ---添加到单位管理器
        --UM:AddUnit(SU)
        GM.Players[id].Hero_ID = SU
        CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, SU)
        CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, CJ.GetUnitTypeId(SU))
        CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, Global:GetStrId(CJ.GetUnitTypeId(GM.Players[id].Hero_ID)))
        --UM:GetUnit(SU).Attributes.AttackBloodSucking = 0.3
        --添加玩家
        --GM:AddPlayer(id)
        --local file = io.open("test1.txt", "a+")
    end
)
