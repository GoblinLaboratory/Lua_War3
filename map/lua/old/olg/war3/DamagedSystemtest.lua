local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
require "ItemSystem"
require "GameManager"
require "Global"
require "EventTemplate"
require "math"

DamagedSystemtest = {}


--任意单位受伤害

DamagedSystemtest.f = function(...) 

    --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,'附加护甲'.. japi.GetUnitState(CJ.GetTriggerUnit(),CJ.ConvertUnitState(0x20)))
    local u = CJ.GetTriggerUnit()--受伤害单位
    local ul = CJ.GetEventDamageSource()--伤害来源单位
    local id = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(CJ.GetTriggerUnit()))--触发玩家ID
    local ids = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(CJ.GetEventDamageSource()))--伤害来源单位玩家ID
    local GM = GameManager:Instance()
    local shz = CJ.GetEventDamage()--伤害值
    local  Damage = CJ.GetEventDamage() --最终伤害值
    --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,'原始伤害'..Damage)

    --///////////////////////////////////////////////////////////////////////////////////////////////////////
    --人族战士技能触发
    --
    --
    --
     --///////////////////////////////////////////////////////////////////////////////////////////////////////
    --战士顶盾技能
    if BJ.UnitHasBuffBJ(u, Global:GetId('B000')) then
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,"战士受到攻击") 
        if CJ.GetUnitAbilityLevel(u, Global:GetId('A000')) == 1 then
            Damage = shz * 0.8
            --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,'顶盾一级伤害'..Damage)
        end
        if CJ.GetUnitAbilityLevel(u, Global:GetId('A000')) == 2 then
            Damage = shz * 0.5
            --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,'顶盾四级伤害'..Damage)
        end
    end
    --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,CJ.GetUnitTypeId(ul))
    --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, Global:GetId('H002'))
    --人族战士-斩杀技能
    if CJ.GetUnitTypeId(ul) == Global:GetId('H002') then
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,'斩杀技能开始')
        if CJ.GetUnitState(u, CJ.UNIT_STATE_LIFE) > 100.00 and CJ.GetUnitState(u, CJ.UNIT_STATE_LIFE) <= 300.00 then
            --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,'生命值小于300')
            local Rn = math.random(1,10)
            if Rn < 4 then
                CJ.DestroyEffect(CJ.AddSpecialEffectTarget("Objects\\Spawnmodels\\Other\\NeutralBuildingExplosion\\NeutralBuildingExplosion.mdl", u, "origin"))
                CJ.KillUnit(u)
                
            end
        end
        if CJ.GetUnitState(u, CJ.UNIT_STATE_LIFE) <= 100.00 then
            --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,'生命值小于100')
            CJ.DestroyEffect(CJ.AddSpecialEffectTarget("Objects\\Spawnmodels\\Other\\NeutralBuildingExplosion\\NeutralBuildingExplosion.mdl",u, "origin"))
            CJ.KillUnit(u)
        end

        if CJ.GetUnitAbilityLevel(ul, Global:GetId('A00K')) == 1 then
        
        elseif CJ.GetUnitAbilityLevel(ul, Global:GetId('A00K')) == 2 then

        elseif CJ.GetUnitAbilityLevel(ul, Global:GetId('A00K')) == 3 then

        elseif CJ.GetUnitAbilityLevel(ul, Global:GetId('A00K')) == 4 then

        end
    end

    --///////////////////////////////////////////////////////////////////////////////////////////////////////
    --人族战士技能触发
    --
    --
    --
     --///////////////////////////////////////////////////////////////////////////////////////////////////////
    --攻击伤害
    if 0 ~= japi.EXGetEventDamageData(2) then
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '攻击伤害') 

       -- local s = CJ.GetEventDamage()
        local hj = japi.GetUnitState(CJ.GetTriggerUnit(),CJ.ConvertUnitState(0x20)) --获取护甲
        --local sh = s*s/(s+hj*3)
        Damage = Damage*Damage/(Damage+hj*3)
        
        --japi.EXSetEventDamage(sh) --设置伤害值
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, sh) 
        if CJ.IsUnitType(ul, CJ.UNIT_TYPE_HERO) == true then
            
        else

        end
        if CJ.IsUnitType(u, CJ.UNIT_TYPE_HERO) == true then
            local xd = GM:GetHero(id)
            if xd.ShangHaiJianMian ~= 0 then
                --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,'伤害免疫'..xd.ShangHaiJianMian)
            else
                --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,'没有伤害免疫')
                xd.ShangHaiJianMian = 20
            end
        else

        end
    else --法术伤害
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '法术伤害') 
    end
    --if 0 ~= japi.EXGetEventDamageData(1) then
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '物理伤害') 
    --end
    --if 0 ~= japi.EXGetEventDamageData(3) then
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '范围伤害') 
    --end
    --
    --japi.EXSetEventDamage(9999) --设置伤害值
    --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, CJ.GetEventDamage()) 

    --设置最终伤害
    japi.EXSetEventDamage(Damage)
    --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,'最终伤害'..Damage)
 end

return DamagedSystemtest