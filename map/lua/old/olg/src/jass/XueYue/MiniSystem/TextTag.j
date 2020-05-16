#ifndef TextTagIncluded
#define TextTagIncluded

library SYTextChange 
		#ifndef XGHtbIncluded
		#define XGHtbIncluded
		globals
			hashtable Xg_htb = InitHashtable()
		endglobals
		#endif

function TextTagChangeAction takes nothing returns nothing
	call DestroyTextTag(LoadTextTagHandle(Xg_htb,GetHandleId(GetExpiredTimer()),-1222640383))
	call FlushChildHashtable(Xg_htb,GetHandleId(GetExpiredTimer()))
	call DestroyTimer(GetExpiredTimer())
endfunction

function TextTagChange takes texttag tt,real x,real y,real pastime,real deletetime returns nothing
	local integer i = 0
	local timer t = CreateTimer()
	//速率设置
	call SetTextTagVelocity(tt,x,y)
	//消逝时间设置
	call SetTextTagFadepoint(tt,pastime)
	//显示持续时长设置
	call SaveTextTagHandle(Xg_htb,GetHandleId(t),-1222640383,tt)
	call TimerStart(t,deletetime,false,function TextTagChangeAction)
	set t = null
endfunction

endlibrary

#endif
