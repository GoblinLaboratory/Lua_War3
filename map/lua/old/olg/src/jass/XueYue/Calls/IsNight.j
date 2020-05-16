#ifndef XGIsNightIncluded
#define XGIsNightIncluded

library HCIsNight
	globals
		private constant real Dusk = <?=tonumber(require('slk').misc.Misc.Dusk)?>	//黄昏
		private constant real Dawn = <?=tonumber(require('slk').misc.Misc.Dawn)?>	//黎明
		private constant real Long = <?=tonumber(require('slk').misc.Misc.DayHours)?>	//一天的长度
	endglobals
	
	function XG_DistanceNightFalls takes nothing returns real
		local real t = GetFloatGameState(GAME_STATE_TIME_OF_DAY)
		if t >= Dusk or t < Dawn then
			return 0.00 //天黑着呢！
		endif
		return Dusk - t
	endfunction
/*
1 2 3 4 5 6 7 8 9 10 11 12 13 14
 15 16 17 18 19 20 21 22 23 24
*/
	function XG_DistanceDayLight takes nothing returns real
		local real t = GetFloatGameState(GAME_STATE_TIME_OF_DAY)
		if t >= Dawn and t < Dusk then
			return 0.00 //天亮着呢！
		elseif t >= Dusk then
			return Long - t + Dawn
		endif
		return Dawn - t
	endfunction
	
	function XG_IsNight takes nothing returns boolean
		local real t = GetFloatGameState(GAME_STATE_TIME_OF_DAY)
		return t >= Dusk or t < Dawn 
	endfunction
	
endlibrary

#endif
