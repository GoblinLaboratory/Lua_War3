#ifndef XG_SetTitleTextLocalMultiBoardIncluded
#define XG_SetTitleTextLocalMultiBoardIncluded

#include "XueYue\SystemLibs\LocalMutiBoard\LocalMultiBoard.j"
library SetTitleTextLocalMultiBoard requires XGLocalMultiBoard
	function XG_SetTitleTextLocalMultiBoard takes integer i ,string str returns nothing
	//	if Player(XGLocalMultiBoard_Ownner[i]) == GetLocalPlayer() then
			call MultiboardSetTitleText(XGLocalMultiBoard_Board[i], str)
	//	endif
	endfunction
endlibrary

#endif
