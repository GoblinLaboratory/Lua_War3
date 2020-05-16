#ifndef Hc_DestroEffect_Used
#define Hc_DestroEffect_Used
library HCDestroyEffect
		#ifndef XGHtbIncluded
		#define XGHtbIncluded
			hashtable Xg_htb = InitHashtable()
		#endif
	private function TimerForEff takes nothing returns nothing
		local timer t = GetExpiredTimer()
		local integer key = GetHandleId(t)
		call DestroyEffect(LoadEffectHandle(Xg_htb, key, 0))
		call FlushChildHashtable(Xg_htb, key)
		call DestroyTimer(t)
		set t = null
	endfunction

	function XG_DestroyEffectByTimer takes real time,effect eff returns nothing
		local timer t = CreateTimer()
		call SaveEffectHandle(Xg_htb, GetHandleId(t), 0, eff)
		call TimerStart(t, time, false,function TimerForEff)
		set t=null
	endfunction
endlibrary
#endif
