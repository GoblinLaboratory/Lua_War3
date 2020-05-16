#ifndef XGEventsLibIncluded
#define XGEventsLibIncluded

library XGEventsLib initializer Init/* 雪月编辑器的动态事件与变量声明 */
	globals
			private hashtable htb = InitHashtable()
			private trigger UnitEnterMap = CreateTrigger()

	endglobals
	function XG_Event_Reg takes trigger trg returns nothing
		local integer i = LoadInteger(htb,)
	endfunction
    private function UnitEnterMapFilter takes nothing returns boolean
        local unit u = GetFilterUnit()

        if GetUnitAbilityLevel( u, 'Aloc') == 0 then
            call TriggerRegisterUnitEvent(Xg_DamPlus_Trg, u, EVENT_UNIT_DAMAGED)
        endif
        set u = null
		return false
    endfunction
	
	private function Init takes nothing returns nothing
			local group g = CreateGroup()
			local rect r = GetWorldBounds()
			local region rectRegion = CreateRegion()

			call GroupEnumUnitsInRect(g, r, Condition(function UnitEnterMapFilter))
			call DestroyGroup(g)
			set g = null

			set UnitEnterMap = CreateTrigger()
			call RegionAddRect(rectRegion, r)
			call TriggerRegisterEnterRegion(UnitEnterMap, rectRegion, Condition(function UnitEnterMapFilter))
			set r = null
	endfunction
endlibrary
#endif
