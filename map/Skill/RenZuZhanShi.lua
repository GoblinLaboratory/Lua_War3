--人族战士技能
local CJ = require 'jass.common'
local BJ = require 'blizzard'
--local japi = require 'jass.japi'
require 'Global'
require 'GameManager'
require 'Attribute'
require 'UnitManager'

local trig_RenzuZhanshi1 = CJ.CreateTrigger()
BJ.TriggerRegisterAnyUnitEventBJ(trig_RenzuZhanshi1, CJ.EVENT_PLAYER_UNIT_ISSUED_ORDER)

CJ.TriggerAddCondition(
    trig_RenzuZhanshi1,
    CJ.Condition(
        function()
            return true
        end
    )
)

CJ.TriggerAddAction(
    trig_RenzuZhanshi1,
    function()
        local u = CJ.GetTriggerUnit() -- 触发单位
        if CJ.IsUnitType(u, CJ.UNIT_TYPE_HERO) == true then
            if BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('defend') then
                CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '举盾')
                --UM:GetUnit(u).defend = true
            end
            if BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('undefend') then
                CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '落盾')
                --UM:GetUnit(u).defend = true
            end
        end
    end
)
