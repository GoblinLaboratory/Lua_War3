#ifndef HC_StrColor_Used
#define HC_StrColor_Used
library HcStrColor
	function Xg_StrColor takes nothing returns string
		local string str=""
		local string s="0123456789abcdef"
		local integer i = 1
		local integer a
		loop
			exitwhen i>6
			set a=GetRandomInt(1,16)
			set str = str + SubString(s,a-1,a)
			set i=i+1
		endloop
		return "|cff"+str
	endfunction
endlibrary
#endif
