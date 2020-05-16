#ifndef Hc_XuanYun_Used
#define Hc_XuanYun_Used
#include "XueYue\HcFuncs\DestroyUnitByTimer.j"
	#include "XueYue\Define\XuanYun.Cons" /* 载入常量 */
library HcXuanYun requires HcDestroyUnit
		#ifndef XGHtbIncluded
		#define XGHtbIncluded
		globals
			hashtable Xg_htb = InitHashtable()
		endglobals
		#endif

	function Xg_XuanYun_Init takes integer u,integer sk,integer buffcode returns nothing
	call SaveInteger(Xg_htb,XuanYun_System,XuanYun_Vest,u)
	call SaveInteger(Xg_htb,XuanYun_System,XuanYun_Skill,sk)
	call SaveInteger(Xg_htb,XuanYun_System,XuanYun_BUFF,buffcode)
	endfunction
	
	function Xg_XuanYun_Timer takes nothing returns nothing
		local timer t=GetExpiredTimer()
		local integer key=GetHandleId(t)
		local unit u=LoadUnitHandle(Xg_htb,key,XuanYun_Unit)
		local integer ukey=GetHandleId(u)
		local real timeout=LoadReal(Xg_htb,ukey,XuanYun_Time)-0.01
		local integer buffcode=LoadInteger(Xg_htb,XuanYun_System,XuanYun_BUFF)
		call SaveReal(Xg_htb,ukey,XuanYun_Time,timeout)
		if timeout + 0.1 <= 0 /*or GetUnitAbilityLevel(u, buffcode) <= 0*/ then //这里0.1是修正值，避免BUG
			call SaveReal(Xg_htb,ukey,XuanYun_Time,0)
			call UnitRemoveAbility(u, buffcode)
			call FlushChildHashtable(Xg_htb,key)
			call PauseTimer(GetExpiredTimer())
			call DestroyTimer(GetExpiredTimer())
		endif
		set u=null
		set t=null
	endfunction
	function Xg_XuanYunUnit takes unit u,real time returns nothing
		local integer uid
		local integer sk
		local unit us
		local timer t
		if time > LoadReal(Xg_htb,GetHandleId(u),XuanYun_Time) then
			call SaveReal(Xg_htb,GetHandleId(u),XuanYun_Time,time)
		endif
		if LoadTimerHandle(Xg_htb,GetHandleId(u),XuanYun_Timer)==null then
			set uid=LoadInteger(Xg_htb,XuanYun_System,XuanYun_Vest)
			set sk=LoadInteger(Xg_htb,XuanYun_System,XuanYun_Skill)
			set us=CreateUnit(GetOwningPlayer(u),uid,GetUnitX(u),GetUnitY(u),0)
			call XG_DestroyUtByTimer(0.5,us)
			call ShowUnit( us , false )
			call UnitAddAbility(us,sk)
			call IssueTargetOrder( us, "thunderbolt", u )
			set t=CreateTimer()
			call SaveTimerHandle(Xg_htb,GetHandleId(u),XuanYun_Timer,t)
			call SaveUnitHandle(Xg_htb,GetHandleId(t),XuanYun_Unit,u)
			call TimerStart(t,0.01,true,function Xg_XuanYun_Timer)
			set t=null
			set us=null
		endif
	endfunction
	function XG_XuanYunUnit_New takes unit u,real time,boolean b returns nothing
		local integer uid
		local integer sk
		local unit us
		local real OldTime=0.
		local timer t
		local integer ukey=GetHandleId(u)
		if b then/*叠加*/
			set OldTime=LoadReal(Xg_htb,ukey,XuanYun_Time)
		endif
		call SaveReal(Xg_htb,ukey,XuanYun_Time,OldTime + time)
		if LoadTimerHandle(Xg_htb,ukey,XuanYun_Timer)==null then
			set  uid=LoadInteger(Xg_htb,XuanYun_System,XuanYun_Vest)
			set  sk=LoadInteger(Xg_htb,XuanYun_System,XuanYun_Skill)
			set  us=CreateUnit(GetOwningPlayer(u),uid,GetUnitX(u),GetUnitY(u),0)
			call XG_DestroyUtByTimer(0.5,us)
			call ShowUnit( us , false )
			call UnitAddAbility(us,sk)
			call IssueTargetOrder( us, "thunderbolt", u )
			set  t=CreateTimer()
			call SaveTimerHandle(Xg_htb,ukey,XuanYun_Timer,t)
			call SaveUnitHandle(Xg_htb,GetHandleId(t),XuanYun_Unit,u)
			call TimerStart(t,0.01,true,function Xg_XuanYun_Timer)
			set  us=null
			set  t=null
		endif
	endfunction
endlibrary
#endif
