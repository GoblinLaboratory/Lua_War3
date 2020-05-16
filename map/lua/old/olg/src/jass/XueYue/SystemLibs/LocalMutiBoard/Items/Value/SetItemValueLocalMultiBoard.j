#ifndef XG_SetItemValueLocalMultiBoardIncluded
#define XG_SetItemValueLocalMultiBoardIncluded

#include "XueYue\SystemLibs\LocalMutiBoard\LocalMultiBoard.j"
library SetItemValueLocalMultiBoard requires XGLocalMultiBoard
	function XG_SetItemValueLocalMultiBoard takes integer i ,integer row, integer col, string val returns nothing
		local multiboarditem mbitem
		/* if Player(XGLocalMultiBoard_Ownner[i]) != GetLocalPlayer() then
			set val = ""
		endif */
		set mbitem = MultiboardGetItem(XGLocalMultiBoard_Board[i], row - 1, col - 1)
		call MultiboardSetItemValue(mbitem, val)
		call MultiboardReleaseItem(mbitem)
		set mbitem = null
	endfunction
endlibrary

#endif
