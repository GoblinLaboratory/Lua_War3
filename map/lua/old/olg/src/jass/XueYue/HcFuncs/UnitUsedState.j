#ifndef HC_UnitUsedState_Used
#define HC_UnitUsedState_Used
library HcUnitUsedState
	function Xg_UnitUsedState takes unit u,integer i returns real
		local unitstate usteMax
		local unitstate uste
		if i==1 then
			set usteMax=UNIT_STATE_MAX_LIFE
			set uste=UNIT_STATE_LIFE
		else
			set usteMax=UNIT_STATE_MAX_MANA
			set uste=UNIT_STATE_MANA
		endif
		return GetUnit/**/State(u,usteMax) - GetUnit/**/State(u,uste)
	endfunction
endlibrary
#endif
