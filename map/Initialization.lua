local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
require "EventTemplate"
require "War3\\DamagedSystemTrigger"
require "Global"
require "ECS\\Model\\Maths"
require "Game"
require "War3\\UI"
require "AttributeSystem\\Bonus"
require "ECS\\Manager\\EventManager"

local trigint = CJ.CreateTrigger()

BJ.TriggerRegisterTimerEventSingle(trigint, 1.1)
CJ.TriggerAddCondition(trigint, CJ.Condition(
                           function()
        -- CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, "初始化，请不要进行任何操作") 
        return true
    end))
GM = Game:Instance()
CJ.TriggerAddAction(trigint, function()

    CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, "地图初始化。。。")
    CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, "加载事件系统")
    -- 事件
    -- local ev = EventTemplate:Instance()
    -- ev.AnyUnitDamaged:connect(DamagedSystemTrigger.f)
    -- ev.SetPrototype:connect(AttributeSystem.SetPrototype)
    EM = EventManager:Instance()
    -- ev.HeroAddPrototype:connect(AttributeSystem:AddPrototype)
    -- 初始化马甲系统
    -- 初始化万能属性系统
    local bu = Bonus:Instance()
    bu:Int()
    local JiShiQI = CJ.CreateTimer()
    -- CJ.TimerStart(JiShiQI, 2.50, false, function()
    --     CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, "加载马甲系统")
    -- end)
    -- BJ.QuestMessageBJ( BJ.GetPlayersAll(), BJ.bj_QUESTMESSAGE_SECRET, "秘密任务" )
    -- BJ.QuestMessageBJ( BJ.GetPlayersAll(), BJ.bj_QUESTMESSAGE_ALWAYSHINT, "提示任务" )
    CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, "加载马甲系统")
    -- 装备马甲
    local mj = "hsz2"
    local i = 1
    CJ.TimerStart(CJ.CreateTimer(), 0.3, true, function()
        if i == 13 then
            CJ.DestroyTimer(CJ.GetExpiredTimer())
        else
            BJ.CreateNUnitsAtLoc(1, Maths.GetId(mj), CJ.Player(i - 1),
                                 BJ.GetRectCenter(BJ.GetPlayableMapRect()),
                                 270.0)
            local ZbMJ = BJ.GetLastCreatedUnit()
            CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWA" .. tostring(i - 1)))
            CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWB" .. tostring(i - 1)))
            CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWC" .. tostring(i - 1)))
            CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWD" .. tostring(i - 1)))
            CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWE" .. tostring(i - 1)))
            CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWF" .. tostring(i - 1)))
            CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWG" .. tostring(i - 1)))
            CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWH" .. tostring(i - 1)))
            CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWI" .. tostring(i - 1)))
            CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWJ" .. tostring(i - 1)))
            CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWK" .. tostring(i - 1)))
            CJ.UnitAddAbility(ZbMJ, Maths.GetId("Avul"))

            GM.MajiID["玩家" .. tostring(i)].Equipment_Maji = ZbMJ
            i = i + 1
        end
    end)
    -- 创建天赋马甲
    local tfmj = "hsz3"
    BJ.CreateNUnitsAtLoc(1, Maths.GetId(tfmj), CJ.Player(0),
                         BJ.GetRectCenter(BJ.GetPlayableMapRect()), 270.0)
    GM.MajiID["玩家1"].FuWen_Maji = BJ.GetLastCreatedUnit()
    BJ.CreateNUnitsAtLoc(1, Maths.GetId(tfmj), CJ.Player(1),
                         BJ.GetRectCenter(BJ.GetPlayableMapRect()), 270.0)
    GM.MajiID["玩家2"].FuWen_Maji = BJ.GetLastCreatedUnit()
    BJ.CreateNUnitsAtLoc(1, Maths.GetId(tfmj), CJ.Player(2),
                         BJ.GetRectCenter(BJ.GetPlayableMapRect()), 270.0)
    GM.MajiID["玩家3"].FuWen_Maji = BJ.GetLastCreatedUnit()
    BJ.CreateNUnitsAtLoc(1, Maths.GetId(tfmj), CJ.Player(3),
                         BJ.GetRectCenter(BJ.GetPlayableMapRect()), 270.0)
    GM.MajiID["玩家4"].FuWen_Maji = BJ.GetLastCreatedUnit()
    BJ.CreateNUnitsAtLoc(1, Maths.GetId(tfmj), CJ.Player(4),
                         BJ.GetRectCenter(BJ.GetPlayableMapRect()), 270.0)
    GM.MajiID["玩家5"].FuWen_Maji = BJ.GetLastCreatedUnit()
    BJ.CreateNUnitsAtLoc(1, Maths.GetId(tfmj), CJ.Player(5),
                         BJ.GetRectCenter(BJ.GetPlayableMapRect()), 270.0)
    GM.MajiID["玩家6"].FuWen_Maji = BJ.GetLastCreatedUnit()
    BJ.CreateNUnitsAtLoc(1, Maths.GetId(tfmj), CJ.Player(6),
                         BJ.GetRectCenter(BJ.GetPlayableMapRect()), 270.0)
    GM.MajiID["玩家7"].FuWen_Maji = BJ.GetLastCreatedUnit()
    BJ.CreateNUnitsAtLoc(1, Maths.GetId(tfmj), CJ.Player(7),
                         BJ.GetRectCenter(BJ.GetPlayableMapRect()), 270.0)
    GM.MajiID["玩家8"].FuWen_Maji = BJ.GetLastCreatedUnit()
    BJ.CreateNUnitsAtLoc(1, Maths.GetId(tfmj), CJ.Player(8),
                         BJ.GetRectCenter(BJ.GetPlayableMapRect()), 270.0)
    GM.MajiID["玩家9"].FuWen_Maji = BJ.GetLastCreatedUnit()
    BJ.CreateNUnitsAtLoc(1, Maths.GetId(tfmj), CJ.Player(9),
                         BJ.GetRectCenter(BJ.GetPlayableMapRect()), 270.0)
    GM.MajiID["玩家10"].FuWen_Maji = BJ.GetLastCreatedUnit()
    BJ.CreateNUnitsAtLoc(1, Maths.GetId(tfmj), CJ.Player(10),
                         BJ.GetRectCenter(BJ.GetPlayableMapRect()), 270.0)
    GM.MajiID["玩家11"].FuWen_Maji = BJ.GetLastCreatedUnit()
    BJ.CreateNUnitsAtLoc(1, Maths.GetId(tfmj), CJ.Player(11),
                         BJ.GetRectCenter(BJ.GetPlayableMapRect()), 270.0)
    GM.MajiID["玩家12"].FuWen_Maji = BJ.GetLastCreatedUnit()
    CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, "初始化完毕")
    -- BJ.DisplayTextToForce( BJ.GetPlayersAll(), "初始化完毕" )
    print("---------------------------------------")
    -- ---测试
    -- UI:RemoveAbility(0, GM.MajiID["玩家1"].FuWen_Maji, 1, " name", "explain",
    --                  "ReplaceableTextures\\CommandButtons\\BTNNightElfCaptureFlag.blp")
    -- UI:RemoveAbility(1, GM.MajiID["玩家1"].FuWen_Maji, 1, " name", "explain",
    --                  "ReplaceableTextures\\CommandButtons\\BTNNightElfCaptureFlag.blp")
    -- UI:RemoveAbility(2, GM.MajiID["玩家1"].FuWen_Maji, 1, " name", "explain",
    --                  "ReplaceableTextures\\CommandButtons\\BTNNightElfCaptureFlag.blp")
    -- UI:RemoveAbility(3, GM.MajiID["玩家1"].FuWen_Maji, 1, " name", "explain",
    --                  "ReplaceableTextures\\CommandButtons\\BTNNightElfCaptureFlag.blp")
    -- UI:RemoveAbility(4, GM.MajiID["玩家1"].FuWen_Maji, 1, " name", "explain",
    --                  "ReplaceableTextures\\CommandButtons\\BTNNightElfCaptureFlag.blp")
    -- UI:RemoveAbility(5, GM.MajiID["玩家1"].FuWen_Maji, 1, " name", "explain",
    --                  "ReplaceableTextures\\CommandButtons\\BTNNightElfCaptureFlag.blp")
    -- UI:RemoveAbility(6, GM.MajiID["玩家1"].FuWen_Maji, 1, " name", "explain",
    --                  "ReplaceableTextures\\CommandButtons\\BTNNightElfCaptureFlag.blp")
    -- UI:RemoveAbility(7, GM.MajiID["玩家1"].FuWen_Maji, 1, " name", "explain",
    --                  "ReplaceableTextures\\CommandButtons\\BTNNightElfCaptureFlag.blp")
    -- UI:RemoveAbility(8, GM.MajiID["玩家1"].FuWen_Maji, 1, " name", "explain",
    --                  "ReplaceableTextures\\CommandButtons\\BTNNightElfCaptureFlag.blp")
    -- UI:RemoveAbility(9, GM.MajiID["玩家1"].FuWen_Maji, 1, " name", "explain",
    --                  "ReplaceableTextures\\CommandButtons\\BTNNightElfCaptureFlag.blp")
    -- UI:RemoveAbility(10, GM.MajiID["玩家1"].FuWen_Maji, 1, " name", "explain",
    --                  "ReplaceableTextures\\CommandButtons\\BTNNightElfCaptureFlag.blp")
    -- UI:RemoveAbility(11, GM.MajiID["玩家1"].FuWen_Maji, 1, " name", "explain",
    --                  "ReplaceableTextures\\CommandButtons\\BTNNightElfCaptureFlag.blp")

    -- japi.EXSetItemDataString(x.ID, 1, x.TuBiao )
end)
