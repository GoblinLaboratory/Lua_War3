local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
require "Global"
require "Bonus"

ForceAura = {
    Level = 1,--等级
    Priority  = 0,--优先级
    Allow = true,--是否开启
    TriggerUnit = 0,--技能拥有单位

    DanWeZu = nil,--单位组
    LinShiDanWeZu = nil,--临时单位组

    MoFaXiaoGuo = 0,--，魔法效果

    Ally = true,--是否为盟友
    Hero = true,--只选择英雄
    Unit = false,--只选择普通单位
    
    JuLi = 900,--距离

    JiNeng = 0,--技能
    
    Force = 0, -- 力量
 

    JiShiQI = nil,--计时器
}

function ForceAura:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self 
    --self:Int() 
    return o
end

function ForceAura:Int(u,jl)  
    self.TriggerUnit = u
    self.JuLi = jl
    self.DanWeZu = CJ.CreateGroup()
    self.LinShiDanWeZu = CJ.CreateGroup()
    self.JiShiQI =CJ.CreateTimer()

    self.Allow = true--是否开启

    self.MoFaXiaoGuo = 0--，魔法效果

    self.Ally = true--是否为盟友
    self.Hero = true--只选择英雄
    self.Unit = false--只选择普通单位

   -- self.MaJiaJiNeng = 0--马甲技能
    self.JiNeng = 0--技能
    
    self.Force = 0 -- 力量

end 



function ForceAura:ClearUnit(u) 
    local bu = Bonus:Instance() 
    if self.JiNeng ~= 0 then
        CJ.UnitRemoveAbility( x, self.JiNeng)
    end
    if CJ.IsHeroUnitId(CJ.GetUnitTypeId(u)) == true then
        if self.Force ~= 0 then
            bu:UnitAddBonus(u, 8, 0-self.Force )
        end
    end
   
end



function ForceAura:AddUnit(u) 
    local bu = Bonus:Instance() 
    if self.JiNeng ~= 0 then
        CJ.UnitAddAbility(x, self.JiNeng)--添加技能
    end
    if CJ.IsHeroUnitId(CJ.GetUnitTypeId(u)) == true then
        if self.Force ~= 0 then
            bu:UnitAddBonus(u, 8, self.Force )
        end
    end
    
end
function ForceAura:LevelUp() 
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
function ForceAura:SetValue(i) 
    if BJ.CountUnitsInGroup(self.DanWeZu) ~= 0 then
        BJ.ForGroupBJ( self.DanWeZu, function()
            local x = CJ.GetEnumUnit()
            self:ClearUnit(x)
        end) 
        self.Force = i
        BJ.ForGroupBJ( self.DanWeZu, function()
            local x = CJ.GetEnumUnit()
            self:AddUnit(x)
        end) 
    end
end
function ForceAura:Group()  
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

function ForceAura:Start()  
    CJ.TimerStart(self.JiShiQI, 1.50, true,  function () 
        CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,"开始计时器")
        if self.Allow  then
            if CJ.GetUnitLevel(self.TriggerUnit)==self.Level then
            else
                BJ.ForGroupBJ( self.DanWeZu, function()
                    local x = CJ.GetEnumUnit()
                    self:ClearUnit(x)
                end) 
                self.Level=CJ.GetUnitLevel(self.TriggerUnit)
                self.Force = self.Level
                BJ.ForGroupBJ( self.DanWeZu, function()
                    local x = CJ.GetEnumUnit()
                    self:AddUnit(x)
                end) 
            end
            self:Group()  
            
        end
    end)
end

function ForceAura:Stop()  
    CJ.PauseTimer(self.JiShiQI)
end

function ForceAura:Destroy()  
    CJ.DestroyTimer(self.JiShiQI)
    if BJ.CountUnitsInGroup(self.DanWeZu) ~= 0 then
        BJ.ForGroupBJ( self.DanWeZu, function()
            self:ClearUnit(x)
            CJ.GroupRemoveUnit(self.DanWeZu,x)
        end) 
    end    
    CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,"关闭光环")
end

return ForceAura