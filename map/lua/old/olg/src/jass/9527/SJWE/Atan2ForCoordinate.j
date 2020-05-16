#ifndef Atan2ForCoordinateIncluded
#define Atan2ForCoordinateIncluded
library Atan2ForCoordinate
function Atan2ForCoordinate takes real x1,real y1,real x2,real y2 returns real
    return Atan2(y2-y1,x2-x1)*bj_RADTODEG
endfunction
endlibrary
#endif
