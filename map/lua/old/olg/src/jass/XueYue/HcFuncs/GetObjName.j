#ifndef HC_GetObjName_Used
#define HC_GetObjName_Used
library HcGetObjName
	function Xg_GetObjName takes integer i returns string
		return GetObjectName(i)
	endfunction
endlibrary
#endif
