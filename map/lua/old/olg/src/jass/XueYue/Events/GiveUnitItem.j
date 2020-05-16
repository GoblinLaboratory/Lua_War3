#ifndef XGGiveUnitItemEventIncluded
#define XGGiveUnitItemEventIncluded

library HCGiveUnitItem initializer Init
#define HC_GiveUnitItem 939841844 //Hash:物品给予事件
#define HC_GiveUnitItem_Item 1764340739 //Hash:物品给予事件_Item
globals
#ifndef XGHtbIncluded
#define XGHtbIncluded
	hashtable Xg_htb = InitHashtable()
#endif
	private trigger Trg_PickUpItem=CreateTrigger()
	private trigger Trg_DropItem=CreateTrigger()
	private integer Num=0
	private boolean Switch=false
//	private integer Queue=0
	private trigger array Trigger
endglobals

function XG_GiveUnitItem_Reg takes trigger trg returns nothing
	set Num=Num+1
	set Trigger[Num]=trg
endfunction
function XG_GiveUnitItem_GetItem takes nothing returns item
	//return LoadUnitHandle(Xg_htb,HC_GiveUnitItem,Queue)
	return LoadItemHandle(Xg_htb,GetHandleId(GetExpiredTimer()),0)
endfunction
function XG_GiveUnitItem_GetUnitE takes nothing returns unit
	//return LoadUnitHandle(Xg_htb,HC_GiveUnitItem,-Queue)
	return LoadUnitHandle(Xg_htb,GetHandleId(GetExpiredTimer()),1)
endfunction
function XG_GiveUnitItem_GetUnitS takes nothing returns unit
	//return LoadUnitHandle(Xg_htb,HC_GiveUnitItem,Queue)
	return LoadUnitHandle(Xg_htb,GetHandleId(GetExpiredTimer()),2)
endfunction
private function Drop_Timer takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer key=GetHandleId(t)

local item it=LoadItemHandle(Xg_htb,key,0)
	if IsItemOwned(it) then
		
		//call SaveBoolean(Xg_htb,HC_GiveUnitItem,-GetHandleId(it),true) //Switch	
		//set Queue=Queue+1
		//call SaveUnitHandle(Xg_htb,key,2,LoadUnitHandle(Xg_htb,key,1))
		//call BJDebugMsg("====Drop====")
		//set Queue=Queue-1
		set Switch=true
		call SaveUnitHandle(Xg_htb,HC_GiveUnitItem_Item,GetHandleId(it),LoadUnitHandle(Xg_htb,key,1))
	endif
	set it=null
	call DestroyTimer(t)
	set t=null
	call FlushChildHashtable(Xg_htb,key)
endfunction

private function Drop_Act takes nothing returns nothing
	local timer t=CreateTimer()
	call SaveItemHandle(Xg_htb,GetHandleId(t),0,GetManipulatedItem())
	call SaveUnitHandle(Xg_htb,GetHandleId(t),1,GetManipulatingUnit())
	call TimerStart(t,0,false,function Drop_Timer)
	set t=null
endfunction
private function Pick_Timer takes nothing returns nothing
	local timer t=GetExpiredTimer()
	local integer i=1
	local integer key=GetHandleId(t)
	local item it=LoadItemHandle(Xg_htb,key,0)
	local unit u=LoadUnitHandle(Xg_htb,HC_GiveUnitItem_Item,GetHandleId(it))
	if Switch then
		set Switch=false
		call SaveUnitHandle(Xg_htb,key,2,u)
		//call BJDebugMsg("====Pick====")
		loop
			exitwhen i>Num
			if IsTriggerEnabled(Trigger[i]) then
				if TriggerEvaluate(Trigger[i]) then
					call TriggerExecute(Trigger[i])
				endif
			endif
			set i=i+1
		endloop

	endif
	call FlushChildHashtable(Xg_htb,GetHandleId(it))
	call DestroyTimer(t)
	set t=null
	set it=null
	set u=null
	call FlushChildHashtable(Xg_htb,key)
endfunction
private function Pick_Act takes nothing returns nothing
	local timer t=CreateTimer()
	call SaveItemHandle(Xg_htb,GetHandleId(t),0,GetManipulatedItem())
	call SaveUnitHandle(Xg_htb,GetHandleId(t),1,GetManipulatingUnit())
	call TimerStart(t,0,false,function Pick_Timer)
	set t=null
endfunction
/*
private function Group_Con takes nothing returns boolean
	local integer i
	local unit u=GetFilterUnit()
	if UnitInventorySize(u)>0 then
		set i=0
		loop
			if UnitItemInSlot(u,i)==null then
				//call SaveUnitHandle(Xg_htb,HC_GiveUnitItem_Item,GetHandleId(UnitItemInSlot(u,i)),u)
			endif
			set i=i+1
			exitwhen i>5
		endloop
	endif
	set u=null
	return false
endfunction
*/
private function Init takes nothing returns nothing
	local integer i=0
	//local group g=CreateGroup()
	//local rect r=GetWorldBounds()
	//local boolexpr expr=Condition(function Group_Con)
	set Trigger[0]=CreateTrigger()
	loop
		call TriggerRegisterPlayerUnitEvent(Trg_PickUpItem, Player(i), EVENT_PLAYER_UNIT_PICKUP_ITEM, null)
		call TriggerRegisterPlayerUnitEvent(Trg_DropItem, Player(i), EVENT_PLAYER_UNIT_DROP_ITEM, null)
		set i=i+1
		exitwhen i==15
	endloop
	call TriggerAddAction(Trg_PickUpItem,function Pick_Act)
	call TriggerAddAction(Trg_DropItem,function Drop_Act)
	//call GroupEnumUnitsInRect(g,r,expr)
	//call DestroyGroup(g)
	//call RemoveRect(r)
	//call DestroyBoolExpr(expr)
	//set expr=null
	//set r=null
	//set g=null
endfunction
endlibrary
#endif
