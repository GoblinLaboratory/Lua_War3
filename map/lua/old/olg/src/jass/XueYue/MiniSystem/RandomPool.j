#ifndef Hc_RandomPool_Used
#define Hc_RandomPool_Used

library HcRandomPool
	globals
		private hashtable htb = InitHashtable()
		private integer ID = 0
	endglobals
	function XG_Destroy_RandomPool takes integer p returns nothing
		call FlushChildHashtable(htb, p)
	endfunction
	function XG_GetElementNum_RandomPool takes integer p returns integer
		return LoadInteger(htb, p, 0)
	endfunction
	//取得元素
	function XG_TakeElement_RandomPool_Ex takes integer p,boolean b returns real
		local integer num = LoadInteger(htb, p, 0)
		local integer ch
		local real val = -1
		local integer f
		if num > 0 then
			if LoadInteger(htb, p, -1) > 0 then //比重大于0 剩余
				loop
					set ch = GetRandomInt(1, num)
					set f = LoadInteger(htb, p, ch)
					if f > 0 then
						if GetRandomInt(1, 100) <= f then
							set val = LoadReal(htb, p , ch)
							exitwhen f > 0
						endif
					endif
				endloop
				call SaveInteger(htb, p, -1, LoadInteger(htb, p, -1) - 1) //重计算 比重大于0的元素 数量
			else
				set ch = GetRandomInt(1, num)
				set val = LoadReal(htb, p , ch)
			endif
			
			if b then //True 为取出 、 False 则仅仅获取 不会使该元素离开随机池
				if num > 1 then
					call SaveReal(htb, p, ch, LoadReal(htb, p, num)) //前移补足
					call RemoveSavedReal(htb, p, num)
				endif
				call SaveInteger(htb, p, 0, num - 1)
			endif
			
		endif
		return val
	endfunction
	function XG_AddLoopInt_RandomPool takes integer p, integer min, integer max, real f returns nothing
		local integer num = LoadInteger(htb, p, 0) //起始位置
		local integer x
		local integer n
		if max < min then
			set x = min
			set min = max
			set max = x
		endif
		set n = (max - min + 1) //新增数量
		call SaveInteger(htb, p, 0, num + n) //刷新池数量
		if f > 0.0 then
			call SaveInteger(htb, p, -1, LoadInteger(htb, p, -1) + n)
		endif
		set x = 1
		loop
			exitwhen x > n
			call SaveReal(htb, p, num + x, I2R(min+x-1))
			call SaveInteger(htb, p, num + x, R2I(f * 100))
			set x = x + 1
		endloop
	endfunction
	function XG_AddElement_RandomPool takes integer p, real val, real f returns nothing
		local integer num = LoadInteger(htb, p, 0) + 1
		call SaveInteger(htb, p, 0, num)
		call SaveReal(htb, p, num, val)
		call SaveInteger(htb, p, num, R2I(f * 100))
		if f > 0.0 then
			call SaveInteger(htb, p, -1, LoadInteger(htb, p, -1) + 1)
		endif
	endfunction
	function XG_RandomPool_Create takes nothing returns integer
		local integer i = 1
		//local integer num = max - min + 1
		set ID = ID + 1
		//call SaveInteger(htb, ID, 0, num) //池数量
		return ID
	endfunction
endlibrary
#endif
