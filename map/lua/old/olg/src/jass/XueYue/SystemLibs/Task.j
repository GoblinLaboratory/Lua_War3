#ifndef XGTaskIncluded
#define XGTaskIncluded
  #include "XueYue\Base.j"
  #include "XueYue\Define\Task.Cons" /* 定义常量 */
library XGTask requires XGbase
	globals
		private  hashtable		db_u  =  InitHashtable() 
		private  hashtable  db_t  =  InitHashtable() //任务主结构体
		private  hashtable  db_d  =  InitHashtable() //任务需求进度
		private  integer TID = 0
	endglobals
	//获取任务状态
	function XG_Task_GetState takes integer t,integer s returns boolean
	  local integer i=LoadInteger(db_t, t, Task_State)
	  if s==0 then
	    return t==0
	  endif
	  return i==s
	    
	endfunction
	//设置任务状态
	function XG_Task_SetState takes integer t,integer s returns nothing
	  if t > 0 then
	     call SaveInteger(db_t, t, Task_State, s)
	  endif
	endfunction
	//注销任务
	function XG_Task_Logout takes integer t returns nothing
	  local integer key = LoadInteger(db_t, t, Task_Key)
	  local integer id = LoadInteger(db_t, t, Task_ID)
	  call FlushChildHashtable(db_t, t)
	  call FlushChildHashtable(db_d, t)
	  call RemoveSavedBoolean(db_u, key, id)
	  call RemoveSavedInteger(db_u, key, id)
	endfunction
  //获取玩家任务ID
	function XG_Task_GetPlayerTid takes player u, integer id returns integer
	  return LoadInteger(db_u, GetHandleId(u), id)
	endfunction
	//获取单位任务ID
	function XG_Task_GetUnitTid takes unit u, integer id returns integer
	  return LoadInteger(db_u, GetHandleId(u), id)
	endfunction
	//对玩家发布任务
	function XG_ReleaseTask_Player takes integer id,player ue,string s returns nothing
   local integer key = GetHandleId(ue)
   local integer i = LoadInteger(db_u, key, id)
   if LoadBoolean(db_u, key, id) then //拥有任务
     return
   endif
   set TID = TID + 1
   call SaveInteger(db_u, key, id, TID)
   call SaveBoolean(db_u, key, id, true)
   call SaveStr(db_t, TID, Task_Name, s)
 //  call SaveUnitHandle(db_t, TID, Task_Unit, ue)
   call SaveInteger(db_t, TID, Task_ID, id)
   call SaveInteger(db_t, TID, Task_Key, key)
   call SaveInteger(db_t, TID, Task_State, 1)
	endfunction
	//对单位发布任务
	function XG_ReleaseTask_Unit takes integer id,unit ue,string s returns nothing
   local integer key = GetHandleId(ue)
   local integer i = LoadInteger(db_u, key, id)
   if LoadBoolean(db_u, key, id) then //拥有任务
     return
   endif
   set TID = TID + 1
   call SaveInteger(db_u, key, id, TID)
   call SaveBoolean(db_u, key, id, true)
   call SaveStr(db_t, TID, Task_Name, s)
   call SaveUnitHandle(db_t, TID, Task_Unit, ue)
   call SaveInteger(db_t, TID, Task_ID, id)
   call SaveInteger(db_t, TID, Task_Key, key)
   call SaveInteger(db_t, TID, Task_State, 1)
	endfunction
	//设置需求进度
	function XG_Task_CustomDemand_Set takes integer t,string u,real n returns nothing
	  call SaveReal(db_d, t, StringHash(u), n)
	endfunction
	//获取需求进度
	function XG_Task_CustomDemand_Get takes integer t,string u returns real
	  return LoadReal(db_d, t, StringHash(u))
	endfunction

endlibrary
#endif
