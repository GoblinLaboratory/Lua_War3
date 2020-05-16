#ifndef HC_GetUnitZ_Used
#define HC_GetUnitZ_Used
library HCGetUnitZ
globals
	private location p=Location(0,0)
endglobals
	function Xg_GetUnitZ takes unit u returns real
		call MoveLocation(p,GetUnitX(u),GetUnitY(u))
		return GetUnitFlyHeight(u) + GetLocationZ(p)
	endfunction
endlibrary
#endif
