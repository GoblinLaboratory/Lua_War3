#ifndef XG_SetTitleColorLocalMultiBoardIncluded
#define XG_SetTitleColorLocalMultiBoardIncluded

#include "XueYue\SystemLibs\LocalMutiBoard\LocalMultiBoard.j"
library SetTitleColorLocalMultiBoard requires XGLocalMultiBoard
	function XG_SetTitleColorLocalMultiBoard takes integer i ,integer red, integer green, integer blue, integer alpha returns nothing
	//	if Player(XGLocalMultiBoard_Ownner[i]) == GetLocalPlayer() then
			call MultiboardSetTitleTextColor(XGLocalMultiBoard_Board[i], red,green,blue,alpha)
	//	endif
	endfunction
endlibrary

#endif
