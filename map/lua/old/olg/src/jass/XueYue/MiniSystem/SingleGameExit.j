#ifndef Hc_SingleGameExit_Used
#define Hc_SingleGameExit_Used
library HcSingleGameExit initializer XG_SingleGameExit_Init
	function XG_SingleGameExit_Init takes nothing returns nothing
	local gamecache GC=InitGameCache("jassUttils")
	if SaveGameCache(GC) then
		call ExecuteFunc("XG_SingleGameExit_Init")
	endif
	endfunction
endlibrary
#endif
