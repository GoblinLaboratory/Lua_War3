local CJ = require 'jass.common'
local BJ = require 'blizzard'
local japi = require 'jass.japi'
require 'ItemManager'
require 'Item'
require 'GameManager'
require 'Global'
require 'UnitManager'
--装备系统，使用装备
local trig1 = CJ.CreateTrigger()

BJ.TriggerRegisterAnyUnitEventBJ(trig1, CJ.EVENT_PLAYER_UNIT_USE_ITEM)

-- 下面大量使用了函数定义后直接使用的技巧，这样甚至不需要给函数安一个名字，所以称之为‘匿名函数’。
-- 好处是代码结构更加紧密，也省去了给函数想名字的烦恼。
-- zinc也有匿名函数，如果你使用过zinc，应该不会陌生。
CJ.TriggerAddCondition(
    trig1,
    CJ.Condition(
        function()
            --print('h111122a!')
            -- |xxxx|不是一个标准的lua语法，而是ydwe lua的扩展语法，值和jass里'xxxx'一样
            -- 注意，在lua里'xxxx'是一个字符串，和"xxxx"一样。
            --print(CJ.GetItemTypeId(CJ.GetManipulatedItem()))

            --return CJ.GetSpellAbilityId() == 1515412034
            --return CJ.GetItemTypeId(CJ.GetManipulatedItem()) == 1227894832
            return CJ.GetWidgetLife(CJ.GetManipulatedItem()) > 99
        end
    )
)

CJ.TriggerAddAction(
    trig1,
    function()
        if CJ.GetWidgetLife(CJ.GetManipulatedItem()) == 100 then
            local IM = ItemManager:Instance()
            local GM = GameManager:Instance()

            local UM = UnitManager:Instance()

            local u = CJ.GetTriggerUnit() -- 触发单位
            --local s = CJ.GetUnitName(CJ.GetTriggerUnit()) --触发单位名称
            local id = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(CJ.GetTriggerUnit()))
             --触发玩家ID
            local itemid = CJ.GetItemTypeId(CJ.GetManipulatedItem())
             --物品ID
            local it = CJ.GetManipulatedItem() -- 被操作物品

            local x1 = IM:GetItemDota(itemid) --物品数据

            local j = 'ZG' .. x1.Uis.Custom .. tostring(id - 1)

            BJ.UnitRemoveItemSwapped(it, u)
             --丢弃物品

            if CJ.GetUnitAbilityLevel(u, Global:GetId(j)) ~= 1 then
                --设置工程升级
                CJ.UnitAddAbility(u, Global:GetId(j))
                CJ.UnitMakeAbilityPermanent(u, true, Global:GetId(j))
                BJ.SetPlayerAbilityAvailableBJ(false, Global:GetId(j), CJ.GetOwningPlayer(u))
            else
                local xd = UM:GetUnit(u):GetEquipment(x1.Uis.Custom)
                 --获取已装备的物品数据

                --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,"已装备"..xd.name)

                local xc = IM:CreateAppointItem(xd)
                 --创建物品数据

                japi.EXSetItemDataString(xc.ID, 1, xc.Uis.Art)

                BJ.UnitAddItemByIdSwapped(xc.ID, u)
                 --在物品栏创建物品

                japi.EXSetItemDataString(xc.ID, 4, IM:GetName(xc))
                japi.EXSetItemDataString(xc.ID, 3, IM:GetExplain(xc))

                --GM:GetHero(u):RemoveItemprototype(xc)--移除英雄装备数据
                UM:GetUnit(u):RemoveItemprototype(xc)
             --移除英雄装备数据
            end
            UM:GetUnit(u):SetItemprototype(x1) --添加英雄装备数据
            --替换装备说明
            local mj = GM.Players[id].EquipmentId
            local mjjn = 'ZW' .. x1.Uis.Custom .. tostring(id - 1)

            japi.EXSetAbilityDataString(japi.EXGetUnitAbility(mj, Global:GetId(mjjn)), 1, 215, IM:GetName(x1))
            japi.EXSetAbilityDataString(japi.EXGetUnitAbility(mj, Global:GetId(mjjn)), 1, 218, IM:GetExplain(x1))
            japi.EXSetAbilityDataString(japi.EXGetUnitAbility(mj, Global:GetId(mjjn)), 1, 204, x1.Uis.Art)
            --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,"装备物品图标".. x.TuBiao)
            IM:RemoveAppointItem(x1)

            CJ.RemoveItem(it)
         --删除物品
        end
    end
)
