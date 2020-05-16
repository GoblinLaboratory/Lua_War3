function Trig____________________004Actions takes nothing returns nothing
    call DisplayTextToForce( GetPlayersAll(), "TRIGSTR_3104" )
endfunction

//===========================================================================
function InitTrig____________________004 takes nothing returns nothing
    set gg_trg____________________004 = CreateTrigger()
#ifdef DEBUG
    call YDWESaveTriggerName(gg_trg____________________004, "未命名触发器 004")
#endif
    call TriggerAddAction(gg_trg____________________004, function Trig____________________004Actions)
endfunction

