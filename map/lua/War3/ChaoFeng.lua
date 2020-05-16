local CJ = require 'jass.common'
local BJ = require 'blizzard'
require 'Global'

local trig_ChaoFeng = CJ.CreateTrigger()
BJ.TriggerRegisterAnyUnitEventBJ(trig_ChaoFeng, CJ.EVENT_PLAYER_UNIT_SPELL_EFFECT)

CJ.TriggerAddCondition(
    trig_ChaoFeng,
    CJ.Condition(
        function()
            -- |xxxx|不是一个标准的lua语法，而是ydwe lua的扩展语法，值和jass里'xxxx'一样
            -- 注意，在lua里'xxxx'是一个字符串，和"xxxx"一样。
            return CJ.GetSpellAbilityId() == Global:GetId('A006') --'AHhb'
        end
    )
)

CJ.TriggerAddAction(
    trig_ChaoFeng,
    function()
        local u = CJ.GetSpellAbilityUnit() --技能施放单位
        local DanWeZu = CJ.CreateGroup()
        local id = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(CJ.GetSpellAbilityUnit()))
         --触发玩家ID

        if CJ.GetUnitAbilityLevel(CJ.GetSpellAbilityUnit(), Global:GetId('A006')) == 2 then
            --选取单位组
            DanWeZu =
                BJ.GetUnitsInRangeOfLocMatching(
                300,
                CJ.GetUnitLoc(u),
                CJ.Condition(
                    function()
                        return CJ.IsUnitEnemy(CJ.GetFilterUnit(), CJ.GetOwningPlayer(u)) == true
                    end
                )
            )
            --CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '嘲讽')
            --单位组做动作
            local n = 0
            -- 这里定义的两个局部变量，可以直接在下面的计时器函数直接使用。当然你依然可以使用hashtable来传递(但不推荐)。
            -- 这是和jass的最大差别。
            CJ.TimerStart(
                CJ.CreateTimer(),
                0.3,
                true,
                function()
                    if n == 3.3 then
                        CJ.DestroyTimer(CJ.GetExpiredTimer())
                    else
                        n = n + 0.3
                        BJ.ForGroupBJ(
                            DanWeZu,
                            function()
                                local x = CJ.GetEnumUnit()
                                CJ.IssueTargetOrder(x, 'attack', u)
                            end
                        )
                    end
                end
            )
        end
        if CJ.GetUnitAbilityLevel(CJ.GetSpellAbilityUnit(), Global:GetId('A006')) == 3 then
            CJ.UnitAddAbility(u, Global:GetId('A00P'))
            --CJ.UnitRemoveAbility(u, Global:GetId("A00N"))
            CJ.SetPlayerAbilityAvailable(CJ.Player(id - 1), Global:GetId('A00P'), false)
            local n1 = 0
            CJ.TimerStart(
                CJ.CreateTimer(),
                2,
                true,
                function()
                    if n1 > 10.1 then
                        CJ.UnitRemoveAbility(u, Global:GetId('A00P'))
                        --CJ.UnitRemoveAbility(u, Global:GetId("A00L"))
                        CJ.DestroyTimer(CJ.GetExpiredTimer())
                    else
                        n1 = n1 + 3
                    end
                end
            )
        end
        if CJ.GetUnitAbilityLevel(CJ.GetSpellAbilityUnit(), Global:GetId('A006')) == 4 then
            CJ.UnitAddAbility(u, Global:GetId('A00N'))
            --CJ.UnitRemoveAbility(u, Global:GetId("A00N"))
            CJ.SetPlayerAbilityAvailable(CJ.Player(id - 1), Global:GetId('A00N'), false)
            local n1 = 0
            CJ.TimerStart(
                CJ.CreateTimer(),
                2,
                true,
                function()
                    if n1 > 10.1 then
                        CJ.UnitRemoveAbility(u, Global:GetId('A00N'))
                        --CJ.UnitRemoveAbility(u, Global:GetId("A00L"))
                        CJ.DestroyTimer(CJ.GetExpiredTimer())
                    else
                        n1 = n1 + 3
                    end
                end
            )
        end
    end
)
