#ifndef XG_SetItemWidthLocalMultiBoardIncluded
#define XG_SetItemWidthLocalMultiBoardIncluded

#include "XueYue\SystemLibs\LocalMutiBoard\LocalMultiBoard.j"
library SetItemWidthLocalMultiBoard requires XGLocalMultiBoard
	function XG_SetItemWidthLocalMultiBoard takes integer i, integer row, integer col, real width returns nothing
		local multiboarditem mbitem
	//	if Player(XGLocalMultiBoard_Ownner[i]) == GetLocalPlayer() then
		
	//	endif
			set mbitem = MultiboardGetItem(XGLocalMultiBoard_Board[i], row - 1, col - 1)
			call MultiboardSetItemWidth(mbitem, width/100.0)
			call MultiboardReleaseItem(mbitem)
			set mbitem = null
	endfunction
endlibrary

#endif
