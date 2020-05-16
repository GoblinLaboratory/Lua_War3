#ifndef XGLocalMultiBoardIncluded
#define XGLocalMultiBoardIncluded
#include "XueYue\Base.j"
library XGLocalMultiBoard requires XGbase
	globals
		public multiboard	array	Board
		public integer		array	Ownner
	endglobals
	function XG_CreateLocalMultiBoard takes integer i, player ply, integer rows, integer cols, string title returns nothing
		//local boolean l_disp = true
		set	Board[i] = CreateMultiboard()
		if ply == GetLocalPlayer() then
			set Ownner[i] = GetPlayerId(ply)
			call MultiboardDisplay(Board[i], true)
		endif
			call MultiboardSetRowCount(Board[i], rows)
			call MultiboardSetColumnCount(Board[i], cols)
			call MultiboardSetTitleText(Board[i], title)
	endfunction
endlibrary
#endif
