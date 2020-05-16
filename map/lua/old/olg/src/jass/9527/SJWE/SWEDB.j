#ifndef SWEDBIncluded
#define SWEDBIncluded

library_once SWEDB requires YDWETriggerEvent,HatredSystem,UnitAlive,SWEsystem,SJTimersystem,SJBUFFsystem
	
//============================================================================================================================================================
//=============================================BUFF系统与伤害对接=============================================================================================
//============================================================================================================================================================

function BuffDamage_over_time takes unit DamageSource, unit DamagedUnit, integer buffcode, real intervaltime, integer AttackTypeID, real damage returns nothing
    if (UnitInCheckBuffList(DamagedUnit) == true) and (GetBuffBooleanData(buffcode,14) == true) then 
		if (GetUnitAbilityLevel(DamagedUnit, buffcode) == 0) then
		    call AddBuffSystem(DamageSource,DamagedUnit,buffcode)
		    call SaveTimerHandle(DATA,StringHash(I2S(GetHandleId(DamagedUnit)) + "Timer"),buffcode,CreateTimer())
		    call MimeticdDamage_over_time_system(LoadTimerHandle(DATA,StringHash(I2S(GetHandleId(DamagedUnit)) + "Timer"),buffcode),intervaltime,GetUnitBuffAttribute(DamagedUnit,buffcode,2),AttackTypeID,DamageSource,DamagedUnit,damage)
		elseif (GetUnitAbilityLevel(DamagedUnit, buffcode) > 0) then
		    call AddBuffSystem(DamageSource,DamagedUnit,buffcode)
			if (GetBuffBooleanData(buffcode,7) == true) then
			    if (GetUnitBuffStories(DamagedUnit,buffcode) < GetUnitBuffStoriesMax(DamagedUnit,buffcode)) then
			        call SetContinuousTimer_Timeout(LoadTimerHandle(DATA,StringHash(I2S(GetHandleId(DamagedUnit)) + "Timer"),buffcode),GetContinuousTimer_Timeout(LoadTimerHandle(DATA,StringHash(I2S(GetHandleId(DamagedUnit)) + "Timer"),buffcode))+GetUnitBuffAttribute(DamagedUnit,buffcode,8))
			    endif
			elseif (GetBuffBooleanData(buffcode,7) == false) then
			    if (GetUnitBuffStories(DamagedUnit,buffcode) < GetUnitBuffStoriesMax(DamagedUnit,buffcode)) then
			        call SetContinuousTimer_Time(LoadTimerHandle(DATA,StringHash(I2S(GetHandleId(DamagedUnit)) + "Timer"),buffcode),0.0)
			    endif
			endif
		endif
	endif
endfunction

function MimeticdBuffMeleeDamage_over_time takes unit DamageSource, unit DamagedUnit, integer buffcode, real intervaltime, integer AttackTypeID, integer SkillID, real damage returns nothing
    if (UnitInCheckBuffList(DamagedUnit) == true) and (GetBuffBooleanData(buffcode,14) == true) then 
		if (GetUnitAbilityLevel(DamagedUnit, buffcode) == 0) then
		    call AddBuffSystem(DamageSource,DamagedUnit,buffcode)
		    call SaveTimerHandle(DATA,StringHash(I2S(GetHandleId(DamagedUnit)) + "Timer"),buffcode,CreateTimer())
		    call MimeticdMeleeDamage_over_time_system(LoadTimerHandle(DATA,StringHash(I2S(GetHandleId(DamagedUnit)) + "Timer"),buffcode),intervaltime,GetUnitBuffAttribute(DamagedUnit,buffcode,2),AttackTypeID,SkillID,DamageSource,DamagedUnit,damage)
		elseif (GetUnitAbilityLevel(DamagedUnit, buffcode) > 0) then
		    call AddBuffSystem(DamageSource,DamagedUnit,buffcode)	
			if (GetBuffBooleanData(buffcode,7) == true) then
			    if (GetUnitBuffStories(DamagedUnit,buffcode) < GetUnitBuffStoriesMax(DamagedUnit,buffcode)) then
			        call SetContinuousTimer_Timeout(LoadTimerHandle(DATA,StringHash(I2S(GetHandleId(DamagedUnit)) + "Timer"),buffcode),GetContinuousTimer_Timeout(LoadTimerHandle(DATA,StringHash(I2S(GetHandleId(DamagedUnit)) + "Timer"),buffcode))+GetUnitBuffAttribute(DamagedUnit,buffcode,8))
			    endif
			elseif (GetBuffBooleanData(buffcode,7) == false) then
			    if (GetUnitBuffStories(DamagedUnit,buffcode) < GetUnitBuffStoriesMax(DamagedUnit,buffcode)) then
			        call SetContinuousTimer_Time(LoadTimerHandle(DATA,StringHash(I2S(GetHandleId(DamagedUnit)) + "Timer"),buffcode),0.0)
			    endif
			endif
		endif
	endif
endfunction

function MimeticdBuffMagicDamage_over_time takes unit DamageSource, unit DamagedUnit, integer buffcode, real intervaltime, integer AttackTypeID, integer SkillID, real damage returns nothing
    if (UnitInCheckBuffList(DamagedUnit) == true) and (GetBuffBooleanData(buffcode,14) == true) then 
		if (GetUnitAbilityLevel(DamagedUnit, buffcode) == 0) then
		    call AddBuffSystem(DamageSource,DamagedUnit,buffcode)
		    call SaveTimerHandle(DATA,StringHash(I2S(GetHandleId(DamagedUnit)) + "Timer"),buffcode,CreateTimer())
		    call MimeticdMagicDamage_over_time_system(LoadTimerHandle(DATA,StringHash(I2S(GetHandleId(DamagedUnit)) + "Timer"),buffcode),intervaltime,GetUnitBuffAttribute(DamagedUnit,buffcode,2),AttackTypeID,SkillID,DamageSource,DamagedUnit,damage)
		elseif (GetUnitAbilityLevel(DamagedUnit, buffcode) > 0) then
		    call AddBuffSystem(DamageSource,DamagedUnit,buffcode)
			if (GetBuffBooleanData(buffcode,7) == true) then
			    if (GetUnitBuffStories(DamagedUnit,buffcode) < GetUnitBuffStoriesMax(DamagedUnit,buffcode)) then
			        call SetContinuousTimer_Timeout(LoadTimerHandle(DATA,StringHash(I2S(GetHandleId(DamagedUnit)) + "Timer"),buffcode),GetContinuousTimer_Timeout(LoadTimerHandle(DATA,StringHash(I2S(GetHandleId(DamagedUnit)) + "Timer"),buffcode))+GetUnitBuffAttribute(DamagedUnit,buffcode,8))
			    endif
			elseif (GetBuffBooleanData(buffcode,7) == false) then
			    if (GetUnitBuffStories(DamagedUnit,buffcode) < GetUnitBuffStoriesMax(DamagedUnit,buffcode)) then
			        call SetContinuousTimer_Time(LoadTimerHandle(DATA,StringHash(I2S(GetHandleId(DamagedUnit)) + "Timer"),buffcode),0.0)
			    endif
			endif
		endif
	endif
endfunction

function BuffHealing_over_time takes unit HealingUnit, unit HealedUnit, integer buffcode, real intervaltime, integer SkillID, real HealingAbility returns nothing
    if (UnitInCheckBuffList(HealedUnit) == true) and (GetBuffBooleanData(buffcode,14) == true) then 
		if (GetUnitAbilityLevel(HealedUnit, buffcode) == 0) then
		    call AddBuffSystem(HealingUnit,HealedUnit,buffcode)
		    call SaveTimerHandle(DATA,StringHash(I2S(GetHandleId(HealedUnit)) + "Timer"),buffcode,CreateTimer())
		    call Healing_over_time_system(LoadTimerHandle(DATA,StringHash(I2S(GetHandleId(HealedUnit)) + "Timer"),buffcode),intervaltime,GetUnitBuffAttribute(HealedUnit,buffcode,2),SkillID,HealingUnit,HealedUnit,HealingAbility)
		elseif (GetUnitAbilityLevel(HealedUnit, buffcode) > 0) then
		    call AddBuffSystem(HealingUnit,HealedUnit,buffcode)
			if (GetBuffBooleanData(buffcode,7) == true) then
			    if (GetUnitBuffStories(HealedUnit,buffcode) < GetUnitBuffStoriesMax(HealedUnit,buffcode)) then
			        call SetContinuousTimer_Timeout(LoadTimerHandle(DATA,StringHash(I2S(GetHandleId(HealedUnit)) + "Timer"),buffcode),GetContinuousTimer_Timeout(LoadTimerHandle(DATA,StringHash(I2S(GetHandleId(HealedUnit)) + "Timer"),buffcode))+GetUnitBuffAttribute(HealedUnit,buffcode,8))
			    endif
			elseif (GetBuffBooleanData(buffcode,7) == false) then
			    if (GetUnitBuffStories(HealedUnit,buffcode) < GetUnitBuffStoriesMax(HealedUnit,buffcode)) then
			        call SetContinuousTimer_Time(LoadTimerHandle(DATA,StringHash(I2S(GetHandleId(HealedUnit)) + "Timer"),buffcode),0.0)
			    endif
			endif
		endif
	endif
endfunction

endlibrary

#endif