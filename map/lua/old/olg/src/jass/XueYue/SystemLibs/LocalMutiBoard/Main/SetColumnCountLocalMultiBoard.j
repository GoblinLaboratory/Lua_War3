#ifndef XG_SetColumnCountLocalMultiBoardIncluded
#define XG_SetColumnCountLocalMultiBoardIncluded

#include "XueYue\SystemLibs\LocalMutiBoard\LocalMultiBoard.j"
library SetColumnCountLocalMultiBoard requires XGLocalMultiBoard
	function XG_SetColumnCountLocalMultiBoard takes integer i ,integer cols returns nothing
	//	if Player(XGLocalMultiBoard_Ownner[i]) == GetLocalPlayer() then
			call MultiboardSetColumnCount(XGLocalMultiBoard_Board[i],cols)
	//	endif
	endfunction
endlibrary

#endif
