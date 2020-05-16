#ifndef HcGetUnitsInRectIncluded
#define HcGetUnitsInRectIncluded
<? local s = "" ?>
#ifdef XGPreExpression_ON
	<? local s = ",XGPreExpression" ?>
#endif
library XGGetUnitsInRect requires XGbase<?=s?>
	globals
		#ifndef XG_Temp_Group_Include
		#define XG_Temp_Group_Include
			group XG_Temp_Group
		#endif
	endglobals
	function XG_GetUnitsInRect takes rect r, boolexpr filter, boolean xf returns group
		local group g = CreateGroup()
		call GroupEnumUnitsInRect(g, r, filter)
		if xf then
			call DestroyBoolExpr(filter)
		endif
		set XG_Temp_Group = g
		set g = null
		return XG_Temp_Group
	endfunction
endlibrary
#endif
