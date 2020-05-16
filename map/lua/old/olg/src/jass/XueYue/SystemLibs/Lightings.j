#ifndef XGsysSDLIncluded
#define XGsysSDLIncluded

#include "XueYue\Base.j"
#include "XueYue\HcFuncs\DestroyLightingByTimer.j"
#include "XueYue\HcFuncs\GetUnitZ.j"
<? local str = "" ?>
#ifdef XGDamPlus_ON
<? str = ",XGDamPlus" ?>
#endif
#include "XueYue\Define\Lighting.Cons" /* 定义常量 */
library XgLighting requires XGbase,HCDestroyLighting,HCGetUnitZ<?=str?>
globals
	private hashtable htb = InitHashtable()
	private trigger array Trigger
	private integer Num = 0
	private integer Que = 0
endglobals

function Xg_Reg_SDL takes trigger trg returns nothing//注册触发器
	set Num = Num + 1
	set Trigger[Num] = trg
endfunction

function Xg_SDLsource takes nothing returns unit //获取闪电链来源
	return LoadUnitHandle(htb, Que, Lighting_UNS)
endfunction

function Xg_SDLunit takes nothing returns unit //获取闪电链单位
	return LoadUnitHandle(htb, Que, Lighting_UNE)
endfunction

function Xg_SDLval takes nothing returns real //获取闪电链值
	return LoadReal(htb, Que, Lighting_VAL)
endfunction

function Xg_setSDLval takes real val returns nothing //设置闪电链值
	call SaveReal(htb, Que, Lighting_VAL, val)
endfunction

function Xg_ExcSysSDL takes unit us,unit ue,real val returns real//运行闪电链触发器
	local integer i = 1
	set Que = Que + 1
	call SaveUnitHandle(htb, Que, Lighting_UNS, us)
	call SaveUnitHandle(htb, Que, Lighting_UNE, ue)
	call SaveReal(htb, Que, Lighting_VAL, val)
	loop
		exitwhen i > Num
		if IsTriggerEnabled(Trigger[Num]) then
			if TriggerEvaluate(Trigger[Num]) then
				call TriggerExecute(Trigger[Num])
			endif
		endif
		set i = i + 1
	endloop
	set val = LoadReal(htb, Que, Lighting_VAL)
	call FlushChildHashtable(htb, Que)
	set Que = Que - 1
	return val
endfunction
function Xg_SDLSH takes unit us,unit ue,real val returns nothing//闪电链指定单位 (闪电链来源,闪电链单位,闪电链量)
	call SaveReal(htb, Que+1, Lighting_VAL, val)
	set val =  Xg_ExcSysSDL(us, ue, val)
	if val > 0 then
		#ifndef XGDamPlus_ON
		call UnitDamageTarget( us, ue, val, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_DIVINE, WEAPON_TYPE_WHOKNOWS )
		#else
		call XG_UnitDamTarPlus( us, ue, val, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_DIVINE, WEAPON_TYPE_WHOKNOWS )
		#endif
	endif
endfunction
function Xg_Trig_Group_2_Cont takes nothing returns boolean //敌人
	local unit u = GetFilterUnit()
	local integer key = GetHandleId(GetExpiredTimer())
	local unit last = LoadUnitHandle(htb, key, Lighting_TIMER_LAST)
	local unit us = LoadUnitHandle(htb, key, Lighting_TIMER_SOURCE)
	local real life = GetUnitState(u,UNIT_STATE_LIFE)
	local boolean b = not(IsUnitAlly(u, GetOwningPlayer(us))) and not(IsUnitType(u, UNIT_TYPE_STRUCTURE)) \
		and life > 0.405 and u != last and not(IsUnitInGroup(u, LoadGroupHandle(htb, key, Lighting_TIMER_GROUP)))
	set u = null
	set last = null
	set us = null
	return b
endfunction
function Xg_Trig_Group_3_Cont takes nothing returns boolean //盟友
	local unit u = GetFilterUnit()
	local integer key = GetHandleId(GetExpiredTimer())
	local unit last = LoadUnitHandle(htb, key, Lighting_TIMER_LAST)
	local unit us = LoadUnitHandle(htb, key, Lighting_TIMER_SOURCE)
	local real life = GetUnitState(u,UNIT_STATE_LIFE)
	local boolean b = not(IsUnitType(u, UNIT_TYPE_STRUCTURE)) \
		and life > 0.405 and u != last and not(IsUnitInGroup(u, LoadGroupHandle(htb, key, Lighting_TIMER_GROUP)))
	set u = null
	set last = null
	set us = null
	return b
endfunction
private function Timer_Lighting takes nothing returns nothing
	local timer t = GetExpiredTimer()
	local integer key = GetHandleId(t)
	local integer num = LoadInteger(htb, key, Lighting_TIMER_NUMBER)
	local real hw = LoadReal(htb, key, Lighting_TIMER_VALUE)
	local unit u = LoadUnitHandle(htb, key, Lighting_TIMER_LAST)
	local group sdg = LoadGroupHandle(htb, key, Lighting_TIMER_GROUP)
	local unit next = null
	local group g = CreateGroup()
	local boolexpr expr = Condition(function Xg_Trig_Group_2_Cont)
	local real x = GetUnitX(u)
	local real y = GetUnitY(u)
	call GroupEnumUnitsInRange(g, x, y, LoadReal(htb, key, Lighting_TIMER_RANGE), expr)
	call DestroyBoolExpr(expr)
	if CountUnitsInGroup(g) == 0 then
		if LoadBoolean(htb, key, Lighting_TIMER_ALLY) then
			set expr = Condition(function Xg_Trig_Group_3_Cont)
			call GroupEnumUnitsInRange(g, x, y, LoadReal(htb, key, Lighting_TIMER_RANGE), expr)
		endif
	endif
	call DestroyBoolExpr(expr)
	set expr = null
	set next = GroupPickRandomUnit(g)
	call DestroyGroup(g)
	set g = null
	if num <=0 or next==null or hw<1 then //判断无弹射次数+无弹射单位+闪电链量过低
		call FlushChildHashtable(htb, key)
		call PauseTimer(t)
		call DestroyTimer(t)
		call DestroyGroup(sdg) 
		set t = null
		set sdg = null
		return
	endif
	if sdg != null then
		call GroupAddUnit(sdg, next)
	endif

	call XG_DestroyLtByTimer( 0.45, AddLightningEx(LoadStr(htb, key, Lighting_TIMER_LIGHTING), false, GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u) ,GetUnitX(next), GetUnitY(next), Xg_GetUnitZ(next)) )

	set hw = hw * ( 1 + LoadReal(htb, key, Lighting_TIMER_PART) ) //闪电链递减
	call Xg_SDLSH(LoadUnitHandle(htb, key, Lighting_TIMER_SOURCE), next, hw)

	call SaveUnitHandle(htb, key, Lighting_TIMER_LAST, next)
	call SaveReal(htb, key, Lighting_TIMER_VALUE, hw)
	call SaveInteger(htb, key, Lighting_TIMER_NUMBER, num - 1)
	set t = null
	set next = null
	set sdg = null
endfunction
	//闪电链 :来源单位,指定单位,递减参数,弹射次数,闪电链量,影响范围,是否弹友军,是否重复弹射
function Xg_SDL takes unit us,unit ue,real part,integer num,real dam,real range,boolean ally,boolean rtk,string mainlight,string minorlight returns nothing
	local timer t
	local integer key
	if dam <=0  or num<=0 then
		return
	endif
	call XG_DestroyLtByTimer( 0.75, AddLightningEx(mainlight, false, GetUnitX(us), GetUnitY(us), GetUnitFlyHeight(us) ,GetUnitX(ue), GetUnitY(ue), Xg_GetUnitZ(ue)) )
	call Xg_SDLSH(us, ue, dam)
	if num <= 1 then
	return
	endif
	set t = CreateTimer()
	set key = GetHandleId(t)
	call SaveInteger(htb, key, Lighting_TIMER_NUMBER, num - 1)
	call SaveReal(htb, key, Lighting_TIMER_VALUE, dam)
	call SaveReal(htb, key, Lighting_TIMER_PART, part)
	call SaveReal(htb, key, Lighting_TIMER_RANGE, range)
	call SaveBoolean(htb, key, Lighting_TIMER_ALLY, ally)
	call SaveStr(htb, key, Lighting_TIMER_LIGHTING, minorlight)
	if not rtk then
	call SaveGroupHandle(htb, key, Lighting_TIMER_GROUP, CreateGroup())
	endif
	call SaveUnitHandle(htb, key, Lighting_TIMER_LAST, ue)
	call SaveUnitHandle(htb, key, Lighting_TIMER_SOURCE, us)
	call TimerStart(t, 0.2, true, function Timer_Lighting)
	set t=null
endfunction

endlibrary

#endif
