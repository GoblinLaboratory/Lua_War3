#ifndef XG_SetItemColorLocalMultiBoardIncluded
#define XG_SetItemColorLocalMultiBoardIncluded

#include "XueYue\SystemLibs\LocalMutiBoard\LocalMultiBoard.j"
library SetItemColorLocalMultiBoard requires XGLocalMultiBoard
	function XG_SetItemColorLocalMultiBoard takes integer i, integer row, integer col, integer red, integer green, integer blue, integer alpha  returns nothing
		local multiboarditem mbitem
	//	if Player(XGLocalMultiBoard_Ownner[i]) == GetLocalPlayer() then

	//	endif
		set mbitem = MultiboardGetItem(XGLocalMultiBoard_Board[i], row - 1, col - 1)
		call MultiboardSetItemValueColor(mbitem, red, green, blue, alpha)
		call MultiboardReleaseItem(mbitem)
		set mbitem = null
	endfunction
endlibrary

#endif
