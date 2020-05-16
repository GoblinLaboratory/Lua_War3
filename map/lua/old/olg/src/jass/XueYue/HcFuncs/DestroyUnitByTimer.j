#ifndef Hc_DestroyUnitUsed
#define Hc_DestroyUnitUsed
library HcDestroyUnit
		#ifndef XGHtbIncluded
		#define XGHtbIncluded
			hashtable Xg_htb = InitHashtable()
		#endif
	function TimerForUt takes nothing returns nothing
		call RemoveUnit(LoadUnitHandle(Xg_htb,GetHandleId(GetExpiredTimer()),0))
		call FlushChildHashtable(Xg_htb,GetHandleId(GetExpiredTimer()))
		call DestroyTimer(GetExpiredTimer())
	endfunction

	function XG_DestroyUtByTimer takes real time,unit u returns nothing
		local timer t=CreateTimer()
		call SaveUnitHandle(Xg_htb,GetHandleId(t),0,u)
		call TimerStart(t,time,false,function TimerForUt)
		set t=null
	endfunction
endlibrary
#endif
