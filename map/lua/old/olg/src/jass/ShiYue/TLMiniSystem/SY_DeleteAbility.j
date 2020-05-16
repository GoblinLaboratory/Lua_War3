#ifndef SY_DeleteAbilityIncluded
#define SY_DeleteAbilityIncluded

library DeleteAbility

function SY_DeleteAbility takes unit u,integer ab returns nothing
call UnitRemoveAbility(u,ab)
call UnitMakeAbilityPermanent(u,false,ab)
endfunction

endlibrary

#endif