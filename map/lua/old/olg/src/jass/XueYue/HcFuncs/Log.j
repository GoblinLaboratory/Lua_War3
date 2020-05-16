#ifndef HC_Log_Used
#define HC_Log_Used
library HcLog
	<?local Misc_DefenseArmor     = tonumber(require('slk').misc.Misc.DefenseArmor)?>
	function Log takes real x returns real
    local real min = -88.0
    local real max = 88.0
    local real mid
    local integer i = 20
    loop
        set mid = (min + max) / 2
        exitwhen(i <= 0)
        set i = i - 1
        if(Pow(bj_E, mid) >= x) then
            set max = mid
        else
            set min = mid
        endif
    endloop
    return mid
	endfunction
endlibrary
#endif
