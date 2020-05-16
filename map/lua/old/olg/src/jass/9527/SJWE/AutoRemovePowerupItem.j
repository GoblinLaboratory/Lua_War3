#ifndef AutoRemovePowerupItemIncluded
#define AutoRemovePowerupItemIncluded
library AutoRemovePowerupItem
	
private function Remove takes nothing returns nothing
    if IsItemPowerup(GetManipulatedItem()) == true then
        call SetWidgetLife( GetManipulatedItem(), 1.00 )
        call RemoveItem( GetManipulatedItem() )
    endif
endfunction

function AutoRemovePowerupItem takes nothing returns nothing
    local trigger t=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(t,EVENT_PLAYER_UNIT_PICKUP_ITEM)
    call TriggerAddCondition(t,Condition(function Remove))
endfunction

endlibrary

#endif
