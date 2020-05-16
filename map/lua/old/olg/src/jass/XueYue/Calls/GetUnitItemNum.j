#ifndef XGGetUnitItemNumIncluded
#define XGGetUnitItemNumIncluded

library XGGetUnitItemNum
//获取物品数量
	function XG_GetUnitItemNum takes unit u,integer it returns integer
	  local integer i = 0
	  local integer num = 0
	  local integer ii = 0
	  local item y
	  loop
	    exitwhen i>5
	    set y = UnitItemInSlot(u,i)
	    if GetItemTypeId(y) == it then
	      set ii = GetItemCharges( y )
	      if ii == 0 then
	        set ii = 1
	      endif
	      set num = num + ii
	    endif
	    set i = i + 1
	  endloop
	    return num
	endfunction
endlibrary

#endif
