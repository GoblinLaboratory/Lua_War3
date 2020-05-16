#ifndef XGChargeIncluded
#define XGChargeIncluded
	#include "XueYue\Base.j"
	#include "XueYue\Define\Charge.Cons" /* 载入常量 */
#ifndef XGDamPlus_ON
library XGCharge initializer Init requires XGbase
#else
library XGCharge initializer Init requires XGbase,XGDamPlus
#endif
globals
	private hashtable htb=InitHashtable()
	private boolexpr Bexpr = null
	private group Group = null
	private string Effe = null
	private boolean Switch = false
	private boolean Build = false
	private boolean Impact = false
	private boolean HaveSource = false
	private boolean FlyingUnit = false
	private boolean Path = false
	unit Charge_DamSource=null
	unit Charge_Source=null
	unit Charge_Current=null
	unit Charge_Target=null
	integer Xg_Charge_Key = 0
	private integer Trg_Impact_Num=0
	private trigger array Trg_Impact_Trigger
	private integer Trg_End_Num=0
	private trigger array Trg_End_Trigger
	private integer Tree=0
endglobals
	function XG_Charge_Reg takes trigger trg returns nothing
		if trg==null then
			return
		endif
		set Trg_Impact_Num=Trg_Impact_Num+1
		set Trg_Impact_Trigger[Trg_Impact_Num]=trg
	endfunction
	function XG_Charge_End_Reg takes trigger trg returns nothing
		if trg==null then
			return
		endif
		set Trg_End_Num=Trg_End_Num+1
		set Trg_End_Trigger[Trg_End_Num]=trg
	endfunction
    private function TreeFilter takes nothing returns boolean
        local integer id = GetDestructableTypeId(GetFilterDestructable())
        if id == 'LTlt' or id == 'ATtr' or id == 'BTtw' or id == 'KTtw' /*
          */or id == 'YTft' or id == 'JTct' or id == 'YTst' or id == 'YTct' /*
          */or id == 'YTwt' or id == 'JTtw' or id == 'DTsh' or id == 'FTtw' /*
          */or id == 'CTtr' or id == 'ITtw' or id == 'NTtw' or id == 'OTtw' /*
          */or id == 'ZTtw' or id == 'WTst' or id == 'GTsh' or id == 'VTlt' /*
          */or id == 'WTtw' or id == 'ATtc' or id == 'BTtc' or id == 'CTtc' /*
          */or id == 'ITtc' or id == 'NTtc' or id == 'ZTtc' then
		  return true
		endif
		if not Path then
			if id == 'YTfb' or id == 'YTfc' then //通用 路径阻断器
				set Switch = true
				return false
			endif
			
			if FlyingUnit then
				if id == 'YTab' or id == 'YTac' then //空 路径阻断器
					set Switch = true
				endif
			else
				if id == 'YTpb' or id == 'YTpc' then //陆 路径阻断器
					set Switch = true
				endif
			endif
		endif
		return false
    endfunction
	private function TreeKill takes nothing returns nothing
        local destructable d = GetEnumDestructable()
		if Tree == 1 then
			if GetWidgetLife(d) > 0.405 then
				call KillDestructable(d)
			endif
		elseif Tree == 2 and GetWidgetLife(d) > 0.405 then
			set Switch = true
		endif
        set d = null
    endfunction
	private function EnemyFilter takes unit u returns boolean
     if GetUnitState(u, UNIT_STATE_LIFE) > 0.405 and not(IsUnitHidden(u)) then
      if IsUnitEnemy(u,GetOwningPlayer(Charge_Source)) then
			if IsUnitType(u, UNIT_TYPE_STRUCTURE) then
				if not(Build) then
					set Switch = true
				endif
			elseif not(Impact) then
				set Switch = true
			endif
       return true
      endif
     endif
     return false
    endfunction
	private function DamageFilter takes nothing returns boolean
		local integer i
		local real dam
  set Charge_Current = GetFilterUnit()

  if not(IsUnitInGroup(Charge_Current, Group)) and Charge_Current != Charge_Source  then
   if not(Switch) and EnemyFilter(Charge_Current) then
			call GroupAddUnit(Group, Charge_Current)
			set i=GetHandleId(GetExpiredTimer())
			set dam=LoadReal(htb,i,Charge_Damage)
			if dam>0 and HaveSource then
				#ifndef XGDamPlus_ON
				call UnitDamageTarget(Charge_DamSource, Charge_Current, dam, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_DIVINE, WEAPON_TYPE_WHOKNOWS)
				#else
				call XG_UnitDamTarPlus(Charge_DamSource, Charge_Current, dam, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_DIVINE, WEAPON_TYPE_WHOKNOWS)
				#endif
			endif

		set i=1
		loop
			exitwhen i > Trg_Impact_Num
			if IsTriggerEnabled(Trg_Impact_Trigger[i]) then
				if TriggerEvaluate(Trg_Impact_Trigger[i]) then
					call TriggerExecute(Trg_Impact_Trigger[i]) //单位碰撞事件
				endif
			endif
			set i=i+1
		endloop

   call DestroyEffect( AddSpecialEffect(Effe, GetUnitX(Charge_Current), GetUnitY(Charge_Current)) )
            return true
        endif
          endif
        set Charge_Current = null
        return false
    endfunction
	function Charge_Unit_Timer takes nothing returns nothing
		local timer t=GetExpiredTimer()
		local integer key=GetHandleId(t)
		local boolean follow=LoadBoolean(htb,key,Charge_Follow)	
		local real range=LoadReal(htb,key,Charge_Range)
		local real time=LoadReal(htb,key,Charge_Time)-0.02
		local real Ex	YDNL	local real Ey
		local string effs=LoadStr(htb,key,Charge_EffectS)
		local group g=CreateGroup()
		local real dx 	YDNL	local real dy
		local real angle	YDNL	local real dist
		local rect rct	YDNL local integer i
		local real Atime = LoadReal(htb,key,Charge_Atime)	YDNL	local real timeout = LoadReal(htb,key,Charge_Timeout)
		local unit us=LoadUnitHandle(htb,key,Charge_DamageSource)
		set HaveSource = us != null
		set Charge_DamSource = us
		set Charge_Source=LoadUnitHandle(htb,key,Charge_UnitS)
		set Build=LoadBoolean(htb,key,Charge_Build)
		set Impact=LoadBoolean(htb,key,Charge_Impact)
		set Charge_Target=LoadUnitHandle(htb,key,Charge_UnitE)
		set Switch = false
		set FlyingUnit = IsUnitType(Charge_Source, UNIT_TYPE_FLYING)
		set Path = LoadBoolean(htb,key,Charge_Path)
		if follow then
			set Ex=GetUnitX(Charge_Target)		YDNL	set Ey=GetUnitY(Charge_Target)
		else
			set Ex=LoadReal(htb,key,Charge_X)	YDNL	set Ey=LoadReal(htb,key,Charge_Y)
		endif
		set Group = LoadGroupHandle(htb,key,Charge_Group)
		set dx = Ex - GetUnitX(Charge_Source)		YDNL	set dy = Ey - GetUnitY(Charge_Source)	YDNL	set dist = SquareRoot(dx * dx + dy * dy)
	
		if time < timeout or dist < 30 then
			set Switch=true
		endif
		if HaveSavedReal(htb, key, Charge_Dist) then
			set dist  = LoadReal(htb, key, Charge_Dist)
			set angle = LoadReal(htb, key, Charge_Angle)
		else
			set angle = bj_RADTODEG * Atan2(dy, dx)
			set dist =  dist * (  timeout / time ) * 2
		endif
		if not Switch then
			set Ex=GetUnitX(Charge_Source) + dist * Cos(angle * bj_DEGTORAD)
			set Ey=GetUnitY(Charge_Source) + dist * Sin(angle * bj_DEGTORAD)
			set Ex=RMinBJ(RMaxBJ(Ex, XG_Map_Loc[1]), XG_Map_Loc[3])
			set Ey=RMinBJ(RMaxBJ(Ey, XG_Map_Loc[2]), XG_Map_Loc[4])
			//call BJDebugMsg(R2S(Ex)+","+R2S(Ey))
			
			if not(Path) and IsTerrainPathable(Ex, Ey, PATHING_TYPE_WALKABILITY) then /*非无视地形的地形碰撞*/
				set Switch=true /*停止冲锋*/
			else
				set Tree=LoadInteger(htb,key,Charge_KillTree)
				set rct=LoadRectHandle(htb,key,Charge_Rect)
				call MoveRectTo(rct, Ex, Ey)
				call EnumDestructablesInRect(rct, Bexpr, function TreeKill)
				set rct=null
			endif
						set Effe=LoadStr(htb,key,Charge_EffectE)
			if not Switch then
				call SetUnitX(Charge_Source,Ex)
				call SetUnitY(Charge_Source,Ey)
				call DestroyEffect(AddSpecialEffect(effs, Ex, Ey))
				call GroupEnumUnitsInRange(g, Ex, Ey, range, function DamageFilter)
			endif
		endif
		if Switch then
			set i=1
			loop
				exitwhen i>Trg_End_Num
				if IsTriggerEnabled(Trg_End_Trigger[i]) then
					if TriggerEvaluate(Trg_End_Trigger[i]) then
						call TriggerExecute(Trg_End_Trigger[i]) //冲锋结束事件
					endif
				endif
				set i=i+1
			endloop
			call DestroyTimer(t)
			call RemoveRect(LoadRectHandle(htb,key,Charge_Rect))
			call DestroyGroup(Group)
			call FlushChildHashtable(htb,key)
		endif
		call DestroyGroup(g)
		call SaveReal(htb,key,Charge_Time,time)
		set t=null
		set us=null
		set HaveSource=false
		set Charge_Source=null
		set Charge_Target=null
		set Charge_DamSource=null
		set Group=null
		set Switch=false
		set g=null
	endfunction

	/*令${Unit}冲锋到${单位}的位置,持续${x}秒.伤害半径${r} 伤害值${val} 伤害来源${unit} ${跟随},${摧毁}树木，${计算}碰撞，${无视}建筑，${无视}地形 附加${特效} 目标附加${特效}*/
	function XG_Charge_Unit takes unit us,unit ue,real time,real timeout,real range,real dam,unit damSource,\
								boolean follow,integer killtree,boolean impact,boolean build,boolean path,\
								string effs,string effe returns nothing
		local timer t=CreateTimer()						YDNL	local integer key=GetHandleId(t)
		call SaveUnitHandle(htb,key,Charge_UnitS,us)	YDNL	call SaveUnitHandle(htb,key,Charge_UnitE,ue)
		call SaveReal(htb,key,Charge_Time,time)			YDNL	call SaveReal(htb,key,Charge_Range,range)	YDNL	call SaveReal(htb,key,Charge_Atime,time)
		call SaveReal(htb,key,Charge_Timeout,timeout)
		call SaveReal(htb,key,Charge_Damage,dam)	YDNL	call SaveUnitHandle(htb,key,Charge_DamageSource,damSource)
		
		call SaveBoolean(htb,key,Charge_Follow,follow)	YDNL	call SaveInteger(htb,key,Charge_KillTree,killtree)
		call SaveBoolean(htb,key,Charge_Impact,impact)	YDNL	call SaveBoolean(htb,key,Charge_Build,build)		YDNL	call SaveBoolean(htb,key,Charge_Path,path)
		call SaveRectHandle(htb,key,Charge_Rect,Rect(-range,-range,range,range))
		
		call SaveStr(htb,key,Charge_EffectS,effs)		YDNL		call SaveStr(htb,key,Charge_EffectE,effe)
		if not follow then
			call SaveReal(htb,key,Charge_X,GetUnitX(ue))
			call SaveReal(htb,key,Charge_Y,GetUnitY(ue))
		endif
		call SaveGroupHandle(htb,key,Charge_Group,CreateGroup())
		call TimerStart(t,timeout,true,function Charge_Unit_Timer)
		set t=null
		set Xg_Charge_Key = key
				call SaveTimerHandle(htb,key,Charge_Timer,t)
	endfunction
	/*令${Unit}冲锋到${指定点},持续${x}秒.伤害半径${r} 伤害值${val} 伤害来源${unit} ,${摧毁}树木，${计算}碰撞，${无视}建筑，${无视}地形 附加${特效} 目标附加${特效}*/
	function XG_Charge_Loc takes unit us,location p,real time,real timeout,real range,real dam,unit damSource,\
								integer killtree,boolean impact,boolean build,boolean path,\
								string effs,string effe returns nothing
		local timer t=CreateTimer()						YDNL	local integer key=GetHandleId(t)
		call SaveUnitHandle(htb,key,Charge_UnitS,us)
		call SaveReal(htb,key,Charge_Time,time)			YDNL	call SaveReal(htb,key,Charge_Range,range)	YDNL	call SaveReal(htb,key,Charge_Atime,time)
		call SaveReal(htb,key,Charge_Timeout,timeout)
		call SaveReal(htb,key,Charge_Damage,dam)	YDNL	call SaveUnitHandle(htb,key,Charge_DamageSource,damSource)
		
		call SaveInteger(htb,key,Charge_KillTree,killtree)	YDNL	call SaveBoolean(htb,key,Charge_Path,path)
		call SaveBoolean(htb,key,Charge_Impact,impact)	YDNL	call SaveBoolean(htb,key,Charge_Build,build)
		call SaveRectHandle(htb,key,Charge_Rect,Rect(-range,-range,range,range))
			call SaveReal(htb,key,Charge_X,GetLocationX(p))
			call SaveReal(htb,key,Charge_Y,GetLocationY(p))
		call SaveStr(htb,key,Charge_EffectS,effs)		YDNL		call SaveStr(htb,key,Charge_EffectE,effe)
		call SaveGroupHandle(htb,key,Charge_Group,CreateGroup())
		call TimerStart(t,timeout,true,function Charge_Unit_Timer)
		set t=null
		set Xg_Charge_Key = key
				call SaveTimerHandle(htb,key,Charge_Timer,t)
	endfunction
	/*令${Unit}向${x}方向冲锋${y}距离,持续${x}秒.伤害半径${r} 伤害值${val} 伤害来源${unit} ,${摧毁}树木，${计算}碰撞，${无视}建筑，${无视}地形 附加${特效} 目标附加${特效}*/
	function XG_Charge_Angle_Dist takes unit us,real angle,real dist,real time,real timeout,real range,real dam,unit damSource,\
								integer killtree,boolean impact,boolean build,boolean path,\
								string effs,string effe returns nothing
		local timer t=CreateTimer()						YDNL	local integer key=GetHandleId(t)
		call SaveUnitHandle(htb,key,Charge_UnitS,us)
		call SaveReal(htb,key,Charge_Time,time)			YDNL	call SaveReal(htb,key,Charge_Range,range)	YDNL	call SaveReal(htb,key,Charge_Atime,time) //all time
		call SaveReal(htb,key,Charge_Timeout,timeout)
		call SaveReal(htb,key,Charge_Damage,dam)	YDNL	call SaveUnitHandle(htb,key,Charge_DamageSource,damSource)
		
		call SaveInteger(htb,key,Charge_KillTree,killtree)	YDNL	call SaveBoolean(htb,key,Charge_Path,path)
		call SaveBoolean(htb,key,Charge_Impact,impact)	YDNL	call SaveBoolean(htb,key,Charge_Build,build)
		call SaveRectHandle(htb,key,Charge_Rect,Rect(-range,-range,range,range))

		call SaveStr(htb,key,Charge_EffectS,effs)		YDNL		call SaveStr(htb,key,Charge_EffectE,effe)
		
		call SaveReal(htb, key, Charge_Angle, angle)	YDNL	call SaveReal(htb, key, Charge_Dist, dist / (time/timeout))
		
		call SaveGroupHandle(htb,key,Charge_Group,CreateGroup())
		call TimerStart(t,timeout,true,function Charge_Unit_Timer)
		set t=null
		set Xg_Charge_Key = key
		call SaveTimerHandle(htb,key,Charge_Timer,t)
	endfunction
	function XG_Charge_Stop takes nothing returns nothing
		set Switch=true
	endfunction
		function XG_Charge_StopW takes integer key returns nothing
     local timer t = LoadTimerHandle(htb,key,Charge_Timer)
    	call PauseTimer(t)
     call DestroyTimer(t)
     call RemoveRect(LoadRectHandle(htb,key,Charge_Rect))
		  	call DestroyGroup(LoadGroupHandle(htb,key,Charge_Group))
		  	call FlushChildHashtable(htb,key)
		  	set t=null
	endfunction
	private function Init takes nothing returns nothing
		set Bexpr = Filter(function TreeFilter)
	endfunction
endlibrary
#endif



   

