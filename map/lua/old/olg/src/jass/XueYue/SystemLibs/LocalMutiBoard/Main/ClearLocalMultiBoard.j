#ifndef XG_ClearLocalMultiBoardIncluded
#define XG_ClearLocalMultiBoardIncluded

#include "XueYue\SystemLibs\LocalMutiBoard\LocalMultiBoard.j"
library ClearLocalMultiBoard requires XGLocalMultiBoard
	function XG_ClearLocalMultiBoard takes integer i returns nothing
	//	if Player(XGLocalMultiBoard_Ownner[i]) == GetLocalPlayer() then
			call MultiboardClear(XGLocalMultiBoard_Board[i])
	//	endif
	endfunction
endlibrary

#endif
