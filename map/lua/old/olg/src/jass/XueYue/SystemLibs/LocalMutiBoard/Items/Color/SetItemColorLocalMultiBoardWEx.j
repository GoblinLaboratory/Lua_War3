#ifndef XG_SetItemColorLocalMultiBoardWExIncluded
#define XG_SetItemColorLocalMultiBoardWExIncluded

#include "XueYue\SystemLibs\LocalMutiBoard\LocalMultiBoard.j"
library SetItemColorLocalMultiBoardWEx requires XGLocalMultiBoard
	function XG_SetItemColorLocalMultiBoardWEx takes integer i, integer Row, integer Col, integer red, integer green, integer blue, integer alpha  returns nothing
		local multiboarditem mbitem
		local integer MaxRow
		local integer MaxCol
		local integer row = 0
		local integer col
	//	if Player(XGLocalMultiBoard_Ownner[i]) == GetLocalPlayer() then
		
	//	endif
			if Row == 0 and Col == 0 then
				call MultiboardSetItemsValueColor(XGLocalMultiBoard_Board[i], PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - alpha))
				return
			endif
			set MaxRow = MultiboardGetRowCount(XGLocalMultiBoard_Board[i])
			set MaxCol = MultiboardGetColumnCount(XGLocalMultiBoard_Board[i])
			loop
				set row = row + 1
				exitwhen row > MaxRow
				if (Row == 0 or Row == row) then
					set col = 0
					loop
						set col = col + 1
						exitwhen col > MaxCol
						if (Col == 0 or Col == col) then
							set mbitem = MultiboardGetItem(XGLocalMultiBoard_Board[i], row - 1, col - 1)
							call MultiboardSetItemValueColor(mbitem, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - alpha))
							call MultiboardReleaseItem(mbitem)
						endif
					endloop
				endif
			endloop
		set mbitem = null
		
	endfunction
endlibrary

#endif
