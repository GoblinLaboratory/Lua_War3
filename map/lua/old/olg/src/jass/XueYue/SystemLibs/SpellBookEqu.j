#ifndef XGmfszblIncluded
#define XGmfszblIncluded

#include "XueYue\Base.j"
	#include "XueYue\Define\SpellBookEqu.Cons" /* 载入常量 */
library XGmfszbl requires XGbase
globals
	private hashtable htb=InitHashtable()
	private integer Total=0
endglobals

function Xg_String2OrderId takes string orderIdString returns integer
    local integer orderId
    set orderId = OrderId(orderIdString)
    if (orderId != 0) then
        return orderId
    endif
    set orderId = UnitId(orderIdString)
    if (orderId != 0) then
        return orderId
    endif
    return 0
endfunction

function Xg_OrderId2String takes integer orderId returns string
    local string orderString
    set orderString = OrderId2String(orderId)
    if orderString != null then
        return orderString
    endif
    set orderString = UnitId2String(orderId)
    if orderString != null then
        return orderString
    endif
    return null
endfunction

	//添加装备类型
	//AddList("autoentangle","衣服")
function Xg_AddList takes string ordid,string List returns nothing
	call SaveStr( htb, Xg_String2OrderId(ordid), 0, List )
	set Total=Total+1
endfunction
//添加新的装备配置  参数 - 物品ID,装备类型,工程ID
function Xg_AddItem takes integer Goods,string List,integer Proc,integer skill returns nothing
	call SaveStr	( htb, Goods, SpBk_List,  List )
	call SaveInteger( htb, Goods, SpBk_Proc, Proc )
	call SaveInteger( htb, Goods, SpBk_Attr, skill )
	call SaveBoolean( htb, Goods, SpBk_IsFit, true )
endfunction

function Xg_IsMfszblFit takes integer Goods returns boolean
	return LoadBoolean( htb, Goods, SpBk_IsFit )
endfunction

//获取装备类别
function Xg_GetFitList takes integer it returns string
	return LoadStr( htb, it,SpBk_List )
endfunction

function Xg_RemoveFit takes unit u,integer ItId returns nothing//内部调用(脱下装备)
	//Xg_RemoveFit(单位,装备ID)
	local integer uid = GetHandleId(u)//Get单位ID
	local string list = LoadStr(htb,ItId,SpBk_List)//GET装备类型
	local integer Proc = LoadInteger(htb,uid,StringHash("工程-"+list))//GET单位身上的指定装备类型工程ID(GET单位的旧装备)
	local integer skill
	local item it = LoadItemHandle(htb,uid, StringHash("装备-"+list))
	if Proc==0 then
		set it=null
		return
	endif
	call UnitRemoveAbility( u, Proc )//删除旧工程
	call UnitMakeAbilityPermanent( u, false, Proc )
	call SetItemVisible( it, true )
	call SetItemPosition( it, GetUnitX(u), GetUnitY(u) )
	call UnitAddItem( u, it )//给单位卸下旧的装备(物品还原)
	//  call SetItemCharges( it, LoadInteger(htb,uid,StringHash(list)) )//设置物品使用次数
	set skill = LoadInteger( htb, GetItemTypeId(it), SpBk_Attr )
	call UnitMakeAbilityPermanent( u, false, skill )
	call UnitRemoveAbility( u, skill )//删除属性
	set it = null
endfunction
	//list = 装备类型 :如:武器/衣服
	//用于获取某部位的装备ID
function Xg_GetFit takes unit u,string list returns item
	return LoadItemHandle( htb, GetHandleId(u), StringHash("装备-"+list) )
endfunction

function Xg_GetListWithId takes integer orid returns string
	return LoadStr( htb, orid, 0 )
endfunction

function Xg_UseFit takes unit u,item it returns nothing//使用装备
    local integer uid = GetHandleId(u)//Get单位ID
    local integer Goods = GetItemTypeId(it)//GET使用的装备ID
    local string list = LoadStr( htb, Goods, SpBk_List ) //读取装备类型
    local integer oldgc = LoadInteger( htb, uid, StringHash("工程-"+list) )//GET单位身上的指定装备类型工程ID(GET单位的旧装备)
    local integer newgc = LoadInteger( htb, Goods, SpBk_Proc ) //读取新装备的工程
    local integer skill = LoadInteger( htb, Goods, SpBk_Attr ) //读取属性
    if newgc==0 then
		return
    endif
        // 取出原装备
        call Xg_RemoveFit(u,Goods)
        // 启用新装备
        call UnitAddAbility(u,newgc)//添加新工程
		call SetPlayerAbilityAvailable(GetOwningPlayer(u),newgc,false)//禁用工程
  //      call SaveInteger(htb,uid,StringHash(list),GetItemCharges(it)) //存储物品使用次数
        call UnitAddAbility(u,skill)//添加属性
		call SetPlayerAbilityAvailable(GetOwningPlayer(u),skill,false)//禁用属性
        call SaveInteger( htb,uid, StringHash("工程-"+list), newgc)
        call SaveItemHandle(htb,uid,StringHash("装备-"+list),it)
        call UnitRemoveItem(u,it)
        call SetItemVisible(it,false)
endfunction

//脱装备,指定部位
function Xg_UnFit_B takes unit u,string list returns nothing
    local integer uid = GetHandleId(u)
    local item it = LoadItemHandle(htb,uid,StringHash("装备-"+list))
    local integer oldgc = LoadInteger(htb,uid,StringHash("工程-"+list))
    local integer newgc = LoadInteger(htb,GetItemTypeId(it),StringHash("工程"))
    // 脱下装备
        call Xg_RemoveFit(u,GetItemTypeId(it))
    // 返还物品
	call RemoveSavedInteger(htb,uid, StringHash("工程-"+list))
	call RemoveSavedHandle(htb,uid,StringHash("装备-"+list))
endfunction

//脱装备,ID
function Xg_UnFit_A takes unit u,integer orid returns nothing
    local string list
	set list=LoadStr(htb,orid,0)
    if list == null then
		return
    endif
	call Xg_UnFit_B(u,list)
endfunction

function Xg_IsFitOrId takes integer id returns boolean
	local integer i=1
	loop
		exitwhen i>Total
		if HaveSavedString(htb,id,0) then
			return true
		endif
		set i = i + 1
	endloop
	return false
endfunction

endlibrary

#endif
