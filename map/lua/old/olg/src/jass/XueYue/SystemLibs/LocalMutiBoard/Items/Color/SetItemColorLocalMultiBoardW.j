#ifndef XG_SetItemColorLocalMultiBoardWIncluded
#define XG_SetItemColorLocalMultiBoardWIncluded

#include "XueYue\SystemLibs\LocalMutiBoard\LocalMultiBoard.j"
library SetItemColorLocalMultiBoardW requires XGLocalMultiBoard
	function XG_SetItemColorLocalMultiBoardW takes integer i, integer row, integer col, integer red, integer green, integer blue, integer alpha  returns nothing
		local multiboarditem mbitem
	//	if Player(XGLocalMultiBoard_Ownner[i]) != GetLocalPlayer() then
			
	//	endif
			set mbitem = MultiboardGetItem(XGLocalMultiBoard_Board[i], row - 1, col - 1)
			call MultiboardSetItemValueColor(mbitem, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - alpha))
			call MultiboardReleaseItem(mbitem)
			set mbitem = null
	endfunction
endlibrary

#endif
