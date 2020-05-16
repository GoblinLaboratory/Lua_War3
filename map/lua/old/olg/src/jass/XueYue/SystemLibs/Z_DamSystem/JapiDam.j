#ifndef XGjapiDamIncluded
#define XGjapiDamIncluded
#define XGJapiDam_ON
#include "XueYue\Base.j"
#include "XueYue\HcFuncs\GetDam.j"
#include "XueYue\HcFuncs\IsUnitInvunerable.j"

#include "XueYue\Define\JapiDam.Cons" /* 定义常量 */
 <? local str = ",YDWEEventDamageData" ?>
#ifdef WenHaoJapiIncluded
	<? str = ",WenHaoJapi" ?>
	#include "1_WenHaoJapi\Japi.j"
#else
	#include "japi\YDWEEventDamageData.j"
#endif
library XGJapiDam requires XGbase, HcGetDam <?=str?>, HcIsUnitInvunerable
	/*<?	local slk = require 'slk'
		local obj = slk.ability.AIsr:new("雪月_Japi伤害系统_法伤捕捉")
        obj.Name = "雪月_Japi伤害系统_法伤捕捉辅助"
        obj.DataB1 = 2.0
    ?>*/
	globals
		private	hashtable			Event			=	InitHashtable()
		private	hashtable			ExecuteQue		=	InitHashtable()
		private	hashtable			Sys				=	InitHashtable()
		private	integer		array	ExecuteQueId
		private	real		array	ArInt
		private	trigger				UnitDamagedTrig	=	null
		private	trigger				UnitEnterMapTrig
		//private	integer				PhyAbil			=	'<?= obj:get_id() ?>'
	endglobals

function XG_JapiDam_RegEvent takes trigger trg, integer Type returns boolean
	local integer num = LoadInteger(Event, Type, 0) + 1
	call SaveInteger(Event, GetHandleId(trg), 1, num)
	call SaveTriggerHandle(Event, Type, num, trg)
	call SaveInteger(Event, Type, 0, num)
	return false
endfunction

function XG_JapiDam_ExecEvent takes integer Type returns real
	local integer i = 1
	local integer max = LoadInteger(Event, Type, 0)
	local trigger trg
	loop
		exitwhen i > max
		set trg = LoadTriggerHandle(Event, Type, i)
		if IsTriggerEnabled(trg) then
			if TriggerEvaluate(trg) then
				call TriggerExecute(trg)
			endif
		endif
		set i = i + 1
	endloop
	set trg = null
	if Type == JAPIDAM_EVENT_GD then
		return LoadReal(ExecuteQue, ExecuteQueId[0], JAPIDAM_GDZ)
	endif
	return LoadReal(ExecuteQue, ExecuteQueId[0], JAPIDAM_DAM)
endfunction

function XG_JapiDam_SetDamSign takes integer i returns nothing
	call SaveInteger(ExecuteQue, ExecuteQueId[0] + 1, JAPIDAM_SIGN, i)
endfunction

function XG_JapiDam_GetDamSign takes nothing returns integer
	return LoadInteger(ExecuteQue, ExecuteQueId[0], JAPIDAM_SIGN)
endfunction

function XG_JapiDam_SetDamSpecSign takes string s,string g returns nothing
	call SaveStr(ExecuteQue, ExecuteQueId[0] + 1, StringHash(s), g) //S2H 数值足够大，不与基础常量冲突
endfunction

function XG_JapiDam_GetDamSpecSign takes string s returns string
	return LoadStr(ExecuteQue, ExecuteQueId[0] + 1, StringHash(s))
endfunction

function XG_JapiDam_GetATP takes nothing returns attacktype //#获取攻击类型#
	return ConvertAttackType( LoadInteger( Sys, JAPIDAM_CONS, LoadInteger(ExecuteQue, ExecuteQueId[0], JAPIDAM_ATP) ) )
endfunction

function XG_JapiDam_GetDTP takes nothing returns damagetype //#获取伤害类型#
	return ConvertDamageType( LoadInteger( Sys, JAPIDAM_CONS, LoadInteger(ExecuteQue, ExecuteQueId[0], JAPIDAM_DTP) ) )
endfunction

function XG_JapiDam_GetWTP takes nothing returns weapontype //#获取武器类型#
	return ConvertWeaponType( LoadInteger( Sys, JAPIDAM_CONS, LoadInteger(ExecuteQue, ExecuteQueId[0], JAPIDAM_WTP) ) )
endfunction

function XG_JapiDam_GetUnit takes integer Type returns unit //伤害来源/受伤单位 以后添加的单位都在这里获取
	return LoadUnitHandle(ExecuteQue, ExecuteQueId[0], Type)
endfunction

function XG_JapiDam_SetArInt takes integer Type,real r returns nothing
	set ArInt[Type] = r
endfunction

function XG_JapiDam_SetReal takes integer Type,real r returns nothing
	call SaveReal(ExecuteQue, ExecuteQueId[0], Type, r)
endfunction

function XG_JapiDam_GetReal takes integer Type returns real
	return LoadReal(ExecuteQue, ExecuteQueId[0], Type) //伤害/初始伤害/吸血量 以后添加的实数都在这里获取
endfunction

function XG_JapiDam_SetBoolean takes nothing returns nothing  //设置布尔值整合
	call SaveBoolean(ExecuteQue, ExecuteQueId[0], JAPIDAM_PDOD, true)
endfunction

function XG_JapiDam_GetBoolean takes integer i returns boolean
	return LoadBoolean(ExecuteQue, ExecuteQueId[0], i)
endfunction

function XG_JapiDam_GetUnitAttribute takes unit u,integer id returns real
	return LoadReal(Sys, GetHandleId(u), id )
endfunction

function XG_JapiDam_SetUnitAttribute takes unit u,integer id,real r returns nothing
	call SaveReal(Sys, GetHandleId(u), id, r)
endfunction

//------------------------伤害处理系统------------------------
private function Damage_Deal_Code takes unit us, unit ue, real dam, boolean trgdam, boolean atk, boolean rng, attacktype atp, damagetype dtp, weapontype wtp, boolean truth returns nothing
	local boolean phy = atp != ATTACK_TYPE_NORMAL
	local integer key_ue = GetHandleId(ue)
	local integer key_us = GetHandleId(us)
	local integer id = ExecuteQueId[0]
	local real hd
	local real mfhd
	local real arm = GetUnitState(ue, ConvertUnitState(0x20))
	local real mk = LoadReal( Sys, key_ue, JAPIDAM_MFKX )
	if GetUnitState(ue, UNIT_STATE_LIFE) <= 0.405 or XG_IsUnitInvunerable(ue) then
		return
	endif
	call SaveBoolean(ExecuteQue, id, JAPIDAM_TRG, trgdam)
	call SaveBoolean(ExecuteQue, id, JAPIDAM_PHY, phy)
	if trgdam then
		set dam = LoadReal(ExecuteQue, id, JAPIDAM_DAM)
		call SaveReal(ExecuteQue, id, JAPIDAM_Odam, 0.0)
		call SaveReal(ExecuteQue, id, JAPIDAM_OrigDam, dam)
	else
		call FlushChildHashtable(ExecuteQue,id)
		if phy then
			set dam = XG_GetDam( dam, arm )
		endif
		call SaveReal(	ExecuteQue, id, JAPIDAM_Odam,  dam) //原始伤害
		call SaveUnitHandle(ExecuteQue, id, JAPIDAM_UNS, us)
		call SaveUnitHandle(ExecuteQue, id, JAPIDAM_UNE, ue)
		call SaveReal(		ExecuteQue, id, JAPIDAM_DAM, dam)
		call SaveBoolean(	ExecuteQue, id, JAPIDAM_ATK, atk)
		call SaveBoolean(	ExecuteQue, id, JAPIDAM_RNG, rng)
	endif
	if atk then
		if GetRandomReal(0.01, 1.00) <= RMinBJ( LoadReal( Sys, key_ue, JAPIDAM_DODGE ) , ArInt[1]) then //闪避
			call SaveBoolean(ExecuteQue, id, JAPIDAM_STATE_DODGE, true)
			set dam = XG_JapiDam_ExecEvent(JAPIDAM_EVENT_DAM)
			if not LoadBoolean(ExecuteQue, id, JAPIDAM_PDOD) then
				call SaveReal( ExecuteQue, id, JAPIDAM_DAM, 0.0 )
				return
			//else
			//	call SaveBoolean(ExecuteQue, id, JAPIDAM_STATE_DODGE, false)
			endif
		endif
	endif

	if not truth then
		set dam = dam * ( 1 + LoadReal( Sys, key_us, JAPIDAM_SHJS ) ) //伤害加深
		set dam = dam * ( 1 - LoadReal( Sys, key_ue, JAPIDAM_JS_B ) ) //减伤%
		set dam = dam - RMaxBJ( LoadReal( Sys, key_ue, JAPIDAM_JS ) ,0 ) //减伤
		if not phy then //-- !phy
			if GetRandomReal(0.01, 1.00) <= LoadReal( Sys, key_us, JAPIDAM_FBGL ) then //法暴
				set dam = dam * ( 2 + LoadReal( Sys, key_us, JAPIDAM_FBSH ) )
				call SaveBoolean(ExecuteQue, id, JAPIDAM_STATE_FSBJ, true)
			endif
			set dam = dam * ( 1 + LoadReal( Sys, key_us, JAPIDAM_FSJS ) ) //魔法伤害加深
			set mk = mk - mk * LoadReal( Sys, key_us, JAPIDAM_FC_B ) //法术穿透-百分比
			set mk = mk - LoadReal( Sys, key_us, JAPIDAM_FC ) //法术穿透
			if mk > 0.0 then //魔抗重计算伤害
				  set dam = dam - dam * ( mk * ArInt[0] / ( mk * ArInt[0] + 1 ) )
			else
				  set dam = dam * ( 2 - Pow( 1 - ArInt[0], -mk ) )
			endif
			set mfhd = LoadReal( Sys, key_ue, JAPIDAM_MFHD )
			if mfhd > 0.0 and dam > 0.0 then
				if mfhd >= dam then
					set mfhd = mfhd - dam
					set dam = 0.0
				else
					set dam = dam - mfhd
					set mfhd = 0.0
				endif
				call SaveReal( Sys, key_ue, JAPIDAM_MFHD, mfhd )
				call SaveBoolean( ExecuteQue, id, JAPIDAM_STATE_MFHD, true )
				if dam <= 0.0 then
					call SaveReal( ExecuteQue, id, JAPIDAM_DAM, 0.0 )
					return
				endif
			endif
		
		else //-- phy
			if GetRandomReal(0.01, 1.00) <= LoadReal( Sys, key_us, JAPIDAM_WBGL ) then //物暴
				set dam = dam * ( 2 + LoadReal( Sys, key_us, JAPIDAM_WBSH ) )
				call SaveBoolean(ExecuteQue, id, JAPIDAM_STATE_WLBJ, true)
			endif
			set dam = dam * ( 1 + LoadReal( Sys, key_us, JAPIDAM_WSJS ) ) //物理伤害加深
			set arm = arm - arm * LoadReal( Sys, key_us, JAPIDAM_WC_B ) //护甲穿透-百分比
			set arm = arm - LoadReal( Sys, key_us, JAPIDAM_WC ) //护甲穿透.
			set hd = <?=tonumber(require('slk').misc.Misc.DefenseArmor)?>
			if arm > 0.00 then //护甲重计算伤害
				set dam = dam - dam * (arm * hd / (arm * hd + 1) )
			else
				set dam = dam * ( 2 - Pow(1 - hd, -arm) )
			endif //-- arm
			
			if GetRandomReal(0.01, 1) <= RMinBJ( LoadReal( Sys, key_ue, JAPIDAM_GDGL ), ArInt[2] ) then //格挡
				call SaveBoolean(ExecuteQue, id, JAPIDAM_STATE_GD, true)
				call SaveReal(ExecuteQue, id, JAPIDAM_GDZ, dam)
				set dam = dam - XG_JapiDam_ExecEvent(JAPIDAM_EVENT_GD)
				if dam <= 0.0 then
					call SaveReal(ExecuteQue, id, JAPIDAM_DAM, dam)
					return
				endif
				call SaveReal(ExecuteQue, id, JAPIDAM_DAM, dam)
			endif //-- 格挡
			
			if atk and dam > 0.0 then //硬化皮肤
				set dam = dam - RMinBJ( LoadReal( Sys, key_ue, JAPIDAM_YHPF ) , 0.0 )
				if dam <= 0.0 then
					call SaveReal(ExecuteQue, id, JAPIDAM_DAM, 0.0)
					return
				endif
			endif //-- 硬化皮肤

		endif //-- phy
		

	else
		call SaveBoolean(ExecuteQue, id, JAPIDAM_STATE_TRUTH, true)
	endif //-- not truth
	
	set hd = LoadReal( Sys, key_ue, JAPIDAM_HD )
	if hd > .0 and dam > .0 then
		call SaveBoolean(ExecuteQue, id, JAPIDAM_STATE_HD, true)
		if hd >= dam then
			set hd = hd - dam
			set dam = .0
		else
			set dam = dam - hd
			set hd = .0
		endif
		call SaveReal( Sys, key_ue, JAPIDAM_HD , hd)
	endif
	
	set dam = XG_JapiDam_ExecEvent( JAPIDAM_EVENT_DAM )
	if dam < .0 then
		set dam = .0
	endif
	call SaveReal( ExecuteQue, id, JAPIDAM_DAM, dam )
	
	if phy then
		set hd = LoadReal( Sys, key_us, JAPIDAM_WLXX )
		if hd > 0.00 then
			call SaveReal( ExecuteQue, id, JAPIDAM_Suck, dam * hd )
			call XG_JapiDam_ExecEvent( JAPIDAM_EVENT_Suck ) //物理吸血
			set hd = LoadReal( ExecuteQue, id, JAPIDAM_Suck )
			call SetUnitState( us, UNIT_STATE_LIFE,  GetUnitState(us, UNIT_STATE_LIFE) + hd  )
		endif
		if atk then
			set hd = LoadReal( Sys, key_us, JAPIDAM_SMTQ )
			if hd > 0.00 then
				call SaveReal( ExecuteQue, id, JAPIDAM_Suck, dam * hd )
				call XG_JapiDam_ExecEvent( JAPIDAM_EVENT_SMTQ ) //生命偷取
				set hd = LoadReal( ExecuteQue, id, JAPIDAM_Suck )
				call SetUnitState( us, UNIT_STATE_LIFE,  GetUnitState(us, UNIT_STATE_LIFE) + hd  )
			endif
		endif
	else
		set hd = LoadReal( Sys, key_us, JAPIDAM_FSXX )
		if hd > 0.00 then
			call SaveReal( ExecuteQue, id, JAPIDAM_Suck, dam * hd )
			call XG_JapiDam_ExecEvent( JAPIDAM_EVENT_Suck ) //法术吸血
			set hd = LoadReal( ExecuteQue, id, JAPIDAM_Suck )
			call SetUnitState( us, UNIT_STATE_LIFE,  GetUnitState(us, UNIT_STATE_LIFE) + hd  )
		endif
	endif
endfunction

private function DamAction_Fix takes nothing returns nothing
	local integer id = ExecuteQueId[0]
	local unit ue = LoadUnitHandle(ExecuteQue, id, JAPIDAM_UNE)
	local unit us = LoadUnitHandle(ExecuteQue, id, JAPIDAM_UNS)
	local real life = GetUnitState(ue, UNIT_STATE_LIFE)
	local real dam
	local boolean rng = true
	if LoadReal(ExecuteQue, id, JAPIDAM_OrigDam) >= 0.0 then
		set rng = LoadBoolean(ExecuteQue, id, JAPIDAM_RNG)
	endif
	call XG_JapiDam_ExecEvent( JAPIDAM_EVENT_DAM_END )//伤害系统结算
	
	//释放栈
	call FlushChildHashtable(ExecuteQue, id)
	set ExecuteQueId[id] = 0
	set ExecuteQueId[0] = id - 1
	
	set dam = LoadReal(ExecuteQue, id, JAPIDAM_DAM) - LoadReal(ExecuteQue, id, JAPIDAM_Odam)
	if dam > 0.0 then //--补足[伤害差>0 !与! 法术伤害]--
		if life - dam > 0.405 then //非致死伤害
			call SetUnitState(ue, UNIT_STATE_LIFE, life - dam + 0.001)
			call DisableTrigger(UnitDamagedTrig)
			call UnitDamageTarget( us,ue, 0.001, false, rng, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS ) //非远程伤害会受到冰甲影响
			call EnableTrigger(UnitDamagedTrig)
		else
			call SetUnitState( ue, UNIT_STATE_LIFE, 0.50 )
			call DisableTrigger(UnitDamagedTrig)
			call UnitDamageTarget(us,ue, 101.00, false, true, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS )
			call EnableTrigger(UnitDamagedTrig)
		endif
	elseif dam == 0.0 then
	else	//--减伤--
		set dam = -dam //欲减少的伤害
		call EXSetEventDamage(dam)
	endif
	set ue = null
	set us = null
endfunction

private function Con_EnterMap takes nothing returns boolean
	local unit u = GetFilterUnit()
	if GetUnitAbilityLevel( u, 'Aloc') <= 0 then
		call TriggerRegisterUnitEvent(UnitDamagedTrig, u, EVENT_UNIT_DAMAGED)
		//call TriggerRegisterUnitEvent(UnitDeathEvent, u, EVENT_UNIT_DEATH)
	endif
	set u = null
	return false
endfunction

private function DamAction_Redirect takes nothing returns boolean //自带伤害 - 重定向
	local unit us = GetEventDamageSource()
	local unit ue = GetTriggerUnit()
	local real dam = GetEventDamage()
	set ExecuteQueId[0] = ExecuteQueId[0] + 1
	call SaveBoolean( ExecuteQue, ExecuteQueId[0], JAPIDAM_ATTACK, dam > 0 )
	//unit us, unit ue, real dam, boolean trgdam, boolean atk, boolean rng, attacktype atp, damagetype dtp, weapontype wtp, boolean truth
	call Damage_Deal_Code(us, ue, RAbsBJ(dam), false, YDWEIsEventPhysicalDamage(), YDWEIsEventRangedDamage(), ConvertAttackType(EXGetEventDamageData(6)), ConvertDamageType(EXGetEventDamageData(4)), ConvertWeaponType(EXGetEventDamageData(5)), false)
	set us = null
	set ue = null
	return true
endfunction

function XG_JapiDam_DamTar takes unit us, unit ue, real dam, boolean atk, boolean rng, attacktype atp, damagetype dtp, weapontype wtp returns nothing
	local integer id = ExecuteQueId[0] + 1
	set ExecuteQueId[0] = id
	set ExecuteQueId[id] = 1
		call SaveUnitHandle(ExecuteQue, id, JAPIDAM_UNS, us)
		call SaveUnitHandle(ExecuteQue, id, JAPIDAM_UNE, ue)
		call SaveReal(ExecuteQue, id, JAPIDAM_DAM, dam)
		call SaveBoolean(ExecuteQue, id, JAPIDAM_ATK, atk)     //攻击伤害
		call SaveBoolean(ExecuteQue, id, JAPIDAM_RNG, rng) //远程伤害
		call SaveInteger(ExecuteQue, id, JAPIDAM_ATP, GetHandleId(atp))
		call SaveInteger(ExecuteQue, id, JAPIDAM_DTP, GetHandleId(dtp))
		call SaveInteger(ExecuteQue, id, JAPIDAM_WTP, GetHandleId(wtp))
	call Damage_Deal_Code(us, ue, dam, true, atk, rng, atp, dtp, wtp, dtp == DAMAGE_TYPE_UNIVERSAL)
	call DamAction_Fix()
endfunction

function XG_JapiDam_ON takes nothing returns nothing
	local region rG
	local group g 
	local rect r
	local integer i = -1
	local boolexpr expr
	if UnitDamagedTrig != null then
		return
	endif
	set rG = CreateRegion()
	set g = CreateGroup()
	set r = GetWorldBounds()
	call RegionAddRect(rG, r)
	set ExecuteQueId[0] = 0
	
	set expr = Condition(function Con_EnterMap)
	call GroupEnumUnitsInRect(g, r, expr)
	set UnitEnterMapTrig = CreateTrigger()
	call TriggerRegisterEnterRegion(UnitEnterMapTrig, rG, expr)
	
	set UnitDamagedTrig = CreateTrigger()
	call TriggerAddCondition(UnitDamagedTrig, Condition(function DamAction_Redirect))
	call TriggerAddAction(UnitDamagedTrig, function DamAction_Fix)
	set ArInt[0] = 0.06	//抗性因子
	set ArInt[1] = 1.0	//闪避上限
	set ArInt[2] = 1.0	//格挡上限
	//=====初始化常量表=====
	loop
		set i = i + 1
		if i <= 23 then
			call SaveInteger(Sys, JAPIDAM_CONS, GetHandleId(ConvertWeaponType(i)), i)
			if i <= 6 then
				call SaveInteger(Sys, JAPIDAM_CONS, GetHandleId(ConvertAttackType(i)), i)
			endif
		endif
		call SaveInteger(Sys, JAPIDAM_CONS, GetHandleId(ConvertDamageType(i)), i)
		exitwhen i == 26
	endloop
	call DestroyGroup(g)
	set g = null
	set r = null
	set rG = null
	set expr = null
endfunction


endlibrary

#endif
