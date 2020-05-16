#ifndef TCStringcodeSystemIncluded
#define TCStringcodeSystemIncluded

library_once TCStringcodeSystem initializer Init 
    
globals
    public string emptyStr
    public string array char
    public string sep
    public string empty
    public integer array pow
    public integer tccode
    public constant integer maxchar=92
    //public string emptyStr
endglobals

public function C2I takes string s returns integer
    if s==char[0] then
        return 0
 	<? for i=1,92 do ?>
    elseif s==char[<?= i ?>] then
        return <?= i ?>
 	<? end ?>
    endif
    return 0
endfunction

public struct stringcode[8100]

    string str
    integer array data[100]
    integer maxdata
    integer Type
    boolean processed
    static integer lastCreatedStringcode
    
    method I2Code takes nothing returns nothing
        local integer i=99
        local integer a
        local integer b
        local integer array c
        local integer d
        local string array s
        local boolean flag
        if .maxdata==0 then
            loop
                exitwhen i<0
                if data[i]!=0 then
                    set .maxdata=i+1
                    exitwhen true
                endif
                set i=i-1
            endloop
        endif
        if .maxdata==0 then
            set str=empty
            set .processed=true
            return
        endif
        if .maxdata>pow[1] then
            set .str=.str+char[1]+char[.maxdata-pow[1]]+sep
        else
            set .str=.str+char[.maxdata]+sep
        endif
        set i=0
        loop
            exitwhen i>=.maxdata
            set s[i]=TCMain_emptyStr
            set c[i]=.data[i]
            if c[i]>=0 then
                set c[i]=ModuloInteger(c[i],pow[4]/2-1)
                set c[i]=c[i]+pow[4]/2
            else
                set c[i]=ModuloInteger(-c[i],pow[4]/2)
                set c[i]=-c[i]+pow[4]/2
            endif
            set a=3
            set d=c[i]
            set flag=false
            loop
                exitwhen a<0
                set b=d/pow[a]
                set d=d-b*pow[a]
                if b>0 or flag then
                    set s[i]=s[i]+char[b]
                    set flag=true
                endif
                set a=a-1
            endloop
            set i=i+1
        endloop
        set i=0
        set a=0
        loop
            exitwhen i>=.maxdata
            set .str=.str+s[i]
            set a=a+c[i]
            if ModuloInteger(i+1,10)==0 or i==.maxdata-1 then
                set s[100]=TCMain_emptyStr
                set d=ModuloInteger(a,tccode)
                set a=3
                set flag=false
                set .str=.str+sep
                loop
                    exitwhen a<0
                    set b=d/pow[a]
                    set d=d-b*pow[a]
                    if b>0 or flag then
                        set .str=.str+char[b]
                        set flag=true
                    endif
                    set a=a-1
                endloop
                set a=0
            endif
            if i+1!=.maxdata then
                set .str=.str+sep
            endif
            set i=i+1
        endloop
        set .processed=true
    endmethod
    
    method Code2I takes nothing returns nothing
        local integer i=0
        local integer j
        local integer pointer=2
        local integer array temp
        local integer num=0
        local integer max=0
        local integer sum=0
        local string s
        local boolean flag=false
        set .maxdata=C2I(SubString(.str,0,1))
        set s=SubString(.str,1,2)
        if s!=sep then
            set .maxdata=.maxdata*pow[1]+C2I(s)
            set pointer=pointer+1
        endif
        set .processed=true
        loop
            exitwhen i>=.maxdata
            set max=0
            set num=0
            loop
                set s=SubString(.str,pointer,pointer+1)
                set pointer=pointer+1
                if s==sep or s==null or max==4 then
                    exitwhen true
                else
                    set temp[max]=C2I(s)
                    set max=max+1
                endif
            endloop
            set j=0
            if max==0 then
         	<? local i=0
            for i=1,4 do ?>
            elseif max==<?= i?> then
             	<? local j=0
                for j=0,i-1 do ?>
                set num=num+temp[<?= j ?>]*pow[<?= i-j-1 ?>]
             	<? end
            end ?>
            endif
            if ModuloInteger(i+1,10)==0 or i==.maxdata-1 then
                if flag then
                    set flag=false
                    if ModuloInteger(sum,tccode)!=num then
                        set .processed=false
                        return
                    endif
                    set sum=0
                    set i=i+1
                else
                    set flag=true
                    set .data[i]=num
                    set sum=sum+num
                endif
            else
                set .data[i]=num
                set sum=sum+num
                set i=i+1
            endif
        endloop
        set i=0
        loop
            exitwhen i>=.maxdata
            set .data[i]=.data[i]-pow[4]/2
            set i=i+1
        endloop
    endmethod
    
    method process takes nothing returns boolean
        if .Type==0 then
            return false
        endif
        if .Type==1 then
            call .I2Code()
        else
            call .Code2I()
        endif
        return .processed
    endmethod
    
    method clear takes nothing returns nothing
        local integer i=0
        loop
            exitwhen i>=100
            set .data[i]=0
            set i=i+1
        endloop
        set .maxdata=0
        set .str=TCMain_emptyStr
        set .Type=0
        set .processed=false
        debug call BJDebugMsg("Stringcode "+I2S(integer(this))+" has been cleared")
    endmethod
    
    static method create takes nothing returns thistype
        local thistype s=thistype.allocate()
        debug call BJDebugMsg("Stringcode "+I2S(integer(s))+" has been created")
        call s.clear()
        set lastCreatedStringcode=integer(s)
        return s
    endmethod
    
    method onDestroy takes nothing returns nothing
        debug call BJDebugMsg("Stringcode "+I2S(integer(this))+" has been destroyed")
    endmethod
    
    method SetType takes integer i returns boolean
        if .Type==0 then
            set .Type=i
            return true
        endif
        debug call BJDebugMsg("error : Stringcode type redeclared")
        return false
    endmethod
    
    method SetMaxData takes integer i returns boolean
        if .Type==0 then
            set .Type=1
        elseif .Type==2 then
            debug call BJDebugMsg("error : Stringcode type is wrong")
            return false
        endif
        set .maxdata=i
        set .processed=false
        return true
    endmethod
    
    method AddInt takes integer index , integer i returns boolean
        if .Type==0 then
            set .Type=1
        elseif .Type==2 then
            debug call BJDebugMsg("error : Stringcode type is wrong")
            return false
        endif
        if index<100 and index>=0 then
            set .data[index]=i
            set .processed=false
        else
            debug call BJDebugMsg("error : index is too large")
            return false
        endif
        return true
    endmethod
    
    method GetInt takes integer index returns integer
        if .Type==2 and not .processed then
            call .Code2I()
        endif
        if not .processed then
            debug call BJDebugMsg("error : failed")
            return 0
        endif
        if index<100 and index>=0 then
            return .data[index]
        endif
        debug call BJDebugMsg("error : index is too large")
        return 0
    endmethod
    
    method SetStr takes string s returns boolean
        if .Type==0 then
            set .Type=2
        elseif .Type==1 then
            debug call BJDebugMsg("error : Stringcode type is wrong")
            return false
        endif
        set .str=s
        set .processed=false
        return true
    endmethod
    
    method GetStr takes nothing returns string
        if .Type==0 then
            debug call BJDebugMsg("error : Stringcode type is wrong")
            return TCMain_emptyStr
        endif
        if .Type==2 or .processed then
            return str
        endif
        call .I2Code()
        return str
    endmethod
    
endstruct

public function I2Stringcode takes integer i returns integer
    return i
endfunction

public function GetlastCreatedStringCode takes nothing returns integer
    return stringcode.lastCreatedStringcode
endfunction

public function CreateStringcode takes nothing returns integer
    local stringcode p=stringcode.create()
    return p.lastCreatedStringcode
endfunction

public function DestroyStringcode takes integer s returns nothing
    call stringcode(s).destroy()
endfunction

public function ClearStringcode takes integer s returns nothing
    call stringcode(s).clear()
endfunction

public function StringcodeSetType takes integer s, integer ptype returns boolean
    return stringcode(s).SetType(ptype)
endfunction 

public function StringcodeAddInt takes integer s , integer index , integer i returns boolean
    return stringcode(s).AddInt(index-1,i)
endfunction

public function StringcodeAddLongInt takes integer s , integer index , integer i returns nothing
    local integer a
    local integer b
    if i<=pow[4]/2-1 and i>=-pow[4]/2 then
        call StringcodeAddInt(s,index,i)
    else
        set a=i/97825
        if i<0 then
            set b=-i+a*97825
        else
            set b=i-a*97825
        endif
        call StringcodeAddInt(s,index,a)
        call StringcodeAddInt(s,index+1,b)
    endif
endfunction

public function StringcodeSetStr takes integer s , string str returns boolean
    return stringcode(s).SetStr(str)
endfunction

public function StringcodeGetInt takes integer s , integer index returns integer
    return stringcode(s).GetInt(index-1)
endfunction

public function StringcodeGetLongInt takes integer s , integer index returns integer
    return StringcodeGetInt(s,index)*97825+StringcodeGetInt(s,index+1)
endfunction

public function StringcodeGetStr takes integer s returns string
    return stringcode(s).GetStr()
endfunction

public function IsStringcodeSucceeded takes integer s returns boolean
    if stringcode(s).Type==2 then
        call stringcode(s).Code2I()
        return stringcode(s).processed
    endif
    return false
endfunction

public function SetCode takes string s returns nothing
    set tccode=ModuloInteger(StringHash(s),pow[4])
endfunction

private function Init takes nothing returns nothing
    local integer i=0
    local string s=" !#$%&`()*+,./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[]^_'abcdefghijklmnopqrstuvwxyz{|}~"
    loop
        exitwhen i>5
        set pow[i]=R2I(Pow(maxchar,i))
        set i=i+1
    endloop
    set i=0
    loop
        exitwhen i>=pow[1]
        set char[i]=SubString(s,i,i+1)
        set i=i+1
    endloop
    set sep="-"
    set empty=" "
    set emptyStr = ""
    call SetCode("zz97825")
    //set emptyStr=""
endfunction
    
endlibrary

#endif