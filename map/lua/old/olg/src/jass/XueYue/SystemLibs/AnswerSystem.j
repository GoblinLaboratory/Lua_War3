#ifndef HcAnswerSystemIncluded
#define HcAnswerSystemIncluded
library HcAnswerSystem
 globals
   private hashtable array htb
   private integer array Num
 endglobals
//创建题库
 function XG_CreateQuestionLib takes nothing returns integer
  if Num[0] == 0 then
   set htb[0] = InitHashtable()
  endif
  set Num[0] = Num[0] + 1
  set Num[Num[0]] = 0
  set htb[Num[0]] = InitHashtable()
  return Num[0]
 endfunction
 //添加题目
 function XG_AddQuestion takes integer lib, string s returns integer
  set Num[lib] = Num[lib] + 1
  call SaveStr(htb[lib], Num[lib], -1, s) //题目
 endfunction
  //添加选项
 function XG_AddAnswer takes integer lib, integer q, string s, boolean b returns nothing
  local integer n = LoadInteger(htb[lib], q, 0) + 1
  if q > 0 then
   call SaveInteger(htb[lib], q, 0, n)
   call SaveStr(htb[lib], q, n, s)
    if b then
     call SaveInteger(htb[lib], q, -1, n)//正确答案
    endif
  endif
 endfunction
 function XG_RandomTakeQuestion takes integer lib returns integer
 local integer q = GetRandomInt(1,Num[lib])
 call FlushChildHashtable(htb[0],lib)
 call SaveInteger(htb[0],lib,-1,
 endfunction
endlibrary
#endif
