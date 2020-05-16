#ifndef XGDoubleClickEventIncluded
#define XGDoubleClickEventIncluded


library XGDoubleClickEvent initializer Init

globals
#ifndef XGHtbIncluded
#define XGHtbIncluded
	hashtable Xg_htb = InitHashtable()
#endif
	private trigger array Trigger
	private integer Num=0
	private integer array Unit
	private timer array Timer
endglobals


private function Timer_Cancel takes nothing returns nothing
    local timer t=GetExpiredTimer()
    local integer key=GetHandleId(t)
	local integer i=LoadInteger(Xg_htb,key,0)
	set Unit[i]=0
	call FlushChildHashtable(Xg_htb,key)
	call DestroyTimer(t)
    set t=null
endfunction

function XG_DoubleClick_Reg takes trigger trg returns nothing
	set Num=Num+1
	set Trigger[Num]=trg
endfunction
private function Action takes nothing returns nothing
	local unit u=GetTriggerUnit()
	local player p=GetTriggerPlayer()
	local integer i=GetPlayerId(p)
	if Unit[i]>0 and Unit[i]==GetHandleId(u) then
		set Unit[i]=-1
		set i=1
		loop
			exitwhen i>Num
			if IsTriggerEnabled(Trigger[i]) then
				if TriggerEvaluate(Trigger[i]) then
					call TriggerExecute(Trigger[i])
				endif
			endif
			set i=i+1
		endloop
	else
		if Unit[i]==0 then
			set Timer[i]=CreateTimer()
		else
			call PauseTimer(Timer[i])
		endif
		set Unit[i]=GetHandleId(u)
		call SaveInteger(Xg_htb,GetHandleId(Timer[i]),0,i)
		call TimerStart(Timer[i],0.25,false,function Timer_Cancel)
	endif
endfunction
private function Init takes nothing returns nothing
	local integer i=0
	set Trigger[0]=CreateTrigger()
	loop
		set Unit[i]=0
		set Timer[i]=null
		call TriggerRegisterPlayerUnitEvent(Trigger[0], Player(i), EVENT_PLAYER_UNIT_SELECTED, null)
		set i=i+1
		exitwhen i==15
	endloop
	call TriggerAddAction(Trigger[0],function Action)
endfunction
endlibrary
#endif
