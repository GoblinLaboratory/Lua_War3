#ifndef HC_IsUnitInvunerable_Used
#define HC_IsUnitInvunerable_Used
library HcIsUnitInvunerable
	function XG_IsUnitInvunerable takes unit u returns boolean
		return UnitMakeAbilityPermanent(u, true, 'Avul')
	endfunction
endlibrary
#endif
