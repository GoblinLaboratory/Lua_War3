#ifndef Hc_AutoMergeItem_Used
#define Hc_AutoMergeItem_Used

library HcAutoMergeItem
#define ItemAutoMerge 1134596174 /*Hash: 物品自动叠加*/
	globals
		private itemtype ItemType
		private trigger trg=null
		#ifndef XGHtbIncluded
		#define XGHtbIncluded
			hashtable Xg_htb = InitHashtable()
		#endif
	endglobals
	private function MergeItem_Act takes nothing returns nothing
		local item it=GetManipulatedItem()
		local unit u=GetManipulatingUnit()
		local item soltIt
		local integer i=0
		local integer a=GetItemCharges(it)
		local integer j=0
		local integer max
		local integer num
		local itemtype itp=GetItemType(it)
		set max=LoadInteger(Xg_htb,ItemAutoMerge,GetItemTypeId(it))
		if itp == ItemType or itp == ITEM_TYPE_ANY or max>0 and a>0 then
			loop
				set soltIt=UnitItemInSlot(u,i)
				if GetItemTypeId(it) == GetItemTypeId(soltIt) and it != soltIt then
					set num=GetItemCharges(soltIt)
					if max==0 then
						call SetItemCharges( soltIt, num + a )
						call RemoveItem( it )
					else
						set j = max - num
						if j > 0 then
							if a > j then
								call SetItemCharges( soltIt, num + j )
								call SetItemCharges( it, a-j ) //叠加且有剩余
							else
								call SetItemCharges( soltIt, num + a )
								call RemoveItem( it )
							endif
						endif
					endif
				endif
				set i=i+1
				exitwhen i>5
			endloop
		endif
		set itp=null
		set it=null
		set soltIt=null
		set u=null
	endfunction
	function HC_SetMergeMaxVal takes integer itemcode,integer max returns nothing
		call SaveInteger(Xg_htb,ItemAutoMerge,itemcode,max)
	endfunction
	function HC_AutoMergeItem takes itemtype itp returns nothing
		local integer i=0
		if trg!=null then
			call DestroyTrigger(trg)
		endif
		set trg = CreateTrigger()
		call TriggerAddAction(trg,function MergeItem_Act)
		loop
			call TriggerRegisterPlayerUnitEvent(trg,Player(i),EVENT_PLAYER_UNIT_PICKUP_ITEM,null)
			set i=i+1
			exitwhen i>=15
		endloop
		set ItemType=itp
	endfunction
endlibrary
#endif
