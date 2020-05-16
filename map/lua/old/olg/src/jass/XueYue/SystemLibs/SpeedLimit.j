#ifndef XGSpeedLimitIncluded
#define XGSpeedLimitIncluded

#define SpeedLimit_Speed -1
#define SpeedLimit_Sj -2
#define SpeedLimit_Timer -3

library HCSpeedLimit
globals
	private hashtable htb = InitHashtable()
endglobals
	private function Timer_Act takes nothing returns nothing
		local integer key = GetHandleId(GetExpiredTimer())
		local unit u = LoadUnitHandle(htb , key , 1)
		local integer hd = GetHandleId(u)
		local real ms = LoadReal(htb , hd , SpeedLimit_Speed)
		local real x0 = LoadReal(htb , key , 2)
		local real y0 = LoadReal(htb , key , 3)
		local real x1 = LoadReal(htb , key , 4)
		local real y1 = LoadReal(htb , key , 5)
		local real n = LoadReal(htb , key , 6)
		local real n2 = LoadReal(htb , key , 7)
		local real intj = LoadReal(htb , key , 8)
		local real x00 = LoadReal(htb , key , 9)
		local real y00 = LoadReal(htb , key , 10)
		local real cd = LoadReal(htb , key , 11)
		local real a
		local real a2
		local real d
		local real tempd
		local real ms0 = GetUnitMoveSpeed(u)
		
		set n = n + 0.01
		set n2 = n2 + 0.01
		if n2 >= intj then
			set n2 = 0
			set x00 = x0
			set y00 = y0
			set x0 = x1
			set y0 = y1
			set x1 = GetUnitX(u)
			set y1 = GetUnitY(u)
			set d = SquareRoot(Pow((x0-x1), 2)+Pow((y0-y1), 2))
			set a = Atan2(y1-y0, x1-x0)
			//set a2 = Atan2(y0-y00, x0-x00)
			set a2 = Deg2Rad(GetUnitFacing(u))
			if (Cos(a-a2)<0.9)and(d>ms0 * 0.8 * intj) then
				set cd = cd + 1 * intj
			endif
			if cd <= 0 or ms < ms0 then
				set cd = 0
				if (d<=550 * intj)and(d>ms0 * 0.8 * intj) then
					set tempd = ms * intj-d
					set x1 = x1 + tempd * Cos(a)
					set y1 = y1 + tempd * Sin(a)
					if (RectContainsCoords(bj_mapInitialPlayableArea , x1 , y1)) then
						call SetUnitX(u, x1)
						call SetUnitY(u, y1)            
					endif
				endif
			else
				set cd = cd-intj
			endif
		endif
		
		call SaveUnitHandle(htb , key , 1 , u)
		call SaveReal(htb , key , 2 , x0)
		call SaveReal(htb , key , 3 , y0)
		call SaveReal(htb , key , 4 , x1)
		call SaveReal(htb , key , 5 , y1)
		call SaveReal(htb , key , 6 , n)
		call SaveReal(htb , key , 7 , n2)
		call SaveReal(htb , key , 8 , intj)
		call SaveReal(htb , key , 9 , GetUnitX(u))
		call SaveReal(htb , key , 10 , GetUnitY(u))
		call SaveReal(htb , key , 11 , cd)
		
		set u = null
	endfunction


	function XG_SpeedLimit_Set takes unit u, real value returns nothing
		local timer t = LoadTimerHandle(htb, GetHandleId(u), SpeedLimit_Timer)
		local integer key
		local integer hd = GetHandleId(u)
		call SaveReal(htb, hd, SpeedLimit_Speed, value)
		if t == null then
			set t = CreateTimer()
		else
			set t = null
			return
		endif
		set key = GetHandleId(t)
		if value < 0 then
			set value = 0
		endif
		
		call SaveUnitHandle(htb , key , 1 , u)
		call SaveReal(htb , key , 2 , GetUnitX(u))
		call SaveReal(htb , key , 3 , GetUnitY(u))
		call SaveReal(htb , key , 4 , GetUnitX(u))
		call SaveReal(htb , key , 5 , GetUnitY(u))
		call SaveReal(htb , key , 6 , 0)
		call SaveReal(htb , key , 7 , 0)
		call SaveReal(htb , key , 8 , 0.02) //int_j
		call SaveReal(htb , key , 9 , GetUnitX(u))
		call SaveReal(htb , key , 10 , GetUnitY(u))
		call SaveReal(htb , key , 11 , 0)
		call SaveTimerHandle(htb, GetHandleId(u), SpeedLimit_Timer, t)
		call TimerStart(t, 0.01 , true , function Timer_Act)
		set t = null

	endfunction
	function XG_SpeedLimit_Off takes unit u returns nothing
		local integer key = GetHandleId(u)
		local timer t = LoadTimerHandle(htb, key, SpeedLimit_Timer)
		if t != null then
			call FlushChildHashtable(htb, GetHandleId(t))
			call PauseTimer( t )
			call DestroyTimer( t )
		endif

	endfunction
endlibrary

#endif
