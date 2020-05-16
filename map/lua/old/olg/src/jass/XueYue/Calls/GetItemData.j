#ifndef XGsysZhiLiaoIncluded
#define XGsysZhiLiaoIncluded

#include "XueYue\Base.j"
#include "XueYue\HcFuncs\DestroyLightingByTimer.j"
#include "XueYue\HcFuncs\GetUnitZ.j"
#include "XueYue\Define\ZhiLiao.Cons" /* 定义常量 */
library XGsysZhiLiao initializer Init requires XGbase,HCDestroyLighting,HCGetUnitZ
globals
	private hashtable		htb		=	InitHashtable()
	private trigger	array	Trigger
	private integer	array	Num
endglobals
//获取物体数据 物体,数据名  -->  需要预载数据
function XG_GetItemData takes integer it,string data returns nothing
	return LoadStr(htb, it, StringHash(data))
endfunction
//预载数据
function XG_PreLoadData takes integer i,string data returns string
	
endfunction

private function Init takes nothing returns nothing
	set Num[0] = 0
	set Num[1] = 0
endfunction

endlibrary

#endif
