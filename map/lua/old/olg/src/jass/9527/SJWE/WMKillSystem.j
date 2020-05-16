#ifndef WMKillSystemIncluded
#define WMKillSystemIncluded
#include "9527/SJWE/SJWEBase.j"

library WMKillSystem initializer init uses SJWEBase

globals
    private trigger deathtrg=CreateTrigger()
    private trigger damagetrg=CreateTrigger()
    private timer array t//每个玩家对应的计时器
    private real dur//连杀间隔
    private integer array i//累计杀
    private integer array il//连杀
    private integer array d//累计死
    private string array Kill//累计杀文本
    private string array KillLimit//连杀文本
    private string array Death//累计死文本
    private sound array Sd//累计杀音效
    private integer maxdeath=2
    private integer maxkilllimited=1//最高连杀
    private sound array Sound//连杀音效
    private integer maxkill=2//累计杀人数所显示文本上限
    private integer MinMoney//基础金钱
    private integer K//连杀所增加钱数
    private boolean sub//死亡是否损失金钱
    private boolean FirstBlood=true
    private integer First//第一滴血钱
    private sound FirstSound
	private string array ShutDown//终结文本
	private integer ShutDownIndex=2

    private real zdur//助攻持续时间。
    private boolean array b[11][11]//助攻系统
    private timer array tass[11][11]//助攻对应计时器

    private integer array Zs//助攻数。用于获取。
    private integer array KillCount
    private integer array DeathCount
    private integer lasti=0
endglobals

    private function ClearContinuousKill takes nothing returns nothing
        local integer id=GetHandleId(GetExpiredTimer())
        set il[LoadInteger(DATA,id,0)]=0
    endfunction

	private function Playsound takes nothing returns nothing
		call StartSound(Sound[il[lasti]])
		call DestroyTimer(GetExpiredTimer())
	endfunction

    private function death takes nothing returns nothing
        local integer did=GetPlayerId(GetTriggerPlayer())
        local integer kid=GetPlayerId(GetOwningPlayer(GetKillingUnit()))
        local integer id=GetHandleId(t[kid])
        local string kname=GetPlayerName(Player(kid))
        local string dname=GetPlayerName(Player(did))
        local integer money=MinMoney+K*GetHeroLevel(GetTriggerUnit())
        local string ass="，助攻:"
        local integer assi=0
        set d[did]=d[did]+1
        if GetKillingUnit()==null then//空单位返回，防止负血死等
            call PrintToAllPlayer(dname+" 死都不知道怎么死的.")
	        if d[did]>2 then//连死显示
	            if d[did]>=maxdeath then
	                call PrintToAllPlayer(dname+Death[maxdeath])
	            else
	                call PrintToAllPlayer(dname+Death[d[did]])
	            endif
	        endif
            return
        elseif kid==12 then//中立
            call PrintToAllPlayer("|cff777777中立单位:"+GetUnitName(GetKillingUnit())+" 杀死了 "+dname)
            if sub then
                call SubMoney(Player(did),money)
	        endif
	        if d[did]>2 then//连死显示
	            if d[did]>=maxdeath then
	                call PrintToAllPlayer(dname+Death[maxdeath])
	            else
	                call PrintToAllPlayer(dname+Death[d[did]])
	            endif
	        endif
            return
        elseif IsUnitAlly(GetKillingUnit(),GetTriggerPlayer()) then//队友杀
            call PrintToAllPlayer(kname+" 竟然杀死了自己的队友 "+dname)
	        if d[did]>2 then//连死显示
	            if d[did]>=maxdeath then
	                call PrintToAllPlayer(dname+Death[maxdeath])
	            else
	                call PrintToAllPlayer(dname+Death[d[did]])
	            endif
	        endif
            return
        elseif did==kid then//自杀
            call PrintToAllPlayer(dname+"自杀了")
            return
        endif
        set i[kid]=i[kid]+1//杀人累计杀+1
        set il[kid]=il[kid]+1//杀人连杀+1
        set KillCount[kid]=KillCount[kid]+1
        set DeathCount[did]=DeathCount[did]+1
        call SaveInteger(DATA,id,0,kid)
        call TimerStart(t[kid],dur,false,function ClearContinuousKill)
        loop
            exitwhen assi>11
            if b[did][assi]and IsUnitAlly(GetKillingUnit(),Player(assi)) and kid!=assi then//助攻
                set ass=ass+GetPlayerName(Player(assi))+"/"
                set Zs[assi]=Zs[assi]+1
            endif
            set b[did][assi]=false
            set assi=assi+1
        endloop
        if ass=="，助攻:"then
            set ass=""
        else
            set ass=SubString(ass,0,StringLength(ass)-1)
        endif
        if FirstBlood then//第一滴血
            set FirstBlood=false
            call PrintToAllPlayer(kname+"拿到了|cffff0000第一滴血！|r奖励他"+I2S(First)+"金钱")
            call StartSound(FirstSound)
        endif
        call PrintToAllPlayer(kname+" 杀死了 "+dname+"!得到了"+I2S(money)+"金钱"+ass)
        if il[kid]>1 then//连杀显示
            if il[kid]>=maxkilllimited then
                call PrintToAllPlayer(kname+KillLimit[maxkilllimited])
            else
                call PrintToAllPlayer(kname+KillLimit[il[kid]])
            endif
            set lasti=kid
            call TimerStart(CreateTimer(),0.8,false,function Playsound)
        endif
        if i[did]>2 then//终结显示
            if i[did]>=ShutDownIndex then
                call PrintToAllPlayer(kname+"终结了"+dname+ShutDown[maxkill])
            else
                call PrintToAllPlayer(kname+"终结了"+dname+ShutDown[i[did]])
            endif
        endif
        if i[kid]>2 then//累计杀显示
            if i[kid]>=maxkill then
                call PrintToAllPlayer(kname+Kill[maxkill])
            else
                call PrintToAllPlayer(kname+Kill[i[kid]])
            endif
            call StartSound(Sd[i[kid]])
        endif
        call AddMoney(Player(kid),money)
        if d[did]>2 then//连死显示
            if d[did]>=maxdeath then
                call PrintToAllPlayer(dname+Death[maxdeath])
            else
                call PrintToAllPlayer(dname+Death[d[did]])
            endif
        endif
        if sub then
            call SubMoney(Player(did),money)
        endif
        set d[kid]=0//杀人清累计死亡
        set i[did]=0//死亡重置累计杀
        set il[did]=0//死亡重置连杀
    endfunction

    private function RemoveAssists takes nothing returns nothing
        local integer id=GetHandleId(GetExpiredTimer())-MinHandleId
        set b[LoadInteger(DATA,id,0)][LoadInteger(DATA,id,1)]=true
    endfunction

    private function damage takes nothing returns nothing
        local integer did=GetPlayerId(GetTriggerPlayer())
        local integer kid=GetPlayerId(GetOwningPlayer(GetEventDamageSource()))
        local integer id=GetHandleId(tass[did][kid])-MinHandleId
        if GetEventDamage()>0 then
            set b[did][kid]=true
            call SaveInteger(DATA,id,0,did)
            call SaveInteger(DATA,id,1,kid)
            call TimerStart(tass[did][kid],zdur,false,function RemoveAssists)
        endif
    endfunction

    private function init takes nothing returns nothing
        local integer r=0
        local integer m=0
        call TriggerAddCondition(deathtrg,Condition(function death))
        call TriggerAddCondition(damagetrg,Condition(function damage))
        loop
            exitwhen r>=12
            loop
                exitwhen m>=10
                set b[r][m]=false
                set tass[r][m]=CreateTimer()
                set m=m+1
            endloop
            set t[r]=CreateTimer()
            set m=0
            set i[r]=0
            set Zs[r]=0
            set KillCount[r]=0
            set DeathCount[r]=0
            set r=r+1
        endloop
    endfunction

    function AddContinuousKillText takes string s,sound sd returns nothing
        set maxkilllimited=maxkilllimited+1
        set KillLimit[maxkilllimited]=s
        set Sound[maxkilllimited]=sd
    endfunction

    function AddDeathText takes string s returns nothing
        set maxdeath=maxdeath+1
        set Death[maxdeath]=s
    endfunction

	function AddShutDownText takes string s returns nothing
		set ShutDownIndex=ShutDownIndex+1
        set ShutDown[ShutDownIndex]=s
	endfunction

    function AddKillText takes string s,sound sou returns nothing
        set maxkill=maxkill+1
        set Sd[maxkill]=sou
        set Kill[maxkill]=s
    endfunction

    function KillSystemAddHero takes unit u returns nothing
        call TriggerRegisterUnitEvent(deathtrg,u,EVENT_UNIT_DEATH)
        call TriggerRegisterUnitEvent(damagetrg,u,EVENT_UNIT_DAMAGED)
    endfunction

    function GetAssistsCount takes player p returns integer
        return Zs[GetPlayerId(p)]
    endfunction

    function GetHeroDeathCount takes player p returns integer
        return DeathCount[GetPlayerId(p)]
    endfunction

    function GetHeroKillCount takes player p returns integer
        return KillCount[GetPlayerId(p)]
    endfunction

    function KillSystemInitSet takes integer gf,sound firstsound,integer base,integer k,real kdu,real adu,boolean b returns nothing
        set First=gf
        set FirstSound=firstsound
        set MinMoney=base
        set K=k
        set dur=kdu
        set zdur=adu
        set sub=b
    endfunction

endlibrary
#endif
