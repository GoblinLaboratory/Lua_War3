#ifndef HC_PointPy_Used
#define HC_PointPy_Used
library HcPointPy
	function Xg_PointPy takes location source,real angle,real dist,rect xzrt returns location
		local real x = GetLocationX(source) + dist * Cos(angle * 3.14159/180.0)
		local real y = GetLocationY(source) + dist * Sin(angle * 3.14159/180.0)
		set x=RMinBJ(RMaxBJ(x, GetRectMinX(xzrt)), GetRectMaxX(xzrt))
		set y=RMinBJ(RMaxBJ(y, GetRectMinY(xzrt)), GetRectMaxY(xzrt))
		return Location(x, y)
	endfunction
endlibrary
#endif
