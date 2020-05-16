#ifndef XGLandIncluded
#define XGLandIncluded
	#include "XueYue\Define\Land.Cons" /* 载入常量 */
library XGLand

globals
		private hashtable htb = InitHashtable()
endglobals

//替换地形 整片区域，但是循环次数限制了区域大小 大概50x50
function Xg_Land_Change takes rect rct,integer Sland,integer Cland returns nothing
	local integer left = R2I(GetRectMinX(rct)) //左上角X
	local integer top = R2I(GetRectMaxY(rct)) //左上角Y
	local integer iX= 1
	local integer iY= 1
	local integer endX = (R2I(GetRectMaxX(rct)) - left) / 128
	local integer endY = (top - R2I(GetRectMinY(rct))) / 128 + 1
	local real x
	local real y
	//单元格128*128
	loop
		exitwhen iY>endY
		set iX=1
		loop
			exitwhen iX>endX
			set x = left + (iX-1)*128 + 1
			set y = top  - (iY-1)*128 + 1
			if GetTerrainType(x,y) == Sland then
				call SetTerrainType( x, y, Cland, -1, 1, 0 )
			endif
			set iX=iX+1
		endloop
		set iY=iY+1
	endloop
endfunction
//替换地形Plus 自动计算区域块 分割多次替换
function Xg_Land_Change_Timer takes nothing returns nothing
	local timer t=GetExpiredTimer()
	local integer key=GetHandleId(t)
	local integer count = LoadInteger(htb,key,0)
	local real Minx
	local real Miny
	local real Maxx
	local real Maxy
	local rect rct=null
	set Minx = LoadReal( htb, key, Land_MinX + count )
	set Miny = LoadReal( htb, key, Land_MinY + count )
	set Maxx = LoadReal( htb, key, Land_MaxX + count )
	set Maxy = LoadReal( htb, key, Land_MaxY + count )
	//call BJDebugMsg("Minx="+R2S(Minx))
	//call BJDebugMsg("Miny="+R2S(Miny))
	set rct = Rect(Minx,Miny,Maxx,Maxy)
	call Xg_Land_Change( rct, LoadInteger( htb, key, Land_Sland ), LoadInteger( htb, key, Land_Cland ) )
	call RemoveRect( rct )
	set rct=null
	call FlushChildHashtable( htb, key )
	call DestroyTimer(t)
	set t=null
endfunction
function Xg_Land_Change_Plus takes rect Rec,integer Sland,integer Cland returns nothing
	local integer left = R2I(GetRectMinX(Rec)) //左上角X
	local integer top = R2I(GetRectMaxY(Rec)) //左上角Y
	local integer long = R2I(GetRectMaxX(Rec) - GetRectMinX(Rec)) //长
	local integer Wide = R2I(GetRectMaxY(Rec) - GetRectMinY(Rec))//宽
	local integer xA =0//长-小区域
	local integer yA =0//宽-小区域
	local real  Rlong //小区域长度
	local real  Rwide //小区域宽度
	local integer x1=1
	local integer y1=1
	local integer count=0
	local timer t
	local integer key
	if long>Land_LongMax then 
		set xA=R2I(long/Land_LongMax)//判断X-Size
		if xA*Land_LongMax!=long then
			set xA=xA+1
		endif
	else
		set xA=1
	endif
	if Wide>Land_WideMax then
		set yA=R2I(Wide/Land_WideMax) //判断Y-Size
		if yA*Land_WideMax!=Wide then
			set yA=yA+1
		endif
	else
		set yA=1
	endif
	set Rlong=long/xA
	set Rwide=Wide/yA
	//call BJDebugMsg("Long="+R2S(long))
	//call BJDebugMsg("Wide="+R2S(Wide))
	//call BJDebugMsg("xA="+R2S(xA))
	//call BJDebugMsg("yA="+R2S(yA))
	//call BJDebugMsg("Rlong="+R2S(Rlong))
	//call BJDebugMsg("Rwide="+R2S(Rwide))
	loop
		exitwhen y1 > yA
		set x1=1
		loop
			exitwhen x1 > xA
			set count = count + 1 //区域数量
			set t=CreateTimer()
			set key=GetHandleId(t)
			call SaveInteger(htb,key,0,count)
		//	call SaveReal( htb, key, Land_X    + count, left+(x1-1)*Rlong )
		//	call SaveReal( htb, key, Land_Y    + count, top+(y1-1)*Rwide )
			call SaveReal( htb, key, Land_MinX + count, left+(x1-1)*Rlong )
			call SaveReal( htb, key, Land_MinY + count, top-y1*Rwide )
			call SaveReal( htb, key, Land_MaxX + count, left+x1*Rlong+128)
			call SaveReal( htb, key, Land_MaxY + count, top-(y1-1)*Rwide)
			call SaveInteger(htb,key,Land_Sland,Sland)
			call SaveInteger(htb,key,Land_Cland,Cland)
			call TimerStart(t,0. ,false, function Xg_Land_Change_Timer)
			set x1=x1+1
		endloop
		set y1=y1+1
	endloop
	set t=null
endfunction

endlibrary

#endif
