#ifndef IsUnitSpellingIncluded
#define IsUnitSpellingIncluded
library IsUnitSpelling initializer SpellingEvent
globals
    private group g=CreateGroup()
endglobals
struct Cooldown
    unit u
    integer id
    static method create takes unit un,integer i returns thistype
        local thistype a=thistype.allocate()
        set a.u=un
        set a.id=i
        return a
    endmethod
    method destroy takes nothing returns nothing
        local integer l=GetUnitAbilityLevel(.u,.id)
        call UnitRemoveAbility(.u,.id)
        call UnitAddAbility(.u,.id)
        call SetUnitAbilityLevel(.u,.id,l)
        call SetUnitAnimation(.u,"stand")
        set .u=null
        set .id=0
    endmethod
endstruct
function IsUnitSpelling takes unit u returns boolean
    return IsUnitInGroup(u,g)
endfunction
function AbilityResetCooldown takes unit u,integer abilId,boolean wait returns nothing
    local integer l=GetUnitAbilityLevel(u,abilId)
    local integer id
    local Cooldown i
    if GetUnitAbilityLevel(u,abilId)>0 then
	    set i=Cooldown.create(u,abilId)
        if wait==false then
            call i.destroy()
        else
            if IsUnitSpelling(u)==false then
                call i.destroy()
            endif
        endif
    endif
endfunction
private function SpellingGroupAddUnit takes nothing returns nothing
    call GroupAddUnit(g,GetTriggerUnit())
endfunction
private function SpellingGroupRemoveUnit takes nothing returns nothing
    local Cooldown i=1
    call GroupRemoveUnit(g,GetTriggerUnit())
    loop
        exitwhen i==si__Cooldown_I+1
        if i.u==GetTriggerUnit() then
            call i.destroy()
            exitwhen true
        endif
        set i=i+1
    endloop
endfunction
private function SpellingEvent takes nothing returns nothing
    local trigger t1=CreateTrigger()
    local trigger t2=CreateTrigger()
    local integer i=0
    loop
        call TriggerRegisterPlayerUnitEvent(t1,Player(i),EVENT_PLAYER_UNIT_SPELL_ENDCAST,null)
        call TriggerRegisterPlayerUnitEvent(t2,Player(i),EVENT_PLAYER_UNIT_SPELL_CHANNEL,null)
        set i=i+1
        exitwhen i==15
    endloop
    call TriggerAddAction(t1,function SpellingGroupRemoveUnit)
    call TriggerAddAction(t2,function SpellingGroupAddUnit)
endfunction
endlibrary
#endif
