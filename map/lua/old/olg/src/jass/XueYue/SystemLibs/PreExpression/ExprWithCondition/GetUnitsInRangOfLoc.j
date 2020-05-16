#ifndef HcGetUnitsInRangIncluded
#define HcGetUnitsInRangIncluded
<? local s = "" ?>
#ifdef XGPreExpression_ON
	<? local s = ",XGPreExpression" ?>
#endif
library XGGetUnitsInRang requires XGbase<?=s?>
	globals
		#ifndef XG_Temp_Group_Include
		#define XG_Temp_Group_Include
			group XG_Temp_Group
		#endif
	endglobals
	function XG_GetUnitsInRangOfLoc takes real radius, location p, boolean xp, boolexpr filter, boolean xf returns group
		local group g = CreateGroup() 
		call GroupEnumUnitsInRangeOfLoc(g, p, radius, filter)
		if xp then
			call RemoveLocation(p)
		endif
		if xf then
			call DestroyBoolExpr(filter)
		endif
		set XG_Temp_Group = g
		set g = null
		return XG_Temp_Group
	endfunction
endlibrary
#endif
