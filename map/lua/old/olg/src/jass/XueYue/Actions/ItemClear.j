#ifndef XGItemClearIncluded
#define XGItemClearIncluded


library XgItemClear
globals
		#ifndef XGHtbIncluded
		#define XGHtbIncluded
		hashtable Xg_htb = InitHashtable()
		#endif
		private trigger Trg_ItemClear=null
endglobals
private function ItemClear_Timer takes nothing returns nothing
	local timer t=GetExpiredTimer()
	local integer key = GetHandleId(t)
	local item it=LoadItemHandle(Xg_htb,key,0)
	call SetWidgetLife(it, 0.401)
	call RemoveItem(it)
	call FlushChildHashtable(Xg_htb,key)
	call DestroyTimer(t)
	set t=null
	set it=null
endfunction
private function ItemClear_Act takes nothing returns nothing
	local timer t
	if IsItemIdPowerup(GetItemTypeId(GetManipulatedItem())) then
		set t = CreateTimer()
		call SaveItemHandle(Xg_htb, GetHandleId(t), 0, GetManipulatedItem())
		call TimerStart(t, 0.35, false, function ItemClear_Timer)
		set t = null
	endif
endfunction

function Xg_ItemClear_On takes nothing returns nothing
	local integer i=0
	set Trg_ItemClear=CreateTrigger()
	loop
        call TriggerRegisterPlayerUnitEvent(Trg_ItemClear, Player(i), EVENT_PLAYER_UNIT_PICKUP_ITEM, null)
        set i = i + 1
        exitwhen i == bj_MAX_PLAYER_SLOTS
    endloop
	call TriggerAddAction(Trg_ItemClear,function ItemClear_Act)
endfunction

endlibrary

#endif
