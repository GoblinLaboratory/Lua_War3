#ifndef XG_DestroyLocalMultiBoardIncluded
#define XG_DestroyLocalMultiBoardIncluded

#include "XueYue\SystemLibs\LocalMutiBoard\LocalMultiBoard.j"
library DestroyLocalMultiBoard requires XGLocalMultiBoard
	function XG_DestroyLocalMultiBoard takes integer i returns nothing
	//	if Player(XGLocalMultiBoard_Ownner[i]) == GetLocalPlayer() then
			call DestroyMultiboard(XGLocalMultiBoard_Board[i])
			set XGLocalMultiBoard_Board [i] = null
	//	endif
	endfunction
endlibrary

#endif
