#ifndef Hc_TriggerRegisterEnterRectSimple_Used
#define Hc_TriggerRegisterEnterRectSimple_Used
library HcTriggerRegisterEnterRectSimple
	function Xg_TriggerRegisterEnterRectSimple takes trigger trig, rect r returns event
		local region rectRegion = CreateRegion()
		call RegionAddRect(rectRegion, r)
		return TriggerRegisterEnterRegion(trig, rectRegion, null)
	endfunction
endlibrary
#endif
