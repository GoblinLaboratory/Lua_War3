#ifndef CKRefreshIncluded
#define CKRefreshIncluded
#include "9527/SJWE/SJWEBase.j"

library CKRefresh 
	
globals
    private real stupidrevd//野怪刷新间隔
    private real starttime//初始刷野时机
    private real area//野怪分区半径
    private real visibleareacheck = 550//检测DOTA刷野模式视野
    private integer IdNotAttack//野怪不主动攻击的技能id,一般是-1秒的永久隐身.
    public boolean DOTAMODE
endglobals
//以下为刷野需要用到的变量 无视即可
globals
    private group array g
    private integer i = 0
    private integer a = 0
    private integer z = 0
    private group gg = CreateGroup()
    private group gt = CreateGroup()
    private unit u
    private hashtable HT2=InitHashtable()
    private boolean b = false
    private real x
    private real y
    private real f
    private integer groupcount = 0
    private trigger tg
endglobals
//将野怪按距离分组
private function f2 takes nothing returns boolean
    if (GetOwningPlayer(GetFilterUnit()) == Player(12))and IsUnitInGroup(GetFilterUnit(), gt) == false then
        call GroupAddUnit(gt, GetFilterUnit())
        call GroupRemoveUnit(gg, GetFilterUnit())
        call SaveGroupHandle(DATA, GetHandleId(GetFilterUnit()), 1, g[i])
        call SaveReal(DATA, GetHandleId(GetFilterUnit()), 2, GetUnitX(GetFilterUnit()))
        call SaveReal(DATA, GetHandleId(GetFilterUnit()), 3, GetUnitY(GetFilterUnit()))
        return true
    endif
    return false
endfunction
//遍历初始化地图上的野怪
private function f1 takes nothing returns nothing
    set u = GetEnumUnit()
    if IsUnitInGroup(u, gt) then
        return
    endif
    set g[i] = CreateGroup()
    call SaveGroupHandle(DATA, GetHandleId(u), 1, g[i])
    call SaveReal(DATA, GetHandleId(u), 2, GetUnitX(u))
    call SaveReal(DATA, GetHandleId(u), 3, GetUnitY(u))
    call GroupEnumUnitsInRange(g[i], GetUnitX(u), GetUnitY(u), area, function f2)//300为判断野怪是否划分为一波的距离限定
    set i = i + 1
endfunction
//保存每组野怪的参数
private function f3 takes nothing returns nothing
    set u = GetEnumUnit()
    set x = GetUnitX(u)
    set y = GetUnitY(u)
    set f = GetUnitFacing(u)
    call SaveInteger(DATA, GetHandleId(gt), 0, a)
    call SaveReal(DATA, GetHandleId(gt), -1, (LoadReal(DATA, GetHandleId(gt), -1) * (a - 1) + x) / a)
    call SaveReal(DATA, GetHandleId(gt), -2, (LoadReal(DATA, GetHandleId(gt), -2) * (a - 1) + y) / a)
    call SaveInteger(DATA, GetHandleId(gt), a * 5 + 1, GetUnitTypeId(u))
    call SaveReal(DATA, GetHandleId(gt), a * 5 + 2, x)
    call SaveReal(DATA, GetHandleId(gt), a * 5 + 3, y)
    call SaveReal(DATA, GetHandleId(gt), a * 5 + 4, f)
    set a = a + 1
endfunction
//复活
private function rt takes nothing returns nothing
    local timer t = GetExpiredTimer()
    local integer b = 1
    set a = GetHandleId(t)
    set gt = LoadGroupHandle(DATA, a, 1)
    set i = GetHandleId(gt)
    set z = LoadInteger(DATA, i, 0)
    call GroupClear(gt)
    loop
        exitwhen b > z
        set u = CreateUnit(Player(12), LoadInteger(DATA, i, b * 5 + 1), LoadReal(DATA, i, b * 5 + 2), LoadReal(DATA, i, b * 5 + 3), LoadReal(DATA, i, b * 5 + 4))
        call UnitAddAbility(u,IdNotAttack)
        call GroupAddUnit(gt, u)
        call SetUnitAcquireRange(u, 500)
        call SaveGroupHandle(DATA, GetHandleId(u), 1, gt)
        call SaveReal(DATA, GetHandleId(u), 2, GetUnitX(u))
        call SaveReal(DATA, GetHandleId(u), 3, GetUnitY(u))
        set b = b + 1
    endloop
    call FlushChildHashtable(DATA, a)
    call DestroyTimer(t)
    set t = null
endfunction
//野怪复活计时器
private function rev takes group g returns nothing
    local timer t = CreateTimer()
    call SaveGroupHandle(DATA, GetHandleId(t), 1, g)
    call TimerStart(t, stupidrevd, false, function rt)
    set t = null
endfunction
//普通野怪复活计时器 间隔为顶端变量设置的值
private function f4 takes nothing returns boolean
    local group gt
    set u = GetTriggerUnit()
    if UnitHasBuffBJ(u, 'Aloc') then
        return false
    endif
    //call BJDebugMsg("dead")
    set gt = LoadGroupHandle(DATA, GetHandleId(u), 1)
    call GroupRemoveUnit(gt, u)
    if FirstOfGroup(gt) == null then
    //call BJDebugMsg("rev")
        call rev(gt)
    endif
    set gt = null
    return false
endfunction
//初始化删除中立敌对单位
private function hide takes nothing returns nothing
    local unit u = GetEnumUnit()
    call GroupRemoveUnit(LoadGroupHandle(DATA, GetHandleId(u), 1), u)
    call RemoveUnit(u)
    set u = null
endfunction
//第一波刷野
private function rt2 takes nothing returns nothing
    local timer t = GetExpiredTimer()
    local integer b = 1
    set a = GetHandleId(t)
    set gt = LoadGroupHandle(DATA, a, 1)
    set i = GetHandleId(gt)
    set z = LoadInteger(HT2, i, 0)
    call GroupClear(gt)
    loop
        exitwhen b > z
        set u = CreateUnit(Player(12), LoadInteger(HT2, i, b * 6 + 1), LoadReal(HT2, i, b * 6 + 2), LoadReal(HT2, i, b * 6 + 3), LoadReal(HT2, i, b * 6 + 4))
        call UnitAddAbility(u,IdNotAttack)
        call GroupAddUnit(LoadGroupHandle(HT2,i,b*6+5),u)
        //call SetUnitAcquireRange(u, 500)
        call SaveGroupHandle(DATA,GetHandleId(u),1,LoadGroupHandle(HT2,i,b*6+5))
        call SaveReal(DATA,GetHandleId(u),2,GetUnitX(u))
        call SaveReal(DATA,GetHandleId(u),3,GetUnitY(u))
        set b = b + 1
    endloop
    call FlushChildHashtable(DATA, a)
    call DestroyTimer(t)
    call FlushParentHashtable(HT2)
    set t = null
endfunction
//第一波刷野计时器 时间为顶端变量设定
private function t100 takes group g returns nothing
    local timer t = CreateTimer()
    call SaveGroupHandle(DATA, GetHandleId(t), 1, g)
    call TimerStart(t, starttime, false, function rt2)
    set t = null
endfunction
//为第一波刷野记录野怪数据
private function f32 takes nothing returns nothing
    set u = GetEnumUnit()
    set x = GetUnitX(u)
    set y = GetUnitY(u)
    set f = GetUnitFacing(u)
    call SaveInteger(HT2, GetHandleId(gg), 0, a)
    call SaveInteger(HT2, GetHandleId(gg), a * 6 + 1, GetUnitTypeId(u))
    call SaveReal(HT2, GetHandleId(gg), a * 6 + 2, x)
    call SaveReal(HT2, GetHandleId(gg), a * 6 + 3, y)
    call SaveReal(HT2, GetHandleId(gg), a * 6 + 4, f)
    call SaveGroupHandle(HT2, GetHandleId(gg), a * 6 + 5, LoadGroupHandle(DATA, GetHandleId(u), 1))
    set a = a + 1
endfunction

private function rt3 takes group gt returns nothing
    local integer b = 1
    set i = GetHandleId(gt)
    set z = LoadInteger(DATA, i, 0)
    loop
        exitwhen b > z
        set u = CreateUnit(Player(12), LoadInteger(DATA, i, b * 5 + 1), LoadReal(DATA, i, b * 5 + 2), LoadReal(DATA, i, b * 5 + 3), LoadReal(DATA, i, b * 5 + 4))
         call UnitAddAbility(u,IdNotAttack)
        set b = b + 1
    endloop
endfunction

private function ffilt takes nothing returns boolean
    set u = GetFilterUnit()
    return IsUnitType(u,UNIT_TYPE_DEAD)==false 
endfunction

private function fresh takes nothing returns nothing
    local group gg = CreateGroup()
    set i = 0
    loop
        exitwhen i > groupcount
        set gt = g[i]
        set a = GetHandleId(gt)
        set x = LoadReal(DATA, a, -1)
        set y = LoadReal(DATA, a, -2)
        debug call PingMinimap(x, y, 3)
        call GroupEnumUnitsInRange(gg, x, y, visibleareacheck, function ffilt)
        if FirstOfGroup(gg) == null then
        //call BJDebugMsg("grt"+I2S(i))
            call rt3(gt)
        endif
        call GroupClear(gg)
        set i = i + 1
    endloop
    call DestroyGroup(gg)
    set gg = null
endfunction

private function start takes nothing returns nothing
    call TimerStart(GetExpiredTimer(), stupidrevd, true, function fresh)
endfunction
//初始化函数
function initcreeps takes nothing returns nothing
    call GroupEnumUnitsOfPlayer(gg, Player(12), null)
    call ForGroup(gg, function f1)
    call DestroyGroup(gt)
    loop
        exitwhen z >= i
        set gt = g[z]
        set a = 1
        call ForGroup(g[z], function f3)
        set z = z + 1
    endloop
    set groupcount = i - 1
    //debug call BJDebugMsg("groupcount = " + I2S(groupcount))
    call GroupEnumUnitsOfPlayer(gg, Player(12), null)
    set gt = gg
    call ForGroup(gg, function f32)
    call ForGroup(gg, function hide)
    call t100(gg)
    if DOTAMODE==false then
        set tg=CreateTrigger()
        call TriggerRegisterPlayerUnitEvent(tg,Player(12),EVENT_PLAYER_UNIT_DEATH,null)
        call TriggerAddCondition(tg,function f4)
    else
        call TimerStart(CreateTimer(), starttime, false, function start)
    endif
endfunction

function CKRefresh takes boolean b,real inittime, real refreshtime,real arearadio,integer id returns nothing
    set area = arearadio
    set stupidrevd = refreshtime
    set starttime = inittime
    set DOTAMODE=b
    set IdNotAttack=id
    call initcreeps()
endfunction
endlibrary
#endif
