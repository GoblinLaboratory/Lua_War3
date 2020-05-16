#ifndef XG_SuppressDisplayLocalMultiBoardIncluded
#define XG_SuppressDisplayLocalMultiBoardIncluded

#include "XueYue\SystemLibs\LocalMutiBoard\LocalMultiBoard.j"
library SuppressDisplayLocalMultiBoard requires XGLocalMultiBoard
	function XG_SuppressDisplayLocalMultiBoard takes player p, boolean open returns nothing
	//	if p == GetLocalPlayer() then
			call MultiboardSuppressDisplay(open)
	//	endif
	endfunction
endlibrary

#endif
