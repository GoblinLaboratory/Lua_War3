#ifndef XGDamPlusIncluded
#define XGDamPlusIncluded

	#define XGDamPlus_ON
#include "XueYue\Base.j"
#include "XueYue\HcFuncs\GetDam.j"
#include "XueYue\HcFuncs\GetUnitArmor.j"
#include "XueYue\HcFuncs\UnitAlive.j"
#include "XueYue\HcFuncs\IsUnitInvunerable.j"
#include "XueYue\Define\DamPlus.Cons" /* 定义常量 */

library XGDamPlus requires XGbase,HcGetDam,HcGetUnitArmor,HcUnitAlive,HcIsUnitInvunerable
    globals
        private trigger UnitEnterMap = null
		private trigger UnitDeathEvent = null
        private hashtable HT = InitHashtable()
		integer array ExecuteQueId
		private hashtable ExecuteQue=InitHashtable()
		private hashtable DamTrig=InitHashtable()
		private real array arint
		private integer  ReduceAbil=0
		private real  ReduceValue=0.
		private integer PhyAbil=0
		trigger Xg_DamPlus_Trg = null
		private hashtable Const = InitHashtable()
		//private boolean TrgDam = false
		//private boolean AtkDam = false
    endglobals
//**************************************
	private function Xg_DamPlus_SetState takes integer s,boolean b returns nothing //设置伤害特性[内部]
		local integer x
		call SaveBoolean(ExecuteQue,ExecuteQueId[0],s,b)
	endfunction
	function Xg_DamPlus_GetState takes integer s returns boolean //#获取伤害特性#
	//	local integer x
		return LoadBoolean(ExecuteQue,ExecuteQueId[0],s)
	endfunction
	function Xg_DamPlus_GetATP takes nothing returns attacktype
	//	local integer x
		return ConvertAttackType(LoadInteger(Const,HA_CONS,LoadInteger(ExecuteQue,ExecuteQueId[0],HA_ATP)))
	endfunction
	function Xg_DamPlus_GetDTP takes nothing returns damagetype
		//local integer x
		return ConvertDamageType(LoadInteger(Const,HA_CONS,LoadInteger(ExecuteQue,ExecuteQueId[0],HA_DTP)))
	endfunction
	function Xg_DamPlus_GetWTP takes nothing returns weapontype
		//local integer x
		return ConvertWeaponType(LoadInteger(Const,HA_CONS,LoadInteger(ExecuteQue,ExecuteQueId[0],HA_WTP)))
	endfunction
	function Xg_DamPlus_GetAttr takes unit u ,integer ii returns real //#获取单位属性#
		//local integer x //防止函数内联
		return LoadReal(HT,GetHandleId(u),ii)
	endfunction
	function Xg_DamPlus_SetAttr takes unit u ,integer ii ,real value returns nothing //#设置单位属性#
		//local integer x
		call SaveReal(HT,GetHandleId(u),ii,value)
	endfunction
	function Xg_DamPlus_GetDam takes nothing returns real //#获取伤害#
		//local integer x
		return LoadReal(ExecuteQue,ExecuteQueId[0],HA_DAM)
	endfunction
	function Xg_DamPlus_GetOrigDam takes nothing returns real //#获取原始伤害#
		local real x
		if ExecuteQueId[ExecuteQueId[0]]==0 then
			set x=GetEventDamage()
			if x>0 then
				return x
			else
				return -x
			endif
		endif
		return LoadReal(ExecuteQue,ExecuteQueId[0],HA_OrigDam)
	endfunction
	function Xg_DamPlus_SetDam takes real dam returns nothing //#设置伤害#
		call SaveReal(ExecuteQue,ExecuteQueId[0],HA_DAM,dam)
	endfunction
	function Xg_DamPlus_RealAbil takes integer abil,real value returns nothing //#关联血牌#
		set ReduceAbil=abil
		set ReduceValue=value
	endfunction
	function Xg_DamPlus_GetUnitS takes nothing returns unit //#伤害来源#
		//local integer x
		return LoadUnitHandle(ExecuteQue,ExecuteQueId[0],HA_UNS)
	endfunction
	function Xg_DamPlus_ChgUnitS takes unit us returns nothing //#修改伤害来源#
		//local integer x
		call SaveUnitHandle(ExecuteQue,ExecuteQueId[0],HA_NEWUNS, us)
	endfunction
	function Xg_DamPlus_ChgPhyDam takes boolean p returns nothing //#修改伤害种类#
		//local integer x
		call SaveBoolean(ExecuteQue,ExecuteQueId[0],HA_PHY, p)
	endfunction
	function Xg_DamPlus_GetUnitE takes nothing returns unit //#受伤单位#
		//local integer x
		return LoadUnitHandle(ExecuteQue,ExecuteQueId[0],HA_UNE)
	endfunction
	function Xg_DamPlus_PassDodge takes nothing returns nothing //#无视本次闪避#
		//local x
		call SaveBoolean(ExecuteQue,ExecuteQueId[0],HA_PDOD,true)
	endfunction
	function Xg_DamPlus_SetSign takes integer i returns nothing //#设置伤害标记#
		//local x
		call SaveInteger(ExecuteQue,ExecuteQueId[0]+1,HA_SIGN,i)
	endfunction
	function Xg_DamPlus_ChgSign takes integer i returns nothing //#修改伤害标记#
		//local x
		call SaveInteger(ExecuteQue,ExecuteQueId[0],HA_SIGN,i)
	endfunction
	function Xg_DamPlus_GetSign takes nothing returns integer //#获取伤害标记#
		//local x
		return LoadInteger(ExecuteQue,ExecuteQueId[0],HA_SIGN)
	endfunction
	function Xg_DamPlus_SetSuck takes real r returns nothing
		call SaveReal(ExecuteQue,ExecuteQueId[0],HA_Suck,r)
	endfunction
	function Xg_DamPlus_GetSuck takes nothing returns real
		return LoadReal(ExecuteQue,ExecuteQueId[0],HA_Suck)
	endfunction
	function Xg_DamPlus_Execute_Deal takes unit us,unit ue,real dam,integer tyi,boolean atk,boolean phy,boolean rng,attacktype atp,damagetype dtp,weapontype wtp returns real
		local integer index = 1
		local integer i=0
		local integer num
		local trigger trg
		call SaveReal(ExecuteQue,ExecuteQueId[0],HA_DAM,dam)
		if ExecuteQueId[ExecuteQueId[0]] != 0 then //触发伤害
			set index=3
		elseif LoadBoolean(ExecuteQue,ExecuteQueId[0],HA_ATTACK) then
			set index=1
		else
			set index=2
		endif

		set num=LoadInteger(DamTrig,index,0)
		loop
			exitwhen i>num
			set trg=LoadTriggerHandle(DamTrig,index,i)
			if IsTriggerEnabled(trg) then
				if TriggerEvaluate(trg) then
					call TriggerExecute(trg)
				endif
			endif
			set i=i+1
		endloop
		set trg=null
		return Xg_DamPlus_GetDam()
	endfunction
	function Xg_DamPlus_Execute_Custom takes integer index returns nothing
		local integer i=1
		local integer num=LoadInteger(DamTrig,index,0)
		local trigger trg
		loop
			exitwhen i>num
			set trg=LoadTriggerHandle(DamTrig,index,i)
			if IsTriggerEnabled(trg) then
				if TriggerEvaluate(trg) then
					call TriggerExecute(trg)
				endif
			endif
			set i=i+1
		endloop
		set trg=null
	endfunction

	function Xg_DamPlus_Execute_GD takes nothing returns real
		local integer index = 4
		local integer i=1
		local integer num=LoadInteger(DamTrig,index,0)
		local trigger trg
		loop
			exitwhen i>num
			set trg=LoadTriggerHandle(DamTrig,index,i)
			if IsTriggerEnabled(trg) then
				if TriggerEvaluate(trg) then
					call TriggerExecute(trg)
				endif
			endif
			set i=i+1
		endloop
		set trg = null
		return Xg_DamPlus_GetDam()
	endfunction

	private function DamAction takes unit us,unit ue,real dam,boolean phy,boolean trgdam,boolean rng,attacktype atp,damagetype dtp,weapontype wtp,boolean truth returns nothing
		local integer id = ExecuteQueId[0]
		local boolean atk = false
		local integer property = 0 //一些特性
		local integer key_us
		local integer key_ue = GetHandleId(ue)
		local real rjs
		local real arm
		local real mk
		local real mfhd
		local real hd
		if not(UnitAlive(ue)) or XG_IsUnitInvunerable(ue) then
			return
		endif
		call SaveUnitHandle(ExecuteQue, id, HA_NEWUNS, us)
		call Xg_DamPlus_Execute_Custom(8) //伤害被触发
		set us = LoadUnitHandle(ExecuteQue, id, HA_NEWUNS)
		set key_us = GetHandleId(us)
		call SaveUnitHandle(ExecuteQue, id, HA_NEWUNS, LoadUnitHandle(ExecuteQue, id, HA_UNS))
		call SaveUnitHandle(ExecuteQue, id, HA_UNS, us)
		set dam = LoadReal(ExecuteQue, id, HA_DAM)
		set phy = LoadBoolean(ExecuteQue, id, HA_PHY)
		if phy then
			set arm = XGGetUnitArmor( us, ue, ReduceAbil, 160, ReduceValue ) //中立敌对的单位对自己造成伤害时会乱跑，所以传入一个伤害来源。
		endif
		
		if not trgdam then //伤害来自魔兽自带
			if phy then
				set atk = phy
				set dam = XG_GetDam( dam, arm )
			endif
		else  //伤害来自触发
			set atk = LoadBoolean(ExecuteQue, id, HA_ATK)
		endif
		
		
		call SaveBoolean(ExecuteQue, id, HA_PHY, phy)

		if atk then //普通攻击
			if GetRandomReal(0.01, 1.00) <= RMinBJ( LoadReal(HT,key_ue,HA_ATTR_DODGE) ,arint[1] ) then //闪避
					call Xg_DamPlus_SetState(HA_STATE_DODGE,true)
					call Xg_DamPlus_Execute_Custom(9) //伤害被闪避
					set dam = LoadReal(ExecuteQue, id, HA_DAM)
					if not LoadBoolean(ExecuteQue, id, HA_PDOD) then //没有要求无视本次闪避
						call Xg_DamPlus_SetDam( 0.0 )
						return
					endif
			endif
		endif
		call Xg_DamPlus_SetState( HA_STATE_TRUTH, truth )//真实伤害
		if not truth then
			set rjs = RMaxBJ(LoadReal(HT,key_ue,HA_ATTR_GDJS),0)
			if not phy then //法术伤害
				  if GetRandomReal(0.01, 1.00) <= LoadReal(HT,key_us,HA_ATTR_FBGL) then //法暴
					set dam = dam * ( arint[3] + LoadReal(HT,key_us,HA_ATTR_FBSH) )
					call Xg_DamPlus_SetState( HA_STATE_FSBJ, true )
				  endif
				  set dam = dam * ( 1 + LoadReal(HT,key_us,HA_ATTR_FSJS) ) //魔法伤害加深
			else
				  if GetRandomReal(0.01, 1.00) <= LoadReal(HT,key_us,HA_ATTR_WBGL) then //物暴
					set dam = dam * ( arint[4] +  LoadReal(HT,key_us,HA_ATTR_WBSH) )
					call Xg_DamPlus_SetState( HA_STATE_WLBJ, true )
				  endif
				  set dam = dam * ( 1 + LoadReal(HT,key_us,HA_ATTR_WSJS) ) //物理伤害加深
			endif
			
			set dam = dam * ( 1 + LoadReal(HT,key_us,HA_ATTR_SHJS) ) //伤害加深
			set dam = dam * ( 1 - LoadReal(HT,key_ue,HA_ATTR_BFBJS) ) //减伤%
			set dam = dam - rjs //减伤
			if phy then
				set arm = arm - arm * LoadReal(HT,key_us,HA_ATTR_BFBWC) //护甲穿透-百分比
				set arm = arm - LoadReal(HT,key_us,HA_ATTR_GDWC) //护甲穿透.
				set hd = <?=tonumber(require('slk').misc.Misc.DefenseArmor)?>
				if arm > 0.00 then //护甲重计算伤害
					set dam = dam - dam * (arm * hd / (arm * hd + 1) )
				else
					set dam = dam * ( 2 - Pow(1 - hd, -arm) )
				endif
				
			else
				set mk = LoadReal(HT,key_ue,HA_ATTR_MFKX) * ( 1 - LoadReal(HT,key_us,HA_ATTR_BFBFC) ) //法术穿透-百分比
				set mk = mk - LoadReal(HT,key_us,HA_ATTR_GDFC) //法术穿透
				if mk >= 0.0 then //魔抗重计算伤害
					  set dam = dam - dam * ( mk * arint[0] / ( mk * arint[0] + 1 ) )
				else
					  set dam = dam * ( 2 - Pow( 1 - arint[0], -mk ) )
				endif
				set mfhd = LoadReal(HT,key_ue,HA_ATTR_MFHD)
				if mfhd > 0.0 and dam > 0.0 then
					if mfhd >= dam then
						set mfhd = mfhd - dam
						set dam = 0.0
					else
						set dam = dam - mfhd
						set mfhd = 0.0
					endif
					call Xg_DamPlus_SetAttr( ue, HA_ATTR_MFHD, mfhd )
					call Xg_DamPlus_SetState( HA_ATTR_MFHD, true )
				endif
			endif
			
		endif
		
		if GetRandomReal(0.01, 1) <= RMinBJ(LoadReal(HT,key_ue,HA_ATTR_GDGL),arint[2]) then //格挡
			call Xg_DamPlus_SetState( HA_STATE_GD, true )
			call Xg_DamPlus_SetDam( dam * arint[5] )
			set dam = dam - Xg_DamPlus_Execute_GD()
			if dam < 0.0 then
				set dam = 0.0
			endif
		endif
		
		if atk then
			set dam = dam - LoadReal(HT,key_ue,HA_ATTR_YHPF)
		endif

		if dam > 0.0 then
				set hd = LoadReal(HT,key_ue,HA_ATTR_HD)
				if hd > 0.0 and dam > 0.0 then
						call Xg_DamPlus_SetState( HA_ATTR_HD, true )
						if hd >= dam then
							set hd = hd - dam
							set dam = 0.0
						else
							set dam = dam - hd
							set hd = 0.0
						endif
						call Xg_DamPlus_SetAttr( ue, HA_ATTR_HD, hd )
				endif
		else
				call Xg_DamPlus_SetDam( 0.0 )
				set dam = 0.0
		endif
		set dam = Xg_DamPlus_Execute_Deal( us, ue, dam, property, atk, phy, rng, atp, dtp, wtp )
		call Xg_DamPlus_Execute_Custom(10) //接受任意伤害 4-1
		call Xg_DamPlus_Execute_Custom(11)
		call Xg_DamPlus_Execute_Custom(12) //接受任意伤害 4-3
   set dam = LoadReal(ExecuteQue, id, HA_DAM)
		call Xg_DamPlus_SetDam( dam )
		if dam > 0.0 then
				if phy then
						set hd = LoadReal(HT, key_us, HA_ATTR_WLXX)
						if hd > 0.0 then
							call Xg_DamPlus_SetSuck(dam*hd)
							call Xg_DamPlus_Execute_Custom(6) //物理吸血
							set hd = Xg_DamPlus_GetSuck()
							call SetUnitState ( us, UNIT_STATE_LIFE ,  GetUnitState(us, UNIT_STATE_LIFE) + hd   )
						endif
						if atk then
							set hd = LoadReal(HT, key_us, HA_ATTR_SMTQ)
							if hd > 0.0 then
								call Xg_DamPlus_SetSuck(dam*hd)
								call Xg_DamPlus_Execute_Custom(7)
								set hd=Xg_DamPlus_GetSuck()
								call SetUnitState ( us, UNIT_STATE_LIFE ,  GetUnitState(us, UNIT_STATE_LIFE) + hd )//生命偷取
							endif
						endif
				else
						set hd=LoadReal(HT,key_us,HA_ATTR_FSXX)
						if hd > 0.0 then
							call Xg_DamPlus_SetSuck(dam*hd)
							call Xg_DamPlus_Execute_Custom(6) //法术吸血
							set hd = Xg_DamPlus_GetSuck()
							call SetUnitState ( us, UNIT_STATE_LIFE ,  GetUnitState(us, UNIT_STATE_LIFE) + hd   )
						endif
				endif
				
		endif
		//return
	endfunction
	private function DamAction_Redirect takes nothing returns boolean
		local unit us=GetEventDamageSource()
		local unit ue=GetTriggerUnit()
		local real dam=GetEventDamage()
		local boolean rng = false
		local real dam_r = RAbsBJ(dam)
		set ExecuteQueId[0] = ExecuteQueId[0] + 1
		
		if dam > 0.0 then
			set rng = IsUnitType(us, UNIT_TYPE_RANGED_ATTACKER)
		endif
		//call FlushChildHashtable(ExecuteQue,ExecuteQueId[0])
		call SaveBoolean(ExecuteQue, ExecuteQueId[0], HA_ATTACK, dam > 0)
		call SaveUnitHandle(ExecuteQue, ExecuteQueId[0], HA_UNS, us)
		call SaveUnitHandle(ExecuteQue, ExecuteQueId[0], HA_UNE, ue)
		call SaveReal(		ExecuteQue, ExecuteQueId[0], HA_DAM, dam_r)
		call SaveBoolean(	ExecuteQue, ExecuteQueId[0], HA_TRG, false)
		call SaveBoolean(	ExecuteQue, ExecuteQueId[0], HA_ATK, dam > 0.0)
		call SaveBoolean(	ExecuteQue, ExecuteQueId[0], HA_PHY, dam > 0.0)
		call SaveBoolean(	ExecuteQue, ExecuteQueId[0], HA_RNG, rng)
		call SaveReal( ExecuteQue, ExecuteQueId[0], HA_Odam, dam ) //真实的伤害

		call DamAction(us, ue, dam_r, dam > 0.0, false/*trg*/, rng, null, null, null, false)
		set us = null
		set ue = null
		return true
	endfunction
	private function UnitDamageReduce takes nothing returns nothing //减免伤害[内部]
        local timer t = GetExpiredTimer()
        local integer key = GetHandleId(t)
        local unit ue = LoadUnitHandle( HT, key, 1)
		local integer abil =LoadInteger(HT,key,0)
		local real rdce = LoadReal(HT,key,2)
		local real dam = LoadReal(HT,key,3)
		local real life=GetUnit/**/State(ue, UNIT_STATE_LIFE)
            call UnitRemoveAbility( ue, abil)
			call SaveReal(HT,GetHandleId(ue),-1,LoadReal(HT,GetHandleId(ue),-1)-rdce)
			set dam = life-dam
			if life<dam then
				call SetUnitState(ue, UNIT_STATE_LIFE,dam)
			else
				call SetUnitState(ue, UNIT_STATE_LIFE,life)
			endif
        call FlushChildHashtable(HT,key)
        call DestroyTimer(t)
        set ue = null
        set t = null
    endfunction
	private function MagicDamageFix takes nothing returns nothing
		local timer t = GetExpiredTimer()
        local integer key = GetHandleId(t)
        local unit ue = LoadUnitHandle( HT, key, 1)
		local real dam = LoadReal(HT,key,2)
		call SetUnitState(ue, UNIT_STATE_LIFE, GetUnitState(ue, UNIT_STATE_LIFE) - dam )
        call FlushChildHashtable(HT,key)
        call DestroyTimer(t)
        set ue = null
        set t = null
	endfunction
    private function UnitDamagedAction takes nothing returns nothing
		local integer id=ExecuteQueId[0]
        local real olddam = LoadReal(ExecuteQue,id,HA_Odam)
        local unit ue = LoadUnitHandle(ExecuteQue,id,HA_UNE)
        local unit us =LoadUnitHandle(ExecuteQue,id,HA_UNS)
		local real life=GetUnitState(ue, UNIT_STATE_LIFE)
		local real maxlife=GetUnitState(ue, UNIT_STATE_MAX_LIFE)
        local real minus //已损失Life
        local timer t
        local integer key = 0
		local real dam
		local real newdam=LoadReal(ExecuteQue,id,HA_DAM)
		local boolean rng = true
		local integer i = 1
		if ExecuteQueId[id] != 0 then
			set rng=LoadBoolean(ExecuteQue,id,HA_RNG)
		endif
		call Xg_DamPlus_Execute_Custom(5)//伤害系统结算
		
		//释放栈
		call FlushChildHashtable(ExecuteQue,id)
		set ExecuteQueId[id] = 0
		set ExecuteQueId[0] = id - 1
		set minus = maxlife - life //已损失Life
		set dam = newdam - olddam
		//call BJDebugMsg(R2S(dam)+" = " + R2S(newdam)+" - "+R2S(olddam))
		if dam > 0.0 then //--补足[伤害差>0 !与! 法术伤害]--
				if life - dam > 0.405 then //非致死伤害
					call SetUnitState(ue, UNIT_STATE_LIFE, life - dam + 0.001)
					call DisableTrigger(Xg_DamPlus_Trg)
					call UnitDamageTarget( us,ue, 0.001, false, rng, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS ) //非远程伤害会受到冰甲影响
					call EnableTrigger(Xg_DamPlus_Trg)
				elseif olddam < 0 and life + olddam > 0.405 then //非致死 法术伤害 修正伤害
					set t = CreateTimer()
					set key = GetHandleId(t)
					call SaveUnitHandle(HT, key, 1, ue)
					if life - olddam > maxlife then
						set dam = -olddam + (minus)
					endif
					call SaveReal(HT,key,2, dam - 0.001)
					call SaveReal(HT,GetHandleId(ue),-1,LoadReal(HT,GetHandleId(ue),-1)+ReduceValue)
					call DisableTrigger(Xg_DamPlus_Trg)
					call UnitDamageTarget( us,ue, 0.001, false, rng, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS ) //非远程伤害会受到冰甲影响
					
					call EnableTrigger(Xg_DamPlus_Trg)
					call SetUnitState(ue, UNIT_STATE_LIFE, life)
					call TimerStart(t, 0.0, false, function MagicDamageFix)
					set t=null
				else
					call SetUnitState( ue, UNIT_STATE_LIFE, 3.210 )
					//call UnitRemoveAbility( ue,PhyAbil)
					call DisableTrigger(Xg_DamPlus_Trg)
					//loop //既然已经用到混乱伤害来获取护甲那就放弃枚举攻击类型直接使用混乱了 节约效率
						call UnitDamageTarget(us,ue, 50.00, false, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS )
					//	set i = i + 1
					//	exitwhen i == 7
					//endloop
					call EnableTrigger(Xg_DamPlus_Trg)
					//call UnitAddAbility( ue, PhyAbil )
				endif
		elseif dam == 0.0 then
		else	//--减伤--
			set dam = -dam //欲减少的伤害
			if maxlife - life >= dam then
				call SetUnitState(ue, UNIT_STATE_LIFE, life + dam)
			else
				set i = GetUnitAbilityLevel( ue, ReduceAbil )
				if i <= 0 then
					call UnitAddAbility( ue, ReduceAbil )
				endif
				call SetUnitState(ue, UNIT_STATE_LIFE, life + dam)
				if i<=0 then
					set t=CreateTimer()
					set key=GetHandleId(t)
					call SaveInteger(HT,key,0,ReduceAbil)
					call SaveUnitHandle(HT,key,1,ue)
					call SaveReal(HT,key,2,ReduceValue)
					call SaveReal(HT,key,3,dam)
					call SaveReal(HT,GetHandleId(ue),-1,LoadReal(HT,GetHandleId(ue),-1)+ReduceValue)
					call TimerStart(t,0,false,function UnitDamageReduce)
					set t=null
				endif
			endif
		endif
        set ue = null
        set us = null
    endfunction

    private function AnyUnitDamagedFilter takes nothing returns boolean
        local unit u = GetFilterUnit()
        if GetUnitAbilityLevel( u, 'Aloc') <= 0 then
            call TriggerRegisterUnitEvent(Xg_DamPlus_Trg, u, EVENT_UNIT_DAMAGED)
			call TriggerRegisterUnitEvent(UnitDeathEvent, u, EVENT_UNIT_DEATH)
            call UnitAddAbility( u, PhyAbil )
            call UnitMakeAbilityPermanent( u, true, PhyAbil )
        endif
        set u = null
		return false
    endfunction
	function XG_UnitDamTarPlus takes unit us,unit ue,real dam,boolean atk,boolean range,attacktype atp,damagetype dtp,weapontype wtp returns nothing
		local integer id=ExecuteQueId[0]+1
		local integer pid
		local trigger trig
		local boolean phy = atp != ATTACK_TYPE_NORMAL
		set ExecuteQueId[id]=1
		//call FlushChildHashtable(ExecuteQue,id)
	call SaveUnitHandle(ExecuteQue,id,HA_UNS,us)
		call SaveUnitHandle(ExecuteQue,id,HA_UNE,ue)
		call SaveReal(ExecuteQue,id,HA_DAM,dam)
		call SaveBoolean(ExecuteQue,id,HA_TRG,true)     //触发伤害
		call SaveBoolean(ExecuteQue,id,HA_ATK,atk)     //攻击伤害
		call SaveBoolean(	ExecuteQue,id, HA_PHY, phy)
		call SaveBoolean(ExecuteQue,id,HA_RNG,range) //远程伤害
		call SaveInteger(ExecuteQue,id,HA_ATP,GetHandleId(atp))
		call SaveInteger(ExecuteQue,id,HA_DTP,GetHandleId(dtp))
		call SaveInteger(ExecuteQue,id,HA_WTP,GetHandleId(wtp))
		call SaveReal(	ExecuteQue, id,HA_Odam,0.0)
		call SaveReal(	ExecuteQue, id, HA_OrigDam, dam)
		//call UnitDamageTarget(us,ue,dam,atk,range,atktype,damtype,weatype)
		set ExecuteQueId[0]=id //设置栈索引
		call DamAction( us, ue, dam, phy, true, range, atp, dtp, wtp, dtp == DAMAGE_TYPE_UNIVERSAL )
		call UnitDamagedAction()
	endfunction
	private function Dot_Timer takes nothing returns nothing
		local timer t=GetExpiredTimer()
		local integer key=GetHandleId(t)
		local real timeout=LoadReal(HT,key,HA_Timeout)
		local real keep=LoadReal(HT,key,HA_Keep)-timeout
		if GetUnitState(LoadUnitHandle(HT,key,HA_UNE),UNIT_STATE_LIFE)>0.405 then
		call Xg_DamPlus_SetSign(LoadInteger(HT,key,HA_SIGN))
		call XG_UnitDamTarPlus(LoadUnitHandle(HT,key,HA_UNS),\
							   LoadUnitHandle(HT,key,HA_UNE),\
							   LoadReal(HT,key,HA_DAM),\
							   LoadBoolean(HT,key,HA_ATK),\
							   LoadBoolean(HT,key,HA_RNG),\
							   ConvertAttackType(LoadInteger(Const,HA_CONS,LoadInteger(HT,key,HA_ATP))),\
							   ConvertDamageType(LoadInteger(Const,HA_CONS,LoadInteger(HT,key,HA_DTP))),\
							   ConvertWeaponType(LoadInteger(Const,HA_CONS,LoadInteger(HT,key,HA_WTP))))
		else
	   	set keep=0
		endif
		if keep <=0 then
			call FlushChildHashtable(HT,key)
			call PauseTimer(t)
			call DestroyTimer(t)
		else
			call SaveReal(HT,key,HA_Keep,keep)
		endif
		set t=null
	endfunction
	function XG_DamPlus_Dot takes unit us,unit ue,real dam,real keep,real timeout,boolean oned,integer sign,boolean atk,boolean range,attacktype atp,damagetype dtp,weapontype wtp returns nothing
		local timer t=CreateTimer()
		local integer key=GetHandleId(t)
		call SaveUnitHandle(HT,key,HA_UNS,us)
		call SaveUnitHandle(HT,key,HA_UNE,ue)
		call SaveReal(HT,key,HA_DAM,dam)
		call SaveReal(HT,key,HA_Keep,keep)
		call SaveInteger(HT,key,HA_SIGN,sign)
		call SaveReal(HT,key,HA_Timeout,timeout)
		call SaveBoolean(HT,key,HA_TRG,true)     //触发伤害
		call SaveBoolean(HT,key,HA_ATK,atk)     //攻击伤害
		call SaveBoolean(HT,key,HA_RNG,range) //远程伤害
		call SaveInteger(HT,key,HA_ATP,GetHandleId(atp))
		call SaveInteger(HT,key,HA_DTP,GetHandleId(dtp))
		call SaveInteger(HT,key,HA_WTP,GetHandleId(wtp))
		if oned then
			call Xg_DamPlus_SetSign(sign)
			call XG_UnitDamTarPlus(us,ue,dam,atk,range,atp,dtp,wtp)
		endif
		call TimerStart(t,timeout,true,function Dot_Timer)
		set t=null
	endfunction
//================================================================================
//事件动态清理
	function XG_DamPlus_Event_Clear takes integer index returns nothing
		local integer num = LoadInteger(DamTrig,index,0)
		local integer i = 0
		local integer p = 0 //位置偏移
		if num <= 0 then
			return
		endif
		loop
			set i = i + 1
			if LoadTriggerHandle(DamTrig, index, i) == null then
				set p = p + 1
			else
				if p > 0 then
					call SaveTriggerHandle(DamTrig, index - p, i, LoadTriggerHandle(DamTrig, index, i))
					call RemoveSavedHandle(DamTrig, index, i)
				endif
			endif
			exitwhen i >= num
		endloop
		if p > 0 then
			call SaveInteger(DamTrig, index, 0, num - p )
		endif
	endfunction
/*注册事件 接受普通攻击【1】 接受技能伤害【2】 接受触发伤害【3】 伤害被格挡【4】 伤害处理结束【5】吸血【6】 生命偷取【7】*/
	function XG_DamPlus_Reg takes trigger trg,integer index returns nothing
		local integer num = LoadInteger(DamTrig,index,0) + 1
		call SaveInteger(DamTrig,index,0,num)
		call SaveTriggerHandle(DamTrig,index,num,trg)
		//return true
	endfunction


	function Xg_DamPlus_SetArint takes integer i,real value returns nothing
		set arint[i]=value
	endfunction
	private function ClearData_Timer takes nothing returns nothing
		local timer t=GetExpiredTimer()
		local integer key=GetHandleId(t)
		local integer e=LoadInteger(HT,key,2)
		if LoadUnitHandle(HT,key,0)==null then
			call FlushChildHashtable(HT,LoadInteger(HT,key,1))
		endif
		call FlushChildHashtable(HT,key)
		call PauseTimer(t)
		call DestroyTimer(t)
		set t=null
	endfunction
	private function UnitDeathClearData takes nothing returns nothing
		local timer t=CreateTimer()
		local unit u=GetDyingUnit()
		call SaveUnitHandle(HT,GetHandleId(t),0,u)
		call SaveInteger(HT,GetHandleId(t),1,GetHandleId(u))
		call TimerStart(t,60.00,true,function ClearData_Timer)
		set t=null
		set u=null
	endfunction
     function Xg_DamPlus_ON takes integer abil returns nothing
        local region rectRegion
        local group g 
        local rect r
		local integer i=-1
		if UnitEnterMap!=null then
			return
		endif
		set PhyAbil = abil
		set rectRegion = CreateRegion()
		set g = CreateGroup()
		set r = GetWorldBounds()
        set ExecuteQueId[0]=0
		set arint[0]=0.06 //抗性因子
		set arint[1]=1.00 //闪避上限
		set arint[2]=1.00 //格挡上限
		set arint[3]=2.00 //默认法术暴击伤害
		set arint[4]=2.00 //默认物理暴击伤害
		set arint[5]=1.00 //默认格挡伤害比例
        set Xg_DamPlus_Trg = CreateTrigger()
		call TriggerAddCondition(Xg_DamPlus_Trg,Condition(function DamAction_Redirect))
        call TriggerAddAction(Xg_DamPlus_Trg,function UnitDamagedAction)

        call GroupEnumUnitsInRect(g, r, Condition(function AnyUnitDamagedFilter))
        call DestroyGroup(g)
        set g = null

        set UnitEnterMap = CreateTrigger()
		set UnitDeathEvent = CreateTrigger()
		call TriggerAddAction(UnitDeathEvent,function UnitDeathClearData)
        call RegionAddRect(rectRegion, r)
        call TriggerRegisterEnterRegion(UnitEnterMap, rectRegion, Condition(function AnyUnitDamagedFilter))
        set r = null
		set rectRegion=null
		//初始化常量表
	loop
		set i = i + 1
		if i <= 23 then
			call SaveInteger(Const, HA_CONS, GetHandleId(ConvertWeaponType(i)), i)
			if i <= 6 then
				call SaveInteger(Const, HA_CONS, GetHandleId(ConvertAttackType(i)), i)
			endif
		endif
		call SaveInteger(Const, HA_CONS, GetHandleId(ConvertDamageType(i)), i)
		exitwhen i == 26
	endloop
    endfunction
#undef width
//#undef GetUnitState
endlibrary
#endif
