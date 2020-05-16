#ifndef Hc_PauseUnit_Used
#define Hc_PauseUnit_Used
	#include "XueYue\Define\PauseUnit.Cons" /* 载入常量 */
library HcPauseUnit
		#ifndef XGHtbIncluded
		#define XGHtbIncluded
		globals
			hashtable Xg_htb = InitHashtable()
		endglobals
		#endif
	function Xg_PauseUnitWithTimer_Timer takes nothing returns nothing
		local timer t=GetExpiredTimer()
		local integer key=GetHandleId(t)
		local unit u=LoadUnitHandle(Xg_htb,key,PauseUnit_Unit)
		local integer ukey=GetHandleId(u)
		local real timeout=LoadReal(Xg_htb,ukey,PauseUnit_Time)-0.01
		call SaveReal(Xg_htb,ukey,PauseUnit_Time,timeout)
		if timeout <=0 or IsUnitPaused(u)==false then
			call SaveReal(Xg_htb,ukey,PauseUnit_Time,0)
			call PauseUnit(u,false)
			call FlushChildHashtable(Xg_htb,key)
			call PauseTimer(t)
			call DestroyTimer(t)
		endif
		set u=null
		set t=null
	endfunction

	function Xg_PauseUnitWithTimer takes unit u,real time returns nothing
		local timer t
		if time > LoadReal(Xg_htb,GetHandleId(u),PauseUnit_Time) then
			call SaveReal(Xg_htb,GetHandleId(u),PauseUnit_Time,time)
		endif
		if LoadTimerHandle(Xg_htb,GetHandleId(u),PauseUnit_Time)==null then
			call PauseUnit(u,true)
			set t=CreateTimer()
			call SaveTimerHandle(Xg_htb,GetHandleId(u),PauseUnit_Timer,t)
			call SaveUnitHandle(Xg_htb,GetHandleId(t),PauseUnit_Unit,u)
			call TimerStart(t,0.01,true,function Xg_PauseUnitWithTimer_Timer)
			set t=null
		endif
	endfunction
	function XG_PauseUnitWithTimer_New takes unit u,real time,boolean b returns nothing
		local timer t
		local real OldTime=0.
		if b then/*叠加*/
			set OldTime=LoadReal(Xg_htb,GetHandleId(u),PauseUnit_Time)
		endif
		call SaveReal(Xg_htb,GetHandleId(u),PauseUnit_Time,OldTime + time)
		if LoadTimerHandle(Xg_htb,GetHandleId(u),PauseUnit_Time)==null then
			call PauseUnit(u,true)
			set t=CreateTimer()
			call SaveTimerHandle(Xg_htb,GetHandleId(u),PauseUnit_Timer,t)
			call SaveUnitHandle(Xg_htb,GetHandleId(t),PauseUnit_Unit,u)
			call TimerStart(t,0.01,true,function Xg_PauseUnitWithTimer_Timer)
			set t=null
		endif
	endfunction
endlibrary
#endif
