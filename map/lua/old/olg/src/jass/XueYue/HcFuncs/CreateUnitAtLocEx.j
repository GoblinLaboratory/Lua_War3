#ifndef HC_CreateUnitAtLocEx_Used
#define HC_CreateUnitAtLocEx_Used
library HCCreateUnitAtLocEx
	function XG_CreateUnitAtLocEx takes player p, integer u, location loc, boolean rm, real face, integer lv, integer sk returns nothing
		set bj_lastCreatedUnit = CreateUnit(p, u, GetLocationX(loc),GetLocationY(loc),face)
		call UnitAddAbility(bj_lastCreatedUnit, sk)
		call SetUnitAbilityLevel(bj_lastCreatedUnit, sk, lv)
		if rm then
			call RemoveLocation(loc)
		endif
	endfunction
endlibrary
#endif
