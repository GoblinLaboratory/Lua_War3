local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
require "Global"
require "EventTemplate"
require "DamagedSystemTrigger"
require "math"
require "Item"
require "GameManager"
require "ItemManager"
require "Bonus"
require "AuraManager"

local trigint = CJ.CreateTrigger()

BJ.TriggerRegisterTimerEventSingle(trigint, 1.1)
CJ.TriggerAddCondition(trigint, CJ.Condition(
                           function()
        -- CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, "初始化，请不要进行任何操作") 
        return true
    end))

CJ.TriggerAddAction(trigint, function()

    CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0,
                           "初始化，请不要进行任何操作")
    -- BJ.QuestMessageBJ( CJ.GetPlayersAll(), BJ.bj_QUESTMESSAGE_UPDATED, "初始化，请不要进行任何操作" )
    math.randomseed(tostring(os.time()):reverse():sub(1, 7))
    -- 测试Item
    local YingXiong = {}
    setmetatable(YingXiong, Item)
    CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '物品' .. YingXiong.name)

    --
    local ev = EventTemplate:Instance()
    -- ev.AnyUnitDamaged:connect(DamagedSystemtest.f)
    local GM = GameManager:Instance()

    local It = ItemManager:Instance()

    local bu = Bonus:Instance()
    bu:Int()

    local ev = EventTemplate:Instance()
    ev.AnyUnitDamaged:connect(DamagedSystemTrigger.f)

    -- 光环系统
    local Aura = AuraManager:Instance()
    Aura:Start()
end)
