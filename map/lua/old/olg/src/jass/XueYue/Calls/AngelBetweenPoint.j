#ifndef HcAngelBetweenPointIncluded
#define HcAngelBetweenPointIncluded

library XGAngelBetweenPoint
	function XG_AngelBetweenPoint takes location ps, boolean xs, location pe, boolean xe returns real
		local real r = bj_RADTODEG * Atan2(GetLocationY(pe) - GetLocationY(ps), GetLocationX(pe) - GetLocationX(ps))
		if r<=0 then
			set r = r + 360.0
		endif
		if xs then
			call RemoveLocation(ps)
		endif
		if xe then
			call RemoveLocation(pe)
		endif
		return r
	endfunction

endlibrary

#endif
