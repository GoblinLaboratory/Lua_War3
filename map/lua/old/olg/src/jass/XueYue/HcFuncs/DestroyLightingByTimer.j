#ifndef Hc_DestroyLighting_Used
#define Hc_DestroyLighting_Used
library HCDestroyLighting
		#ifndef XGHtbIncluded
		#define XGHtbIncluded
			hashtable Xg_htb = InitHashtable()
		#endif
	function TimerForLt takes nothing returns nothing
		call DestroyLightning(LoadLightningHandle(Xg_htb,GetHandleId(GetExpiredTimer()),0))
		call FlushChildHashtable(Xg_htb,GetHandleId(GetExpiredTimer()))
		call DestroyTimer(GetExpiredTimer())
	endfunction

	function XG_DestroyLtByTimer takes real time,lightning lt returns nothing
		local timer t=CreateTimer()
		call SaveLightningHandle(Xg_htb,GetHandleId(t),0,lt)
		call TimerStart(t,time,false,function TimerForLt)
		set t=null
	endfunction
endlibrary
#endif
