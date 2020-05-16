local CJ = require "jass.common"
-- local BJ = require "blizzard"
local japi = require "jass.japi"
require "EventTemplate"
require "math"
BL = require "ECS\\Blizzard"
Games = require "Game"
-- 伤害类型
DamagedType = {
    {ID = 0, Name = "未知类型", Type = CJ.DAMAGE_TYPE_UNKNOWN},
    {ID = 4, Name = "普通类型", Type = CJ.DAMAGE_TYPE_DAMAGE_TYPE_NORMAL},
    {ID = 5, Name = "增强类型", Type = CJ.DAMAGE_TYPE_ENHANCED},
    {ID = 8, Name = "火焰类型", Type = CJ.DAMAGE_TYPE_FIRE},
    {ID = 9, Name = "冰霜类型", Type = CJ.DAMAGE_TYPE_COLD},
    {ID = 10, Name = "闪电类型", Type = CJ.DAMAGE_TYPE_LIGHTNING},
    {ID = 11, Name = "毒类型", Type = CJ.DAMAGE_TYPE_POISON},
    {ID = 12, Name = "疾病类型", Type = CJ.DAMAGE_TYPE_DISEASE},
    {ID = 13, Name = "神圣类型", Type = CJ.DAMAGE_TYPE_DIVINE},
    {ID = 14, Name = "魔法类型", Type = CJ.DAMAGE_TYPE_MAGIC},
    {ID = 15, Name = "声波类型", Type = CJ.DAMAGE_TYPE_SONIC},
    {ID = 16, Name = "酸性类型", Type = CJ.DAMAGE_TYPE_ACID},
    {ID = 17, Name = "力量类型", Type = CJ.DAMAGE_TYPE_FORCE},
    {ID = 18, Name = "死亡类型", Type = CJ.DAMAGE_TYPE_DEATH},
    {ID = 19, Name = "精神类型", Type = CJ.DAMAGE_MIND},
    {ID = 20, Name = "植物类型", Type = CJ.DAMAGE_PLANT},
    {ID = 21, Name = "防御类型", Type = CJ.DAMAGE_DEFENSIVE},
    {ID = 22, Name = "破坏类型", Type = CJ.DAMAGE_DEMOLITION},
    {ID = 23, Name = "慢性毒药类型", Type = CJ.DAMAGE_SLOW_POISON},
    {ID = 24, Name = "灵魂锁链类型", Type = CJ.DAMAGE_SPIRIT_LINK},
    {ID = 25, Name = "暗影突袭类型", Type = CJ.DAMAGE_SHADOW_STRIKE},
    {ID = 26, Name = "通用类型", Type = CJ.DAMAGE_UNIVERSAL}
}
-- Games = Game:Instance()
DamagedSystemTrigger = {}

-- 任意单位受伤害

DamagedSystemTrigger.f = function()

    -- local u = CJ.GetTriggerUnit() -- 受伤害单位
    -- local ul = CJ.GetEventDamageSource() -- 伤害来源单位
    -- local id = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(CJ.GetTriggerUnit())) -- 触发玩家ID
    -- local ids = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(
    -- CJ.GetEventDamageSource())) -- 伤害来源单位玩家ID
    -- local shz = CJ.GetEventDamage() -- 伤害值

    --local Damage = CJ.GetEventDamage() -- 最终伤害值

    -- local damageType = CJ.ConvertDamageType(japi.EXGetEventDamageData(4))
    local s = japi.EXGetEventDamageData(4)
    for i = #DamagedType, 1, -1 do
        if DamagedType[i].ID == s then
            CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, DamagedType[i].Name)
        end
    end
    if 0 ~= japi.EXGetEventDamageData(2) then
        CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '攻击伤害')
        BL.DamageSource = "攻击伤害"
    else
        CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '技能伤害')
        BL.DamageSource = "技能伤害"
    end
    if 0 ~= japi.EXGetEventDamageData(1) then
        CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '物理伤害')
        BL.DamageType = "物理伤害"
    else
        CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '魔法伤害')
        BL.DamageType = "魔法伤害"
    end
    if 0 ~= japi.EXGetEventDamageData(3) then
        CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '远程伤害')
        BL.DamageCategory = "远程伤害"
    else
        CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '近战伤害')
        BL.DamageCategory = "近战伤害"
    end
    -- 发送消息
    local ev = EventTemplate:Instance()
    ev.Damag:Fire()
    ev.Damaged:Fire()
    -- 设置最终伤害
    -- japi.EXSetEventDamage(Damage)
end

return DamagedSystemTrigger
