#ifndef DefineEventIncluded
#define DefineEventIncluded
#include "9527/SJWE/SJWEBase.j"

library DefineEvent requires SJWEBase

private function key takes string s returns integer
	return key(s)
endfunction

private function ListEnd takes nothing returns integer
	return StringHash("ListEnd")
endfunction

private function LastIndex takes integer a returns integer
	return StringHash("LastIndex" + I2S(a))
endfunction

private function NextIndex takes integer a returns integer
	return StringHash("NextIndex" + I2S(a))
endfunction

private function TriggerList takes integer a returns integer
	return StringHash("TriggerList" + I2S(a))
endfunction

function GetListEnd takes string s returns integer
	return LoadInteger(DATA,key(s),ListEnd())
endfunction

function GetTriggerList takes string s, integer index returns trigger
	return LoadTriggerHandle(DATA,key(s),TriggerList(index))
endfunction

function TriggerRegisterEvent takes trigger t, string s returns nothing
	call SaveInteger(DATA,key(s),ListEnd(),LoadInteger(DATA,key(s),ListEnd()) + 1)
    call SaveInteger(DATA,key(s),NextIndex(LoadInteger(DATA,key(s),ListEnd()) - 1),LoadInteger(DATA,key(s),ListEnd()))
    call SaveInteger(DATA,key(s),LastIndex(LoadInteger(DATA,key(s),ListEnd())),LoadInteger(DATA,key(s),ListEnd()) - 1)
    call SaveTriggerHandle(DATA,key(s),TriggerList(LoadInteger(DATA,key(s),ListEnd())),t)
endfunction

function TriggerListExecute takes string s returns nothing
    local integer index = 0
    set index = LoadInteger(DATA,key(s),NextIndex(0))
    loop
        exitwhen (index == 0)
        exitwhen (index > LoadInteger(DATA,key(s),ListEnd()))
        if (IsTriggerEnabled(LoadTriggerHandle(DATA,key(s),TriggerList(index)))) and (TriggerEvaluate(LoadTriggerHandle(DATA,key(s),TriggerList(index)))) then
            call TriggerExecute(LoadTriggerHandle(DATA,key(s),TriggerList(index)))
        endif
        set index = LoadInteger(DATA,key(s),NextIndex(index))
    endloop
endfunction

function DestroyEvent takes trigger t，string s returns nothing
    local integer index = 0
    set index = LoadInteger(DATA,key(s),NextIndex(0))
    loop
        exitwhen (index == 0)
        exitwhen (LoadTriggerHandle(DATA,key(s),TriggerList(index)) == t)
        set index = LoadInteger(DATA,key(s),NextIndex(index)
    endloop
    if (index > 0) then
	    call SaveInteger(DATA,key(s),NextIndex(LoadInteger(DATA,key(s),LastIndex(index))),LoadInteger(DATA,key(s),NextIndex(index)))
        call SaveInteger(DATA,key(s),LastIndex(LoadInteger(DATA,key(s),NextIndex(index))),LoadInteger(DATA,key(s),LastIndex(index)))
    endif
endfunction

endlibrary

#endif
