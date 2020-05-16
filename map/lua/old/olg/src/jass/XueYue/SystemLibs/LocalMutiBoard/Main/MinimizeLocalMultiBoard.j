#ifndef XG_MinimizeLocalMultiBoardIncluded
#define XG_MinimizeLocalMultiBoardIncluded

#include "XueYue\SystemLibs\LocalMutiBoard\LocalMultiBoard.j"
library MinimizeLocalMultiBoard requires XGLocalMultiBoard
	function XG_MinimizeLocalMultiBoard takes integer i, boolean mini returns nothing
	//	if Player(XGLocalMultiBoard_Ownner[i]) == GetLocalPlayer() then
			call MultiboardMinimize(XGLocalMultiBoard_Board[i], mini)
	//	endif
	endfunction
endlibrary
#endif
