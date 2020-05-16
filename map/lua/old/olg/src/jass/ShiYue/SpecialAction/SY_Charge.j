#ifndef Blood_ChargeIncluded
#define Blood_ChargeIncluded
  #include "ShiYue\TLMiniSystem\SY_CheckWalk.j"

#ifndef XGDamPlus_ON
library SYCharge requires CheckWalk
#else
library SYCharge requires CheckWalk,XGDamPlus
#endif


globals
    
    private unit Worker = null          //农民单位
    private trigger T=CreateTrigger()   //触发器
    
    private integer array Index     //索引  *标识,作为标识项目,相同标识的冲锋作用同一个单位两个冲锋之间无影响
    public integer I                //循环数  index:SYCharge_I
    private unit array Charger      //冲锋单位
    private unit array Damager      //伤害单位
    private real array Degree       //冲锋角度
    private real array Dis_Each     //每次距离
    private real array Cycle        //运行周期
    private real array Time         //花费时间
    private real array Times        //以运行时间
    private real array Damage       //伤害
    private real array Radius       //伤害范围
    private group array Remember      //重复伤害记录
    private boolean array IsAgain   //重复伤害
    private boolean array IsAt      //是攻击伤害
    private boolean array IsFar     //是远程伤害
    private boolean array Through   //无视地形
    private integer array Trees     //树木操作: 0->无视树木,1->撞树停止,2->摧毁树木(穿过)
    private integer array Units     //单位操作: 0->无视任何单位碰撞,1->无视建筑碰撞,2->不关闭碰撞
    private attacktype array AttackType //攻击类型
    private damagetype array DamageType //伤害类型
    private weapontype array WeaponType //武器类型
    private string array AddtoSoil  //地面特效
    private boolean array IsUnUsual //被强制停止
    
    private boolean array B         //辅助布尔值,0->地面可通行 1->树木 2->单位 3->结束冲锋
    //冲锋结束
    private integer Trg_End_index = 0        //触发索引
    private trigger array Trg_End_Trigger    //触发器
    //受到伤害
    private integer Trg_Dam_index = 0        //触发索引
    private trigger array Trg_Dam_Trigger    //触发器
    private unit Damaged = null
endglobals

//获取伤害者
public function GetDamager takes nothing returns unit
    return I:Damager
endfunction
//获取冲锋者
public function GetCharger takes nothing returns unit
    return I:Charger
endfunction
//获取标记
public function GetIndex takes nothing returns integer
    return I:Index
endfunction
//获取受伤者
public function GetDamaged takes nothing returns unit
    return Damaged
endfunction
//获取结束方式
public function GetUnUsual takes nothing returns boolean
    return I:IsUnUsual
endfunction
//注册结束事件
public function Event_End_Reg takes trigger t returns nothing
    if t == null then
        return
    else
        set Trg_End_index = Trg_End_index + 1
        set Trg_End_Trigger[Trg_End_index] = t
    endif
endfunction
//注册伤害事件
public function Event_Dam_Reg takes trigger t returns nothing
    if t == null then
        return
    else
        set Trg_Dam_index = Trg_Dam_index + 1
        set Trg_Dam_Trigger[Trg_Dam_index] = t
    endif
endfunction

//树木操作
function SY_ChargeTrees takes nothing returns nothing
    if GetDestructableLife(GetEnumDestructable()) > 0.0 then
        if IssueTargetOrder(Worker,"harvest",GetEnumDestructable()) == true then
            if Trees[I] == 0 then //无视树木
                //模糊判断是由树木造成的阻挡
                set 0:B = true
            elseif Trees[I] == 1 then//撞树停止
                set B[1] = false
            else//摧毁树木(穿过)
                call KillDestructable(GetEnumDestructable())
                //模糊判断是由树木造成的阻挡
                set 0:B = true
            endif
        endif
    endif
endfunction
//单位操作
function SY_ChargeUnits takes nothing returns nothing
    if GetEnumUnit() != I:Charger then
        if Units[I] == 2 then//不关闭碰撞
            set B[2] = false
        elseif Units[I] == 1 then//无视建筑碰撞
            if IsUnitType(GetTriggerUnit(), UNIT_TYPE_STRUCTURE) then
                set B[2] = false
            endif
        //无视任何单位碰撞
        endif
    endif
endfunction
//伤害操作
function SY_ChargeDamage takes nothing returns nothing
local integer i =1
    if GetUnitState(GetEnumUnit(), UNIT_STATE_LIFE) >= 0 and IsUnitEnemy(GetEnumUnit(),GetOwningPlayer(Damager[I])) and (IsUnitInGroup(GetEnumUnit(),Remember[I]) == false or IsAgain[I] == true ) then
        #ifndef XGDamPlus_ON
        call UnitDamageTarget(Damager[I],GetEnumUnit(),Damage[I],IsAt[I],IsFar[I],AttackType[I],DamageType[I],WeaponType[I])
        #else
        call XG_UnitDamTarPlus(Damager[I],GetEnumUnit(),Damage[I],IsAt[I],IsFar[I],AttackType[I],DamageType[I],WeaponType[I])
        #endif
        call GroupAddUnit(Remember[I],GetEnumUnit())
        //响应事件
        set Damaged = GetEnumUnit()
        loop
        exitwhen i > Trg_Dam_index
            if IsTriggerEnabled(Trg_Dam_Trigger[i]) and TriggerEvaluate(Trg_Dam_Trigger[i])then
               call TriggerExecute(Trg_Dam_Trigger[i]) //冲锋完成
            endif
            set i = i+1
        endloop
    endif
endfunction

private function ChargeAction takes nothing returns nothing 
    local rect r = null
    local real x = 0.0
    local real y = 0.0
    local group g = CreateGroup()
    local integer i = 0
    set I = 1
    loop 
    exitwhen I>Index[0]
        set Times[I] = Times[I]+0.01
        //是否抵达
        if Times[I] == Cycle[I] then
            set B[3] = true
            set Time[I] = Time[I] - Cycle[I]
            set Times[I] = 0.00
            //位移点确定
            set x = GetUnitX(Charger[I])+Cos(Degree[I])*Dis_Each[I]
            set y = GetUnitY(Charger[I])+Sin(Degree[I])*Dis_Each[I]
            //地面操作
            set 0:B = true
            if I:Through == false  /*位置不可通行*/  then
                set 0:B = CheckWalk_XY(x,y)
                //set 0:B = IssueBuildOrderById(Worker,UID,x,y)
            endif
            //树木操作
            set B[1] = true
            //set r = Rect(x-Dis_Each[I],y-Dis_Each[I],x+Dis_Each[I],y+Dis_Each[I])
            set r = Rect(x-100.0,y-100.0,x+100.0,y+100.0)//过小选取不到,well This do really Dstroy My View To War3
            call EnumDestructablesInRect(r,null,function SY_ChargeTrees)
            call RemoveRect(r)
            //单位碰撞操作
            set B[2] = true
            if I:Units != 0 then
                //call GroupEnumUnitsInRangeOfLoc(g,p,I:Dis_Each,null)碰撞只于运动距离有关和伤害范围无关
                call GroupEnumUnitsInRange(g,x,y,35.0,null)//测定后我选择规定式...
                call ForGroup(g,function SY_ChargeUnits)
            endif
            call GroupClear(g)
            //决定移动
            if B[1] == true and B[2] == true and 0:B == true then
                call SetUnitX(I:Charger,x)
                call SetUnitY(I:Charger,y)
                //伤害运作
                call GroupEnumUnitsInRange(g,x,y,I:Radius,null)
                call ForGroup(g,function SY_ChargeDamage)
                //特效地面
                call DestroyEffect(AddSpecialEffect(AddtoSoil[I],x,y))
            else
                set I:IsUnUsual = true
                set B[3] = false
            endif
            if Time[I] < Cycle[I] then //剩余时间不足以支持下一次周期时直接退出*考虑折中
                set B[3] = false
            endif
            //退出动作
            if B[3] == false then
                //响应事件
                set i = 1
                loop
                exitwhen i > Trg_End_index
                    if IsTriggerEnabled(Trg_End_Trigger[i]) and TriggerEvaluate(Trg_End_Trigger[i])then
                        call TriggerExecute(Trg_End_Trigger[i]) //冲锋完成
                    endif
                    set i = i+1
                endloop
                //退栈
                set Index[I] = Index[Index[0]]
                set Charger[I] = Charger[Index[0]]
                set Damager[I] = Damager[Index[0]]
                set Degree[I]  = Degree[Index[0]]
                set Dis_Each[I] = Dis_Each[Index[0]]
                set Cycle[I] = Cycle[Index[0]]
                set Time[I] = Time[Index[0]]
                set Times[I] = Times[Index[0]]
                set Damage[I] = Damage[Index[0]]
                set Radius[I] = Radius[Index[0]]
                call DestroyGroup(Remember[I])
                set Remember[I] = Remember[Index[0]]
                set IsAgain[I] = IsAgain[Index[0]]
                set IsAt[I] = IsAt[Index[0]]
                set IsFar[I] = IsFar[Index[0]]
                set Through[I] = Through[Index[0]]
                set Trees[I] = Trees[Index[0]]
                set Units[I] = Units[Index[0]]
                set AttackType[I] = AttackType[Index[0]]
                set DamageType[I] = DamageType[Index[0]]
                set WeaponType[I] = WeaponType[Index[0]]
                set AddtoSoil[I] = AddtoSoil[Index[0]]
                set I:IsUnUsual = 0:Index:IsUnUsual 
                set Index[0] = Index[0] - 1
                set I = I - 1
            endif
        endif
        set I = I + 1
    endloop
    call IssueTargetOrder(Worker,"attackonce",Worker)//暂停动作,时代提供
    if 0:Index <= 0 then
        call DisableTrigger(GetTriggeringTrigger())
    endif  
    call DestroyGroup(g)
    set g = null
endfunction

public function ToDegree takes unit damager,unit charger,real degree,real Distance,real cycle,real time,real radius,real damage,\
                         boolean isagain,boolean isat,boolean isfar,boolean through,integer trees,integer units,\
                         attacktype At,damagetype Dt,weapontype Wt,\
                         string addtosoil,integer sign returns nothing
    call EnableTrigger(T)
    set Index[0] = Index[0]+1
    set Index[Index[0]] = sign
    set Charger[Index[0]] = charger
    set Damager[Index[0]] = damager
    set Degree[Index[0]]  = degree*bj_DEGTORAD
    set Dis_Each[Index[0]] = Distance*cycle/time
    set Cycle[Index[0]] = cycle
    set Time[Index[0]] = time
    set 0:Index:Times = 0.00
    set Damage[Index[0]] = damage
    set Radius[Index[0]] = radius
    set Remember[Index[0]] = CreateGroup()
    set IsAgain[Index[0]] = isagain
    set IsAt[Index[0]] = isat
    set IsFar[Index[0]] = isfar
    set Through[Index[0]] = through
    set Trees[Index[0]] = trees
    set Units[Index[0]] = units
    set AttackType[Index[0]] = At
    set DamageType[Index[0]] = Dt
    set WeaponType[Index[0]] = Wt
    set AddtoSoil[Index[0]] = addtosoil
    set 0:Index:IsUnUsual = false
endfunction

public function ToLoc takes unit damager,unit charger,location locA,real cycle,real time,real radius,real damage,\
                         boolean isagain,boolean isat,boolean isfar,boolean through,integer trees,integer units,\
                         attacktype At,damagetype Dt,weapontype Wt,\
                         string addtosoil,integer sign returns nothing
local location locB = GetUnitLoc(charger)
local real distance = DistanceBetweenPoints(locB,locA)
local real degree = AngleBetweenPoints(locB,locA)
    call ToDegree(damager,charger,degree,distance,cycle,time,radius,damage,isagain,isat,isfar,through,trees,units,At,Dt,Wt,addtosoil,sign)
    call RemoveLocation(locB)
set locB=null
endfunction

public function Init takes integer uid,real x,real y returns nothing
call RemoveUnit(Worker)
call DestroyTrigger(T)
set Worker = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE),uid,x,y,0.0)
call ShowUnit(Worker,false)
call UnitAddAbility(Worker,'Aloc')
set T = CreateTrigger()
call TriggerRegisterTimerEvent(T,0.01,true)
call TriggerAddAction(T,function ChargeAction)
set B[1] = true
set B[2] = true
set B[3] = true
endfunction

endlibrary
#endif
