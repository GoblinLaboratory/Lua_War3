#ifndef WMAroundSystemIncluded
#define WMAroundSystemIncluded
#include "9527/SJWE/SJWEBase.j"

library WMAroundSystem requires SJWEBase
	
function Huanrao takes nothing returns nothing
 	local timer t=GetExpiredTimer()
 	local integer id=GetHandleId(t)
 	local unit u=LoadUnitHandle(DATA,id,1)
 	local unit U=LoadUnitHandle(DATA,id,2)
 	local real a=LoadReal(DATA,id,3)
 	local real b=LoadReal(DATA,id,4)
 	local real h=LoadReal(DATA,id,5)
 	local real c1=LoadReal(DATA,id,6)*bj_DEGTORAD
 	local real c2=LoadReal(DATA,id,7)
 	local real c3=LoadReal(DATA,id,8)
 	local real time=LoadReal(DATA,id,9)
 	local real Time=LoadReal(DATA,id,10)
 	local real T=LoadReal(DATA,id,11)
 	local real timepast=LoadReal(DATA,id,12)
 	local real r
 	set timepast=timepast+.02
 	set T=T+(7.2/time)*bj_DEGTORAD
 	if T>=6.28 then
     	set T=T-6.28
 	endif
 	if c1==-1 then
     	set c1=(GetUnitFacing(u)-270)*bj_DEGTORAD
 	endif
 	call SaveReal(DATA,id,11,T)
 	call SaveReal(DATA,id,12,timepast)
 	set r=SquareRoot(a*Cos(c2)*Cos(T)*a*Cos(c2)*Cos(T)+b*Cos(c3)*Sin(T)*b*Cos(c3)*Sin(T))
 	call SetUnitX(U,GetUnitX(u)+r*Cos(c1+Atan2(b*Cos(c3)*Sin(T),a*Cos(c2)*Cos(T))))
 	call SetUnitY(U,GetUnitY(u)+r*Sin(c1+Atan2(b*Cos(c3)*Sin(T),a*Cos(c2)*Cos(T))))
 	call SetUnitFlyHeight(U,GetUnitFlyHeight(u)+h+a*Cos(T)*Sin(c2)+b*Sin(T)*Sin(c3),0)
 	if timepast>=Time and Time>0 then
     	call RemoveUnit(U)
     	call FlushChildHashtable(DATA,id)
     	call DestroyTimer(t)
 	endif
 	set t=null
 	set u=null
 	set U=null
endfunction

function WMAroundSystem takes unit u,integer unittypes,real a,real b,real h,real c1,real c2,real c3,real time,real Time returns nothing
 	local timer t=CreateTimer()
 	local integer id=GetHandleId(t)
 	local unit U=CreateUnit(GetOwningPlayer(u),unittypes,GetUnitX(u),GetUnitY(u),0)
 	call SaveUnitHandle(DATA,id,1,u)
 	call SaveUnitHandle(DATA,id,2,U)
 	call SaveReal(DATA,id,3,a)
 	call SaveReal(DATA,id,4,b)
 	call SaveReal(DATA,id,5,h)
 	call SaveReal(DATA,id,6,c1)
 	call SaveReal(DATA,id,7,c2*bj_DEGTORAD)
 	call SaveReal(DATA,id,8,c3*bj_DEGTORAD)
 	call SaveReal(DATA,id,9,time)
 	call SaveReal(DATA,id,10,Time)
 	call TimerStart(t,0.02,true,function Huanrao)
 	set U=null
 	set t=null
endfunction

endlibrary

#endif
