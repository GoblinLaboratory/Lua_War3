local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
require "ECS\\Manager\\WeaponryManager"
require "Game"
local trig_test = CJ.CreateTrigger()
BJ.TriggerRegisterPlayerEventEndCinematic(trig_test, CJ.Player(0))
-- BJ.TriggerRegisterAnyUnitEventBJ(trig_test, CJ.EVENT_PLAYER_UNIT_SPELL_EFFECT)

-- 下面大量使用了函数定义后直接使用的技巧，这样甚至不需要给函数安一个名字，所以称之为‘匿名函数’。
-- 好处是代码结构更加紧密，也省去了给函数想名字的烦恼。
-- zinc也有匿名函数，如果你使用过zinc，应该不会陌生。
CJ.TriggerAddCondition(trig_test, CJ.Condition(
                           function()
        -- |xxxx|不是一个标准的lua语法，而是ydwe lua的扩展语法，值和jass里'xxxx'一样
        -- 注意，在lua里'xxxx'是一个字符串，和"xxxx"一样。

        -- return CJ.GetSpellAbilityId() == 1095264354 --'AHhb'
        return true
    end))
local GM = Game:Instance()
CJ.TriggerAddAction(trig_test, function()
    CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, "按下ESC")
    --local id = BJ.GetConvertedPlayerId(CJ.GetTriggerPlayer()) -- 触发玩家ID
    print("按下ESC")
    local IM = WeaponryManager:Instance()
    local x = IM:CreateItemDota(15, 60)
    BJ.CreateItemLoc(x.ID, CJ.GetUnitLoc(GM.MajiID["玩家1"].Hero_ID))
    japi.EXSetItemDataString(x.ID, 4, IM:GetName(x))
    japi.EXSetItemDataString(x.ID, 3, IM:GetExplain(x))
    japi.EXSetItemDataString(x.ID, 1, IM:GetIcon(x))

    --CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, IM:GetExplain(x))
end)
