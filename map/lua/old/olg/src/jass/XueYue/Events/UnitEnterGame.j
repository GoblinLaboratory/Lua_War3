#ifndef XGUnitEnterGameIncluded
#define XGUnitEnterGameIncluded

library HCUnitEnterGame initializer Init
	globals
		private trigger	array	Trigger
		private integer			Num		=	0
	endglobals
	private function EnterGame takes nothing returns boolean
		local integer i = 1
		loop
			exitwhen i > Num
			if IsTriggerEnabled(Trigger[i]) then
				if TriggerEvaluate(Trigger[i]) then
					call TriggerExecute(Trigger[i])
				endif
			endif
			set i = i + 1
		endloop
		return false
	endfunction
	function XG_UnitEnterGame_Reg takes trigger trg returns nothing
		set Num = Num + 1
		set Trigger[Num] = trg
	endfunction
	private function Timer takes nothing returns nothing
		local group		g = CreateGroup()
		local rect		r = GetWorldBounds()
		local region	rG	=	CreateRegion()
		call GroupEnumUnitsInRect(g, r, Condition(function EnterGame))
		call DestroyGroup(g)
		
		set Trigger[0] = CreateTrigger()
        call RegionAddRect(rG, r)
        call TriggerRegisterEnterRegion(Trigger[0], rG, Condition(function EnterGame))
		call RemoveRect(r)
		
		call RemoveRect(r)
		set r  = null
		set rG = null
		set g  = null
		call DestroyTimer(GetExpiredTimer())
	endfunction
	private function Init takes nothing returns nothing
		call TimerStart(CreateTimer(),0.0,false,function Timer)
	endfunction
	
endlibrary
#endif
