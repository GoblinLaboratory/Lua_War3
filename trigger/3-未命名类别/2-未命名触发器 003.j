function Trig____________________003Actions takes nothing returns nothing
    call QuestMessageBJ( GetPlayersAll(), bj_QUESTMESSAGE_SECRET, "TRIGSTR_3103" )
    call QuestMessageBJ( GetPlayersAll(), bj_QUESTMESSAGE_ALWAYSHINT, "TRIGSTR_3102" )
endfunction

//===========================================================================
function InitTrig____________________003 takes nothing returns nothing
    set gg_trg____________________003 = CreateTrigger()
#ifdef DEBUG
    call YDWESaveTriggerName(gg_trg____________________003, "未命名触发器 003")
#endif
    call TriggerAddAction(gg_trg____________________003, function Trig____________________003Actions)
endfunction

