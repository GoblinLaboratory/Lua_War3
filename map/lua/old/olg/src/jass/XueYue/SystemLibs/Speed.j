#ifndef XGSpeedIncluded
#define XGSpeedIncluded

#include "XueYue\Base.j"
library XGSpeed requires XGbase
	#define SPD_UNIT   1
	#define SPD_VALUE  2
	#define SPD_EFFECT 3
	#define SPD_TIMER  4
	globals
		integer last_XgSpeedId=-1
		private real MinSpeed = <?= tonumber(require('slk').misc.Misc.MinUnitSpeed) ?>
		private real MaxSpeed = <?= tonumber(require('slk').misc.Misc.MaxUnitSpeed) ?>
	endglobals
	//删除减速
	function Xg_DSpeed takes integer id returns nothing
		local unit u= LoadUnitHandle(Xg_htb,id,SPD_UNIT)
		local real Low = LoadReal(Xg_htb,id,SPD_VALUE)
		if Low<0 then
			call SetUnitMoveSpeed( u, GetUnitMoveSpeed( u )  - Low ) //减速还原
		else
			call SetUnitMoveSpeed( u, GetUnitMoveSpeed( u )  - Low ) //加速还原
		endif
		call DestroyEffect( LoadEffectHandle(Xg_htb,id,SPD_EFFECT) )
		call FlushChildHashtable(Xg_htb,id)
		call DestroyTimer(LoadTimerHandle(Xg_htb,id,SPD_TIMER))
		set u = null
		endfunction
	function Xg_Speed_timer takes nothing returns nothing
		call Xg_DSpeed(GetHandleId(GetExpiredTimer()))
	endfunction
	//百分比减速
	function Xg_SpeedA takes unit u,integer ty,real r,real keep,string ui,string text returns integer
		local real MoveSpeed = GetUnitMoveSpeed( u )
		local timer t
		local effect ef
		local integer id
		local real Low  //减少的移动速度
		if keep <=0 then
			set last_XgSpeedId = -1
			return -1
		endif
		set r = r * ty
		if r < 0 then //减速
			if MoveSpeed <= MinSpeed then
				set last_XgSpeedId = -1
				return -1 //该单位的移动速度已无法再下降
			elseif MoveSpeed * (1 + r) < MinSpeed then //减速值溢出
				set Low = -( MoveSpeed - MinSpeed )
			else
				set Low = -( MoveSpeed * -r )
			endif
		elseif r == 0 then
			set last_XgSpeedId = -1
			return -1
		else //加速
			if MoveSpeed >= MaxSpeed then
				set last_XgSpeedId = -1
				return -1 //该单位的移动速度已无法再增加
			elseif MoveSpeed * (1 + r) > MaxSpeed  then //加速值溢出
				set Low = MaxSpeed - MoveSpeed
			else
				set Low = MoveSpeed * r
			endif
		endif
		set t = CreateTimer()
		set ef = AddSpecialEffectTarget( ui, u, text )
		call SetUnitMoveSpeed( u, MoveSpeed + Low )
		set id = GetHandleId( t )
		call SaveReal( Xg_htb, id,SPD_VALUE, Low )
		call SaveUnitHandle( Xg_htb, id, SPD_UNIT, u )
		call SaveEffectHandle( Xg_htb, id, SPD_EFFECT, ef )
		call SaveTimerHandle(Xg_htb,id,SPD_TIMER,t)
		call TimerStart(t,keep,false,function Xg_Speed_timer)
		set t = null
		set ef = null
		set last_XgSpeedId = id
		return id
	endfunction
	//固定值减速
	function Xg_SpeedB takes unit u,integer ty,real val,real keep,string ui,string text returns integer
		local real MoveSpeed = GetUnitMoveSpeed( u )
		local timer t
		local effect ef
		local integer id
		local real Low  //减少的移动速度
		if keep <=0 then
			set last_XgSpeedId=-1
			return -1
		endif
		set val = val * ty
		if val < 0 then //减速
			if MoveSpeed <= MinSpeed then
				set last_XgSpeedId=-1
				return -1 //该单位的移动速度已无法再下降
			elseif MoveSpeed + val < MinSpeed then //减速值溢出
				set Low = -( MoveSpeed - MinSpeed )
			else
				 set Low = val
			endif
		elseif val == 0 then
			set last_XgSpeedId=-1
			return -1
		else //加速
			if MoveSpeed >= MaxSpeed then//该单位的移动速度已无法再增加
				set last_XgSpeedId = -1
				return -1
			elseif MoveSpeed + val > MaxSpeed  then //加速值溢出
				set Low = MaxSpeed - MoveSpeed
			else
				set Low = val
			endif
		endif
		set t = CreateTimer()
		set ef = AddSpecialEffectTarget( ui, u, text )
		call SetUnitMoveSpeed( u, MoveSpeed + Low )
		set id = GetHandleId(t)
		call SaveReal( Xg_htb, id, SPD_VALUE, Low )
		call SaveUnitHandle( Xg_htb, id, SPD_UNIT, u )
		call SaveEffectHandle( Xg_htb, id, SPD_EFFECT, ef )
		call SaveTimerHandle( Xg_htb, id, SPD_TIMER, t )
		call TimerStart( t, keep, false, function Xg_Speed_timer )
		set t = null
		set ef = null
		set last_XgSpeedId = id
		return id
	endfunction

endlibrary

#endif
