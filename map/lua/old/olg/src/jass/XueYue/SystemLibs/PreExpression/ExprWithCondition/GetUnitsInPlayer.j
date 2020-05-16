#ifndef HcGetUnitsInPlayerIncluded
#define HcGetUnitsInPlayerIncluded
<? local s = "" ?>
#ifdef XGPreExpression_ON
	<? local s = ",XGPreExpression" ?>
#endif
library XGGetUnitsInPlayer requires XGbase<?=s?>
	globals
		#ifndef XG_Temp_Group_Include
		#define XG_Temp_Group_Include
			group XG_Temp_Group
		#endif
	endglobals
	function XG_GetUnitsInPlayer takes player p, boolexpr filter, boolean xf returns group
		local group g = CreateGroup()
		call GroupEnumUnitsOfPlayer(g, p, filter)
		if xf then
			call DestroyBoolExpr(filter)
		endif
		set XG_Temp_Group = g
		set g = null
		return XG_Temp_Group
	endfunction
endlibrary
#endif
