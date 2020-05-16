#ifndef HcPreExpressionIncluded
#define HcPreExpressionIncluded

#include "XueYue\Base.j"
#define XGPreExpression_ON

library XGPreExpression requires XGbase
	globals
		private hashtable htb = InitHashtable()
		private integer Num = 0
	endglobals
	
	function XG_Create_Expression takes string s,boolexpr e returns nothing
		set Num = Num + 1
		set Expr[Num] = e
		call SaveInteger(htb,0,StringHash(s),Num)
		call SaveBooleanExprHandle(htb,-11,Num,e)
	endfunction
	
	function XG_Load_Expression takes string s returns boolexpr
		local integer i = LoadInteger(htb,0,StringHash(s))
		return  LoadBooleanExprHandle(htb,-11,i)
	endfunction
endlibrary

#endif
