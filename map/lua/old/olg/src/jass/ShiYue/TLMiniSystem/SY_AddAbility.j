#ifndef SY_AddAbilityIncluded
#define SY_AddAbilityIncluded

library AddAbility

function SY_AddAbility takes unit u,integer ab returns boolean
local boolean b = UnitAddAbility(u,ab)
    if b == true then
	    call UnitMakeAbilityPermanent(u,true,ab)
		return true
	else
	    return false
	endif
endfunction

endlibrary

#endif