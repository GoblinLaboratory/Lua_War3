#ifndef SY_CheckWalkIncluded
#define SY_CheckWalkIncluded

library CheckWalk
globals
private item array HiddeenItems
private integer HiddenItemsIndex = 0
endglobals

private function CheckWalkAction takes nothing returns nothing
    if IsItemVisible(GetEnumItem()) then
    set HiddeenItems[HiddenItemsIndex] = GetEnumItem()
    call SetItemVisible(HiddeenItems[HiddenItemsIndex], false)
    set HiddenItemsIndex = (HiddenItemsIndex + 1 )
    endif
endfunction

public function XY takes real x,real y returns boolean
    local item Item = CreateItem('wtlg', 0, 0) 
    local real x2 = 0
    local real y2 = 0
    local rect RecT = Rect(0, 0, 0, 0)
    local boolean B
    call SetItemVisible( Item , false)
    call MoveRectTo(RecT, x, y)
    call EnumItemsInRect(RecT, null, function CheckWalkAction)
    call SetItemPosition(Item, x, y)
    set x2 = GetItemX(Item)
    set y2 = GetItemY(Item)
    call SetItemVisible(Item, false)
    loop
    exitwhen HiddenItemsIndex <= 0
    set HiddenItemsIndex = HiddenItemsIndex - 1
    call SetItemVisible(HiddeenItems[HiddenItemsIndex], true)
    set HiddeenItems[HiddenItemsIndex] = null
    endloop
    set B = ((x2-x)*(x2-x) + (y2-y)*(y2-y) <= 100.0) and (not IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY)) 
    call RemoveRect(RecT)
    call RemoveItem(Item)
    set Item = null
    set RecT = null
    return(B)
endfunction

public function Loc takes location p returns boolean
    return XY(GetLocationX(p),GetLocationY(p))
endfunction

endlibrary




#endif
