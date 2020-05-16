local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
require "GameManager"
require "ItemManager"
require "Global"
require "Bonus"
require "Attribute"
require "Item"
require "UI"

local trig_test = CJ.CreateTrigger()
BJ.TriggerRegisterPlayerEventEndCinematic (   trig_test,  CJ.Player(0) )
--BJ.TriggerRegisterAnyUnitEventBJ(trig_test, CJ.EVENT_PLAYER_UNIT_SPELL_EFFECT)

-- 下面大量使用了函数定义后直接使用的技巧，这样甚至不需要给函数安一个名字，所以称之为‘匿名函数’。
-- 好处是代码结构更加紧密，也省去了给函数想名字的烦恼。
-- zinc也有匿名函数，如果你使用过zinc，应该不会陌生。
CJ.TriggerAddCondition(trig_test, CJ.Condition(
	function ()
		-- |xxxx|不是一个标准的lua语法，而是ydwe lua的扩展语法，值和jass里'xxxx'一样
		-- 注意，在lua里'xxxx'是一个字符串，和"xxxx"一样。
		
        --return CJ.GetSpellAbilityId() == 1095264354 --'AHhb'
        return true
	end
))

CJ.TriggerAddAction(trig_test,
    function () 
        local GM = GameManager:Instance()
        local bu = Bonus:Instance() 
        local IM = ItemManager:Instance()
        --GM.Players[id].Hero_Unit.UnitID
        
        local it = IM:CreateRandomItem(30)  

        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, it.Uis.Custom)
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, IM:GetName(it))
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, IM:GetExplain(it))

        --local ii = IM:GetItemDota(it.ID+1)
        --if  ii ~=0 then
            --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, ii.Uis.Custom)
            --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, IM:GetName(ii))
            --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, IM:GetExplain(ii))
        --else
            --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, "ii.Uis.Custom")
        --end
       
        BJ.CreateItemLoc( it.ID, BJ.GetRectCenter(BJ.GetPlayableMapRect()))

        japi.EXSetItemDataString(it.ID, 4, IM:GetName(it))
        japi.EXSetItemDataString(it.ID, 3, IM:GetExplain(it)  )
        japi.EXSetItemDataString(it.ID, 1, it.Uis.Art  )
        
        print("按下ESC")
	end
)

