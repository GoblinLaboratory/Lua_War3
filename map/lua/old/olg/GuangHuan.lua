local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
require "Global"
require "Bonus"

GuangHuan = {
    Level = 1,--等级
    Priority  = 0,--优先级
    Allow = true,--是否开启
    TriggerUnit = 0,--技能拥有单位

    DanWeZu = nil,--单位组
    LinShiDanWeZu = nil,--临时单位组

    MoFaXiaoGuo = 0,--，魔法效果

    Ally = true,--是否为盟友
    Hero = false,--只选择英雄
    Unit = false,--只选择普通单位
    
    JuLi = 900,--距离

    JiNeng = 0,--技能
    
    Force = 0, -- 力量
    Agile = 0, --敏捷
    Mentality = 0, --智力

    Life = 0,--生命
    LifeRecovery = 0,--生命恢复

    Mana = 0,--魔法
    ManaRecovery = 0,--魔法恢复

    Armor = 0,--护甲
    MagicArmor = 0,--魔法抗性

    Attack = 0,--攻击力
    AttackSpeed = 0,--攻击速度

    MoveSpeed = 0, --移动速度

    JiShiQI = nil,--计时器
}

function GuangHuan:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self 
    --self:Int() 
    return o
end

function GuangHuan:Int(u,jl)  
    self.TriggerUnit = u
    self.JuLi = jl
    self.DanWeZu = CJ.CreateGroup()
    self.LinShiDanWeZu = CJ.CreateGroup()
    self.JiShiQI =CJ.CreateTimer()

    self.Allow = true--是否开启

    self.MoFaXiaoGuo = 0--，魔法效果

    self.Ally = true--是否为盟友
    self.Hero = false--只选择英雄
    self.Unit = false--只选择普通单位

    --self.MaJiaJiNeng = 0--马甲技能
    self.JiNeng = 0--技能
    
    self.Force = 0 -- 力量
    self.Agile = 0 --敏捷
    self.Mentality = 0 --智力

    self.Life = 0--生命
    self.LifeRecovery = 0--生命恢复

    self.Mana = 0--魔法
    self.ManaRecovery = 0--魔法恢复

    self.Armor = 0--护甲
    self.MagicArmor = 0--魔法抗性

    self.Attack = 0--攻击力
    self.AttackSpeed = 0--攻击速度

    self.MoveSpeed = 0 --移动速度
end 



function GuangHuan:ClearUnit(u) 
    local bu = Bonus:Instance() 
    if self.JiNeng ~= 0 then
        CJ.UnitRemoveAbility( x, self.JiNeng)
    end
    if CJ.IsHeroUnitId(CJ.GetUnitTypeId(u)) == true then
        if self.Force ~= 0 then
            bu:UnitAddBonus(u, 8, 0-self.Force )
        end
        if self.Agile ~= 0 then
            bu:UnitAddBonus(u, 9, 0-self.Agile)
        end
        if self.Mentality ~= 0 then
            bu:UnitAddBonus(u, 10, 0-self.Mentality)
        end
    end
    if self.Life ~= 0 then
        bu:UnitAddBonus(u, 6, 0-self.Life)
    end
    if self.LifeRecovery ~= 0 then
        bu:UnitAddBonus(u, 4, 0-self.LifeRecovery)
    end
    if self.Mana ~= 0 then
        bu:UnitAddBonus(u, 7, 0-self.Mana)
    end
    if self.ManaRecovery ~= 0 then
        bu:UnitAddBonus(u, 3, 0-self.ManaRecovery*100)
    end

    if self.Armor ~= 0 then
        bu:UnitAddBonus(u, 1, 0-self.Armor)
    end

    if self.MagicArmor ~= 0 then
        bu:UnitSetMFKX(u,0-self.MagicArmor)
    end

    if self.Attack ~= 0 then
        bu:UnitAddBonus(u, 2, 0-self.Attack)
    end

    if self.AttackSpeed ~= 0 then
        bu:UnitAddBonus(u, 5, 0-self.AttackSpeed*100)
    end

    if self.MoveSpeed ~= 0 then
        bu:UnitSetSeed(u,0-self.MoveSpeed)
    end
end



function GuangHuan:AddUnit(u) 
    local bu = Bonus:Instance() 
    if self.JiNeng ~= 0 then
        CJ.UnitAddAbility(x, self.JiNeng)--添加技能
    end
    if CJ.IsHeroUnitId(CJ.GetUnitTypeId(u)) == true then
        if self.Force ~= 0 then
            bu:UnitAddBonus(u, 8, self.Force )
        end
        if self.Agile ~= 0 then
            bu:UnitAddBonus(u, 9, self.Agile)
        end
        if self.Mentality ~= 0 then
            bu:UnitAddBonus(u, 10, self.Mentality)
        end
    end
    
    if self.Life ~= 0 then
        bu:UnitAddBonus(u, 6, self.Life)
    end
    if self.LifeRecovery ~= 0 then
        bu:UnitAddBonus(u, 4, self.LifeRecovery)
    end
    if self.Mana ~= 0 then
        bu:UnitAddBonus(u, 7, self.Mana)
    end
    if self.ManaRecovery ~= 0 then
        bu:UnitAddBonus(u, 3, self.ManaRecovery*100)
    end

    if self.Armor ~= 0 then
        bu:UnitAddBonus(u, 1, self.Armor)
    end

    if self.MagicArmor ~= 0 then
        bu:UnitSetMFKX(u,self.MagicArmor)
    end

    if self.Attack ~= 0 then
        bu:UnitAddBonus(u, 2, self.Attack)
    end

    if self.AttackSpeed ~= 0 then
        bu:UnitAddBonus(u, 5, self.AttackSpeed*100)
    end

    if self.MoveSpeed ~= 0 then
        bu:UnitSetSeed(u,self.MoveSpeed)
    end
end
function GuangHuan:LevelUp() 
    if BJ.CountUnitsInGroup(self.DanWeZu) ~= 0 then
        BJ.ForGroupBJ( self.DanWeZu, function()
            local x = CJ.GetEnumUnit()
            self:ClearUnit(x)
        end) 
        self.Level = self.Level +1
        BJ.ForGroupBJ( self.DanWeZu, function()
            local x = CJ.GetEnumUnit()
            self:AddUnit(x)
        end) 
    end
end
function GuangHuan:Group()  
    --离开单位删除状态
    if BJ.CountUnitsInGroup(self.DanWeZu) ~= 0 then
        BJ.ForGroupBJ( self.DanWeZu, function()
            local x = CJ.GetEnumUnit()
            if BJ.DistanceBetweenPoints(CJ.GetUnitLoc(self.TriggerUnit), CJ.GetUnitLoc(x)) > 900 then
                
                self:ClearUnit(x)
                --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,"单位组数量"..BJ.CountUnitsInGroup(self.DanWeZu))
                CJ.GroupRemoveUnit(self.DanWeZu,x)
                --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,"临时单位组数量"..BJ.CountUnitsInGroup(self.DanWeZu,x ))
            end
        end) 
    end
    --获取周围单位
    --判定是否为盟友
    if self.Ally then      
        self.LinShiDanWeZu = BJ.GetUnitsInRangeOfLocMatching(self.JuLi, CJ.GetUnitLoc(self.TriggerUnit), CJ.Condition(function()
            return CJ.IsUnitAlly(CJ.GetFilterUnit(), CJ.GetOwningPlayer(self.TriggerUnit)) == true and CJ.IsUnitType(x, CJ.UNIT_TYPE_STRUCTURE) == false --同盟单位
        end))
        
    else   
        self.LinShiDanWeZu = BJ.GetUnitsInRangeOfLocMatching(self.JuLi, CJ.GetUnitLoc(self.TriggerUnit), CJ.Condition(function()
            return CJ.IsUnitEnemy(CJ.GetFilterUnit(), CJ.GetOwningPlayer(self.TriggerUnit)) == true and CJ.IsUnitType(x, CJ.UNIT_TYPE_STRUCTURE) == false
        end))
    end 
    --判定是否为英雄
    if self.Hero then
        BJ.ForGroupBJ( self.LinShiDanWeZu, function()
            local x = CJ.GetEnumUnit()
            if CJ.IsHeroUnitId(CJ.GetUnitTypeId(x)) == false then
                CJ.GroupRemoveUnit(self.LinShiDanWeZu,x)
            end
        end) 
    end
    
    if self.Unit then
        BJ.ForGroupBJ( self.LinShiDanWeZu, function()
            local x = CJ.GetEnumUnit()
            if CJ.IsHeroUnitId(CJ.GetUnitTypeId(x)) then
                CJ.GroupRemoveUnit(self.LinShiDanWeZu,x)
            end
        end) 
    end
    --判断是否为建筑
    BJ.ForGroupBJ( self.LinShiDanWeZu, function()
        local x = CJ.GetEnumUnit()
        if CJ.IsUnitType(x, CJ.UNIT_TYPE_STRUCTURE) == true then
            CJ.GroupRemoveUnit(self.LinShiDanWeZu,x)
        end
    end)
    
    --将单位加入到单位组
    if BJ.CountUnitsInGroup(self.LinShiDanWeZu) ~= 0 then
        BJ.ForGroupBJ( self.LinShiDanWeZu, function()
            local x = CJ.GetEnumUnit()
            if CJ.IsUnitInGroup(x, self.DanWeZu) == true then
                
            else
                CJ.GroupAddUnit( self.DanWeZu, x)
                self:AddUnit(x)
            end
        end) 
    end
    CJ.GroupClear(self.LinShiDanWeZu)--清空单位组

end 

function GuangHuan:Start()  
    CJ.TimerStart(self.JiShiQI, 1.50, true,  function () 
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,"开始计时器")
        if self.Allow  then
            
            self:Group()  
            
        end
    end)
end

function GuangHuan:Stop()  
    CJ.PauseTimer(self.JiShiQI)
end
function GuangHuan:ClearGroup()  
    if BJ.CountUnitsInGroup(self.DanWeZu) ~= 0 then
        BJ.ForGroupBJ( self.DanWeZu, function()
            local x = CJ.GetEnumUnit()
            if JiNeng ~= 0 then
                CJ.UnitRemoveAbility( x, JiNeng)
            end
            self:ClearUnit(x)
            CJ.GroupRemoveUnit(self.DanWeZu,x)
        end) 
    end
end
function GuangHuan:Destroy()  
    if BJ.CountUnitsInGroup(self.DanWeZu) ~= 0 then
        BJ.ForGroupBJ( self.DanWeZu, function()
            local x = CJ.GetEnumUnit()
            if JiNeng ~= 0 then
                CJ.UnitRemoveAbility( x, JiNeng)
            end
            self:ClearUnit(x)
            CJ.GroupRemoveUnit(self.DanWeZu,x)
        end) 
    end
    CJ.DestroyTimer(self.JiShiQI)
end

return GuangHuan