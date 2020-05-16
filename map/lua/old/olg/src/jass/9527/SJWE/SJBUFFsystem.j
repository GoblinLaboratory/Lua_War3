#ifndef SJBUFFsystemIncluded
#define SJBUFFsystemIncluded
#include "9527/SJWE/SJTimersystem.j"
#include "9527/SJWE/UnitAlive.j"

library_once SJBUFFsystem requires SJTimersystem,UnitAlive

globals
	private hashtable         BFHT = InitHashtable()
	private real              MaxBuffTime = 360.0
	private integer           MaxBuffStories = 10
	
    private integer           BHEListEnd = 0
    private integer array     BHELastIndex
    private integer array     BHENextIndex
    private trigger array     BHETriggerList

    private integer           BDEListEnd = 0
    private integer array     BDELastIndex
    private integer array     BDENextIndex
    private trigger array     BDETriggerList

    private integer           BuffListEnd = 0
    private integer array     BuffLastIndex
    private integer array     BuffNextIndex
    private integer array     BuffList

    private integer           UnitListEnd = 0
    private integer array     UnitLastIndex
    private integer array     UnitNextIndex
    private unit array        UnitList

    private trigger           BuffCheck
    private boolean           HeroBool = true
endglobals

//====================================注册buff获得/失去事件========================================
function TriggerRegisterAnyUnitBuffEvent takes trigger t, integer tp returns nothing
	if (tp == 0) then
        set BHEListEnd = BHEListEnd + 1
        set BHENextIndex[BHEListEnd - 1] = BHEListEnd
        set BHELastIndex[BHEListEnd] = BHEListEnd - 1
        set BHETriggerList[BHEListEnd] = t
    elseif (tp == 1) then
        set BDEListEnd = BDEListEnd + 1
        set BDENextIndex[BDEListEnd - 1] = BDEListEnd
        set BDELastIndex[BDEListEnd] = BDEListEnd - 1
        set BDETriggerList[BDEListEnd] = t
    endif
endfunction

function TriggerRegisterAnyUnitBuffEvent0 takes trigger t, integer tp returns nothing
    call TriggerRegisterAnyUnitBuffEvent(t,tp)
endfunction

//======================================响应buff获得/失去事件=======================================
function UnitBuffEventTriggerListExecute takes unit BuffUnit, integer Buffid, integer tp returns nothing
    local integer index
    if (tp == 0) then
        set index = BHENextIndex[0]
        loop
            exitwhen (index == 0)
            exitwhen (index > BHEListEnd)
            if (IsTriggerEnabled(BHETriggerList[index])) and (TriggerEvaluate(BHETriggerList[index])) then
                call SaveUnitHandle(BFHT,GetHandleId(BHETriggerList[index]),StringHash("BuffUnit"),BuffUnit)
                call SaveInteger(BFHT,GetHandleId(BHETriggerList[index]),StringHash("Buff"),Buffid)
                call TriggerExecute(BHETriggerList[index])
            endif
            set index = BHENextIndex[index]
        endloop
    elseif (tp == 1) then
        set index = BDENextIndex[0]
        loop
            exitwhen (index == 0)
            exitwhen (index > BDEListEnd)
            if (IsTriggerEnabled(BDETriggerList[index])) and (TriggerEvaluate(BDETriggerList[index])) then
                call SaveUnitHandle(BFHT,GetHandleId(BDETriggerList[index]),StringHash("BuffUnit"),BuffUnit)
                call SaveInteger(BFHT,GetHandleId(BDETriggerList[index]),StringHash("Buff"),Buffid)
                call TriggerExecute(BDETriggerList[index])
            endif
            set index = BDENextIndex[index]
        endloop
    endif
endfunction

//==============================获得触发事件的单位============================================
function GetBuffEventUnit takes nothing returns unit
	return LoadUnitHandle(BFHT,GetHandleId(GetTriggeringTrigger()),StringHash("BuffUnit"))
endfunction

//===============================获得触发事件的buff===========================================
function GetBuffEventBuff takes nothing returns integer
	return LoadInteger(BFHT,GetHandleId(GetTriggeringTrigger()),StringHash("Buff"))
endfunction

//===============================注销buff获得/失去事件========================================
function DestroyAnyUnitBuffEvent takes trigger t, integer tp returns nothing
    local integer index
    if (tp == 0) then
        set index = BHENextIndex[0]
        loop
            exitwhen (index == 0)
            exitwhen (BHETriggerList[index] == t)
            set index = BHENextIndex[index]
        endloop
        call FlushChildHashtable(BFHT,GetHandleId(t))
        if (index > 0) then
            set BHENextIndex[BHELastIndex[index]] = BHENextIndex[index]
            set BHELastIndex[BHENextIndex[index]] = BHELastIndex[index]
        endif
    elseif (tp == 1) then
        set index = BDENextIndex[0]
        loop
            exitwhen (index == 0)
            exitwhen (BDETriggerList[index] == t)
            set index = BDENextIndex[index]
        endloop
        call FlushChildHashtable(BFHT,GetHandleId(t))
        if (index > 0) then
            set BDENextIndex[BDELastIndex[index]] = BDENextIndex[index]
            set BDELastIndex[BDENextIndex[index]] = BDELastIndex[index]
        endif
    endif
endfunction

//=====================检测buff单位列表添加要检测的单位===========================
function AddCheckUnit takes unit whichunit returns nothing
    set UnitListEnd = UnitListEnd + 1
    set UnitNextIndex[UnitListEnd - 1] = UnitListEnd
    set UnitLastIndex[UnitListEnd] = UnitListEnd - 1
    set UnitList[UnitListEnd] = whichunit
    call SaveBoolean(BFHT,GetHandleId(whichunit),StringHash("UnitInCheckBuffList"),true)
endfunction

//=====================检测buff单位列表移除要检测的单位===========================
function DestroyCheckUnit takes unit whichunit returns nothing
	local integer index
    set index = UnitNextIndex[0]
    loop
        exitwhen (index == 0)
        exitwhen (UnitList[index] == whichunit)
        set index = UnitNextIndex[index]
    endloop
    if (index > 0) then
        set UnitNextIndex[UnitLastIndex[index]] = UnitNextIndex[index]
        set UnitLastIndex[UnitNextIndex[index]] = UnitLastIndex[index]
    endif
    call SaveBoolean(BFHT,GetHandleId(whichunit),StringHash("UnitInCheckBuffList"),false)
endfunction

//=====================检测buff列表添加要检测的buff===========================
function AddCheckBuff takes integer buffid, boolean b, integer BuffAbilityID returns nothing
    set BuffListEnd = BuffListEnd + 1
    set BuffNextIndex[BuffListEnd - 1] = BuffListEnd
    set BuffLastIndex[BuffListEnd] = BuffListEnd - 1
    set BuffList[BuffListEnd] = buffid
    call SaveBoolean(BFHT,buffid,14,true)
    call SaveBoolean(BFHT,buffid,9,b)
    if (b == true) then
        call SaveInteger(BFHT,buffid,StringHash("BuffRelationAbility"),BuffAbilityID)
    endif
endfunction

//=====================检测buff列表移除要检测的buff===========================
function DestroyCheckBuff takes integer buffid returns nothing
	local integer index
    set index = BuffNextIndex[0]
    loop
        exitwhen (index == 0)
        exitwhen (BuffList[index] == buffid)
        set index = BuffNextIndex[index]
    endloop
    if (index > 0) then
        set BuffNextIndex[BuffLastIndex[index]] = BuffNextIndex[index]
        set BuffLastIndex[BuffNextIndex[index]] = BuffLastIndex[index]
    endif
    call FlushChildHashtable(BFHT,buffid)
endfunction

//=============================================BUFF系统函数及数据=============================================================================================

//* 1 == BUFF当前已持续时间
//* 2 == BUFF持续时间
//* 3 == 最近一次BUFF持续时间
//* 4 == BUFF抗性
//* 5 == BUFF层数
//* 6 == BUFF层数上限
//* 7 == BUFF刷新模式
//* 8 == BUFF刷新增加持续时间
//* 9 == BUFF是模拟BUFF
//* 10 == BUFF是正面BUFF
//* 11 == BUFF是不可净化的
//* 12 == BUFF层数达到上限继续刷新BUFF
//* 13 == 模拟BUFF的来源
//* 14 == BUFF在检测列表中
//* 15 == 单位在检测列表中

function SetBuffRealData takes integer whichbuff, integer TypeID, real value returns nothing
	call SaveReal(BFHT,whichbuff,TypeID,value)
endfunction

function GetBuffRealData takes integer whichbuff, integer TypeID returns real
	return LoadReal(BFHT,whichbuff,TypeID)
endfunction

function SetBuffStoriesMax takes integer whichbuff, integer value returns nothing
	call SaveInteger(BFHT,whichbuff,6,value)
endfunction

function GetBuffStoriesMax takes integer whichbuff returns integer
	return LoadInteger(BFHT,whichbuff,6)
endfunction

function SetBuffBooleanData takes integer whichbuff, integer TypeID, boolean value returns nothing
	call SaveBoolean(BFHT,whichbuff,TypeID,value)
endfunction

function GetBuffBooleanData takes integer whichbuff, integer TypeID returns boolean
	return LoadBoolean(BFHT,whichbuff,TypeID)
endfunction

function GetUnitBuffSource takes unit whichunit, integer whichbuff returns unit
	return LoadUnitHandle(BFHT,GetHandleId(whichunit),StringHash(I2S(13)+I2S(whichbuff)))
endfunction

function UnitInCheckBuffList takes unit whichunit returns boolean
	return LoadBoolean(BFHT,GetHandleId(whichunit),StringHash("UnitInCheckBuffList"))
endfunction

//============================================================================================================================

function SetUnitBuffAttribute takes unit whichunit, integer whichbuff, integer TypeID, real value returns nothing
	call SaveReal(BFHT,GetHandleId(whichunit),StringHash(I2S(TypeID)+I2S(whichbuff)),value)
endfunction

function GetUnitBuffAttribute takes unit whichunit, integer whichbuff, integer TypeID returns real
	return LoadReal(BFHT,GetHandleId(whichunit),StringHash(I2S(TypeID)+I2S(whichbuff)))
endfunction

function SetUnitBuffStories takes unit whichunit, integer whichbuff, integer value returns nothing
	call SaveInteger(BFHT,GetHandleId(whichunit),StringHash(I2S(5)+I2S(whichbuff)),value)
endfunction

function GetUnitBuffStories takes unit whichunit, integer whichbuff returns integer
	return LoadInteger(BFHT,GetHandleId(whichunit),StringHash(I2S(5)+I2S(whichbuff)))
endfunction

function SetUnitBuffStoriesMax takes unit whichunit, integer whichbuff, integer value returns nothing
	call SaveInteger(BFHT,GetHandleId(whichunit),StringHash(I2S(6)+I2S(whichbuff)),value)
endfunction

function GetUnitBuffStoriesMax takes unit whichunit, integer whichbuff returns integer
	return LoadInteger(BFHT,GetHandleId(whichunit),StringHash(I2S(6)+I2S(whichbuff)))
endfunction

function SetUnitBuffBooleanData takes unit whichunit, integer whichbuff, integer TypeID, boolean value returns nothing
	call SaveBoolean(BFHT,GetHandleId(whichunit),StringHash(I2S(TypeID)+I2S(whichbuff)),value)
endfunction

function GetUnitBuffBooleanData takes unit whichunit, integer whichbuff, integer TypeID returns boolean
	return LoadBoolean(BFHT,GetHandleId(whichunit),StringHash(I2S(TypeID)+I2S(whichbuff)))
endfunction

function SetMaxBuffTime takes real a returns nothing
	set MaxBuffTime = a
    if MaxBuffTime <= 0.0 then
        set MaxBuffTime = 0.0
    endif
endfunction

function SetMaxBuffStories takes integer a returns nothing
	set MaxBuffStories = a
    if MaxBuffStories <= 0 then
        set MaxBuffStories = 0
    endif
endfunction

function AddBuff takes unit whichunit, integer whichbuff returns nothing
	local integer i = 0
	local integer n = 0
	local boolean b0 = false
	local boolean b1 = false
	local boolean bx = GetBuffBooleanData(whichbuff,12)
	local boolean b = LoadBoolean(BFHT,GetHandleId(whichunit),StringHash(I2S(7)+I2S(whichbuff)))
	local real resistance = LoadReal(BFHT,GetHandleId(whichunit),StringHash(I2S(4)+I2S(whichbuff)))
	local integer a1 = LoadInteger(BFHT,GetHandleId(whichunit),StringHash(I2S(5)+I2S(whichbuff)))
	local integer a2 = LoadInteger(BFHT,GetHandleId(whichunit),StringHash(I2S(6)+I2S(whichbuff)))
	local integer BuffAbilityID = LoadInteger(BFHT,whichbuff,StringHash("BuffRelationAbility"))
	if (LoadBoolean(BFHT,whichbuff,9) == true) and (UnitInCheckBuffList(whichunit) == true) and (GetBuffBooleanData(whichbuff,14) == true) then 
		set i = 0
		loop
		    exitwhen i > GetMaxIndex(GetHandleId(whichunit))
		    if (BuffAbilityID == LoadInteger(BFHT,GetHandleId(whichunit),StringHash("BuffList"+I2S(i)))) then
			    set b1 = true
		    endif
		    set i = i + 1
		endloop
		if (b1 == false) then
			set n = CreateIndex(GetHandleId(whichunit))
			call SaveInteger(BFHT,GetHandleId(whichunit),StringHash("BuffList"+I2S(n)),BuffAbilityID) 
			call SaveInteger(BFHT,GetHandleId(whichunit),StringHash("BuffListIndex"),n) 
	    endif
		if (Probability(resistance*100.0) == false) then
			if (GetUnitAbilityLevel(whichunit,BuffAbilityID) == 0) then
	            call UnitAddAbility(whichunit,BuffAbilityID)
	            call UnitMakeAbilityPermanent(whichunit,true,BuffAbilityID)
	            call SaveInteger(BFHT,GetHandleId(whichunit),StringHash(I2S(5)+I2S(whichbuff)),LoadInteger(BFHT,GetHandleId(whichunit),StringHash(I2S(5)+I2S(whichbuff)))+1)
	        elseif (GetUnitAbilityLevel(whichunit,BuffAbilityID) > 0) then
	            if (a1 < a2) then
		            call SaveInteger(BFHT,GetHandleId(whichunit),StringHash(I2S(5)+I2S(whichbuff)),LoadInteger(BFHT,GetHandleId(whichunit),StringHash(I2S(5)+I2S(whichbuff)))+1)
		            call SetUnitAbilityLevel(whichunit,BuffAbilityID,LoadInteger(BFHT,GetHandleId(whichunit),StringHash(I2S(5)+I2S(whichbuff))))
	            endif
	            call UnitBuffEventTriggerListExecute(whichunit,whichbuff,0)
	        endif
	        if (b == false) then
		        if (bx == false) and (a1 < a2) then
			        call SaveReal(BFHT,GetHandleId(whichunit),StringHash(I2S(1)+I2S(whichbuff)),0.0)
	                call SaveReal(BFHT,GetHandleId(whichunit),StringHash(I2S(8)+I2S(whichbuff)),0.0)
		        elseif (bx == true) then
		        	call SaveReal(BFHT,GetHandleId(whichunit),StringHash(I2S(1)+I2S(whichbuff)),0.0)
	                call SaveReal(BFHT,GetHandleId(whichunit),StringHash(I2S(8)+I2S(whichbuff)),0.0)
		        endif
	        elseif (b == true) then
	            if (bx == false) and (a1 < a2) then
		            if (a1 != 1) then
			            call SaveReal(BFHT,GetHandleId(whichunit),StringHash("增加时间"+I2S(whichbuff)),LoadReal(BFHT,GetHandleId(whichunit),StringHash(I2S(8)+I2S(whichbuff))) + LoadReal(BFHT,GetHandleId(whichunit),StringHash("增加时间"+I2S(whichbuff))))
		            endif
	            elseif (bx == true) then
	                call SaveReal(BFHT,GetHandleId(whichunit),StringHash("增加时间"+I2S(whichbuff)),LoadReal(BFHT,GetHandleId(whichunit),StringHash(I2S(8)+I2S(whichbuff))) + LoadReal(BFHT,GetHandleId(whichunit),StringHash("增加时间"+I2S(whichbuff))))
	            endif
	        endif
	    else
	        call DisplayDamage(whichunit,"抵抗",20.0,10.0,170,244,255,0.0)
	    endif
    endif
endfunction

function AddBuffSystem takes unit BuffSource, unit whichunit, integer whichbuff returns nothing
    call AddBuff(whichunit,whichbuff)
    call SaveUnitHandle(BFHT,GetHandleId(whichunit),StringHash(I2S(13)+I2S(whichbuff)),BuffSource)
endfunction

function RangeAddBuffSystem takes unit BuffSource, real x, real y, real Range, boolean b, integer whichbuff returns nothing
    local group Tempgroup
    local unit Tempunit
    set Tempgroup = CreateGroup()
    call GroupEnumUnitsInRange(Tempgroup, x, y, Range, null)
    loop
        set Tempunit = FirstOfGroup(Tempgroup)
        exitwhen Tempunit == null
        call GroupRemoveUnit(Tempgroup, Tempunit)
        if (UnitAlive(Tempunit) == true) then
	        if (b == false) and (IsUnitEnemy(Tempunit, GetOwningPlayer(BuffSource)) == true) then                  //敌方
	            call AddBuffSystem(BuffSource,Tempunit,whichbuff)
	        elseif (b == true) and (IsUnitAlly(Tempunit, GetOwningPlayer(BuffSource)) == true) then                //友方
	            call AddBuffSystem(BuffSource,Tempunit,whichbuff)
	        endif
        endif
    endloop
    call DestroyGroup(Tempgroup)
    set Tempgroup = null
    set Tempunit = null
endfunction

function RemoveBuff takes unit whichunit, integer whichbuff returns nothing
    local integer i = 0
	local integer BuffAbilityID = LoadInteger(BFHT,whichbuff,StringHash("BuffRelationAbility"))
	if (UnitInCheckBuffList(whichunit) == true) and (GetBuffBooleanData(whichbuff,14) == true) then 
	    call UnitRemoveAbility(whichunit,BuffAbilityID)
	    set i = 0
		loop
		    exitwhen i > GetMaxIndex(GetHandleId(whichunit))
		    if (BuffAbilityID == LoadInteger(BFHT,GetHandleId(whichunit),StringHash("BuffList"+I2S(i)))) then
			    call DestroyIndex(GetHandleId(whichunit),i)
			    call SaveInteger(BFHT,GetHandleId(whichunit),StringHash("BuffList"+I2S(i)),0)
		    endif
		    set i = i + 1
		endloop
	endif
endfunction

function RemoveBuffSystem takes unit whichunit, integer whichbuff returns nothing
    if (GetBuffBooleanData(whichbuff,11) == false) then
        call RemoveBuff(whichunit,whichbuff)
    endif
endfunction

function RangeRemoveBuffSystem takes real x, real y, real Range, integer whichbuff, integer b returns nothing
    local group Tempgroup
    local unit Tempunit
    set Tempgroup = CreateGroup()
    call GroupEnumUnitsInRange(Tempgroup, x, y, Range, null)
    loop
        set Tempunit = FirstOfGroup(Tempgroup)
        exitwhen Tempunit == null
        call GroupRemoveUnit(Tempgroup, Tempunit)
        if (UnitAlive(Tempunit) == true) then
	        if (b == 1) and (GetBuffBooleanData(whichbuff,10) == false) then
	            call RemoveBuffSystem(Tempunit,whichbuff)
	        elseif (b == 2) and (GetBuffBooleanData(whichbuff,10) == true) then
	            call RemoveBuffSystem(Tempunit,whichbuff)
	        elseif (b == 0) then
	            call RemoveBuffSystem(Tempunit,whichbuff)
	        endif
        endif
    endloop
    call DestroyGroup(Tempgroup)
    set Tempgroup = null
    set Tempunit = null
endfunction

function UnitDeathFlushHashtableTimerActions takes nothing returns nothing
	call DestroyCheckUnit(LoadUnitHandle(DATA,GetHandleId(GetExpiredTimer()),StringHash("Unit")))
    call FlushChildHashtable(BFHT,GetHandleId(LoadUnitHandle(DATA,GetHandleId(GetExpiredTimer()),StringHash("Unit"))))
    call FlushChildHashtable(DATA,GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction

function UnitDeathFlushHashtableActions takes nothing returns nothing
	local timer tm = CreateTimer()
	local integer i = 0
    set i = 0
	loop
	    exitwhen i > GetMaxIndex(GetHandleId(GetTriggerUnit()))
        call RemoveBuff(GetTriggerUnit(),LoadInteger(BFHT,GetHandleId(GetTriggerUnit()),StringHash("BuffList"+I2S(i))))
	    set i = i + 1
	endloop		
    call SaveUnitHandle(DATA,GetHandleId(tm),StringHash("Unit"),GetTriggerUnit())
    call TimerStart(tm,0.02,false, function UnitDeathFlushHashtableTimerActions)
    set tm = null
endfunction

//==============================单位死亡移除出检测队列以及清除缓存数据==============================
function UnitDeathFlushHashtable takes nothing returns nothing
    local trigger t
    set t = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( t, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddAction(t, function UnitDeathFlushHashtableActions)
    set t = null
endfunction

function RecordingBuffTime takes nothing returns nothing
	local trigger tr = GetTriggeringTrigger()
	local unit whichunit = LoadUnitHandle(BFHT,GetHandleId(tr),StringHash("BuffUnitTemp"))
	local integer whichbuff = LoadInteger(BFHT,GetHandleId(tr),StringHash("BuffTemp"))
	local real t1 = 0.0
	local real t2 = 0.0
	call SaveReal(BFHT,GetHandleId(whichunit),StringHash(I2S(1)+I2S(whichbuff)),LoadReal(BFHT,GetHandleId(whichunit),StringHash(I2S(1)+I2S(whichbuff)))+0.010)
	set t1 = GetUnitBuffAttribute(whichunit,whichbuff,1)
	if (GetUnitBuffStories(whichunit,whichbuff) == 1) then
		set t2 = GetUnitBuffAttribute(whichunit,whichbuff,2)
	else 
	    set t2 = GetUnitBuffAttribute(whichunit,whichbuff,2) + LoadReal(BFHT,GetHandleId(whichunit),StringHash("增加时间"+I2S(whichbuff)))
	endif
//	call BJDebugMsg(R2S(t2))
//	call BJDebugMsg(R2S(t1))
	if (t1 > 0.0) and (t2 > 0.0) and ((t1 - t2) >= 0.0) then
		call SaveReal(BFHT,GetHandleId(whichunit),StringHash("增加时间"+I2S(whichbuff)),0.0)
		call UnitRemoveAbility(whichunit,LoadInteger(BFHT,whichbuff,StringHash("BuffRelationAbility")))
        call UnitRemoveAbility(whichunit,whichbuff)
	endif
	set tr = null
endfunction

//=======================================检测buff并响应buff事件====================================
function CheckBuffSystem takes nothing returns nothing
	local integer i = 0
	local integer n = 0
    local integer buff1 = 0
    local integer buff2 = 0
    local trigger tr = null
    set n = 1
    loop
    	exitwhen n > UnitListEnd
    	set i = 1
    	loop
    		exitwhen i > BuffListEnd
    	    call SaveInteger(BFHT,GetHandleId(UnitList[n]),StringHash(I2S(i)+"Before"),LoadInteger(BFHT,GetHandleId(UnitList[n]),StringHash(I2S(i)+"Now")))
    	    call SaveInteger(BFHT,GetHandleId(UnitList[n]),StringHash(I2S(i)+"Now"),GetUnitAbilityLevel(UnitList[n],BuffList[i]))
    	    set buff1 = LoadInteger(BFHT,GetHandleId(UnitList[n]),StringHash(I2S(i)+"Before"))
    	    set buff2 = LoadInteger(BFHT,GetHandleId(UnitList[n]),StringHash(I2S(i)+"Now"))
    	    if (buff1 == 0) and (buff2 > 0) then
                call UnitBuffEventTriggerListExecute(UnitList[n],BuffList[i],0)  //响应获得buff事件
                set tr = CreateTrigger()
                call SaveTriggerHandle(BFHT,GetHandleId(UnitList[n]),StringHash("Trigger"+I2S(BuffList[i])),tr)
                call SaveUnitHandle(BFHT,GetHandleId(tr),StringHash("BuffUnitTemp"),UnitList[n])
                call SaveInteger(BFHT,GetHandleId(tr),StringHash("BuffTemp"),BuffList[i])
                call TriggerAddAction(tr,function RecordingBuffTime)
                call AddTrigger(tr)
                set tr = null
            endif
            if (buff1 > 0) and (buff2 == 0) then
                call UnitBuffEventTriggerListExecute(UnitList[n],BuffList[i],1)  //响应失去buff事件
                call SaveReal(BFHT,GetHandleId(UnitList[n]),StringHash(I2S(3)+I2S(BuffList[i])),GetUnitBuffAttribute(UnitList[n],BuffList[i],1))
                call SaveReal(BFHT,GetHandleId(UnitList[n]),StringHash(I2S(1)+I2S(BuffList[i])),0.0)
                call SaveInteger(BFHT,GetHandleId(UnitList[n]),StringHash(I2S(5)+I2S(BuffList[i])),0)
                call RemoveTrigger(LoadTriggerHandle(BFHT,GetHandleId(UnitList[n]),StringHash("Trigger"+I2S(BuffList[i]))))              
                call FlushChildHashtable(BFHT,GetHandleId(LoadTriggerHandle(BFHT,GetHandleId(UnitList[n]),StringHash("Trigger"+I2S(BuffList[i])))))
                call DestroyTrigger(LoadTriggerHandle(BFHT,GetHandleId(UnitList[n]),StringHash("Trigger"+I2S(BuffList[i]))))
                call SaveTriggerHandle(BFHT,GetHandleId(UnitList[n]),StringHash("Trigger"+I2S(BuffList[i])),null)
            endif
    		set i = i + 1
    	endloop
    	set n = n + 1
    endloop
endfunction

function SetBuffData takes integer whichbuff, real timeout, integer c, boolean b0, boolean b1, boolean b2, boolean b3, real timerush returns nothing
    call SetBuffRealData(whichbuff,2,timeout)
    call SetBuffStoriesMax(whichbuff,c)
    call SetBuffBooleanData(whichbuff,12,b0)
    call SetBuffBooleanData(whichbuff,10,b1)
    call SetBuffBooleanData(whichbuff,11,b2)
    call SetBuffBooleanData(whichbuff,7,b3)
    call SetBuffRealData(whichbuff,8,timerush)
endfunction

//=====================Buff事件系统初始化====================================

function AnyUnitEnterRegionAddBuffDataAction takes nothing returns nothing
	local integer index = 0
    set index = 1
    loop
        exitwhen index > BuffListEnd
        if (GetBuffRealData(BuffList[index],2) == 0) then
	        call SaveReal(BFHT,GetHandleId(GetEnterUnit()),StringHash(I2S(2)+I2S(BuffList[index])),MaxBuffTime)
        else
            call SaveReal(BFHT,GetHandleId(GetEnterUnit()),StringHash(I2S(2)+I2S(BuffList[index])),GetBuffRealData(BuffList[index],2))
        endif
        if (GetBuffStoriesMax(BuffList[index]) == 0) then
	        call SaveInteger(BFHT,GetHandleId(GetEnterUnit()),StringHash(I2S(6)+I2S(BuffList[index])),MaxBuffStories)
        else
            call SaveInteger(BFHT,GetHandleId(GetEnterUnit()),StringHash(I2S(6)+I2S(BuffList[index])),GetBuffStoriesMax(BuffList[index]))
        endif
        call SetUnitBuffBooleanData(GetEnterUnit(),BuffList[index],7,GetBuffBooleanData(BuffList[index],7))
        call SetUnitBuffAttribute(GetEnterUnit(),BuffList[index],8,GetBuffRealData(BuffList[index],8))
        call SetUnitBuffBooleanData(GetEnterUnit(),BuffList[index],10,GetBuffBooleanData(BuffList[index],10))
        call SetUnitBuffBooleanData(GetEnterUnit(),BuffList[index],11,GetBuffBooleanData(BuffList[index],11))
        call SetUnitBuffBooleanData(GetEnterUnit(),BuffList[index],12,GetBuffBooleanData(BuffList[index],12))
        set index = index + 1
    endloop
endfunction

function AnyUnitEnterSJBuffSystemInitialization takes nothing returns nothing
    local trigger tr = CreateTrigger()
    call TriggerRegisterAnyUnitEnterEvent(tr)
    call TriggerAddAction(tr,function AnyUnitEnterRegionAddBuffDataAction)
    set tr = null
endfunction

//======================单位Buff检测列表添加单位=============================

function CheckBuffUnitAction takes nothing returns nothing
	if ((GetUnitAbilityLevel(GetEnterUnit(), 'Aloc') == 0) and ( (HeroBool == false) or (IsUnitType(GetEnterUnit(), UNIT_TYPE_HERO) == true) )) then
	    call AddCheckUnit(GetEnterUnit())
    endif
endfunction

function CheckBuffUnit takes nothing returns nothing
    local trigger tr = CreateTrigger()
    call TriggerRegisterAnyUnitEnterEvent(tr)
    call TriggerAddAction(tr,function CheckBuffUnitAction)
    set tr = null
endfunction

private function Trig_BuffDamageSystemActions takes nothing returns nothing
	local timer tm = LoadTimerHandle(DATA,StringHash(I2S(GetHandleId(GetBuffEventUnit())) + "Timer"),GetBuffEventBuff())
    if (tm != null) then
        call PauseTimer(tm)
        call FlushChildHashtable(DATA,GetHandleId(tm))
        call FlushChildHashtable(DATA,StringHash(I2S(GetHandleId(GetBuffEventUnit())) + "Timer"))
        call DestroyTimer(tm)
    endif
    set tm = null
endfunction

//===========================================================================
private function InitTrig takes nothing returns nothing
    local trigger tr = CreateTrigger()
    call TriggerRegisterAnyUnitBuffEvent(tr,1)
    call TriggerAddAction(tr, function Trig_BuffDamageSystemActions)
    set tr = null
endfunction

function SJBuffSystemInitialization takes boolean b, boolean hb returns nothing
	call AnyUnitEnterSJBuffSystemInitialization()
	set BuffCheck = CreateTrigger()
	call TriggerAddAction(BuffCheck,function CheckBuffSystem)
	call AddTrigger(BuffCheck)
	call UnitDeathFlushHashtable()
	if (b == true) then
	    call CheckBuffUnit()
	    set HeroBool = hb
    endif
    call TimerRunTrigger()
    call InitTrig()
endfunction

endlibrary

#endif