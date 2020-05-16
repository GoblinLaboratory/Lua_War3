#ifndef XGJumpTagIncluded
#define XGJumpTagIncluded


library XGJumpTag
#ifndef XGHtbIncluded
#define XGHtbIncluded
globals
		hashtable Xg_htb = InitHashtable()
endglobals
#endif
private function Timer_JumpText takes nothing returns nothing
    local timer t= GetExpiredTimer()
    local integer key=GetHandleId(t)
    local texttag tag=LoadTextTagHandle(Xg_htb,key,0)
    local real x=LoadReal(Xg_htb,key , 1)
    local real y=LoadReal(Xg_htb,key , 2)
    local real time=LoadReal(Xg_htb, key , 3)
    local boolean switch=LoadBoolean(Xg_htb, key , 4)
    local real high=LoadReal(Xg_htb, key , 5)
    local real tome = LoadReal(Xg_htb, key , 8)
    local boolean zoom= LoadBoolean(Xg_htb, key , 9)
    if(time>=tome)then
        call DestroyTextTag(tag)
        call FlushChildHashtable(Xg_htb, key )
        call PauseTimer(t)
        call DestroyTimer(t)
    else
        set x=x-1.75
        if switch then
            set high=high*.95
            set y=y+high*2
        else
            set high=high*1.05
            set y=y-high*1.5
        endif
        if(high<=.5)then
            set switch=false
        endif
        set time=time+tome/150
        if zoom then
			call SetTextTagText(tag,LoadStr(Xg_htb, key , 6),LoadReal(Xg_htb, key , 7)*.023/ high /7)
        endif
        call SetTextTagPos(tag,x,y,0)
		call SetTextTagColor(tag,LoadInteger(Xg_htb,key,-1),LoadInteger(Xg_htb,key,-2),LoadInteger(Xg_htb,key,-3),LoadInteger(Xg_htb,key,-4))
        call SaveReal(Xg_htb, key ,1,x)
        call SaveReal(Xg_htb, key ,2,y)
        call SaveReal(Xg_htb, key ,3,time)
        call SaveBoolean(Xg_htb, key ,4,switch)
        call SaveReal(Xg_htb, key ,5,high)
    endif
    set tag=null
    set t=null
endfunction

function XG_CreateJumpTextFormLoc takes location p,string s,real size,real time,integer red,integer green,integer blue,integer alpha,boolean zoom returns nothing
    local timer t=CreateTimer()
    local texttag tag=CreateTextTag()
    local real x=GetLocationX(p)
    local real y=GetLocationY(p)
    local integer key=GetHandleId(t)
    call SetTextTagText(tag,s,size*.023/10)
    call SetTextTagPos(tag,x,y,0)
    call SetTextTagColor(tag,red,green,blue,alpha)
    call SetTextTagPermanent(tag,false)
    call SetTextTagLifespan(tag,time)
    call SetTextTagFadepoint(tag,time/6)
	call SaveInteger(Xg_htb,key,-1,red)
	call SaveInteger(Xg_htb,key,-2,green)
	call SaveInteger(Xg_htb,key,-3,blue)
	call SaveInteger(Xg_htb,key,-4,alpha)
    call SaveTextTagHandle(Xg_htb,key,0,tag)
    call SaveReal(Xg_htb,key,1,x)
    call SaveReal(Xg_htb,key,2,y)
    call SaveBoolean(Xg_htb,key,4,true)
    call SaveReal(Xg_htb,key,5,5)
    if zoom then
        call SaveStr(Xg_htb,key,6,s)
        call SaveReal(Xg_htb,key,7,size)
    endif
    call SaveReal(Xg_htb,key,8,time)
    call SaveBoolean(Xg_htb,key,9,zoom)
    call TimerStart(t,time/150,true,function Timer_JumpText)
    set t=null
    set tag=null
endfunction

endlibrary


#endif
