#ifndef XG_SetItemStyleLocalMultiBoardIncluded
#define XG_SetItemStyleLocalMultiBoardIncluded

#include "XueYue\SystemLibs\LocalMutiBoard\LocalMultiBoard.j"
library SetItemStyleLocalMultiBoard requires XGLocalMultiBoard
	function XG_SetItemStyleLocalMultiBoard takes integer i ,integer row, integer col, boolean s_text, boolean s_icon returns nothing
		local multiboarditem mbitem
	//	if Player(XGLocalMultiBoard_Ownner[i]) == GetLocalPlayer() then

	//	endif
		set mbitem = MultiboardGetItem(XGLocalMultiBoard_Board[i], row - 1, col - 1)
		call MultiboardSetItemStyle(mbitem,s_text,s_icon)
		call MultiboardReleaseItem(mbitem)
		set mbitem = null
	endfunction
endlibrary

#endif
