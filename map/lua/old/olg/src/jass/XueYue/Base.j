#ifndef XGbaseIncluded
#define XGbaseIncluded
/*
#ifndef DZAPIINCLUDE
#define DZAPIINCLUDE
library DzAPI
endlibrary
#endif
*/
library XGbase initializer InitXG
	globals
		#ifndef XGHtbIncluded
		#define XGHtbIncluded
		hashtable Xg_htb = InitHashtable()
		#endif
		real array XG_Map_Loc
	endglobals
	#ifndef NoHCWEInfo
	function Show_WE_Info takes nothing returns nothing
		call DisplayTextToPlayer(GetLocalPlayer(),0,0,"=====本地图使用雪月团队的雪月编辑器完成制作======")
		call DestroyTimer( GetExpiredTimer() )
	endfunction
	#endif
	function InitXG takes nothing returns nothing
		#ifndef NoHCWEInfo
		local timer t=CreateTimer()
		call TimerStart(t,30.00,false,function Show_WE_Info)
		set t=null
		#endif
		set XG_Map_Loc[1] = GetCameraBoundMinX() - GetCameraMargin(CAMERA_MARGIN_LEFT) //MinX
		set XG_Map_Loc[2] = GetCameraBoundMinY() - GetCameraMargin(CAMERA_MARGIN_BOTTOM) //MinY
		set XG_Map_Loc[3] = GetCameraBoundMaxX() + GetCameraMargin(CAMERA_MARGIN_RIGHT) //MaxX
		set XG_Map_Loc[4] = GetCameraBoundMaxY() + GetCameraMargin(CAMERA_MARGIN_TOP) //MaxY
	endfunction

endlibrary

#endif
