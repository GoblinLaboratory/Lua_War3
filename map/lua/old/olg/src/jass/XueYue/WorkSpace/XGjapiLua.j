#ifndef XGjapiLuaIncluded
#define XGjapiLuaIncluded

#include "XGbase.j"

library JapiLua initializer InitJapiLua requires XGbase
<?import("JapiLua.lua")[=[
local message = require "jass.message"
local jass = require "jass.common"
local trg = jass.CreateTrigger()
jass.SaveTriggerHandle(Xg_htb,jass.StringHash("JapiLua"),jass.StringHash("MouseTrig"),trg)
jass.TriggerAddAction(trg,
function(
	local x, y = message.mouse()
	jass.SaveLocationHandle(Xg_htb,jass.StringHash("JapiLua"),jass.StringHash("MouseLoc"),jass.Location(x,y))
	jass.BJDebugMsg("5555")
))

]=]?>

function GetMouseLoc takes nothing returns location
call TriggerExecute( LoadTriggerHandle(Xg_htb,StringHash("JapiLua"),StringHash("MouseTrig")) )
return LoadLocationHandle(Xg_htb,StringHash("JapiLua"),StringHash("MouseLoc"))
endfunction

function InitJapiLua takes nothing returns nothing
call Cheat( "exec-lua:\"JapiLua\"" )
endfunction
endlibrary

#endif
