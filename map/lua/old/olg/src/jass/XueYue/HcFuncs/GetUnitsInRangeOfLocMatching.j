#ifndef Hc_GetUnitsInRangeOfLocMatchingUsed
#define Hc_GetUnitsInRangeOfLocMatchingUsed
library HcGetUnitsInRangeOfLocMatching
	function XG_GetUnitsInRangeOfLocMatching takes real radius, location whichLocation, boolexpr filter returns group
		local group g = CreateGroup()
		call GroupEnumUnitsInRangeOfLoc(g, whichLocation, radius, filter)
		call DestroyBoolExpr(filter)
		return g
	endfunction
endlibrary
#endif
