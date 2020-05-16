#ifndef HcUnitInUnitFaceDegreeIncluded
#define HcUnitInUnitFaceDegreeIncluded

library XGUnitInUnitFaceDegree
	// 单位在 指定单位面向的 a -> b 度之间
	function XG_UnitInUnitFaceDegree takes unit ue, unit us, real a, real b returns boolean
		local real r = bj_RADTODEG * Atan2(GetUnitY(us) - GetUnitY(ue), GetUnitX(us) - GetUnitX(ue))
		if r<=0 then
			set r = r + 360.0
		endif
		local real f = GetUnitFacing(ue)
		set r = Cos(r)
		if r <= Cos(f+a) and r >= Cos(f-b) then
			return true
		endif
		return false
	endfunction

endlibrary

#endif
