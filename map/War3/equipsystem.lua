local CJ = require 'jass.common'
local BJ = require 'blizzard'
local japi = require 'jass.japi'
require "ECS\\Manager\\UnitsManager"
require "ECS\\Manager\\WeaponryManager"
require "ECS\\Model\\Maths"
require "ECS\\Global"
-- 装备系统，使用装备
local trig1 = CJ.CreateTrigger()

BJ.TriggerRegisterAnyUnitEventBJ(trig1, CJ.EVENT_PLAYER_UNIT_USE_ITEM)

-- 下面大量使用了函数定义后直接使用的技巧，这样甚至不需要给函数安一个名字，所以称之为‘匿名函数’。
-- 好处是代码结构更加紧密，也省去了给函数想名字的烦恼。
-- zinc也有匿名函数，如果你使用过zinc，应该不会陌生。
CJ.TriggerAddCondition(trig1, CJ.Condition(
                           function()
        -- print('h111122a!')
        -- |xxxx|不是一个标准的lua语法，而是ydwe lua的扩展语法，值和jass里'xxxx'一样
        -- 注意，在lua里'xxxx'是一个字符串，和"xxxx"一样。
        -- print(CJ.GetItemTypeId(CJ.GetManipulatedItem()))

        -- return CJ.GetSpellAbilityId() == 1515412034
        -- return CJ.GetItemTypeId(CJ.GetManipulatedItem()) == 1227894832
        return CJ.GetWidgetLife(CJ.GetManipulatedItem()) > 99
    end))

CJ.TriggerAddAction(trig1, function()
    if CJ.GetWidgetLife(CJ.GetManipulatedItem()) == 100 then
        local IM = WeaponryManager:Instance()
        local GM = Game:Instance()
        local UM = UnitsManager
        -- 触发单位
        local u = CJ.GetTriggerUnit()
        -- 触发单位名称
        -- local s = CJ.GetUnitName(CJ.GetTriggerUnit())
        -- 触发玩家ID
        local id = BJ.GetConvertedPlayerId(
                       CJ.GetOwningPlayer(CJ.GetTriggerUnit()))
        -- 物品ID
        local itemid = CJ.GetItemTypeId(CJ.GetManipulatedItem())
        -- 被操作物品
        local it = CJ.GetManipulatedItem()
        -- 物品数据
        local x1 = IM:GetDota(itemid)
        if x1 ~= 0 then
            -- statements
            -- print(x1["Base"]["自定义值"].Value)
            -- 装备图标技能
            local j =
                'ZG' .. Global.GetCustom(x1["Base"]["自定义值"].Value) ..
                    tostring(id - 1)
            -- 丢弃物品
            BJ.UnitRemoveItemSwapped(it, u)

            if CJ.GetUnitAbilityLevel(u, Maths.GetId(j)) ~= 1 then
                -- 设置工程升级
                -- 添加工程升级技能
                CJ.UnitAddAbility(u, Maths.GetId(j))
                -- 设置技能永久性
                CJ.UnitMakeAbilityPermanent(u, true, Maths.GetId(j))
                BJ.SetPlayerAbilityAvailableBJ(false, Maths.GetId(j),
                                               CJ.GetOwningPlayer(u))
            else
                -- 获取已装备的物品数据
                local xd = UM.GetEquipment(u, x1["Base"]["自定义值"].Value)
                -- 创建物品数据
                local xc = IM:CreateAppointItem(xd)
                -- 设置图标
                japi.EXSetItemDataString(xc.ID, 1, IM:GetIcon(xc))
                -- 在物品栏创建物品
                BJ.UnitAddItemByIdSwapped(xc.ID, u)
                -- 设置名称 说明
                japi.EXSetItemDataString(xc.ID, 4, IM:GetName(xc))
                japi.EXSetItemDataString(xc.ID, 3, IM:GetExplain(xc))
                japi.EXSetItemDataString(xc.ID, 1, IM:GetIcon(xc))
                -- 移除英雄装备数据
                UM.RemoveWeaponry(u, xc)
                japi.EXSetItemDataString(xc.ID, 1, IM:GetIcon(xc))
            end
            -- 添加英雄装备数据
            UM.SetWeaponry(u, x1)
            -- 替换装备说明
            local mj = GM.MajiID["玩家" .. tostring(id)].Equipment_Maji
            local mjjn = 'ZW' ..
                             Global.GetCustom(x1["Base"]["自定义值"].Value) ..
                             tostring(id - 1)
            japi.EXSetAbilityDataString(japi.EXGetUnitAbility(mj,
                                                              Maths.GetId(mjjn)),
                                        1, 215, IM:GetName(x1))
            japi.EXSetAbilityDataString(japi.EXGetUnitAbility(mj,
                                                              Maths.GetId(mjjn)),
                                        1, 218, IM:GetExplain(x1))
            -- CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, IM:GetExplain(x1))
            japi.EXSetAbilityDataString(japi.EXGetUnitAbility(mj,
                                                              Maths.GetId(mjjn)),
                                        1, 204, IM:GetIcon(x1))
            -- 物品管理器删除物品
            IM:Remove(x1)
            japi.EXSetAbilityDataString(japi.EXGetUnitAbility(mj,
                                                              Maths.GetId(mjjn)),
                                        1, 204, IM:GetIcon(x1))
            CJ.RemoveItem(it)
            -- 删除物品
        end

    end
end)
