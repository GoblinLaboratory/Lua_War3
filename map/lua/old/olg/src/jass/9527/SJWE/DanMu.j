#ifndef DanMuIncluded
#define DanMuIncluded
#include "9527/SJWE/UnitAlive.j"
#include "9527/SJWE/SJWEBase.j"
#include "9527/SJWE/TerrainPathability.j"

library DanMu uses SJWEBase,TerrainPathability
	
globals
	private group g = CreateGroup()
	private boolean b
	private real damage_D
	public unit u1
	public unit u2
	public unit ue
endglobals

private function danmu takes nothing returns nothing
	if GetWidgetLife(GetEnumDestructable()) > 0 then
   	 	call SetWidgetLife(GetEnumDestructable(),GetWidgetLife(GetEnumDestructable()) - damage_D)
    	set b = true
	endif
endfunction

private function danmu_move takes nothing returns nothing
	local integer id = GetHandleId(GetExpiredTimer())
	local real n = LoadReal(DATA,id,8)+1
	local real v = LoadReal(DATA,id,3)+LoadReal(DATA,id,11)*n
	local real angle
	local real range = LoadReal(DATA,id,6)
	local boolean b0 = false
	local real x
	local real y
	local rect rct
	local boolean array b_Dis
	local boolean b_u
	set u1 = LoadUnitHandle(DATA,id,1)
	set u2 = LoadUnitHandle(DATA,id,2)
	set angle = GetUnitFacing(u1)
	set x = GetUnitX(u1)+v*Cos(angle* bj_DEGTORAD)
	set y = GetUnitY(u1)+v*Sin(angle* bj_DEGTORAD)
	if x > SJWEMaxX or x < SJWEMinX or y < SJWEMinY or y > SJWEMaxY then
		call KillUnit(u1)
    	call DestroyGroup(LoadGroupHandle(DATA,id,14))
    	call FlushChildHashtable(DATA,id)
    	call PauseTimer(GetExpiredTimer())
    	call DestroyTimer(GetExpiredTimer())
    	return
	endif
    set damage_D = LoadReal(DATA,id,7)
    call SaveReal(DATA,id,8,n)
	if not (IsTerrainWalkable(x,y) or LoadBoolean(DATA,id,15)) then
    	set b = false
    	if LoadBoolean(DATA,id,16) then
        	set rct = Rect(x-range*2, y-range*2, x+64+range, y+64+range)
        	call EnumDestructablesInRect(rct,null,function danmu)
        	call RemoveRect(rct)
			set rct = null
    	endif
   		if b then
        	set b0 = true
    	elseif not LoadBoolean(DATA,id,12) then
        	set b_Dis[1]=IsTerrainWalkable(x+v,y)//右
        	set b_Dis[2]=IsTerrainWalkable(x,y+v)//上
        	set b_Dis[3]=IsTerrainWalkable(x-v,y)//左
        	set b_Dis[4]=IsTerrainWalkable(x,y-v)//下
        	if b_Dis[1] and b_Dis[2]==false and b_Dis[3]==false and b_Dis[4]==false then
            	call SetUnitFacing(u1,180-angle)
        	elseif b_Dis[1]==false and b_Dis[2] and b_Dis[3]==false and b_Dis[4]==false then
            	call SetUnitFacing(u1,-angle)
        	elseif b_Dis[1]==false and b_Dis[2]==false and b_Dis[3] and b_Dis[4]==false then
            	call SetUnitFacing(u1,180-angle)
        	elseif b_Dis[1]==false and b_Dis[2]==false and b_Dis[3]==false and b_Dis[4] then
            	call SetUnitFacing(u1,-angle)
        	else
            	call SetUnitFacing(u1,angle+180)
        	endif
    	else
        	set b0 = true
    	endif
	else
    	call SetUnitX(u1,x)
    	call SetUnitY(u1,y)
	endif
    call GroupEnumUnitsInRange(g,x,y,range,null)
    loop
    	set ue = FirstOfGroup(g)
    	exitwhen ue == null
        if ue == u1 then
            set b_u = false
        else
            if LoadBoolean(DATA,id,18) then
                set b_u = true
            else
                set b_u = IsUnitEnemy(u2,GetOwningPlayer(ue))
            endif
        endif
        if b_u and IsUnitAlive(u2) and IsUnitAlive(ue) and (not IsUnitType(GetTriggerUnit(), UNIT_TYPE_STRUCTURE)) and not IsUnitInGroup(u2,LoadGroupHandle(DATA,id,14)) then
            if TriggerEvaluate(LoadTriggerHandle(DATA,id,17))!=null then
                call TriggerExecute(LoadTriggerHandle(DATA,id,17))
            endif
            call GroupAddUnit(LoadGroupHandle(DATA,id,14),u2)
            if LoadBoolean(DATA,id,13) then
                set b0 = true
            endif
            if LoadBoolean(DATA,id,10) then
   				call UnitDamageTarget(u2,ue,damage_D,true, false, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
			else
    			call UnitDamageTarget(u2,ue,damage_D,true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_FIRE, WEAPON_TYPE_WHOKNOWS )
			endif
        endif
    	call GroupRemoveUnit(g,ue)
    endloop
	if b0 or n > LoadReal(DATA,id,9) then
    	call KillUnit(u1)
    	call DestroyGroup(LoadGroupHandle(DATA,id,14))
    	call FlushChildHashtable(DATA,id)
    	call PauseTimer(GetExpiredTimer())
    	call DestroyTimer(GetExpiredTimer())
	endif
endfunction

function DanMu takes unit u,unit u0,real v,real v2,real range,real damage,real time,boolean b1,boolean b2,boolean b3,boolean b4,boolean b5,boolean b6,trigger tr returns nothing
	local timer t = CreateTimer()
	local integer id = GetHandleId(t)
    call SaveUnitHandle(DATA,id,1,u)
    call SaveUnitHandle(DATA,id,2,u0)
    call SaveReal(DATA,id,3,v*0.03)
    call SaveReal(DATA,id,6,range)
    call SaveReal(DATA,id,7,damage)
    call SaveReal(DATA,id,8,0)
    call SaveReal(DATA,id,9,time/0.03)
    call SaveBoolean(DATA,id,10,b1)
    call SaveReal(DATA,id,11,(v2-v)*0.03/(time/0.03))
    call SaveBoolean(DATA,id,12,b2)
    call SaveBoolean(DATA,id,13,b3)
    call SaveGroupHandle(DATA,id,14,CreateGroup())
    call SaveBoolean(DATA,id,15,b4)
    call SaveBoolean(DATA,id,16,b5)
    call SaveTriggerHandle(DATA,id,17,tr)
    call SaveBoolean(DATA,id,18,b6)
    call TimerStart(t,0.03,true,function danmu_move)
	set t = null
endfunction

endlibrary

#endif
