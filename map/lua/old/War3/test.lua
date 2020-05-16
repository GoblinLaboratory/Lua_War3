local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
require "ItemManager"
require "GameManager"
require "Global"

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
        --BJ.CreateItemLoc(1514287152, CJ.Location(72, 380))
        --BJ.CreateItemLoc('ZB00', CJ.GetUnitLoc(CJ.GetTriggerUnit()) )
        --BJ.CreateItemLoc(1514287152, CJ.GetUnitLoc(CJ.GetTriggerUnit()) )
        s1 = ItemManager:Instance() 

        local x = s1:CreateRandomItem(60)
        local GM = GameManager:Instance()
        --GM:GetHero(CJ.Player(0)).Equipment_Maji_ID
        BJ.CreateItemLoc( x.ID, CJ.GetUnitLoc(GM.Maji_ID["玩家1"].Hero_ID))
        japi.EXSetItemDataString(x.ID, 4, s1:GetName(x))
       -- print(x.Name)
        --print(s1:GetExplain(x) )
        japi.EXSetItemDataString(x.ID, 3, s1:GetExplain(x)  )
        japi.EXSetItemDataString(x.ID, 1, x.TuBiao )
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, #s1:UseEquipmentList)
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, x.Name)
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,"物品等级"..x.ZHUANGBEIDENGJI)
		print("按下ESC")
	end
)