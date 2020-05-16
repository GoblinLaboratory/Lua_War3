local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
require "GameManager"
require "Global"
require "EventTemplate"
require "math"
require "UnitState"

DamagedSystemTrigger = {}


--任意单位受伤害

DamagedSystemTrigger.f = function(...) 


    local u = CJ.GetTriggerUnit()--受伤害单位
    local ul = CJ.GetEventDamageSource()--伤害来源单位
    local id = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(CJ.GetTriggerUnit()))--触发玩家ID
    local ids = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(CJ.GetEventDamageSource()))--伤害来源单位玩家ID
    local GM = GameManager:Instance()
    local shz = CJ.GetEventDamage()--伤害值
    local  Damage = CJ.GetEventDamage() --最终伤害值
    
    --伤害阶段
    --攻击伤害
    if 0 ~= japi.EXGetEventDamageData(2) then
        --攻击单位伤害加成
        if CJ.IsUnitType(ul, CJ.UNIT_TYPE_HERO) == true then
            local xd = GM:GetHero(ul)
            --物理暴击
            if xd.Unit_Dota["物理暴击几率"].value ~= 0 then
                local jv = math.random(1,100)
                if jv <xd.Unit_Dota["物理暴击几率"].value*100 then
                    Damage =  Damage*(1+xd.Unit_Dota["物理暴击强度"].value)
                end
            end
        else
    
        end   

        --被攻击单位伤害减免
        if CJ.IsUnitType(u, CJ.UNIT_TYPE_HERO) == true then
            local xd = GM:GetHero(u)
            --伤害减免
            if xd.Unit_Dota["伤害减免"].value ~= 0 then
                Damage =  Damage*(1-xd.Unit_Dota["伤害减免"].value)
            end
            --闪避
            if xd.Unit_Dota["闪避"].value ~= 0 then
                local jv = math.random(1,100)
                if jv <xd.Unit_Dota["闪避"].value*100 then
                    Damage =  0
                end
            end
        end   
        --护甲减免
        local hj = japi.GetUnitState(CJ.GetTriggerUnit(),CJ.ConvertUnitState(0x20)) --获取护甲
        Damage = Damage*Damage/(Damage+hj*3)

        --japi.EXSetEventDamage(sh) --设置伤害值
        --伤害阶段吸血
        if CJ.IsUnitType(ul, CJ.UNIT_TYPE_HERO) == true then
            local xd = GM:GetHero(ul)
            --物理吸血
            if xd.Unit_Dota["物理吸血"].value ~= 0 then
                UnitState:XiXue(ul,Damage*xd.Unit_Dota["物理吸血"].value)
            end
         end     
    else --法术伤害
        --攻击单位伤害加成
        if CJ.IsUnitType(ul, CJ.UNIT_TYPE_HERO) == true then
            local xd = GM:GetHero(ul)
            --法术强度加成
            if xd.Unit_Dota["法术强度"].value ~= 0 then
                Damage =  Damage+xd.Unit_Dota["法术强度"].value*CJ.GetHeroInt(xd, true)
            end
            --法术暴击
            if xd.Unit_Dota["法术暴击几率"].value ~= 0 then
                local jv = math.random(1,100)
                if jv <xd.Unit_Dota["法术暴击几率"].value*100 then
                    Damage =  Damage*(1+xd.Unit_Dota["法术暴击强度"].value)
                end
            end

            --被攻击单位伤害减免
            if CJ.IsUnitType(u, CJ.UNIT_TYPE_HERO) == true then
                local xd = GM:GetHero(u)
                --伤害减免
                if xd.Unit_Dota["伤害减免"].value ~= 0 then
                    Damage =  Damage*(1-xd.Unit_Dota["伤害减免"].value)
                end
            end 
            --魔法抗性减免
            if CJ.IsUnitType(u, CJ.UNIT_TYPE_HERO) == true then
                local xd = GM:GetHero(u)
                --伤害减免
                if xd.Unit_Dota["魔法抗性"].value ~= 0 then
                    Damage =  Damage*(1-xd.Unit_Dota["魔法抗性"].value)
                end
            end     
            --伤害阶段吸血
            if CJ.IsUnitType(ul, CJ.UNIT_TYPE_HERO) == true then
                local xd = GM:GetHero(ul)
                --法术吸血
                if xd.Unit_Dota["法术吸血"].value ~= 0 then
                    UnitState:XiXue(ul,Damage*xd.Unit_Dota["法术吸血"].value)
                end
            end             
        end 
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

return DamagedSystemTrigger