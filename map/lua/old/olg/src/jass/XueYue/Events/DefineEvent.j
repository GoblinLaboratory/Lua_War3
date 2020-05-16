#ifndef XGDefineEventIncluded
#define XGDefineEventIncluded

#include "XueYue\Base.j"

library XGDefineEvent requires XGbase
	globals
		hashtable Xg_DefineEvent = InitHashtable()
	endglobals
	function Xg_RegDefineEvent takes trigger trg,string s returns boolean
		local integer i=LoadInteger(Xg_htb,StringHash("自定义触发_"+s),0) + 1
		call SaveInteger(Xg_htb,StringHash("自定义触发_"+s),0,i)
		call SaveTriggerHandle(Xg_htb,StringHash("自定义触发_"+s),i,trg)
		return true
	endfunction

	function Xg_ExecuteTrigger takes string s returns nothing
		local integer all=LoadInteger(Xg_htb,StringHash("自定义触发_"+s),0)
		local integer i=1
		local trigger trg=null
		loop
			exitwhen i>all
			set trg=LoadTriggerHandle(Xg_htb,StringHash("自定义触发_"+s),i)
			if trg!=null then
				call ConditionalTriggerExecute(trg)
			endif
			set i = i + 1
		endloop
		call FlushParentHashtable(Xg_DefineEvent)
		set Xg_DefineEvent = InitHashtable()
	endfunction

endlibrary

#endif
