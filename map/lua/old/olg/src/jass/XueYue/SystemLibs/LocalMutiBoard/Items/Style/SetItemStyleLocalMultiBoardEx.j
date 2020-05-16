#ifndef XG_SetItemStyleLocalMultiBoardExIncluded
#define XG_SetItemStyleLocalMultiBoardExIncluded

#include "XueYue\SystemLibs\LocalMutiBoard\LocalMultiBoard.j"
library SetItemStyleLocalMultiBoardEx requires XGLocalMultiBoard
	function XG_SetItemStyleLocalMultiBoardEx takes integer i ,integer Row, integer Col, boolean s_text, boolean s_icon returns nothing
		local multiboarditem mbitem
		local integer MaxRow
		local integer MaxCol
		local integer row = 0
		local integer col
	//	if Player(XGLocalMultiBoard_Ownner[i]) == GetLocalPlayer() then
		
	//	endif
			if Row == 0 and Col == 0 then
				call MultiboardSetItemsStyle(XGLocalMultiBoard_Board[i],s_text,s_icon)
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
							call MultiboardSetItemStyle(mbitem,s_text,s_icon)
							call MultiboardReleaseItem(mbitem)
						endif
					endloop
				endif
			endloop
		set mbitem = null
		
	endfunction
endlibrary

#endif
