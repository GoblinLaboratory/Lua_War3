#ifndef HatredSystemIncluded
#define HatredSystemIncluded
#include "9527/SJWE/SJWEBase.j"

library_once HatredSystem requires SJWEBase

globals
    private constant hashtable HASHT = InitHashtable()
    private integer HATRED_MAX_INDEX = 30
    private unit TEMPUNIT = null
    private force wjz_dn = CreateForce()
    private force wjz_wj = CreateForce()
endglobals

function GetComputerForce takes nothing returns force
	return wjz_dn
endfunction
function GetPlayerForce takes nothing returns force
	return wjz_wj
endfunction
function SetSkillHatredFactor takes integer whichskill, real factor returns nothing
    call SaveReal( HASHT, StringHash("SkillHatredFactor"), whichskill, factor )
endfunction
function GetSkillHatredFactor takes integer whichskill returns real
    return LoadReal( HASHT, StringHash("SkillHatredFactor"), whichskill )
endfunction
function SaveUnitHatred takes unit damageunit, unit damagesource, real hatred returns nothing
    call SaveReal( HASHT, GetHandleId(damageunit), GetHandleId(damagesource), hatred )
endfunction
function GetUnitHatred takes unit damageunit, unit damagesource returns real
    return LoadReal( HASHT, GetHandleId(damageunit), GetHandleId(damagesource))
endfunction
function SaveHatredList takes unit damageunit, unit damagesource, integer index returns nothing
    call SaveUnitHandle( HASHT, GetHandleId(damageunit), index, damagesource )
    call SaveInteger( HASHT, GetHandleId(damageunit), GetHandleId(damagesource), index )
endfunction
function GetHatredUnitIndex takes unit damageunit, unit damagesource returns integer
    return LoadInteger( HASHT, GetHandleId(damageunit), GetHandleId(damagesource) )
endfunction
function GetHatredUnitByIndex takes unit damageunit, integer index returns unit
    return LoadUnitHandle( HASHT, GetHandleId(damageunit), index )
endfunction
function GetHatredByIndex takes unit damageunit, integer index returns real
    return LoadReal( HASHT, GetHandleId(damageunit), GetHandleId(GetHatredUnitByIndex( damageunit, index )) )
endfunction
function FlushMissionHatredSystemByUnit takes unit damageunit returns nothing
    call FlushChildHashtable( HASHT, GetHandleId(damageunit) )
    call DestroyIndexAll(GetHandleId(damageunit))
endfunction
function SetHatredMaxIndex takes integer a returns nothing
    set HATRED_MAX_INDEX = a
endfunction

function HatredDebugMsg takes unit damageunit returns nothing
    local integer i
    local integer MaxIndex = GetMaxIndex(GetHandleId(damageunit))
    set i = 1
    loop
        exitwhen i > MaxIndex
        call BJDebugMsg( I2S(i) )
        call BJDebugMsg( I2S(GetHandleId(GetHatredUnitByIndex( damageunit, i))) )
        call BJDebugMsg( R2S(GetHatredByIndex(damageunit, i)) )
        set i = i + 1
    endloop
endfunction

function GetHatredUnit takes unit damageunit, integer SerialNumber returns unit
    local integer i
    local integer k
    local integer MaxIndex = GetMaxIndex(GetHandleId(damageunit))
    local unit    tempunit = null
    local real    temp = 0.0
    if ( SerialNumber < 0 ) then
        set SerialNumber = 0
        else
        if ( SerialNumber >= MaxIndex ) then
            set SerialNumber = MaxIndex
        endif
    endif
    set i = 1
    loop
        exitwhen i > MaxIndex
        call SaveData(i,GetHatredByIndex(damageunit,i))
        set i = i + 1
    endloop
    call quick_sort(1,MaxIndex)
    set k = 1
    loop
        exitwhen k > MaxIndex
        if ( LoadData(SerialNumber) == GetHatredByIndex(damageunit,k) )  then
            set tempunit = GetHatredUnitByIndex(damageunit,k)
        endif
        set k = k + 1
    endloop
    return tempunit
endfunction

function GetHatredMaxUnit takes unit damageunit returns unit
    return GetHatredUnit(damageunit,GetMaxIndex(GetHandleId(damageunit)))
endfunction

function GetHatredMinUnit takes unit damageunit returns unit
    return GetHatredUnit(damageunit,1)
endfunction

function IssueNeutralTargetHatredMaxUnitById takes integer a, unit whichunit, integer id returns nothing
    call IssueNeutralTargetOrderById( Player(a), whichunit, id, GetHatredMaxUnit(GetTriggerUnit()) )
endfunction

function DamageunitdataStockpile takes unit damageunit, unit damagesource returns nothing
    if GetMaxIndex(GetHandleId(damageunit)) < 0 then
       call InitIndex(GetHandleId(damageunit))
    endif
    if ((LoadBoolean( HASHT, GetHandleId(damageunit), GetHandleId(damagesource) ) == false) and (GetMaxIndex(GetHandleId(damageunit)) < HATRED_MAX_INDEX)) then
        call SaveHatredList( damageunit, damagesource, CreateIndex(GetHandleId(damageunit)) )
        call SaveBoolean( HASHT, GetHandleId(damageunit), GetHandleId(damagesource), true )
    elseif ((LoadBoolean( HASHT, GetHandleId(damageunit), GetHandleId(damagesource) ) == false) and (GetMaxIndex(GetHandleId(damageunit)) >= HATRED_MAX_INDEX)) then
        call DestroyIndex(GetHandleId(damageunit),GetHatredUnitIndex(damageunit,GetHatredMinUnit(damageunit)))
        call SaveBoolean( HASHT, GetHandleId(damageunit), GetHandleId(GetHatredMinUnit(damageunit)), false )
        call SaveHatredList( damageunit, damagesource, CreateIndex(GetHandleId(damageunit)) )
        call SaveBoolean( HASHT, GetHandleId(damageunit), GetHandleId(damagesource), true )
    endif
endfunction

function DamageHatredMain takes real a, real b, boolean B returns nothing
    local real damage = 0.0
    local unit damageunit = null
    local unit damagesource = null
    set  damage = GetEventDamage()
    set  damagesource = GetEventDamageSource()
    set  damageunit = GetTriggerUnit()
    call SaveUnitHatred( damageunit, damagesource, ( GetUnitHatred(damageunit, damagesource) + damage * a + b ) )
    if ((GetUnitHatred(damageunit, damagesource) <= 0.00)) then
        call SaveUnitHatred( damageunit, damagesource, 0.0 )
    endif
    if (B == true) then
        call IssueTargetOrderById( damageunit, 851983, GetHatredMaxUnit(damageunit) )
    endif
    set damageunit = null
    set damagesource = null
endfunction

function DamageHatred takes real a1, real b1, real a2, real b2, boolean B returns nothing
    call DamageunitdataStockpile(GetTriggerUnit(),GetEventDamageSource())
    if ((IsUnitType(GetEventDamageSource(), UNIT_TYPE_SUMMONED) == false)) then
        call DamageHatredMain( a1,b1,B )
    else
        call DamageHatredMain( a2,b2,B )
    endif
endfunction

function RUN_EHUD takes nothing returns nothing
    call SaveUnitHatred(GetEnumUnit(),TEMPUNIT,0.0)
    call DestroyIndex(GetHandleId(GetEnumUnit()),GetHatredUnitIndex(GetEnumUnit(),TEMPUNIT))
    set TEMPUNIT = null
endfunction

function Actions_EHUD takes nothing returns nothing
    local group g = CreateGroup()
    call GroupEnumUnitsOfPlayer(g,GetEnumPlayer(),null)
    call ForGroup(g,function RUN_EHUD)
    call DestroyGroup(g)
    set g = null
endfunction

function EliminateHatredUnitDead takes nothing returns nothing
    call ForForce( wjz_dn, function Actions_EHUD )
endfunction

function EliminateHatredUnit takes unit whichunit returns nothing
    if ((IsPlayerInForce(GetOwningPlayer(whichunit), wjz_dn) == true)) then
        call FlushMissionHatredSystemByUnit(whichunit)
    else
        if ((IsPlayerInForce(GetOwningPlayer(whichunit), wjz_wj) == true)) then
	        set TEMPUNIT = whichunit
            call EliminateHatredUnitDead()
        endif
    endif
endfunction

function EliminateHatredAllmain takes nothing returns nothing
    call FlushMissionHatredSystemByUnit( GetEnumUnit() )
endfunction

function EliminateHatredAllgroup takes nothing returns nothing
    local group g = CreateGroup()
    call GroupEnumUnitsOfPlayer(g,GetEnumPlayer(),null)
    call ForGroup(g,function EliminateHatredAllmain)
    call DestroyGroup(g)
    set g = null
endfunction

function EliminateHatredAll takes nothing returns nothing
    call ForForce( wjz_dn, function EliminateHatredAllgroup )
endfunction

function SkillhatredMain takes unit damageunit, unit damagesource, real a, real b, boolean B returns nothing
    local real hatred = 0.0
    set hatred = GetSkillHatredFactor(GetSpellAbilityId())
    call SaveUnitHatred( damageunit, damagesource, ( GetUnitHatred(damageunit, damagesource) + hatred * a + b ) )
    if ((GetUnitHatred(damageunit, damagesource) <= 0.00)) then
        call SaveUnitHatred( damageunit, damagesource, 0.0 )
    endif
    if (B == true) then
        call IssueTargetOrderById( damageunit, 851983, GetHatredMaxUnit(damageunit) )
    endif
    set damageunit = null
endfunction

function Skillhatred takes location point, real radius, real factor, real a, real b, boolean B returns nothing
    local group tempgroup = null
    local unit tempunit = null
    call SetSkillHatredFactor( GetSpellAbilityId(), factor )
    set tempgroup = CreateGroup()
    call GroupEnumUnitsInRange(tempgroup, GetLocationX(point), GetLocationY(point), radius, null)
    loop
        set tempunit = FirstOfGroup(tempgroup)
        exitwhen tempunit == null
        call GroupRemoveUnit(tempgroup, tempunit)
        if ((IsUnitInForce(tempunit, wjz_dn) == true)) then
            call DamageunitdataStockpile(tempunit,GetTriggerUnit())
            call SkillhatredMain( tempunit, GetTriggerUnit(), a, b, B )
        endif
    endloop
    call DestroyGroup(tempgroup)
    set tempgroup = null
    set tempunit = null
endfunction

endlibrary

#endif
