#ifndef XGsysZhiLiaoIncluded
#define XGsysZhiLiaoIncluded

#include "XueYue\Base.j"
#include "XueYue\HcFuncs\DestroyLightingByTimer.j"
#include "XueYue\HcFuncs\GetUnitZ.j"
#include "XueYue\Define\ZhiLiao.Cons" /* 定义常量 */
library XGsysZhiLiao initializer Init requires XGbase,HCDestroyLighting,HCGetUnitZ
globals
	private hashtable	htb		= 	InitHashtable()
	private trigger	array	 Trigger
	private integer	array	 Num
endglobals
function Xg_Reg_ZhiLiao takes trigger trg returns nothing
	set Num[0] = Num[0] + 1
	set Trigger[Num[0]] = trg
endfunction

function Xg_ZLsource takes nothing returns unit //获取治疗来源
	return LoadUnitHandle(htb, Num[1], XGZL_UNS)
endfunction

function Xg_ZLunit takes nothing returns unit //获取治疗单位
	return LoadUnitHandle(htb, Num[1], XGZL_UNE)
endfunction

function Xg_ZLval takes nothing returns real //获取治疗值
	return LoadReal(htb, Num[1], XGZL_VAL)
endfunction

function Xg_setZLval takes real val returns nothing //设置治疗值
	call SaveReal(htb, Num[1], XGZL_VAL, val)
endfunction

function Xg_ZLForYLB takes nothing returns boolean
	return LoadInteger(htb, Num[1], XGZL_YLB_Num) > 1
endfunction

function Xg_Get_YLBNum takes nothing returns integer
	return LoadInteger(htb, Num[1], XGZL_YLB_Num)
endfunction

function Xg_Get_YLB takes nothing returns integer
	return LoadInteger(htb, Num[1], XGZL_YLB)
endfunction

function Xg_ExcSysZhiLiao takes unit us,unit ue,real val returns real//运行治疗触发器
	local integer i = 1
	local real r
	set Num[1] = Num[1] + 1
	call SaveUnitHandle(htb, Num[1], XGZL_UNS, us)
	call SaveUnitHandle(htb, Num[1], XGZL_UNE, ue)
	call SaveReal(htb, Num[1], XGZL_VAL, val)
	loop
		exitwhen i > Num[0]
		if IsTriggerEnabled( Trigger[i] ) then
			if TriggerEvaluate( Trigger[i] ) then
				call TriggerExecute( Trigger[i] )
			endif
		endif
		set i = i + 1
	endloop
	set r =  LoadReal(htb, Num[1], XGZL_VAL)
	call FlushChildHashtable(htb, Num[1])
	set Num[1] = Num[1] - 1
	return r
endfunction

function Xg_ZhiLiao takes unit us,unit ue,real hp returns nothing//治疗指定单位 (治疗来源,治疗单位,治疗量)
	local real val = Xg_ExcSysZhiLiao(us,ue,hp)
	call SetUnitState(ue, UNIT_STATE_LIFE, GetUnitState(ue, UNIT_STATE_LIFE) + val)
endfunction

function Trig_Group_1_Cont takes nothing returns boolean
	local unit u = GetFilterUnit()
	local integer key = GetHandleId(GetExpiredTimer())
	local unit last = LoadUnitHandle(htb, key, XGZL_TIMER_LAST)
	local unit us = LoadUnitHandle(htb, key, XGZL_TIMER_SOURCE)
	local real life = GetUnitState(u,UNIT_STATE_LIFE)
	local boolean b=IsUnitAlly(u, GetOwningPlayer(us)) and not(IsUnitType(u, UNIT_TYPE_STRUCTURE))		and life > 0.405 and life < GetUnitState(u,UNIT_STATE_MAX_LIFE) and u != last and not(IsUnitInGroup(u, LoadGroupHandle(htb, key, XGZL_TIMER_GROUP)))
	set u = null
	set last = null
	set us = null
	return b
endfunction

private function Timer_YLB takes nothing returns nothing
	local timer t = GetExpiredTimer()
	local integer key = GetHandleId(t)
	local integer tnum = LoadInteger(htb, key, XGZL_TIMER_NUMBER)
	local real value=LoadReal(htb, key, XGZL_TIMER_VALUE)
	local unit u = LoadUnitHandle(htb, key, XGZL_TIMER_LAST)
	local group sdg=LoadGroupHandle(htb, key, XGZL_TIMER_GROUP)
	local unit next
	local group g = CreateGroup()
	local boolexpr expr = Condition(function Trig_Group_1_Cont)
	local real x = GetUnitX(u)
	local real y = GetUnitY(u)
	local integer num = LoadInteger(htb,key,XGZL_YLB)
	call GroupEnumUnitsInRange(g, x, y, LoadReal(htb, key, XGZL_TIMER_RANGE), expr)
	call DestroyBoolExpr(expr)
	set expr = null
	set next = GroupPickRandomUnit(g)
	call DestroyGroup(g)
	set g = null
	if tnum <= 0 or next == null or value <= 0.00 then //判断无弹射次数+无弹射单位+治疗量过低
		call FlushChildHashtable(htb, key)
		call PauseTimer(t)
		call DestroyTimer(t)
		call DestroyGroup(sdg)
	else
		if sdg != null then
			call GroupAddUnit(sdg, next)
		endif
		call XG_DestroyLtByTimer( 0.75, AddLightningEx(LoadStr(htb, key,XGZL_TIMER_LIGHTING), false, x, y, GetUnitFlyHeight(u) ,GetUnitX(next), GetUnitY(next), Xg_GetUnitZ(next)) )
		set value = value * ( 1 + LoadReal(htb, key,  XGZL_TIMER_PART) ) //治疗递减
		call SaveInteger(htb, Num[1]+1, XGZL_YLB, num + 1)
	call SaveInteger(htb, Num[1]+1,XGZL_YLB_Num, num+1)
		call Xg_ZhiLiao(LoadUnitHandle(htb, key, XGZL_TIMER_LAST),next,value)
		call SaveUnitHandle(htb ,GetHandleId(t), XGZL_TIMER_LAST, next)
		call SaveReal(htb, GetHandleId(t), XGZL_TIMER_VALUE, value)
		call SaveInteger(htb, GetHandleId(t), XGZL_TIMER_NUMBER, tnum - 1)
	endif
	set t=null
	set next=null
	set sdg=null
endfunction
 //医疗波 :来源单位,指定单位,递减参数,弹射次数,治疗量,影响范围
function Xg_YLB takes unit us,unit ue,real rds,integer num,real value,real ran,boolean cfts,string mainlight,string minorlight returns nothing
	local timer t
	local integer key
	if value <= 0  or num <= 0 then
		return
	endif
	call XG_DestroyLtByTimer( 0.75, AddLightningEx(mainlight, false, GetUnitX(us), GetUnitY(us), GetUnitFlyHeight(us) , GetUnitX(ue), GetUnitY(ue), Xg_GetUnitZ(ue)) )
	call SaveInteger(htb, Num[1]+1, XGZL_YLB_Num, 1)
	call Xg_ZhiLiao( us, ue, value )
	if num <= 1 then
		return
	endif
	set t = CreateTimer()
	set key = GetHandleId(t)
	call SaveInteger(htb, key, XGZL_TIMER_NUMBER, num - 1)
	call SaveReal(htb, key, XGZL_TIMER_VALUE, value)
	call SaveReal(htb, key, XGZL_TIMER_PART, rds)
	call SaveReal(htb, key, XGZL_TIMER_RANGE, ran)
	call SaveStr(htb, key, XGZL_TIMER_LIGHTING, minorlight)
	call SaveInteger(htb, key, XGZL_YLB, 1)
	call SaveInteger(htb, key, XGZL_YLB_Num, num)
	if not cfts then //不重复弹射
		call SaveGroupHandle(htb, key, XGZL_TIMER_GROUP, CreateGroup())
	endif
	call SaveUnitHandle(htb, key, XGZL_TIMER_LAST, ue)
	call SaveUnitHandle(htb, key, XGZL_TIMER_SOURCE, us)
	call TimerStart(t, 0.2, true, function Timer_YLB)
	set t = null
endfunction

private function Init takes nothing returns nothing
	set Num[0] = 0
	set Num[1] = 0
endfunction

endlibrary

#endif

