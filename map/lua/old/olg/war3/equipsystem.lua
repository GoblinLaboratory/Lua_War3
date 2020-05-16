local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
require "ItemSystem"
require "Item"
require "GameManager"
require "Hero"
require "Global"

--装备系统，使用装备
local trig1 = CJ.CreateTrigger()
BJ.TriggerRegisterAnyUnitEventBJ(trig1, CJ.EVENT_PLAYER_UNIT_USE_ITEM)

-- 下面大量使用了函数定义后直接使用的技巧，这样甚至不需要给函数安一个名字，所以称之为‘匿名函数’。
-- 好处是代码结构更加紧密，也省去了给函数想名字的烦恼。
-- zinc也有匿名函数，如果你使用过zinc，应该不会陌生。
CJ.TriggerAddCondition(trig1, CJ.Condition(
	function ()
		--print('h111122a!')
		-- |xxxx|不是一个标准的lua语法，而是ydwe lua的扩展语法，值和jass里'xxxx'一样
		-- 注意，在lua里'xxxx'是一个字符串，和"xxxx"一样。
		--print(CJ.GetItemTypeId(CJ.GetManipulatedItem()))
		
		--return CJ.GetSpellAbilityId() == 1515412034
		--return CJ.GetItemTypeId(CJ.GetManipulatedItem()) == 1227894832
		return CJ.GetWidgetLife(CJ.GetManipulatedItem()) > 99 
	end
))

CJ.TriggerAddAction(trig1,
	function () 
		
		if CJ.GetWidgetLife(CJ.GetManipulatedItem()) == 100 then
			local s1 = ItemSystem:Instance() 
			local GM = GameManager:Instance()
	
			local u = CJ.GetTriggerUnit() -- 触发单位
			local s = CJ.GetUnitName(CJ.GetTriggerUnit()) --触发单位名称
			local id = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(CJ.GetTriggerUnit()))--触发玩家ID
			local itemid = CJ.GetItemTypeId(CJ.GetManipulatedItem())--物品ID
			local it = CJ.GetManipulatedItem() -- 被操作物品
	
			--CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, "wup"..tostring(itemid ) )
			local x = s1:GetItemDota(itemid) --物品数据 
			
			local j = "ZG"..x.ZiDingYi..tostring(id-1)

			--CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, s1:GetId(j))
			BJ.UnitRemoveItemSwapped( it, u)--丢弃物品

			if CJ.GetUnitAbilityLevel(u, Global:GetId(j)) ~= 1 then
				
				--设置工程升级
				CJ.UnitAddAbility( u, Global:GetId(j) )
				CJ.UnitMakeAbilityPermanent( u, true, Global:GetId(j) )
				BJ.SetPlayerAbilityAvailableBJ( false,Global:GetId(j) , CJ.GetOwningPlayer(u) )
				

			else
				local xd = GM:GetHero(id):GetEquipment(x.ZiDingYi)--获取已装备的物品数据
				local xc = s1:CreateAppointItem(xd)--创建物品数据

				japi.EXSetItemDataString(xc.ID, 1, xc.TuBiao )
				BJ.UnitAddItemByIdSwapped( xc.ID, u)--在物品栏创建物品
				japi.EXSetItemDataString(xc.ID, 4, s1:GetName(xc))
				japi.EXSetItemDataString(xc.ID, 3, s1:GetExplain(xc))
				
				--CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,"卸下物品图标".. xc.TuBiao)
				GM:GetHero(id):RemoveItemprototype(xc)--移除英雄装备数据

			end
			GM:GetHero(id):SetItemprototype(x)  --添加英雄装备数据
            --替换装备说明
			local mj = GM:GetHero(id).Equipment_Maji_ID
			local mjjn = "ZW"..x.ZiDingYi..tostring(id-1)
			
			japi.EXSetAbilityDataString(japi.EXGetUnitAbility(mj, Global:GetId(mjjn)), 1, 215,s1:GetName(x))
			japi.EXSetAbilityDataString(japi.EXGetUnitAbility(mj, Global:GetId(mjjn)), 1, 218,s1:GetExplain(x))	
			japi.EXSetAbilityDataString(japi.EXGetUnitAbility(mj, Global:GetId(mjjn)), 1, 204,x.TuBiao )
			--CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,"装备物品图标".. x.TuBiao)	
			s1:RemoveAppointItem(x)

		    CJ.RemoveItem( it)--删除物品
		end
		
	end
)


		
