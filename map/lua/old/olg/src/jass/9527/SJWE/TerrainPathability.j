#ifndef TerrainPathabilityIncluded
#define TerrainPathabilityIncluded
library TerrainPathability initializer Init
globals
    private constant real    MAX_RANGE     = 10.
    private constant integer DUMMY_ITEM_ID = 'wolg'
endglobals

globals    
    private item       Item   = null
    private rect       Find   = null
    private item array Hid
    private integer    HidMax = 0
    public  real       X      = 0.
    public  real       Y      = 0.
endglobals

function IsTerrainDeepWater takes real x, real y returns boolean
    return not IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY) and IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY)
endfunction
function IsTerrainShallowWater takes real x, real y returns boolean
    return not IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY) and not IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY) and IsTerrainPathable(x, y, PATHING_TYPE_BUILDABILITY)
endfunction
function IsTerrainLand takes real x, real y returns boolean
    return IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY)
endfunction
function IsTerrainPlatform takes real x, real y returns boolean
    return not IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY) and not IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY) and not IsTerrainPathable(x, y, PATHING_TYPE_BUILDABILITY)
endfunction

private function HideItem takes nothing returns nothing
    if IsItemVisible(GetEnumItem()) then
        set Hid[HidMax] = GetEnumItem()
        call SetItemVisible(Hid[HidMax], false)
        set HidMax = HidMax + 1
    endif
endfunction
function IsTerrainWalkable takes real x, real y returns boolean
    call MoveRectTo(Find, x, y)
    call EnumItemsInRect(Find ,null, function HideItem)
    call SetItemPosition(Item, x, y) //Unhides the item
    set X = GetItemX(Item)
    set Y = GetItemY(Item)
    call SetItemVisible(Item, false)
    loop
        exitwhen HidMax <= 0
        set HidMax = HidMax - 1
        call SetItemVisible(Hid[HidMax], true)
        set Hid[HidMax] = null
    endloop
    return (X-x)*(X-x)+(Y-y)*(Y-y) <= MAX_RANGE*MAX_RANGE and not IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY)
endfunction

private function Init takes nothing returns nothing
    set Find = Rect(0., 0., 128., 128.)
    set Item = CreateItem(DUMMY_ITEM_ID , 0, 0)
    call SetItemVisible(Item, false)
endfunction
endlibrary
#endif
