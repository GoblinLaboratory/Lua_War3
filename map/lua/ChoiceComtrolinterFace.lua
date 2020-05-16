--酒馆选择英雄
local CJ = require 'jass.common'
local BJ = require 'blizzard'
local japi = require 'jass.japi'
require 'Global'
require 'GameManager'
require 'Attribute'
require 'UnitManager'
require 'Controlinterface'
require 'HeroDota'

local trig_JiNengFuWen = CJ.CreateTrigger()

BJ.TriggerRegisterAnyUnitEventBJ(trig_JiNengFuWen, CJ.EVENT_PLAYER_UNIT_SPELL_FINISH)
---------------
local GM = GameManager:Instance()
local UM = UnitManager:Instance()
local CI = Controlinterface:Instance()
---------------
CJ.TriggerAddCondition(
    trig_JiNengFuWen,
    CJ.Condition(
        function()
            return (CJ.GetUnitTypeId(CJ.GetTriggerUnit()) == Global:GetId('hsz3'))
        end
    )
)
CJ.TriggerAddAction(
    trig_JiNengFuWen,
    function()
        local u = CJ.GetTriggerUnit() -- 触发单位
        local id = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(CJ.GetTriggerUnit()))
         --触发玩家ID

        if GM.Players[id].Hero_ID ~= 0 then
            --天赋符文设置技能等级
            function SetSkillLevel(l)
                local iii = Global:GetStrId(CJ.GetUnitTypeId(GM.Players[id].Hero_ID))
                if GM.Players[id].interfacevalue == 11 then
                    CJ.SetUnitAbilityLevel(GM.Players[id].Hero_ID, Global:GetId(HeroDota[iii]['技能1'].ID), l)
                end
                if GM.Players[id].interfacevalue == 12 then
                    CJ.SetUnitAbilityLevel(GM.Players[id].Hero_ID, Global:GetId(HeroDota[iii]['技能2'].ID), l)
                end
                if GM.Players[id].interfacevalue == 13 then
                    CJ.SetUnitAbilityLevel(GM.Players[id].Hero_ID, Global:GetId(HeroDota[iii]['技能3'].ID), l)
                end
                if GM.Players[id].interfacevalue == 14 then
                    CJ.SetUnitAbilityLevel(GM.Players[id].Hero_ID, Global:GetId(HeroDota[iii]['技能4'].ID), l)
                end
                if GM.Players[id].interfacevalue == 15 then
                    CJ.SetUnitAbilityLevel(GM.Players[id].Hero_ID, Global:GetId(HeroDota[iii]['技能5'].ID), l)
                end
                if GM.Players[id].interfacevalue == 16 then
                    CJ.SetUnitAbilityLevel(GM.Players[id].Hero_ID, Global:GetId(HeroDota[iii]['技能6'].ID), l)
                end
            end
            --主界面
            if GM.Players[id].interfacevalue == 0 then
                --天赋
                if
                    japi.EXGetAbilityDataString(japi.EXGetUnitAbility(u, CJ.GetSpellAbilityId()), 1, 203) ==
                        '符文A[00' .. tostring(id - 1) .. ']'
                 then
                    GM.Players[id].interfacevalue = 1
                    CJ.DisplayTextToPlayer(
                        CJ.Player(0),
                        0,
                        0,
                        '玩家ID' .. tostring(id) .. '点击了技能符文界面' .. tostring(GM.Players[id].interfacevalue)
                    )
                    CI:ChoiceComtrolinterFace(u, id)
                end
                if
                    japi.EXGetAbilityDataString(japi.EXGetUnitAbility(u, CJ.GetSpellAbilityId()), 1, 203) ==
                        '符文B[00' .. tostring(id - 1) .. ']'
                 then
                    GM.Players[id].interfacevalue = 0
                    CJ.DisplayTextToPlayer(
                        CJ.Player(0),
                        0,
                        0,
                        '玩家ID' .. tostring(id) .. '点击了任务界面' .. tostring(GM.Players[id].interfacevalue)
                    )
                end
                if
                    japi.EXGetAbilityDataString(japi.EXGetUnitAbility(u, CJ.GetSpellAbilityId()), 1, 203) ==
                        '符文C[00' .. tostring(id - 1) .. ']'
                 then
                    GM.Players[id].interfacevalue = 0
                    CJ.DisplayTextToPlayer(
                        CJ.Player(0),
                        0,
                        0,
                        '玩家ID' .. tostring(id) .. '点击了背包界面' .. tostring(GM.Players[id].interfacevalue)
                    )
                end
            elseif GM.Players[id].interfacevalue == 1 then
                --天赋主界面
                CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '111')
                --返回
                if
                    japi.EXGetAbilityDataString(japi.EXGetUnitAbility(u, CJ.GetSpellAbilityId()), 1, 203) ==
                        '符文L[00' .. tostring(id - 1) .. ']'
                 then
                    GM.Players[id].interfacevalue = 0
                    CJ.DisplayTextToPlayer(
                        CJ.Player(0),
                        0,
                        0,
                        '玩家ID' .. tostring(id) .. '点击了技能符文界面' .. tostring(GM.Players[id].interfacevalue)
                    )
                    CI:Intinterface(u, id)
                end
                --技能1符文
                if
                    japi.EXGetAbilityDataString(japi.EXGetUnitAbility(u, CJ.GetSpellAbilityId()), 1, 203) ==
                        '符文A[00' .. tostring(id - 1) .. ']'
                 then
                    GM.Players[id].interfacevalue = 11
                    CI:ChoiceFuWEn(u, id, 1)
                end

                --技能2符文
                if
                    japi.EXGetAbilityDataString(japi.EXGetUnitAbility(u, CJ.GetSpellAbilityId()), 1, 203) ==
                        '符文B[00' .. tostring(id - 1) .. ']'
                 then
                    GM.Players[id].interfacevalue = 12
                    CI:ChoiceFuWEn(u, id, 2)
                end
                --技能3符文
                if
                    japi.EXGetAbilityDataString(japi.EXGetUnitAbility(u, CJ.GetSpellAbilityId()), 1, 203) ==
                        '符文C[00' .. tostring(id - 1) .. ']'
                 then
                    GM.Players[id].interfacevalue = 13
                    CI:ChoiceFuWEn(u, id, 3)
                end
                --技能4符文
                if
                    japi.EXGetAbilityDataString(japi.EXGetUnitAbility(u, CJ.GetSpellAbilityId()), 1, 203) ==
                        '符文D[00' .. tostring(id - 1) .. ']'
                 then
                    GM.Players[id].interfacevalue = 14
                    CI:ChoiceFuWEn(u, id, 4)
                end
                --技能5符文
                if
                    japi.EXGetAbilityDataString(japi.EXGetUnitAbility(u, CJ.GetSpellAbilityId()), 1, 203) ==
                        '符文E[00' .. tostring(id - 1) .. ']'
                 then
                    GM.Players[id].interfacevalue = 15
                    CI:ChoiceFuWEn(u, id, 5)
                end
                --技能6符文
                if
                    japi.EXGetAbilityDataString(japi.EXGetUnitAbility(u, CJ.GetSpellAbilityId()), 1, 203) ==
                        '符文F[00' .. tostring(id - 1) .. ']'
                 then
                    GM.Players[id].interfacevalue = 16
                    CI:ChoiceFuWEn(u, id, 6)
                end
            elseif GM.Players[id].interfacevalue > 10 and GM.Players[id].interfacevalue < 20 then
                --返回
                if
                    japi.EXGetAbilityDataString(japi.EXGetUnitAbility(u, CJ.GetSpellAbilityId()), 1, 203) ==
                        '符文L[00' .. tostring(id - 1) .. ']'
                 then
                    GM.Players[id].interfacevalue = 1
                    CJ.DisplayTextToPlayer(
                        CJ.Player(0),
                        0,
                        0,
                        '玩家ID' .. tostring(id) .. '点击了技能符文界面' .. tostring(GM.Players[id].interfacevalue)
                    )
                    CI:ChoiceComtrolinterFace(u, id)
                end
                --1符文
                if
                    japi.EXGetAbilityDataString(japi.EXGetUnitAbility(u, CJ.GetSpellAbilityId()), 1, 203) ==
                        '符文A[00' .. tostring(id - 1) .. ']'
                 then
                    SetSkillLevel(2)
                    GM.Players[id].interfacevalue = 1
                    CI:ChoiceComtrolinterFace(u, id)
                end

                --2符文
                if
                    japi.EXGetAbilityDataString(japi.EXGetUnitAbility(u, CJ.GetSpellAbilityId()), 1, 203) ==
                        '符文B[00' .. tostring(id - 1) .. ']'
                 then
                    SetSkillLevel(3)
                    GM.Players[id].interfacevalue = 1
                    CI:ChoiceComtrolinterFace(u, id)
                end
                --3符文
                if
                    japi.EXGetAbilityDataString(japi.EXGetUnitAbility(u, CJ.GetSpellAbilityId()), 1, 203) ==
                        '符文C[00' .. tostring(id - 1) .. ']'
                 then
                    SetSkillLevel(4)
                    GM.Players[id].interfacevalue = 1
                    CI:ChoiceComtrolinterFace(u, id)
                end
            end
        end
    end
)
