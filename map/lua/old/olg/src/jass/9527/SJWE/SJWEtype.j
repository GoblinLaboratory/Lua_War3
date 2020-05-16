#ifndef SJWEtypeIncluded
#define SJWEtypeIncluded

library_once SJWEtype

//! textmacro ReturnType takes Name
function ReturnType_$Name$ takes integer i returns integer
    return i
endfunction

//! endtextmacro

//! runtextmacro ReturnType ("0")
//! runtextmacro ReturnType ("1")
//! runtextmacro ReturnType ("2")
//! runtextmacro ReturnType ("3")
//! runtextmacro ReturnType ("4")
//! runtextmacro ReturnType ("5")
//! runtextmacro ReturnType ("6")
//! runtextmacro ReturnType ("7")
//! runtextmacro ReturnType ("8")
//! runtextmacro ReturnType ("9")

//! textmacro ReturnUnitID takes Name
function ReturnUnitID_$Name$ takes unit whichunit returns integer
    return GetHandleId(whichunit)
endfunction

//! endtextmacro

//! runtextmacro ReturnUnitID ("0")
//! runtextmacro ReturnUnitID ("1")

endlibrary

#endif