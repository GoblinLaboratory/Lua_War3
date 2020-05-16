local CJ = require 'jass.common'
local BJ = require 'blizzard'
local japi = require 'jass.japi'
require 'GameManager'
require 'UnitManager'
require 'Global'
--require "EventTemplate"
require 'Effect'
require 'math'

--任意单位伤害

local trig_AnyDamagedSystem = CJ.CreateTrigger()

--任意单位进入地图
BJ.TriggerRegisterEnterRectSimple(trig_AnyDamagedSystem, BJ.GetPlayableMapRect())

local GM = GameManager:Instance()

local UM = UnitManager:Instance()

--local ev = EventTemplate:Instance()

CJ.TriggerAddCondition(
    trig_AnyDamagedSystem,
    CJ.Condition(
        function()
            return true
        end
    )
)

CJ.TriggerAddAction(
    trig_AnyDamagedSystem,
    function()
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '注册伤害事件'..CJ.GetUnitName(CJ.GetTriggerUnit()))
        ---添加到单位管理器
        --UM:AddUnit(CJ.GetTriggerUnit())
        if UM:IsUnit(CJ.GetTriggerUnit()) == false then
            UM:AddUnit(CJ.GetTriggerUnit())
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '注册伤害事件'..CJ.GetUnitName(CJ.GetTriggerUnit()))
        end
        --创建一个触发器
        local rTrg = CJ.CreateTrigger()
        --单位受到伤害事件
        CJ.TriggerRegisterUnitEvent(rTrg, CJ.GetTriggerUnit(), CJ.EVENT_UNIT_DAMAGED)
        --条件
        CJ.TriggerAddCondition(
            rTrg,
            CJ.Condition(
                function()
                    return true
                end
            )
        )

        --动作
        CJ.TriggerAddAction(
            rTrg,
            function()
                local u = CJ.GetTriggerUnit()
                --受伤害单位
                local ul = CJ.GetEventDamageSource()
                --伤害来源单位
                local id = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(CJ.GetTriggerUnit()))
                --触发玩家ID
                local ids = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(CJ.GetEventDamageSource()))
                --伤害来源单位玩家ID
                local shz = CJ.GetEventDamage()
                --伤害值
                local sh = shz
                --ev.AnyUnitDamaged:Fire()--发送消息
                --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '受到伤害')
                --获取攻击类型
                if 0 ~= japi.EXGetEventDamageData(2) then
                --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '攻击伤害')
                end

                --获取伤害类型
                if 0 ~= japi.EXGetEventDamageData(1) then
                    --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '物理伤害')
                    --受伤害单位为英雄
                    if CJ.IsUnitType(u, CJ.UNIT_TYPE_HERO) == true then
                    end
                    --物理吸血
                    if UM:GetUnit(ul).Attributes.AttackBloodSucking > 0 then
                        Effect:BloodSucking(ul, shz * UM:GetUnit(ul).Attributes.AttackBloodSucking)
                    end
                    --物理暴击
                    if UM:GetUnit(CJ.GetEventDamageSource()).Attributes.CriticalHitProbability > 0 then
                        local Rn = math.random(1, 100)
                        if Rn < UM:GetUnit(CJ.GetEventDamageSource()).Attributes.CriticalHitProbability then
                            sh = sh * UM:GetUnit(CJ.GetEventDamageSource()).Attributes.AttackCriticismIntensity
                        end
                    end
                    --闪避
                    if UM:GetUnit(CJ.GetEventDamageSource()).Attributes.Dodge > 0 then
                        local Rn = math.random(1, 100)
                        if Rn < UM:GetUnit(CJ.GetEventDamageSource()).Attributes.Dodge then
                            sh = 0
                        end
                    end
                    --格挡
                    if UM:GetUnit(CJ.GetEventDamageSource()).Attributes.Block > 0 then
                        local Rn = math.random(1, 100)
                        if Rn < UM:GetUnit(CJ.GetEventDamageSource()).Attributes.Block then
                            sh = 0
                        end
                    end
                else
                    --CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '魔法伤害')
                    --法术吸血
                    if UM:GetUnit(CJ.GetEventDamageSource()).Attributes.MagicBloodSucking > 0 then
                        Effect:BloodSucking(
                            CJ.GetEventDamageSource(),
                            shz * UM:GetUnit(CJ.GetEventDamageSource()).Attributes.MagicBloodSucking
                        )
                    end
                    --法术强度
                    if UM:GetUnit(CJ.GetEventDamageSource()).Attributes.MagicAttackIntensity > 0 then
                        sh = sh + 3 * UM:GetUnit(CJ.GetEventDamageSource()).Attributes.MagicAttackIntensity
                    end
                    --法术暴击
                    if UM:GetUnit(CJ.GetEventDamageSource()).Attributes.MagicCriticalHitProbability > 0 then
                        local Rn = math.random(1, 100)
                        if Rn < UM:GetUnit(CJ.GetEventDamageSource()).Attributes.MagicCriticalHitProbability then
                            sh = sh * UM:GetUnit(CJ.GetEventDamageSource()).Attributes.MagicCriticismIntensity
                        end
                    end
                end
                --获取是否为远程伤害
                if 0 ~= japi.EXGetEventDamageData(3) then
                    --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '远程伤害')
                else
                    --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '近战伤害')
                end
                -- CJ.DestroyTrigger(CJ.GetTriggeringTrigger())
                --技能减少伤害
                --受伤害单位是英雄
                if CJ.IsUnitType(u, CJ.UNIT_TYPE_HERO) == true then
                    --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '英雄测试')
                    --战士防御
                    if CJ.GetUnitAbilityLevel(u, Global:GetId('A000')) > 0 and UM:GetUnit(u).defend == true then
                        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '战士防御测试')
                        if CJ.GetUnitAbilityLevel(u, Global:GetId('A000')) == 1 then
                            --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '战士防御测试1')
                            sh = sh * 0.7
                        elseif CJ.GetUnitAbilityLevel(u, Global:GetId('A000')) == 2 then
                            --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '战士防御测试2')
                            sh = sh * 0.5
                        elseif CJ.GetUnitAbilityLevel(u, Global:GetId('A000')) == 3 then
                            --elseif CJ.GetUnitAbilityLevel(u, Global:GetId("A000")) == 4 then
                            --sh = sh * 0.7
                            --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '战士防御测试3')
                            sh = sh * 0.7
                        elseif CJ.GetUnitAbilityLevel(u, Global:GetId('A000')) == 4 then
                            local Rn = math.random(1, 100)
                            if Rn > 70 then
                                --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '战士防御测试4')
                                sh = 0
                                --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '格挡伤害')
                                CJ.DestroyEffect(
                                    CJ.AddSpecialEffectTarget(
                                        'Abilities\\Spells\\Human\\Defend\\DefendCaster.mdl',
                                        u,
                                        'chest'
                                    )
                                )
                            else
                                sh = sh * 0.7
                            end
                        end
                    else
                    end
                end
                --技能增加伤害
                --伤害来源单位是英雄
                if CJ.IsUnitType(ul, CJ.UNIT_TYPE_HERO) == true then
                    if BJ.UnitHasBuffBJ(ul, Global:GetId('B003')) == true then
                        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '战士命令光环1')
                        sh = sh + 2 * CJ.GetHeroStr(ul, true)
                        CJ.DestroyEffect(
                            CJ.AddSpecialEffectTarget(
                                'Abilities\\Weapons\\SearingArrow\\SearingArrowMissile.mdl',
                                ul,
                                'weapon'
                            )
                        )
                    --CJ.DestroyEffect(CJ.AddSpecialEffectTarget("Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl", ul, "overhead"))
                    end
                    if BJ.UnitHasBuffBJ(ul, Global:GetId('B004')) == true then
                        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '战士命令光环2')
                        local xx = CJ.GetUnitState(ul, CJ.UNIT_STATE_MAX_LIFE) - CJ.GetUnitState(ul, CJ.UNIT_STATE_LIFE)
                        sh = sh + xx * 0.2
                        CJ.DestroyEffect(
                            CJ.AddSpecialEffectTarget(
                                'Abilities\\Weapons\\SearingArrow\\SearingArrowMissile.mdl',
                                ul,
                                'weapon'
                            )
                        )
                    end
                end
                --圣骑士审判
                if BJ.UnitHasBuffBJ(u, Global:GetId('B009')) == true then
                    sh = sh * 1.15
                end
                --圣骑士专注光环
                if BJ.UnitHasBuffBJ(u, Global:GetId('B006')) == true then
                    if sh > CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_LIFE) * 0.3 then
                        sh = CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_LIFE) * 0.3
                    end
                end
                --战士冲锋
                if BJ.UnitHasBuffBJ(ul, Global:GetId('A00U')) == true then
                    CJ.UnitRemoveAbility(ul, Global:GetId('A00V'))
                end
                --设置最终伤害
                japi.EXSetEventDamage(sh)

                --战士斩杀
                if CJ.GetUnitAbilityLevel(ul, Global:GetId('A004')) == 1 then
                    --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '战士斩杀1')
                    if CJ.GetUnitState(u, CJ.UNIT_STATE_LIFE) < CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_LIFE) * 0.15 then
                        CJ.DestroyEffect(
                            CJ.AddSpecialEffectTarget(
                                'Abilities\\Weapons\\HydraliskImpact\\HydraliskImpact.mdl',
                                ul,
                                'weapon'
                            )
                        )
                        CJ.KillUnit(u)
                    end
                elseif CJ.GetUnitAbilityLevel(ul, Global:GetId('A004')) == 2 then
                    --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '战士斩杀2')
                    if CJ.GetUnitState(u, CJ.UNIT_STATE_LIFE) < CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_LIFE) * 0.15 then
                        CJ.DestroyEffect(
                            CJ.AddSpecialEffectTarget(
                                'Abilities\\Weapons\\HydraliskImpact\\HydraliskImpact.mdl',
                                ul,
                                'weapon'
                            )
                        )
                        Effect:Treat(ul, CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_LIFE) * 0.1)
                        CJ.KillUnit(u)
                    end
                elseif CJ.GetUnitAbilityLevel(ul, Global:GetId('A004')) == 3 then
                    --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '战士斩杀3')
                    if CJ.GetUnitState(u, CJ.UNIT_STATE_LIFE) < CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_LIFE) * 0.15 then
                        CJ.DestroyEffect(
                            CJ.AddSpecialEffectTarget(
                                'Abilities\\Weapons\\HydraliskImpact\\HydraliskImpact.mdl',
                                ul,
                                'weapon'
                            )
                        )
                        CJ.KillUnit(u)
                        BJ.CreateNUnitsAtLoc(1, Global:GetId('e001'), CJ.Player(ids - 1), CJ.GetUnitLoc(ul), 270.0)
                        local JmMJ = BJ.GetLastCreatedUnit()
                        CJ.UnitAddAbility(JmMJ, Global:GetId('A00R'))
                        CJ.ShowUnit(JmMJ, false)
                        CJ.IssueTargetOrder(JmMJ, 'bloodlust', ul)
                        CJ.UnitApplyTimedLife(JmMJ, Global:GetId('BHwe'), 2.00)
                    end
                elseif CJ.GetUnitAbilityLevel(ul, Global:GetId('A004')) == 4 then
                    --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '战士斩杀4')
                    if CJ.GetUnitState(u, CJ.UNIT_STATE_LIFE) < CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_LIFE) * 0.2 then
                        CJ.DestroyEffect(
                            CJ.AddSpecialEffectTarget(
                                'Abilities\\Weapons\\HydraliskImpact\\HydraliskImpact.mdl',
                                ul,
                                'weapon'
                            )
                        )
                        CJ.KillUnit(u)
                    end
                else
                end
            end
        )
    end
)
