#ifndef SY_DamageBaseIncluded
#define SY_DamageBaseIncluded
    #include "ShiYue\Define\ShiYueBase.Cons"


library SYDamageBaseBegin initializer SY_DamageBase


function SY_DamageBase takes nothing returns nothing		
local integer i = 0
local attacktype atk
local damagetype dam
local weapontype wea
	loop
		set i=i+1
		set atk=ConvertAttackType(i)
		call SaveInteger(SY_Hashtable,HA_CONS,GetHandleId(atk),i)
		exitwhen i==6
	endloop
	set atk=null
	set i=-1
	loop
		set i=i+1
		set dam=ConvertDamageType(i)
		call SaveInteger(SY_Hashtable,HA_CONS,GetHandleId(dam),i)
		exitwhen i==26
	endloop
	set dam=null
	set i=-1
	loop
		set i=i+1
		set wea=ConvertWeaponType(i)
		call SaveInteger(SY_Hashtable,HA_CONS,GetHandleId(wea),i)
		exitwhen i==23
	endloop
	set wea=null		
endfunction

endlibrary

#endif
