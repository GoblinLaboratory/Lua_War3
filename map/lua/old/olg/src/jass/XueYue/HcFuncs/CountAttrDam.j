#ifndef HC_CountAttrDam_Used
#define HC_CountAttrDam_Used
library HCCountAttrDam
	function Xg_CountAttrDam takes unit u,boolean s,real Str,boolean a,real Agi,boolean i,real Int returns real
		return GetHeroStr(u,s)*Str + GetHeroAgi(u,a)*Agi + GetHeroInt(u,i)*Int
	endfunction
endlibrary
#endif
