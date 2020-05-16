#ifndef XGCinematicFilterIncluded
#define XGCinematicFilterIncluded

#include "XueYue\Base.j"

library XGCinematicFilter requires XGbase
	#define XG_CineType_FadeInOut 3
	globals
		private	hashtable			htb		=	InitHashtable()
		private timer		array	Timer
	endglobals
	private function second takes nothing returns nothing
		local timer t = GetExpiredTimer()
		local integer key = GetHandleId(t)
		call DisplayCineFilter(false)
		set Timer[LoadInteger(htb, key, 1)] = null
		call FlushChildHashtable(htb, key)
		call DestroyTimer(t)
		set t = null
	endfunction
	private function CinematicFadeCommon takes real duration, string tex, integer type1, integer type2, integer r, integer g, integer b, integer startTrans, integer endTrans returns nothing
		call SetCineFilterTexture(tex)
		call SetCineFilterBlendMode(ConvertBlendMode(type1))
		call SetCineFilterTexMapFlags(ConvertTexMapFlags(type2))
		call SetCineFilterStartUV(0, 0, 1, 1)
		call SetCineFilterEndUV(0, 0, 1, 1)
		call SetCineFilterStartColor(r, g, b, startTrans)
		call SetCineFilterEndColor(r, g, b, endTrans)
		call SetCineFilterDuration(duration)
		call DisplayCineFilter(true)
	endfunction
	private function first takes nothing returns nothing
		local timer t = GetExpiredTimer()
		local integer key = GetHandleId(t)
		local integer r = LoadInteger(htb, key, 3)
		local integer g = LoadInteger(htb, key, 4)
		local integer b = LoadInteger(htb, key, 5)
		local integer lp = LoadInteger(htb, key, 1)
		local integer start = 0
		local integer end = 0
		if LoadBoolean(htb, key, 0) then
			if Player(lp)==GetLocalPlayer() then
				if LoadBoolean(htb, key, 11) then
					set start=LoadInteger(htb, key, 7)
				else
					set end=LoadInteger(htb, key, 6)
				endif
				call CinematicFadeCommon(LoadReal(htb, key, 2), LoadStr(htb, key, 8), LoadInteger(htb, key, 9), LoadInteger(htb, key, 10), r, g, b, start, end)
			endif
			call TimerStart(t, LoadReal(htb, key, 2), false, function second)
		else
			call DisplayCineFilter(false)
			call DestroyTimer(t)
			set Timer[lp] = null
			call FlushChildHashtable(htb, key)
		endif
		set t = null
	endfunction
	function XG_CinematicFadeForPlayer takes player p,integer fadetype, real duration, string tex,integer blendmodetype,integer texmapflagstype,integer red, integer green, integer blue, integer trans returns nothing
		local integer pid = GetPlayerId(p)
		local integer startTrans = trans
		local integer endTrans = trans
		local integer key
		local boolean b  = false
		local boolean b2 = true
		if Timer[pid] != null then
			call DestroyTimer(Timer[pid])
		endif
		set Timer[pid] = CreateTimer()
		set key = GetHandleId(Timer[pid])
		if fadetype == bj_CINEFADETYPE_FADEOUT then
			set startTrans = 0
		elseif fadetype == bj_CINEFADETYPE_FADEIN then
			set endTrans = 0
		elseif fadetype == bj_CINEFADETYPE_FADEOUTIN then
			set startTrans = 0
			set duration = duration * 0.5
			set b = true
		elseif fadetype == XG_CineType_FadeInOut then
			set duration = duration * 0.5
			set b = true
			set b2 = false
			set endTrans = 0
		endif
		if duration == 0 then
			set startTrans = endTrans
		endif
		call SaveBoolean(htb, key, 0, b)
		call SaveInteger(htb, key, 1, pid)
		call SaveReal(htb, key, 2, duration)
		call SaveInteger(htb, key, 3, red)
		call SaveInteger(htb, key, 4, green)
		call SaveInteger(htb, key, 5, blue)
		call SaveInteger(htb, key, 6, startTrans)
		call SaveInteger(htb, key, 7, endTrans)
		call SaveStr(htb, key, 8, tex)
		call SaveInteger(htb, key, 9, blendmodetype)
		call SaveInteger(htb, key, 10, texmapflagstype)
		call SaveBoolean(htb, key, 11, b2)
		call TimerStart(Timer[pid], duration, false, function first)
		if p == GetLocalPlayer() then
			call CinematicFadeCommon(duration, tex, blendmodetype, texmapflagstype, red, green, blue, startTrans, endTrans)
		endif
	endfunction
endlibrary

#endif
