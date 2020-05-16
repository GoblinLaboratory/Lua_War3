#ifndef ReviveHerosystemIncluded
#define ReviveHerosystemIncluded
#include "9527/SJWE/SJWEBase.j"

library_once ReviveHerosystem requires SJWEBase

globals
    private boolean RHSB = false
    private trigger RHST
    private group   RHSG = CreateGroup()
endglobals

function ReviveHeroSystem_TimerFunc takes nothing returns nothing
    local timer t = GetExpiredTimer()
    local timerdialog td
    local unit whichhero = LoadUnitHandle(DATA, GetHandleId(t), StringHash("unit"))
    local real locX = LoadReal(DATA, GetHandleId(RHST), GetHandleId(whichhero) + StringHash("locX"))
    local real locY = LoadReal(DATA, GetHandleId(RHST), GetHandleId(whichhero) + StringHash("locY"))
    local boolean stdb = LoadBoolean(DATA, GetHandleId(RHST), GetHandleId(whichhero) + StringHash("STDB"))
    if (stdb == true) then
	    set td = LoadTimerDialogHandle(DATA, GetHandleId(t), StringHash("timerdialog"))
        call DestroyTimerDialog(td)
    endif
    call ReviveHero(whichhero, locX, locY, true)
    if (stdb == true) then
        if (GetLocalPlayer() == GetOwningPlayer(whichhero)) then
            call PanCameraToTimed(locX, locY, 0.0)
        endif
    endif
    call FlushChildHashtable(DATA, GetHandleId(t))
    call DestroyTimer(t)
    set t = null
    set td = null
    set whichhero = null
endfunction

function ReviveHeroSystem_Func takes nothing returns nothing
    local timer t
    local real timeout
    local timerdialog td
    local boolean stdb = LoadBoolean(DATA, GetHandleId(RHST), GetHandleId(GetTriggerUnit()) + StringHash("STDB"))
    local integer times = LoadInteger(DATA, GetHandleId(RHST), GetHandleId(GetTriggerUnit()) + StringHash("times"))
    if (times > 0) then
        set t = CreateTimer()
        if (stdb == true) then
            set td = CreateTimerDialog(t)
            call SaveTimerDialogHandle(DATA, GetHandleId(t), StringHash("timerdialog"), td)
            call TimerDialogSetTitle(td, (GetUnitName(GetTriggerUnit()) + "复活时间："))
	    endif
        set timeout = LoadReal(DATA, GetHandleId(RHST), GetHandleId(GetTriggerUnit()) + StringHash("timeout"))
        call SaveUnitHandle(DATA, GetHandleId(t), StringHash("unit"), GetTriggerUnit())
        call TimerStart(t, timeout, false, function ReviveHeroSystem_TimerFunc)
        if (stdb == true) then
            call TimerDialogDisplay(td, true)
        endif
        call SaveInteger(DATA, GetHandleId(RHST), GetHandleId(GetTriggerUnit()) + StringHash("times"), times - 1)
    elseif (times < 0) then
        set t = CreateTimer()
        if (stdb == true) then
            set td = CreateTimerDialog(t)
            call SaveTimerDialogHandle(DATA, GetHandleId(t), StringHash("timerdialog"), td)
            call TimerDialogSetTitle(td, (GetUnitName(GetTriggerUnit()) + "复活时间："))
	    endif
        set timeout = LoadReal(DATA, GetHandleId(RHST), GetHandleId(GetTriggerUnit()) + StringHash("timeout"))
        call SaveUnitHandle(DATA, GetHandleId(t), StringHash("unit"), GetTriggerUnit())
        call TimerStart(t, timeout, false, function ReviveHeroSystem_TimerFunc)
        if (stdb == true) then
            call TimerDialogDisplay(td, true)
        endif
    elseif (times == 0) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,60.0,("|cFFFFCC00"+GetUnitName(GetTriggerUnit())+"复活次数上限"+"|r"))
    endif
    set t = null
    set td = null
endfunction

function ReviveHeroSystem_Conditions takes nothing returns boolean
    return ((IsUnitInGroup(GetTriggerUnit(), RHSG) == true))
endfunction

function ReviveHeroSystem takes unit whichhero, location point, real timeout, integer times, boolean b returns nothing
    local integer index
    if (IsUnitInGroup(GetTriggerUnit(), RHSG) == false) then
        call GroupAddUnit(RHSG, whichhero)
    endif
    if (RHSB == false) then
	    set RHSB = true
	    set RHST = CreateTrigger()
        set index = 0
        loop
            call TriggerRegisterPlayerUnitEvent(RHST, Player(index), EVENT_PLAYER_UNIT_DEATH, null)
            set index = index + 1
            exitwhen index == 16
        endloop
        call TriggerAddCondition(RHST, Condition(function ReviveHeroSystem_Conditions))
        call TriggerAddAction(RHST, function ReviveHeroSystem_Func)
    endif
    if (RHST != null) then
        call SaveReal(DATA, GetHandleId(RHST), GetHandleId(whichhero) + StringHash("locX"), GetLocationX(point))
        call SaveReal(DATA, GetHandleId(RHST), GetHandleId(whichhero) + StringHash("locY"), GetLocationY(point))
        call SaveReal(DATA, GetHandleId(RHST), GetHandleId(whichhero) + StringHash("timeout"), timeout)
        call SaveInteger(DATA, GetHandleId(RHST), GetHandleId(whichhero) + StringHash("times"), times)
        call SaveBoolean(DATA, GetHandleId(RHST), GetHandleId(whichhero) + StringHash("STDB"), b)    // STDB = SetTimerDialogBoolean
	endif
endfunction



function Revive_Hero_Func takes nothing returns nothing
    local timer t = GetExpiredTimer()
    local timerdialog td = LoadTimerDialogHandle(DATA, GetHandleId(t), StringHash("timerdialog"))
    local unit whichhero = LoadUnitHandle(DATA, GetHandleId(t), StringHash("unit"))
    local real locX = LoadReal(DATA, GetHandleId(t), StringHash("locX"))
    local real locY = LoadReal(DATA, GetHandleId(t), StringHash("locY"))
    call DestroyTimerDialog(td)
    call ReviveHero(whichhero, locX, locY, true)
    if (GetLocalPlayer() == GetOwningPlayer(whichhero)) then
        call PanCameraToTimed(locX, locY, 0.0)
    endif
    call FlushChildHashtable(DATA, GetHandleId(t))
    call DestroyTimer(t)
    set t = null
    set td = null
    set whichhero = null
endfunction

function Revive_Hero takes unit whichhero, location point, real timeout returns nothing
    local timer t = CreateTimer()
    local timerdialog td = CreateTimerDialog(t)
    call SaveUnitHandle(DATA, GetHandleId(t), StringHash("unit"), whichhero)
    call SaveReal(DATA, GetHandleId(t), StringHash("locX"), GetLocationX(point))
    call SaveReal(DATA, GetHandleId(t), StringHash("locY"), GetLocationY(point))
    call SaveTimerDialogHandle(DATA, GetHandleId(t), StringHash("timerdialog"), td)
    call TimerDialogSetTitle(td, (GetUnitName(whichhero) + "复活时间："))
    call TimerStart(t, timeout, false, function Revive_Hero_Func)
    call TimerDialogDisplay(td, true)
    set t = null
    set td = null
endfunction

function ReviveHero_Simple_Func takes nothing returns nothing
    local timer t = GetExpiredTimer()
    local unit whichhero = LoadUnitHandle(DATA, GetHandleId(t), StringHash("unit"))
    local real locX = LoadReal(DATA, GetHandleId(t), StringHash("locX"))
    local real locY = LoadReal(DATA, GetHandleId(t), StringHash("locY"))
    call ReviveHero(whichhero, locX, locY, true)
    call FlushChildHashtable(DATA, GetHandleId(t))
    call DestroyTimer(t)
    set t = null
    set whichhero = null
endfunction

function ReviveHero_Simple takes unit whichhero, location point, real timeout returns nothing
    local timer t = CreateTimer()
    call SaveUnitHandle(DATA, GetHandleId(t), StringHash("unit"), whichhero)
    call SaveReal(DATA, GetHandleId(t), StringHash("locX"), GetLocationX(point))
    call SaveReal(DATA, GetHandleId(t), StringHash("locY"), GetLocationY(point))
    call TimerStart(t, timeout, false, function ReviveHero_Simple_Func)
    set t = null
endfunction

endlibrary

#endif
