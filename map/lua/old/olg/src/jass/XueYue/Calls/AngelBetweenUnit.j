#ifndef HcAngelBetweenUnitIncluded
#define HcAngelBetweenUnitIncluded

library XGAngelBetweenUnit
	function XG_AngelBetweenUnit takes unit us, unit ue returns real
		local real r = bj_RADTODEG * Atan2(GetUnitY(ue) - GetUnitY(us), GetUnitX(ue) - GetUnitX(us))
		if r<=0 then
			set r = r + 360.0
		endif
		return r
	endfunction

endlibrary

#endif
