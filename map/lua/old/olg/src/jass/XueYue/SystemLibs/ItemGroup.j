#ifndef XGItemIncluded
#define XGItemIncluded

#include "XueYue\Base.j"

library XGItem requires XGbase
globals
hashtable Xg_ItemGroup_htb=InitHashtable()
integer Xg_LastCreatedItemGroupId=0
endglobals
//内部回调物品组
function  Xg_GetItemCallbak takes nothing returns nothing
local integer id=LoadInteger(Xg_ItemGroup_htb,StringHash("ItemGroup"),StringHash("LoopId"))
local integer total = LoadInteger(Xg_ItemGroup_htb,StringHash("ItemGroup_"+I2S(id)),0)
call SaveItemHandle(Xg_ItemGroup_htb,StringHash("ItemGroup_"+I2S(id)),total+1,GetEnumItem()) 
call SaveInteger(Xg_ItemGroup_htb,StringHash("ItemGroup_"+I2S(id)),0,total+1)
endfunction
//物品在点的范围内
function Xg_ItemDB takes item it,location p,real r returns boolean
local real dx = GetItemX(it) - GetLocationX(p)
local real dy = GetItemY(it) - GetLocationY(p)
return SquareRoot(dx * dx + dy * dy) <= r
endfunction
//整理物品组
function Xg_ItemGroup_Organize takes integer id returns nothing
local integer i=1
local integer i_e=LoadInteger(Xg_ItemGroup_htb,StringHash("ItemGroup_"+I2S(id)),0)
local integer ps=0
local integer pl=0
local item it
loop
exitwhen i>i_e
set it=LoadItemHandle(Xg_ItemGroup_htb,StringHash("ItemGroup_"+I2S(id)),i)
if it ==null then
	if ps==0 then
		set ps=i
	else
		set pl=pl+1
	endif
else
	if ps!=0 then
		call SaveItemHandle(Xg_ItemGroup_htb,StringHash("ItemGroup_"+I2S(id)),i-(ps+pl),it )
		call SaveItemHandle(Xg_ItemGroup_htb,StringHash("ItemGroup_"+I2S(id)),i,null)
	endif
endif
set i=i+1
endloop
set i_e=i_e-(ps+pl)
call SaveInteger(Xg_ItemGroup_htb,StringHash("ItemGroup_"+I2S(id)),0,i_e)
set it=null
endfunction
//选取物品
function Xg_GetEnumItem takes nothing returns item
return LoadItemHandle(Xg_ItemGroup_htb,StringHash("ItemGroup"),StringHash("EnumItem"))
endfunction
function Xg_CreateItemGroup takes nothing returns integer
local integer total=LoadInteger(Xg_ItemGroup_htb,StringHash("ItemGroup"),StringHash("total"))
call SaveInteger(Xg_ItemGroup_htb,StringHash("ItemGroup"),StringHash("total"),total+1)
return total+1
endfunction
//物品组 - 加入物品
function Xg_ItemGroupAddItem takes item it,integer id returns nothing
local integer num
call Xg_ItemGroup_Organize(id)
set num=LoadInteger(Xg_ItemGroup_htb,StringHash("ItemGroup_"+I2S(id)),0)
call SaveInteger(Xg_ItemGroup_htb,StringHash("ItemGroup_"+I2S(id)),0,num+1)
call SaveItemHandle(Xg_ItemGroup_htb,StringHash("ItemGroup_"+I2S(id)),num+1,it)
endfunction
//新物品组
function Xg_GetRectItemGroup takes rect rct,boolexpr expr returns integer
local integer total = LoadInteger(Xg_ItemGroup_htb,StringHash("ItemGroup"),StringHash("total"))
local integer i=1
call SaveInteger(Xg_ItemGroup_htb,StringHash("ItemGroup"),StringHash("LoopId"),total+1)
call EnumItemsInRect(rct,expr,function Xg_GetItemCallbak)
call DestroyBoolExpr(expr)
set Xg_LastCreatedItemGroupId=total+1
return total+1
endfunction

//对 指定物品组 做动作
function Xg_ItemGroupDo takes integer id,code itcode returns nothing
local integer total = LoadInteger(Xg_ItemGroup_htb,StringHash("ItemGroup_"+I2S(id)),0)
local integer i = 1
//local trigger t=CreateTrigger()
local force fc=CreateForce()
call Xg_ItemGroup_Organize(id)
//call TriggerAddCondition(t,Condition(itcode))
loop
exitwhen i>total
call SaveItemHandle(Xg_ItemGroup_htb,StringHash("ItemGroup"),StringHash("EnumItem"), LoadItemHandle(Xg_ItemGroup_htb,StringHash("ItemGroup_"+I2S(id)),i) )
//call TriggerEvaluate(t)
call ForceEnumPlayers(fc,Condition(itcode))
set i=i+1
endloop
//call DestroyTrigger(t)
call DestroyForce(fc)
call SaveItemHandle(Xg_ItemGroup_htb,StringHash("ItemGroup"),StringHash("EnumItem"), null )
endfunction

function Xg_Destroy_ItemGroup takes integer id returns nothing
call FlushChildHashtable(Xg_ItemGroup_htb,StringHash("ItemGroup_"+I2S(id)))
endfunction

endlibrary

#endif
