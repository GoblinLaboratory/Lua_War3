#ifndef XG_SetItemIconLocalMultiBoardIncluded
#define XG_SetItemIconLocalMultiBoardIncluded

#include "XueYue\SystemLibs\LocalMutiBoard\LocalMultiBoard.j"
library SetItemIconLocalMultiBoard requires XGLocalMultiBoard
	function XG_SetItemIconLocalMultiBoard takes integer i, integer row, integer col, string icon returns nothing
		local multiboarditem mbitem
	//	if Player(XGLocalMultiBoard_Ownner[i]) == GetLocalPlayer() then
			
	//	endif
		set mbitem = MultiboardGetItem(XGLocalMultiBoard_Board[i], row - 1, col - 1)
		call MultiboardSetItemIcon(mbitem, icon)
		call MultiboardReleaseItem(mbitem)
		set mbitem = null
	endfunction
endlibrary

#endif
