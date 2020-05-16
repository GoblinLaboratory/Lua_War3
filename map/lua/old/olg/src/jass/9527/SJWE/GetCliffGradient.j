#ifndef GetCliffGradientIncluded
#define GetCliffGradientIncluded
library GetCliffGradient
globals
    private location loc=Location(0,0)
endglobals
function GetCliffGradient takes real x,real y returns real
    local real z0=GetLocationZ(loc)
    local real z1=GetLocationZ(loc)
    local real z2=GetLocationZ(loc)
    local real d1=z0 - z2
    local real d2=z0 - z1
    local real a=d1 * d2
    call MoveLocation(loc, x, y)
    set z0=GetLocationZ(loc)
    call MoveLocation(loc, x + 1, y)
    set z1=GetLocationZ(loc)
    call MoveLocation(loc, x, y + 1)
    set z2=GetLocationZ(loc)
    set d1=z0 - z2
    set d2=z0 - z1
    if d2 < 0 then
        set d2=- d2
    endif
    if d1 < 0 then
        set d1=- d1
    endif
    set a=d1 * d2
    if d2 == 0 then
        return Atan(d1) * bj_RADTODEG
    elseif d1 == 0 then
        return Atan(d2) * bj_RADTODEG
    endif
    if z0-z1>0 then
    	return Atan(d2/( 1 + a * a )) * bj_RADTODEG
	endif
	return Atan(( 1 + a * a )/d2) * bj_RADTODEG
endfunction
endlibrary
#endif
