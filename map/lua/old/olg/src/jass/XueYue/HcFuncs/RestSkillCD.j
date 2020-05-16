#ifndef HC_RestSkillCD_Used
#define HC_RestSkillCD_Used
library HCRestSkillCD
	function XG_RestSkillCD takes unit u,integer abil returns nothing
		local integer level=GetUnitAbilityLevel(u,abil)
		if level <=0 then
			return
		endif
		call UnitRemoveAbility(u,abil)
		call UnitAddAbility(u,abil)
		call SetUnitAbilityLevel(u,abil,level)
	endfunction
endlibrary
#endif
