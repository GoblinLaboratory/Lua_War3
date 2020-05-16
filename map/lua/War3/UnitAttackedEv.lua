local CJ = require 'jass.common'
local BJ = require 'blizzard'
local japi = require 'jass.japi'
require 'GameManager'
require 'UnitManager'
require 'Global'
--require "EventTemplate"
require 'Effect'
require 'math'
require 'Attribute'

--任意单位被攻击

local trig_UnitAttacked1 = CJ.CreateTrigger()

BJ.TriggerRegisterAnyUnitEventBJ(trig_UnitAttacked1, CJ.EVENT_PLAYER_UNIT_ATTACKED)

local GM = GameManager:Instance()

local UM = UnitManager:Instance()

CJ.TriggerAddCondition(
    trig_UnitAttacked1,
    CJ.Condition(
        function()
            --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '单位被攻击1')
            return true
        end
    )
)

CJ.TriggerAddAction(
    trig_UnitAttacked1,
    function()
        local u = CJ.GetTriggerUnit()
        --被攻击单位
        local ul = CJ.GetAttacker()
        --攻击单位
        local id = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(CJ.GetTriggerUnit()))
        --被攻击单位玩家ID
        local ids = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(CJ.GetAttacker()))
        --攻击单位单位玩家ID
        local Attributes = Attribute:new()

        --CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, tostring(UM:GetUnit(ul).AttackNumber))
        if CJ.GetUnitAbilityLevel(ul, Global:GetId('A008')) > 0 and UM:GetUnit(ul).AttackNumber == 0 then
            --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '单位被攻击')
            local Rn = math.random(1, 100)
            if Rn > 80 then
                UM:GetUnit(ul).AttackNumber = 1
                if CJ.GetUnitAbilityLevel(ul, Global:GetId('A008')) == 1 then
                    Attributes.AttackSpeed = 4
                    UM:GetUnit(ul).UnAttackNumber = false
                    UM:GetUnit(ul):AddAttribute(Attributes)
                elseif CJ.GetUnitAbilityLevel(ul, Global:GetId('A008')) == 2 then
                    Attributes.AttackSpeed = 4
                    UM:GetUnit(ul).UnAttackNumber = false
                    UM:GetUnit(ul):AddAttribute(Attributes)
                    CJ.UnitAddAbility(ul, Global:GetId('A00X'))
                    CJ.SetPlayerAbilityAvailable(CJ.Player(ids - 1), Global:GetId('A00X'), false)
                elseif CJ.GetUnitAbilityLevel(ul, Global:GetId('A008')) == 3 then
                    Attributes.AttackSpeed = 4
                    UM:GetUnit(ul).UnAttackNumber = false
                    UM:GetUnit(ul):AddAttribute(Attributes)
                elseif CJ.GetUnitAbilityLevel(ul, Global:GetId('A008')) == 4 then
                    Attributes.AttackSpeed = 4
                    Attributes.AttackBloodSucking = 0.75
                    UM:GetUnit(ul).UnAttackNumber = true
                    UM:GetUnit(ul):AddAttribute(Attributes)
                else
                end
            end
        end
        --触发了剑术
        if CJ.GetUnitAbilityLevel(ul, Global:GetId('A008')) > 0 and UM:GetUnit(ul).AttackNumber ~= 0 then
            Attributes:Init()
            Attributes.AttackSpeed = -4
            --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '到期2')
            if CJ.GetUnitAbilityLevel(ul, Global:GetId('A008')) == 1 then
                if UM:GetUnit(ul).AttackNumber >= 4 then
                    if UM:GetUnit(ul).UnAttackNumber == true then
                        Attributes.AttackBloodSucking = -0.75
                    else
                        Attributes.AttackBloodSucking = 0
                    end
                    UM:GetUnit(ul):AddAttribute(Attributes)
                    UM:GetUnit(ul).AttackNumber = 0
                    UM:GetUnit(ul).UnAttackNumber = false
                else
                    UM:GetUnit(ul).AttackNumber = UM:GetUnit(ul).AttackNumber + 1
                end
            elseif CJ.GetUnitAbilityLevel(ul, Global:GetId('A008')) == 2 then
                if UM:GetUnit(ul).AttackNumber >= 4 then
                    if UM:GetUnit(ul).UnAttackNumber == true then
                        Attributes.AttackBloodSucking = -0.75
                    else
                        Attributes.AttackBloodSucking = 0
                    end
                    UM:GetUnit(ul):AddAttribute(Attributes)
                    UM:GetUnit(ul).AttackNumber = 0
                    UM:GetUnit(ul).UnAttackNumber = false
                    CJ.UnitRemoveAbility(ul, Global:GetId('A00X'))
                else
                    UM:GetUnit(ul).AttackNumber = UM:GetUnit(ul).AttackNumber + 1
                end
            elseif CJ.GetUnitAbilityLevel(ul, Global:GetId('A008')) == 3 then
                if UM:GetUnit(ul).AttackNumber >= 6 then
                    if UM:GetUnit(ul).UnAttackNumber == true then
                        Attributes.AttackBloodSucking = -0.75
                    else
                        Attributes.AttackBloodSucking = 0
                    end
                    UM:GetUnit(ul):AddAttribute(Attributes)
                    UM:GetUnit(ul).AttackNumber = 0
                    UM:GetUnit(ul).UnAttackNumber = false
                else
                    UM:GetUnit(ul).AttackNumber = UM:GetUnit(ul).AttackNumber + 1
                end
            elseif CJ.GetUnitAbilityLevel(ul, Global:GetId('A008')) == 4 then
                if UM:GetUnit(ul).AttackNumber >= 4 then
                    if UM:GetUnit(ul).UnAttackNumber == true then
                        Attributes.AttackBloodSucking = -0.75
                    else
                        Attributes.AttackBloodSucking = 0
                    end
                    UM:GetUnit(ul).UnAttackNumber = false
                    UM:GetUnit(ul):AddAttribute(Attributes)
                    UM:GetUnit(ul).AttackNumber = 0
                else
                    UM:GetUnit(ul).AttackNumber = UM:GetUnit(ul).AttackNumber + 1
                end
            else
            end
        end
    end
)
