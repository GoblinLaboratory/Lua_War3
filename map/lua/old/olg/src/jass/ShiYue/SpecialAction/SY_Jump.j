#ifndef Blood_JumpIncluded
#define Blood_JumpIncluded
  #include "ShiYue\ShiYueBase.j"
  #include "ShiYue\SY_DamageBase.j"
  #include "ShiYue\Define\ShiYueBase.Cons"
  #include "ShiYue\Define\SY_jump.Cons"

#ifndef XGDamPlus_ON
library SYJump requires SYDamageBaseBegin
#else
library SYJump requires SYDamageBaseBegin,XGDamPlus
#endif

globals 
    private integer Trg_End_index = 0
    private trigger array Trg_End_Trigger
	private integer array Unit_index
	private unit array Unit_Jumer 
	private unit array Unit_Damager
endglobals

function SY_JumpGetDamager takes nothing returns unit
    return Unit_Damager[Unit_index[0]]
endfunction

function SY_JumpGetJumper takes nothing returns unit
    return Unit_Jumer[Unit_index[0]]
endfunction

function SY_JumpGetIndex takes nothing returns integer
    return Unit_index[Unit_index[0]]
endfunction

function SY_JumpEvent_End_Reg takes trigger t returns nothing
if t == null then
    return
else
	set Trg_End_index = Trg_End_index + 1
    set Trg_End_Trigger[Trg_End_index] = t
endif
endfunction

function SY_JumpDamage takes nothing returns nothing
local integer Int = GetHandleId(GetExpiredTimer())
local unit DamageSource = LoadUnitHandle(SY_Hashtable,Int,SY_Damager)
local real Damage = LoadReal(SY_Hashtable,Int,SY_Damage)
if (IsUnitAliveBJ(GetEnumUnit()) == true and IsUnitEnemy(GetEnumUnit(), GetOwningPlayer(DamageSource))) then
//只能伤害伤害来源的敌人单位
#ifndef XGDamPlus_ON
call UnitDamageTarget(DamageSource,\
                      GetEnumUnit(),\
					  Damage,\
					  LoadBoolean(SY_Hashtable,Int,SY_IsAttack),\
					  LoadBoolean(SY_Hashtable,Int,SY_IsFar),\
					  ConvertAttackType(LoadInteger(SY_Hashtable,HA_CONS,LoadInteger(SY_Hashtable,Int,SY_AttackType))),\
					  ConvertDamageType(LoadInteger(SY_Hashtable,HA_CONS,LoadInteger(SY_Hashtable,Int,SY_DamageType))),\
					  ConvertWeaponType(LoadInteger(SY_Hashtable,HA_CONS,LoadInteger(SY_Hashtable,Int,SY_WeaponType))))
#else
call XG_UnitDamTarPlus(DamageSource,\
                      GetEnumUnit(),\
					  Damage,\
					  LoadBoolean(SY_Hashtable,Int,SY_IsAttack),\
					  LoadBoolean(SY_Hashtable,Int,SY_IsFar),\
					  ConvertAttackType(LoadInteger(SY_Hashtable,HA_CONS,LoadInteger(SY_Hashtable,Int,SY_AttackType))),\
					  ConvertDamageType(LoadInteger(SY_Hashtable,HA_CONS,LoadInteger(SY_Hashtable,Int,SY_DamageType))),\
					  ConvertWeaponType(LoadInteger(SY_Hashtable,HA_CONS,LoadInteger(SY_Hashtable,Int,SY_WeaponType))))
#endif
endif
set DamageSource = null
endfunction

function SY_JumpAction takes nothing returns nothing
local integer Int = GetHandleId(GetExpiredTimer())
local string EffectWays = LoadStr(SY_Hashtable,Int,SY_EffectWays)
local unit Jumper = LoadUnitHandle(SY_Hashtable,Int,SY_Jumper)
//local unit Jumped = LoadUnitHandle(SY_Hashtable,Int,SY_Jumped)
local location p = null
local integer i = 1
//某些关键数据
local real FW = LoadReal(SY_Hashtable,Int,SY_FW)
local real V_0 = LoadReal(SY_Hashtable,Int,SY_Speed)
local real High = LoadReal(SY_Hashtable,Int,SY_Highest)
local real TotalTime = LoadReal(SY_Hashtable,Int,SY_AllTimes)
local real TimeToMax = LoadReal(SY_Hashtable,Int,SY_ChangeTime)
local real EachDis = LoadReal(SY_Hashtable,Int,SY_EachDistance)
local real times = LoadReal(SY_Hashtable,Int,SY_Times)
local boolean BL = false
local boolean Death = LoadBoolean(SY_Hashtable,Int,SY_Overdeath)
local real Angle = LoadReal(SY_Hashtable,Int,SY_Angle)
local real H = 0.0
local real x = 0.0
local real y = 0.0
local group Group = CreateGroup() 
set times = times + 1
call SaveReal(SY_Hashtable,Int,SY_Times,times)

/*判断是否停止跳跃
条件1.两者距离小于每次移动距离
条件2.跳跃者已经死亡（死了总不能让单位继续跳吧！）
*/

if (times >=TotalTime or IsUnitDeadBJ(Jumper)==true ) then 
set BL = true
endif
//位移操作
    set x = GetUnitX(Jumper)
    set y = GetUnitY(Jumper)
    set x = x+EachDis*CosBJ(Angle)
    set y = y+EachDis*SinBJ(Angle)
    call SetUnitX(Jumper,x)
    call SetUnitY(Jumper,y)

//H是最高高度
//t是时间
//t1是抵达最高高度的时间
//t2是落地时间
    if times>=TimeToMax then
    // h = H - H*((t - t1)^2) / (t2-t1)^2)
        set H = High - Pow(times-TimeToMax , 2.0) * High / Pow(TotalTime-TimeToMax , 2.0)
    else
    // h = V*t - (V*t1 - H)*t^2 / t1 ^ 2
        set H = V_0*times - (V_0*TimeToMax - High)*Pow(times , 2.0) / Pow(TimeToMax , 2.0)
    endif
    //设置高度
    call SetUnitFlyHeight(Jumper,H,20000.0)
//退出跳跃并造成伤害
    if ( BL == true ) then
        set p = Location(x,y)
        call SetUnitFlyHeight(Jumper,LoadReal(SY_Hashtable,Int,SY_FlyHigh),20000.0)
        call GroupEnumUnitsInRangeOfLoc(Group,p,FW,null)
        call DestroyEffect(AddSpecialEffectLoc(EffectWays,p))
        call RemoveLocation(p)
        call ForGroup(Group,function SY_JumpDamage)
        //事件变量准备
            set Unit_index[0] = Unit_index[0] + 1
            set Unit_Jumer[Unit_index[0]] = Jumper
            set Unit_Damager[Unit_index[0]] = LoadUnitHandle(SY_Hashtable,Int,SY_Damager)
            set Unit_index[Unit_index[0]] = LoadInteger(SY_Hashtable,Int,SY_Index)
        //响应事件
            loop
            exitwhen i > Trg_End_index
	            if IsTriggerEnabled(Trg_End_Trigger[i]) and TriggerEvaluate(Trg_End_Trigger[i])then
            	    call TriggerExecute(Trg_End_Trigger[i]) //跳跃完成
            	endif
            	set i = i+1
            endloop
            set Unit_index[0] = Unit_index[0] - 1
		//清空
        call SaveReal(SY_Hashtable,Int,SY_Times,0) 
        call FlushChildHashtable(SY_Hashtable,Int)
        call DestroyTimer(GetExpiredTimer())
        call SetUnitPathing(Jumper,true) //为跳跃单位开启碰撞
	       if(Death == true) then //当Death为ture 时会先杀死单位，然后删除
	       call KillUnit(Jumper)
	       call RemoveUnit(Jumper)
	       endif
    endif

call DestroyGroup(Group)
set p = null
set Group = null
set Jumper = null
//set Jumped = null
endfunction


function SY_Jump takes unit DamageSource,unit Jumper,location p,real Cycle,real TotalTime,real High,real TimeToMax,real V_0,real FW,real Damage_Total,boolean IsAttack,boolean IsFar,attacktype Type1,damagetype Type2,weapontype Type3,boolean Kill,string EffectWays,integer index returns nothing
local timer Timer = CreateTimer()
local integer Int = GetHandleId(Timer)
local location p_0 = GetUnitLoc(Jumper)
local real X = 0

if GetUnitAbilityLevel(Jumper,'Arav' ) == 0 then //为跳跃单位添加删除风暴之鸦
call UnitAddAbility(Jumper, 'Arav' )
call UnitRemoveAbility(Jumper, 'Arav' )
endif

set X = DistanceBetweenPoints(p,p_0)
call SetUnitPathing(Jumper,false)//为跳跃单位关闭碰撞
//储存一些关键的数据信息
call SaveReal(SY_Hashtable,Int,SY_Speed,V_0)
call SaveReal(SY_Hashtable,Int,SY_Highest,High)
call SaveReal(SY_Hashtable,Int,SY_AllTimes,TotalTime/Cycle)//总时间
call SaveReal(SY_Hashtable,Int,SY_ChangeTime,TimeToMax/Cycle)//抵达最高点时间
set  X = X*Cycle/TotalTime //计算每次运行距离
call SaveReal(SY_Hashtable,Int,SY_EachDistance,X)//建议这个自己考虑，因为- -总不能没跳起来就直接结束最高点吧
call SaveReal(SY_Hashtable,Int,SY_Angle,AngleBetweenPoints(p_0,p))

call SaveBoolean(SY_Hashtable,Int,SY_Overdeath,Kill)
call SaveBoolean(SY_Hashtable,Int,SY_IsAttack,IsAttack)
call SaveBoolean(SY_Hashtable,Int,SY_IsFar,IsFar)
call SaveStr(SY_Hashtable,Int,SY_EffectWays,EffectWays)
call SaveUnitHandle(SY_Hashtable,Int,SY_Damager,DamageSource)
call SaveUnitHandle(SY_Hashtable,Int,SY_Jumper,Jumper)
//call SaveUnitHandle(SY_Hashtable,Int,SY_Jumped,Jumped)
call SaveReal(SY_Hashtable,Int,SY_Damage,Damage_Total)
call SaveReal(SY_Hashtable,Int,SY_FW,FW)
call SaveReal(SY_Hashtable,Int,SY_FlyHigh,GetUnitFlyHeight(Jumper))
call SaveInteger(SY_Hashtable,Int,SY_AttackType,GetHandleId(Type1))
call SaveInteger(SY_Hashtable,Int,SY_DamageType,GetHandleId(Type2))
call SaveInteger(SY_Hashtable,Int,SY_WeaponType,GetHandleId(Type3))
call SaveInteger(SY_Hashtable,Int,SY_Index,index)
call TimerStart(Timer,Cycle,true,function SY_JumpAction)
call RemoveLocation(p_0)
set p_0 = null
set Timer = null
endfunction

private function Init takes nothing returns nothing
    set Unit_index[0] = 0
endfunction

endlibrary
#endif
