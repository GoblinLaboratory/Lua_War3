#ifndef Hc_GetUnitArmorUsed
#define Hc_GetUnitArmorUsed
#include "Log.j"
library HcGetUnitArmor requires HcLog
<?local Misc_DefenseArmor     = tonumber(require('slk').misc.Misc.DefenseArmor)?>
	function XGGetUnitArmor takes unit us,unit u,integer abilid,real testdam,real backlife returns real
    local real    life = GetWidgetLife(u)
    local real    test = life
    local real    redc = 0.
    local boolean enab = false
    local trigger trig = GetTriggeringTrigger()
	if <?=Misc_DefenseArmor?> ==0.00 then
		return 0
	endif
    if u != null and life >= 0.405 then
        if GetUnit/**/State(u, UNIT_STATE_MAX_LIFE) <= backlife then
            call UnitAddAbility(u, abilid)
        endif
        if life <= backlife then
            call SetWidgetLife(u, backlife)
            set test = backlife 
        endif
        if trig != null and IsTriggerEnabled(trig) then
            call DisableTrigger(trig)
            set enab = true
        endif
		
		call DisableTrigger(Xg_DamPlus_Trg)
        call UnitDamageTarget(us, u, testdam, false, true, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, null)
		call EnableTrigger(Xg_DamPlus_Trg)
        set redc = (testdam-test+GetWidgetLife(u))/testdam
        if enab then
            call EnableTrigger(trig)
        endif
        call UnitRemoveAbility(u, abilid)
        call SetWidgetLife(u, life)
        set trig = null
        if redc >= 1. then
            return 917451.519
        elseif redc < 0. then
            return -Log(redc+1.)/<?=string.format('%.6f', math.log(1.-Misc_DefenseArmor))?>
        else
            return redc/(<?=Misc_DefenseArmor?>*(1.-redc))
        endif
    endif
    set trig = null
    return 0.
	endfunction
endlibrary
#endif
