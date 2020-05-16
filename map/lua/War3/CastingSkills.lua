--任意单位施放技能
local CJ = require 'jass.common'
local BJ = require 'blizzard'
require 'Global'
require 'Effect'
require 'GameManager'
require 'UnitManager'

--local GM = GameManager:Instance()

local UM = UnitManager:Instance()

--创建任意单位施放技能事件
local trig_CastingSkills = CJ.CreateTrigger()
BJ.TriggerRegisterAnyUnitEventBJ(trig_CastingSkills, CJ.EVENT_PLAYER_UNIT_SPELL_EFFECT)

--添加条件
CJ.TriggerAddCondition(
    trig_CastingSkills,
    CJ.Condition(
        function()
            -- |xxxx|不是一个标准的lua语法，而是ydwe lua的扩展语法，值和jass里'xxxx'一样
            -- 注意，在lua里'xxxx'是一个字符串，和"xxxx"一样。
            return true
        end
    )
)

--添加动作
CJ.TriggerAddAction(
    trig_CastingSkills,
    function()
        local u = CJ.GetSpellAbilityUnit() -- 施法单位
        local id = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(u)) --施法玩家ID

        --圣骑士  神圣之光
        if CJ.GetSpellAbilityId() == Global:GetId('A00Z') then
            --CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '神圣之光')
            --技能施放目标
            local SpellTargetUnit = CJ.GetSpellTargetUnit()
            local P = CJ.GetUnitLoc(SpellTargetUnit)
            if CJ.GetUnitAbilityLevel(u, Global:GetId('A00Z')) == 3 then
                --BJ.CreateNUnitsAtLoc(1, Global:GetId('e001'), CJ.Player(id - 1), P, CJ.bj_UNIT_FACING)
                --local z = BJ.GetLastCreatedUnit()
                --CJ.ShowUnit(z, false)
                --隐藏单位
                --CJ.UnitApplyTimedLife(z, Global:GetId('BHwe'), 1)
                --设置生命周期
                --CJ.UnitAddAbility(z, Global:GetId('A009'))
                --添加技能
                --CJ.SetUnitAbilityLevel(z, Global:GetId('A009'), 1)
                --CJ.IssueTargetOrder(z, 'antimagicshell', SpellTargetUnit)
                Effect:CastUnit(u, SpellTargetUnit, 'A009', 'antimagicshell')
            --施放技能
            end
            if CJ.GetUnitAbilityLevel(u, Global:GetId('A00Z')) == 4 then
                local DanWeZu = CJ.CreateGroup()
                --选取单位组
                DanWeZu =
                    BJ.GetUnitsInRangeOfLocMatching(
                    300,
                    P,
                    CJ.Condition(
                        function()
                            local x = CJ.GetEnumUnit()
                            -- return CJ.IsPlayerAlly(CJ.GetFilterUnit(), CJ.GetOwningPlayer(u)) == true
                            return CJ.IsUnitAlly(CJ.GetFilterUnit(), CJ.GetOwningPlayer(u)) == true and
                                CJ.IsUnitType(x, CJ.UNIT_TYPE_STRUCTURE) == false --同盟单位
                        end
                    )
                )
                BJ.ForGroupBJ(
                    DanWeZu,
                    function()
                        local x = CJ.GetEnumUnit()
                        Effect:Treat(
                            x,
                            UM:GetUnit(u).Attributes.MagicAttackIntensity + CJ.GetHeroInt(u, true) * 10 +
                                CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_LIFE) * 0.05
                        )
                        CJ.DestroyEffect(
                            CJ.AddSpecialEffectTarget(
                                'Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl',
                                x,
                                'overhead'
                            )
                        )
                    end
                )
            end
            Effect:Treat(
                SpellTargetUnit,
                UM:GetUnit(u).Attributes.MagicAttackIntensity + CJ.GetHeroInt(u, true) * 10 +
                    CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_LIFE) * 0.05
            )
        end

        --圣骑士  神圣护甲
        if BJ.UnitHasBuffBJ(u, Global:GetId('B008')) == true then
            Effect:Evil(u, CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_MANA) * 0.15)
        end

        --圣骑士  光明审判
        if CJ.GetSpellAbilityId() == Global:GetId('A00Y') then
            CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '光明审判')
            --技能施放目标
            local SpellTargetUnit = CJ.GetSpellTargetUnit()
            if CJ.GetUnitAbilityLevel(u, Global:GetId('A00Y')) == 1 then
                CJ.UnitDamageTarget(
                    u,
                    SpellTargetUnit,
                    UM:GetUnit(u).Attributes.MagicAttackIntensity * 20 + CJ.GetHeroInt(u, true) * 12,
                    true,
                    false,
                    CJ.ATTACK_TYPE_NORMAL,
                    CJ.DAMAGE_TYPE_NORMAL,
                    CJ.WEAPON_TYPE_WHOKNOWS
                )
            end
            if CJ.GetUnitAbilityLevel(u, Global:GetId('A00Y')) == 2 then
                Effect:CastUnit(u, SpellTargetUnit, 'A010', 'slow')
            end
            if CJ.GetUnitAbilityLevel(u, Global:GetId('A00Y')) == 4 then
                local n = 0
                CJ.TimerStart(
                    CJ.CreateTimer(),
                    1.00,
                    true,
                    function()
                        if n == 3 then
                            CJ.DestroyTimer(CJ.GetExpiredTimer())
                        else
                            n = n + 1
                            CJ.UnitDamageTarget(
                                u,
                                SpellTargetUnit,
                                UM:GetUnit(u).Attributes.MagicAttackIntensity * 20 + CJ.GetHeroInt(u, true) * 12,
                                true,
                                false,
                                CJ.ATTACK_TYPE_NORMAL,
                                CJ.DAMAGE_TYPE_NORMAL,
                                CJ.WEAPON_TYPE_WHOKNOWS
                            )
                            CJ.DestroyEffect(
                                CJ.AddSpecialEffectTarget(
                                    'Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl',
                                    SpellTargetUnit,
                                    'overhead'
                                )
                            )
                        end
                    end
                )
            end
        end

        --圣骑士  祈祷
        if CJ.GetSpellAbilityId() == Global:GetId('A00C') then
            local P = CJ.GetUnitLoc(u)
            if CJ.GetUnitAbilityLevel(u, Global:GetId('A00C')) == 1 then
                local DanWeZu = CJ.CreateGroup()
                --选取单位组
                DanWeZu =
                    BJ.GetUnitsInRangeOfLocMatching(
                    600,
                    P,
                    CJ.Condition(
                        function()
                            local x = CJ.GetEnumUnit()
                            -- return CJ.IsPlayerAlly(CJ.GetFilterUnit(), CJ.GetOwningPlayer(u)) == true
                            return CJ.IsUnitAlly(CJ.GetFilterUnit(), CJ.GetOwningPlayer(u)) == true and
                                CJ.IsUnitType(x, CJ.UNIT_TYPE_STRUCTURE) == false --同盟单位
                        end
                    )
                )
                BJ.ForGroupBJ(
                    DanWeZu,
                    function()
                        local x = CJ.GetEnumUnit()
                        Effect:Treat(x, CJ.GetUnitState(x, CJ.UNIT_STATE_MAX_LIFE) * 0.2)
                        Effect:Evil(x, CJ.GetUnitState(x, CJ.UNIT_STATE_MAX_MANA) * 0.2)
                        CJ.DestroyEffect(
                            CJ.AddSpecialEffectTarget('Abilities\\Spells\\Items\\AIre\\AIreTarget.mdll', x, 'overhead')
                        )
                    end
                )
            end
            if CJ.GetUnitAbilityLevel(u, Global:GetId('A00C')) == 2 then
                local DanWeZu = CJ.CreateGroup()
                --选取单位组
                DanWeZu =
                    BJ.GetUnitsInRangeOfLocMatching(
                    600,
                    P,
                    CJ.Condition(
                        function()
                            local x = CJ.GetEnumUnit()
                            -- return CJ.IsPlayerAlly(CJ.GetFilterUnit(), CJ.GetOwningPlayer(u)) == true
                            return CJ.IsUnitAlly(CJ.GetFilterUnit(), CJ.GetOwningPlayer(u)) == true and
                                CJ.IsUnitType(x, CJ.UNIT_TYPE_STRUCTURE) == false --同盟单位
                        end
                    )
                )
                BJ.ForGroupBJ(
                    DanWeZu,
                    function()
                        local x = CJ.GetEnumUnit()
                        Effect:Treat(x, CJ.GetUnitState(x, CJ.UNIT_STATE_MAX_LIFE) * 0.2)
                        Effect:Evil(x, CJ.GetUnitState(x, CJ.UNIT_STATE_MAX_MANA) * 0.2)
                        CJ.DestroyEffect(
                            CJ.AddSpecialEffectTarget('Abilities\\Spells\\Items\\AIre\\AIreTarget.mdll', x, 'overhead')
                        )
                    end
                )

                --耀目之息
                local DanWeZu1 = CJ.CreateGroup()
                --选取单位组
                DanWeZu1 =
                    BJ.GetUnitsInRangeOfLocMatching(
                    600,
                    P,
                    CJ.Condition(
                        function()
                            local x = CJ.GetEnumUnit()
                            -- return CJ.IsPlayerAlly(CJ.GetFilterUnit(), CJ.GetOwningPlayer(u)) == true
                            return CJ.IsUnitEnemy(CJ.GetFilterUnit(), CJ.GetOwningPlayer(u)) == true and
                                CJ.IsUnitType(x, CJ.UNIT_TYPE_STRUCTURE) == false --敌对单位
                        end
                    )
                )
                local n = 0
                CJ.TimerStart(
                    CJ.CreateTimer(),
                    1.00,
                    true,
                    function()
                        if n == 3 then
                            CJ.DestroyTimer(CJ.GetExpiredTimer())
                        else
                            n = n + 1
                            BJ.ForGroupBJ(
                                DanWeZu1,
                                function()
                                    local x = CJ.GetEnumUnit()
                                    CJ.UnitDamageTarget(
                                        u,
                                        x,
                                        UM:GetUnit(u).Attributes.MagicAttackIntensity * 20 + CJ.GetHeroInt(u, true) * 12,
                                        true,
                                        false,
                                        CJ.ATTACK_TYPE_NORMAL,
                                        CJ.DAMAGE_TYPE_NORMAL,
                                        CJ.WEAPON_TYPE_WHOKNOWS
                                    )
                                    CJ.DestroyEffect(
                                        CJ.AddSpecialEffectTarget(
                                            'Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl',
                                            x,
                                            'overhead'
                                        )
                                    )
                                end
                            )
                        end
                    end
                )
            end
            if CJ.GetUnitAbilityLevel(u, Global:GetId('A00C')) == 3 then
                local DanWeZu = CJ.CreateGroup()
                --选取单位组
                DanWeZu =
                    BJ.GetUnitsInRangeOfLocMatching(
                    600,
                    P,
                    CJ.Condition(
                        function()
                            local x = CJ.GetEnumUnit()
                            -- return CJ.IsPlayerAlly(CJ.GetFilterUnit(), CJ.GetOwningPlayer(u)) == true
                            return CJ.IsUnitAlly(CJ.GetFilterUnit(), CJ.GetOwningPlayer(u)) == true and
                                CJ.IsUnitType(x, CJ.UNIT_TYPE_STRUCTURE) == false --同盟单位
                        end
                    )
                )
                BJ.ForGroupBJ(
                    DanWeZu,
                    function()
                        local x = CJ.GetEnumUnit()
                        Effect:Treat(x, CJ.GetUnitState(x, CJ.UNIT_STATE_MAX_LIFE) * 0.3)
                        Effect:Evil(x, CJ.GetUnitState(x, CJ.UNIT_STATE_MAX_MANA) * 0.3)
                        CJ.DestroyEffect(
                            CJ.AddSpecialEffectTarget('Abilities\\Spells\\Items\\AIre\\AIreTarget.mdll', x, 'overhead')
                        )
                    end
                )
            end
            if CJ.GetUnitAbilityLevel(u, Global:GetId('A00C')) == 4 then
                local DanWeZu = CJ.CreateGroup()
                --选取单位组
                DanWeZu =
                    BJ.GetUnitsInRangeOfLocMatching(
                    1500,
                    P,
                    CJ.Condition(
                        function()
                            local x = CJ.GetEnumUnit()
                            -- return CJ.IsPlayerAlly(CJ.GetFilterUnit(), CJ.GetOwningPlayer(u)) == true
                            return CJ.IsUnitAlly(CJ.GetFilterUnit(), CJ.GetOwningPlayer(u)) == true and
                                CJ.IsUnitType(x, CJ.UNIT_TYPE_STRUCTURE) == false --同盟单位
                        end
                    )
                )
                BJ.ForGroupBJ(
                    DanWeZu,
                    function()
                        local x = CJ.GetEnumUnit()
                        Effect:Treat(x, CJ.GetUnitState(x, CJ.UNIT_STATE_MAX_LIFE) * 0.2)
                        Effect:Evil(x, CJ.GetUnitState(x, CJ.UNIT_STATE_MAX_MANA) * 0.2)
                        CJ.DestroyEffect(
                            CJ.AddSpecialEffectTarget('Abilities\\Spells\\Items\\AIre\\AIreTarget.mdll', x, 'overhead')
                        )
                    end
                )
            end
        end

        --圣骑士  祈祷结束
        --审判骑士
    end
)
