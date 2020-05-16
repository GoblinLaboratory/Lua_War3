#ifndef Hc_GetUnitsInRectMatching_Used
#define Hc_GetUnitsInRectMatching_Used
library HcGetUnitsInRectMatching
	function XG_GetUnitsInRectMatching takes rect r, boolexpr filter returns group
		local group g = CreateGroup()
		call GroupEnumUnitsInRect(g, r, filter)
		call DestroyBoolExpr(filter)
		return g
	endfunction
endlibrary
#endif
