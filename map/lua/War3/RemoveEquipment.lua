local CJ = require 'jass.common'
local BJ = require 'blizzard'
local japi = require 'jass.japi'
require 'ItemManager'
require 'Item'
require 'GameManager'
require 'Unit'
require 'Global'

local trig_RemoveEquipment = CJ.CreateTrigger()
BJ.TriggerRegisterAnyUnitEventBJ(trig_RemoveEquipment, CJ.EVENT_PLAYER_UNIT_ISSUED_ORDER)

CJ.TriggerAddCondition(
    trig_RemoveEquipment,
    CJ.Condition(
        function()
            -- CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, "条件"..BJ.OrderId2StringBJ(BJ.GetIssuedOrderIdBJ()) )
            return BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('phoenixfire') or --主手武器 A
                BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('parasite') or --副手武器 B
                BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('parasiteoff') or
                 --头盔 C
                BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('parasiteon') or --铠甲 D
                BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('polymorph') or --披风 E
                BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('possession') or
                 --手套 F
                BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('preservation') or
                 --鞋 G
                BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('purge') or
                 --面具 H
                BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('rainofchaos') or
                 --项链 I
                BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('rainoffire') or
                 --饰品 J
                BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('raisedead') -- 戒指 K
        end
    )
)
CJ.TriggerAddAction(
    trig_RemoveEquipment,
    function()
        local Str = BJ.OrderId2StringBJ(BJ.GetIssuedOrderIdBJ())
        local zdy = ''
        if (Str == 'phoenixfire') then
            zdy = 'A'
        elseif (Str == 'parasite') then
            zdy = 'B'
        elseif (Str == 'parasiteoff') then
            zdy = 'C'
        elseif (Str == 'parasiteon') then
            zdy = 'D'
        elseif (Str == 'polymorph') then
            zdy = 'E'
        elseif (Str == 'possession') then
            zdy = 'F'
        elseif (Str == 'preservation') then
            zdy = 'G'
        elseif (Str == 'purge') then
            zdy = 'H'
        elseif (Str == 'rainofchaos') then
            zdy = 'I'
        elseif (Str == 'rainoffire') then
            zdy = 'J'
        elseif (Str == 'raisedead') then
            zdy = 'K'
        else
            zdy = 'L'
        end
        CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, zdy)
        if (zdy ~= 'L') then
            local s1 = ItemManager:Instance()
            local GM = GameManager:Instance()
            local UM = UnitManager:Instance()

            local u = CJ.GetTriggerUnit() -- 触发单位
            --local s = CJ.GetUnitName(CJ.GetTriggerUnit()) --触发单位名称
            local id = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(CJ.GetTriggerUnit()))
             --触发玩家ID

            --local xd = GM:GetHero(u):GetEquipment(zdy)--获取已装备的物品数据
            local xd = UM:GetUnit(u):GetEquipment(zdy)
             --获取已装备的物品数据
            local xc = s1:CreateAppointItem(xd)
             --创建物品数据
            local j = 'ZG' .. zdy .. tostring(id - 1)
            --删除工程升级
            CJ.UnitRemoveAbility(u, Global:GetId(j))

            japi.EXSetItemDataString(xc.ID, 1, xc.Uis.Art)

            BJ.UnitAddItemByIdSwapped(xc.ID, u)
             --在物品栏创建物品

            japi.EXSetItemDataString(xc.ID, 4, s1:GetName(xc))
            japi.EXSetItemDataString(xc.ID, 3, s1:GetExplain(xc))

            --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,"装备物品图标".. xc.TuBiao)
            --GM:GetHero(id):RemoveItemprototype(xc)--移除英雄装备数据
            UM:GetUnit(u):RemoveItemprototype(xc)
         --移除英雄装备数据
        end
    end
)
