#ifndef HcUnitInUnitDegreeIncluded
#define HcUnitInUnitDegreeIncluded

library XGUnitInUnitDegree
	// 单位到单位 的 指定角度内 
	function XG_UnitInUnitDegree takes unit ue, unit us, real f, real a, real b returns boolean
		local real r = bj_RADTODEG * Atan2(GetUnitY(us) - GetUnitY(ue), GetUnitX(us) - GetUnitX(ue))
		local real xx
		if r<=0 then
			set r = r + 360.0
		endif
		if a <= -b then
		   set xx=a
		   set a=-b
		   set b=xx
		endif
		set xx=0
		if f+a > 360 and r<=a then
		   set r=360+r
		elseif f-b < 0 and r>=b then
		   set r=360-r
		endif

		return (r<=f+a) and (r>=f-b)
	endfunction

endlibrary

#endif
