#ifndef ChooseHeroIncluded
#define ChooseHeroIncluded
#include "9527/SJWE/DoubleClickEvent.j"

library ChooseHero requires DoubleClickEvent

globals
    private boolean array                   have
    private group                           heroes = CreateGroup()
endglobals

private function ChooseHeroMain takes nothing returns nothing
	local integer id = GetPlayerId(GetTriggerPlayer())
	if not have[id] and IsUnitInGroup(GetTriggerUnit(),heroes) then
        call SetUnitOwner(GetTriggerUnit(),GetTriggerPlayer(),true)
        set PlayerUnit[id] = GetTriggerUnit()
        call GroupRemoveUnit(heroes,GetTriggerUnit())
        set have[id] = true
	endif
endfunction

private function ChooseHerofilter takes nothing returns boolean
	return IsUnitType(GetFilterUnit(),UNIT_TYPE_HERO)and GetOwningPlayer(GetFilterUnit())==Player(15)
endfunction

function ChooseHero takes nothing returns nothing
	local integer i = 0
    local trigger tr = CreateTrigger()
    call GroupEnumUnitsInRect(heroes,bj_mapInitialPlayableArea,function ChooseHerofilter)
    loop
        exitwhen i > 11
        set have[i] = false
        set i = i + 1
    endloop
    call TriggerRegisterDoubleClickEvent(tr)
    call TriggerAddAction(tr, function ChooseHeroMain)
    set tr = null
endfunction

endlibrary

#endif