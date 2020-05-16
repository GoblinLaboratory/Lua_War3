#ifndef GetGroupIncluded
#define GetGroupIncluded
library GetGroup
function GetGroup takes real x,real y,real j,real d,real r returns group
    local group g=CreateGroup()
    local unit u
    local real x1
    local real y1
    local real d1
    set bj_lastCreatedGroup=CreateGroup()
    call GroupEnumUnitsInRange(g,x,y,r,null)
    loop
        set u=FirstOfGroup(g)
        exitwhen u==null
        set x1=GetUnitX(u)
        set y1=GetUnitY(u)
        set d1=Atan2(y1-y,x1-x)*180/bj_PI
        if d1<0 then
            set d1=360+d1
        endif
        if d1>d-j/2and d1<d+j/2then
            call GroupAddUnit(bj_lastCreatedGroup,u)
        endif
        call GroupRemoveUnit(g,u)
    endloop
    call DestroyGroup(g)
    set g=null
    return bj_lastCreatedGroup
endfunction
endlibrary
#endif
