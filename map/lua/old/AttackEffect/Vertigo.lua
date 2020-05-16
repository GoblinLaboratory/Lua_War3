require "Global"
local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
--眩晕
Vertigo = {
    Unit = 0,--施法技能单位
    TriggerUnit = 0,--触发单位,被眩晕单位
    Timing = 0, --计时
    Time = 0, --眩晕时间
    Timer = 0.1 --计时器精度
}

function Vertigo:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self 
    --self:Int() 
    return o
end

function Vertigo:Int(unit,triggerUnit,time) 
    self.Unit = unit--施法技能单位
    self.TriggerUnit = triggerUnit--触发单位,被眩晕单位
    self.Time = time --眩晕时间
    self:Start() 
end

function Vertigo:Destroy()  
    BJ.UnitRemoveBuffBJ( Global:GetId('BPSE'), self.TriggerUnit )
end

function Vertigo:Start()  

    BJ.CreateNUnitsAtLoc( 1, Global:GetId('e003'), CJ.GetOwningPlayer(self.Unit), CJ.GetUnitLoc(self.Unit), CJ.bj_UNIT_FACING )
    local z = BJ.GetLastCreatedUnit()
    CJ.ShowUnit( z , false )--隐藏单位
    CJ.UnitApplyTimedLife( z, Global:GetId('BHwe'), 1 )--设置生命周期
    --BJ.ShowUnitHide( z)
    CJ.UnitAddAbility(z, Global:GetId('A00V') )--添加技能
    CJ.SetUnitAbilityLevel( z, Global:GetId('A00V'), 1 )
    CJ.IssueTargetOrder(z, "thunderbolt", self.TriggerUnit )--施放技能

end
--计时器0.1秒
function Vertigo:Update()  
    self.Timing = self.Timing + self.Timer
    --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, "眩晕时间"..self.Timing )
    --if self.Timing > self.Time then
        --CJ.UnitRemoveAbility (self.TriggerUnit, Global:GetId('BPSE') )
        --self:Destroy() 
    --end
end

return Vertigo