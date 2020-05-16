local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
require "ItemSystem"
require "GameManager"
require "Global"
require "HeroDota"
require "GuangHuan"
require "ForceAura"
require "AuraManager"
require "math"
require "AttackEffectManager"
--///////////////////////////////////////////////////////////////////////////////////////////////////////
--人族战士技能触发
--
--
--
--///////////////////////////////////////////////////////////////////////////////////////////////////////

--光环开启
local Aura = AuraManager:Instance()
local trig_GuangHuan = CJ.CreateTrigger()
local AEManager = AttackEffectManager:Instance()
BJ.TriggerRegisterAnyUnitEventBJ(trig_GuangHuan, CJ.EVENT_PLAYER_UNIT_ISSUED_ORDER)
CJ.TriggerAddCondition(trig_GuangHuan, CJ.Condition(
    function ()
        local Str = BJ.OrderId2StringBJ(BJ.GetIssuedOrderIdBJ())
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, Str )
        return BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ("unimmolation") or 
        BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ("immolation")     
    end
))
CJ.TriggerAddAction(trig_GuangHuan,
    function () 
        local GM = GameManager:Instance()
        local id = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(CJ.GetTriggerUnit()))--触发玩家ID
        local Str = BJ.OrderId2StringBJ(BJ.GetIssuedOrderIdBJ())
        GM:GetHero(id).gh = {} 
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, Str )
        --人族战士 命令光环
        if CJ.GetUnitTypeId(CJ.GetTriggerUnit()) == Global:GetId('H002') then
            local gh = {}
            if CJ.GetUnitAbilityLevel(CJ.GetTriggerUnit(), Global:GetId('A00M')) == 1 then
                if( Str == "unimmolation" ) then
                    CJ.UnitRemoveAbility( CJ.GetTriggerUnit(), Global:GetId('A00O'))
                    Aura:ForceAuraRemoveUnit(CJ.GetTriggerUnit())  
                    Aura:LifeAuraRemoveUnit(CJ.GetTriggerUnit()) 
                else
                    CJ.UnitAddAbility(CJ.GetTriggerUnit(), Global:GetId('A00O'))--添加技能

                end
            elseif CJ.GetUnitAbilityLevel(CJ.GetTriggerUnit(), Global:GetId('A00M')) == 2 then
                if( Str == "unimmolation" ) then
                    CJ.UnitRemoveAbility( CJ.GetTriggerUnit(), Global:GetId('A00O'))
                    Aura:ForceAuraRemoveUnit(CJ.GetTriggerUnit())  
                    Aura:LifeAuraRemoveUnit(CJ.GetTriggerUnit()) 
                else
                    CJ.UnitAddAbility(CJ.GetTriggerUnit(), Global:GetId('A00O'))--添加技能
                end
            elseif CJ.GetUnitAbilityLevel(CJ.GetTriggerUnit(), Global:GetId('A00M')) == 3 then
                if( Str == "unimmolation" ) then
                    CJ.UnitRemoveAbility( CJ.GetTriggerUnit(), Global:GetId('A00O'))
                    Aura:ForceAuraRemoveUnit(CJ.GetTriggerUnit()) 
                    Aura:LifeAuraRemoveUnit(CJ.GetTriggerUnit())  
                else
                    CJ.UnitAddAbility(CJ.GetTriggerUnit(), Global:GetId('A00O'))--添加技能
                    Aura:ForceAuraAddUnit(CJ.GetTriggerUnit())  
                end
            elseif CJ.GetUnitAbilityLevel(CJ.GetTriggerUnit(), Global:GetId('A00M')) == 4 then
                if( Str == "unimmolation" ) then
                    CJ.UnitRemoveAbility( CJ.GetTriggerUnit(), Global:GetId('A00O'))
                    Aura:ForceAuraRemoveUnit(CJ.GetTriggerUnit())  
                    Aura:LifeAuraRemoveUnit(CJ.GetTriggerUnit()) 
                else
                    CJ.UnitAddAbility(CJ.GetTriggerUnit(), Global:GetId('A00O'))--添加技能
                    Aura:LifeAuraAddUnit(CJ.GetTriggerUnit())  
                end
            end
        end
	end
)
--战士怒吼技能
local trig_ZS_NuHou = CJ.CreateTrigger()

BJ.TriggerRegisterAnyUnitEventBJ(trig_ZS_NuHou, CJ.EVENT_PLAYER_UNIT_SPELL_EFFECT)

CJ.TriggerAddCondition(trig_ZS_NuHou, CJ.Condition(
    function ()
        return CJ.IsHeroUnitId(CJ.GetUnitTypeId(CJ.GetTriggerUnit())) == true and CJ.GetSpellAbilityId() == Global:GetId('A00J')
    end
))

CJ.TriggerAddAction(trig_ZS_NuHou,
    function () 

        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, CJ.GetUnitAbilityLevel(CJ.GetTriggerUnit(), Global:GetId('A00J')) )
        local SU = CJ.GetTriggerUnit()
        if CJ.GetUnitAbilityLevel(CJ.GetTriggerUnit(), Global:GetId('A00J')) == 1 then
            CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, "1级") 
        elseif CJ.GetUnitAbilityLevel(CJ.GetTriggerUnit(), Global:GetId('A00J')) == 2 then
            CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, "2级") 

            local jass_group = CJ.CreateGroup()
            jass_group = BJ.GetUnitsInRangeOfLocMatching(350.00, CJ.GetUnitLoc(CJ.GetTriggerUnit()), CJ.Condition(function()
                return CJ.IsUnitEnemy(CJ.GetFilterUnit(), CJ.GetOwningPlayer(CJ.GetTriggerUnit())) == true
            end))
            --CJ.GroupEnumUnitsInRange(jass_group, CJ.GetUnitX(CJ.GetTriggerUnit()), CJ.GetUnitY(CJ.GetTriggerUnit()),350, nil)
            --CJ.GroupAddUnit( jass_group, CJ.GetTriggerUnit() )
            --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,"单位组数量"..BJ.CountUnitsInGroup(jass_group))
            BJ.ForGroupBJ( jass_group, function()
                CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,"mingzi"..CJ.GetUnitName(CJ.GetEnumUnit()))
                local n = 0
                local x = CJ.GetEnumUnit()
                CJ.TimerStart(CJ.CreateTimer(), 0.20, true,  function () 
                    if n == 16 then
                        CJ.DestroyTimer(CJ.GetExpiredTimer())
                    else
                        n = n + 1						
                        --CJ.DestroyEffect(CJ.AddSpecialEffectTarget("Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl", x, "overhead"))
                        CJ.IssueTargetOrder( x, "attack",SU)
                        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,n)
                        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,"mingzi"..CJ.GetUnitName(CJ.GetEnumUnit()))
                    end
                end)
            end) 

            --setmetatable(gh,GuangHuan) 
        elseif CJ.GetUnitAbilityLevel(CJ.GetTriggerUnit(), Global:GetId('A00J')) == 3 then
            --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, "3级") 
            BJ.CreateNUnitsAtLoc( 1, Global:GetId('e003'), CJ.GetOwningPlayer(CJ.GetTriggerUnit()), CJ.GetUnitLoc(CJ.GetTriggerUnit()), CJ.bj_UNIT_FACING )
            local z = BJ.GetLastCreatedUnit()
            CJ.ShowUnit ( z , false )--隐藏单位
            CJ.UnitAddAbility(z, Global:GetId('A00I') )--添加技能
            CJ.IssueTargetOrder( z, "cripple", SU)--施放技能
            CJ.RemoveUnit(z)--删除单位

            local jass_group = CJ.CreateGroup()
            jass_group = BJ.GetUnitsInRangeOfLocMatching(350.00, CJ.GetUnitLoc(CJ.GetTriggerUnit()), CJ.Condition(function()
                return CJ.IsUnitAlly(CJ.GetFilterUnit(), CJ.GetOwningPlayer(CJ.GetTriggerUnit())) == true --同盟单位
            end))

            BJ.ForGroupBJ( jass_group, function()
                local x = CJ.GetEnumUnit()
                BJ.CreateNUnitsAtLoc( 1, Global:GetId('e003'), CJ.GetOwningPlayer(x), CJ.GetUnitLoc(x), CJ.bj_UNIT_FACING )
                local z1 = BJ.GetLastCreatedUnit()
                CJ.ShowUnit ( z1 , false )--隐藏单位
                CJ.UnitAddAbility(z1, Global:GetId('A00I') )--添加技能
                CJ.IssueTargetOrder( z1, "cripple", x)--施放技能
                CJ.RemoveUnit(z1)--删除单位
            end) 
        elseif CJ.GetUnitAbilityLevel(CJ.GetTriggerUnit(), Global:GetId('A00J')) == 4 then
            --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, "4级") 
            BJ.CreateNUnitsAtLoc( 1, Global:GetId('e003'), CJ.GetOwningPlayer(CJ.GetTriggerUnit()), CJ.GetUnitLoc(CJ.GetTriggerUnit()), CJ.bj_UNIT_FACING )
            local z = BJ.GetLastCreatedUnit()
            CJ.ShowUnit ( z , false )--隐藏单位
            CJ.UnitAddAbility(z, Global:GetId('A00G') )--添加技能
            --CJ.IssueTargetOrder( z, "cripple", SU)--施放技能
            CJ.IssueImmediateOrder( z, "roar" )
            CJ.RemoveUnit(z)--删除单位
        end
    end)

 
 --战士顺劈斩
 local trig_ZS_ShunPiZhan = CJ.CreateTrigger()

 BJ.TriggerRegisterAnyUnitEventBJ(trig_ZS_ShunPiZhan, CJ.EVENT_PLAYER_UNIT_SPELL_EFFECT)
 
 CJ.TriggerAddCondition(trig_ZS_ShunPiZhan, CJ.Condition(
     function ()
         return CJ.IsHeroUnitId(CJ.GetUnitTypeId(CJ.GetTriggerUnit())) == true and CJ.GetSpellAbilityId() == Global:GetId('A00F')
     end
 ))
 
 CJ.TriggerAddAction(trig_ZS_ShunPiZhan,
     function () 
 
         --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, CJ.GetUnitAbilityLevel(CJ.GetTriggerUnit(), Global:GetId('A00J')) )
         local SU = CJ.GetTriggerUnit()
         if CJ.GetUnitAbilityLevel(CJ.GetTriggerUnit(), Global:GetId('A00F')) == 1 then
             
         elseif CJ.GetUnitAbilityLevel(CJ.GetTriggerUnit(), Global:GetId('A00F')) == 2 then
            AEManager:VertigoAddUnit(CJ.GetTriggerUnit(),CJ.GetSpellTargetUnit(),5) 
             BJ.CreateNUnitsAtLoc( 1, Global:GetId('e003'), CJ.GetOwningPlayer(CJ.GetTriggerUnit()), CJ.GetUnitLoc(CJ.GetTriggerUnit()), CJ.bj_UNIT_FACING )
             local z = BJ.GetLastCreatedUnit()
             CJ.ShowUnit( z , false )--隐藏单位
             CJ.UnitApplyTimedLife( z, Global:GetId('BHwe'), 1 )--设置生命周期
             --BJ.ShowUnitHide( z)
             CJ.UnitAddAbility(z, Global:GetId('A00U') )--添加技能
             CJ.SetUnitAbilityLevel( z, Global:GetId('A00U'), 1 )
             --CJ.IssueTargetOrder( z, "cripple", SU)--施放技能
             CJ.IssueTargetOrder( z, "bloodlust", CJ.GetTriggerUnit() )
             --CJ.RemoveUnit(z)--删除单位
             CJ.IssueTargetOrder( CJ.GetTriggerUnit(), "attack", CJ.GetSpellTargetUnit() )
              
             --setmetatable(gh,GuangHuan) 
         elseif CJ.GetUnitAbilityLevel(CJ.GetTriggerUnit(), Global:GetId('A00F')) == 3 then
             
         elseif CJ.GetUnitAbilityLevel(CJ.GetTriggerUnit(), Global:GetId('A00F')) == 4 then
             
         end
     end)  

    --///////////////////////////////////////////////////////////////////////////////////////////////////////
    --人族战士技能触发
    --
    --
    --
     --///////////////////////////////////////////////////////////////////////////////////////////////////////
