#ifndef XG_SetRowCountLocalMultiBoardIncluded
#define XG_SetRowCountLocalMultiBoardIncluded

#include "XueYue\SystemLibs\LocalMutiBoard\LocalMultiBoard.j"
library SetRowCountLocalMultiBoard requires XGLocalMultiBoard
	function XG_SetRowCountLocalMultiBoard takes integer i ,integer rows returns nothing
	//	if Player(XGLocalMultiBoard_Ownner[i]) == GetLocalPlayer() then
			call MultiboardSetRowCount(XGLocalMultiBoard_Board[i],rows)
	//	endif
	endfunction
endlibrary

#endif
