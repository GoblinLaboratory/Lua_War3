#ifndef DoubleClickEventIncluded
#define DoubleClickEventIncluded
#include "9527/SJWE/SJWEBase.j"

library DoubleClickEvent initializer Init requires SJWEBase

globals
	private trigger           Trigger
	private integer array     Unit
	private timer array       Timer
	private integer           ListEnd = 0
	private integer array     LastIndex
	private integer array     NextIndex
	private trigger array     TriggerList
endglobals


private function Timer_Cancel takes nothing returns nothing
    local timer t = GetExpiredTimer()
    local integer key = GetHandleId(t)
	local integer i = LoadInteger(DATA,key,0)
	set Unit[i] = 0
	call FlushChildHashtable(DATA,key)
	call DestroyTimer(t)
    set t = null
endfunction

function TriggerRegisterDoubleClickEvent takes trigger trg returns nothing
    set ListEnd = ListEnd + 1
    set NextIndex[ListEnd - 1] = ListEnd
    set LastIndex[ListEnd] = ListEnd - 1
    set TriggerList[ListEnd] = trg
endfunction

function DestroyDoubleClickEvent takes trigger trg returns nothing
    local integer index = 0
    set index = NextIndex[0]
    loop
        exitwhen (index == 0)
        exitwhen (TriggerList[index] == trg)
        set index = NextIndex[index]
    endloop
    if (index > 0) then
        set NextIndex[LastIndex[index]] = NextIndex[index]
        set LastIndex[NextIndex[index]] = LastIndex[index]
    endif
endfunction

private function DoubleClickAction takes nothing returns nothing
	local unit u = GetTriggerUnit()
	local player p = GetTriggerPlayer()
	local integer i = GetPlayerId(p)
    local integer index = 0
	if Unit[i]>0 and Unit[i]==GetHandleId(u) then
		set Unit[i]=-1
		set index = NextIndex[0]
		loop
            exitwhen (index == 0)
            exitwhen (index > ListEnd)
			if (IsTriggerEnabled(TriggerList[index]) and TriggerEvaluate(TriggerList[index])) then
				call TriggerExecute(TriggerList[index])
			endif
			set index = NextIndex[index]
		endloop
	else
		if (Unit[i]==0) then
			set Timer[i] = CreateTimer()
		else
			call PauseTimer(Timer[i])
		endif
		set Unit[i] = GetHandleId(u)
		call SaveInteger(DATA,GetHandleId(Timer[i]),0,i)
		call TimerStart(Timer[i],0.2,false,function Timer_Cancel)
	endif
endfunction

private function Init takes nothing returns nothing
	local integer i = 0
	set Trigger = CreateTrigger()
	loop
		set Unit[i] = 0
		set Timer[i] = null
		call TriggerRegisterPlayerUnitEvent(Trigger, Player(i), EVENT_PLAYER_UNIT_SELECTED, null)
		set i = i + 1
		exitwhen i == 15
	endloop
	call TriggerAddAction(Trigger,function DoubleClickAction)
endfunction

endlibrary

#endif
