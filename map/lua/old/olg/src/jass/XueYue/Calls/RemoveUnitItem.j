#ifndef XGRemoveUnitItemNumIncluded
#define XGRemoveUnitItemNumIncluded
library XGRemoveUnitItem
	//删除指定物品数量（数量不足则无效）
	function XG_RemoveUnitItem takes unit u,integer it,integer n returns boolean
	  local integer i = 0
	  local integer num = 0
	  local integer ii = 0
	  local integer array x
	  local item array y
	  loop
   	  exitwhen i>5 or num>=n
	    set y[0] = UnitItemInSlot(u,i)
	    if GetItemTypeId(y[0]) == it then
	      set ii = ii + 1
	      set x[ii] = GetItemCharges( y[0] )
	      if x[ii] == 0 then
	        set x[ii] = 1
	      endif
	      set y[ii]= y[0]
	      set num=num + x[ii]
	    endif
	    set i = i + 1
	  endloop
	  if ii <= 0 or num<n then
	    return false
	  endif
	  set i = 0
	  loop
	    set i = i + 1
	    exitwhen i > ii
	  
	    if i>=ii then
	      if n  == x[i] then
	        call RemoveItem(y[i])
	      else
	        call SetItemCharges(y[i], x[i] - n)
	      endif
	      return true
	    else
	      set n=n- x[i]
	      call RemoveItem(y[i])
	    endif
	  endloop
	  return true
	endfunction
endlibrary
#endif
