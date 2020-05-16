#ifndef XG_DisplayLocalMultiBoardIncluded
#define XG_DisplayLocalMultiBoardIncluded

#include "XueYue\SystemLibs\LocalMutiBoard\LocalMultiBoard.j"
library DisplayLocalMultiBoard requires XGLocalMultiBoard
	function XG_DisplayLocalMultiBoard takes integer i, boolean show returns nothing
	//	if Player(XGLocalMultiBoard_Ownner[i]) == GetLocalPlayer() then
			call MultiboardDisplay(XGLocalMultiBoard_Board[i], show)
	//	endif
	endfunction
endlibrary

#endif
