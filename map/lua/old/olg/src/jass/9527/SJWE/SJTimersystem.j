#ifndef SJTimersystemIncluded
#define SJTimersystemIncluded
#include "9527/SJWE/SJWEBase.j"

library_once SJTimersystem requires SJWEBase

globals
	private timer             Timer = CreateTimer()
    private boolean           TimerRun = false
endglobals

function AddTrigger takes trigger T returns nothing
	local integer index = CreateIndex(GetHandleId(Timer))
    call SaveTriggerHandle(DATA,StringHash("TimerTriggerList"),index,T)
    call SaveInteger(DATA,StringHash("TriggerListIndex"),GetHandleId(T),index)
endfunction

function RemoveTrigger takes trigger T returns nothing
	local integer index = LoadInteger(DATA,StringHash("TriggerListIndex"),GetHandleId(T))
    call DestroyIndex(GetHandleId(Timer),index)
    call SaveTriggerHandle(DATA,StringHash("TimerTriggerList"),index,null)
endfunction

function RunTrigger takes nothing returns nothing
	local integer MaxIndex = GetMaxIndex(GetHandleId(Timer))
	local integer index = 0
	set TimerRun = true
	set index = 0
	loop
	    exitwhen index > MaxIndex
	    if (LoadTriggerHandle(DATA,StringHash("TimerTriggerList"),index) != null) then
		    if  TriggerEvaluate(LoadTriggerHandle(DATA,StringHash("TimerTriggerList"),index)) then
	            call TriggerExecute(LoadTriggerHandle(DATA,StringHash("TimerTriggerList"),index))
            endif
	    endif
	    set index = index + 1
	endloop
endfunction

function TimerRunTrigger takes nothing returns nothing
	if (TimerRun == false) then
		call TimerStart(Timer,0.01,true, function RunTrigger)
    endif
endfunction

function Pause takes nothing returns nothing
    call PauseTimer(Timer)
    set TimerRun = false
endfunction

function TimerRunBoolean takes nothing returns boolean
	return TimerRun
endfunction

endlibrary

#endif
