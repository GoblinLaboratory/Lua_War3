#ifndef HC_String_zd_Used
#define HC_String_zd_Used
library HcStringzd
	function Xg_String_zd takes string text,string left,string right returns string
		local integer a = -1
		local integer b = -1
		local integer i = 1
		local integer ALen = StringLength(text)
		local integer LLen = StringLength(left)
		local integer RLen = StringLength(right)
		loop
			exitwhen i > ALen
			if a == -1 then
				if SubString( text, i - 1, i - 1 + LLen ) == left then
					set a = i - 1 + LLen
				endif
			elseif b == -1 then
				if SubString( text, i - 1, i - 1 + RLen ) == right then
					set b = i - 1
				endif
			endif
			set i = i + 1
		endloop
		if a == -1 or b == -1 then
			return ""
		endif
		return SubString( text, a, b )
	endfunction
endlibrary
#endif
