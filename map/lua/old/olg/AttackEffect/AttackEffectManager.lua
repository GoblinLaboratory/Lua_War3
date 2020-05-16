local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
require "Global"
require "Bonus"
require "Vertigo"

AttackEffectManager = {
    JiShiQI = nil,--计时器
    VertigoList = {},--眩晕状态
}

function AttackEffectManager:new(o)  
    o = o or {}  
    setmetatable(o,self)  
	self.__index = self 
	----
    self.JiShiQI =CJ.CreateTimer()
	-----
    return o  
end 
AttackEffectManager.__index=AttackEffectManager

function AttackEffectManager:Instance()  
    if self.instance == nil then  
        self.instance = self:new()  
    end  
    return self.instance  
end 
--眩晕状态
--添加单位
function AttackEffectManager:VertigoAddUnit(unit,triggerUnit,time)  
    for i=#self.VertigoList, 1, -1 do 
        if self.VertigoList[i].TriggerUnit == u then 
            self.VertigoList[i].Time = self.VertigoList[i].Time + time
        end         
    end 
    local x = Vertigo:new()
    x:Int(unit,triggerUnit,time) 
    table.insert(self.VertigoList,x)
    return true
end 
function AttackEffectManager:VertigoRemoveUnit(u)  
    for i=#self.VertigoList, 1, -1 do 
        if self.VertigoList[i].TriggerUnit == u then 
            self.VertigoList[i]:Destroy()  
            table.remove(self.VertigoList,i) 
        end         
    end 
end
function AttackEffectManager:VertigoGetUnit(u)  
    for i=#self.VertigoList, 1, -1 do 
        if self.VertigoList[i].TriggerUnit == u then 
            return self.VertigoList[i]
        end         
    end 
end
--眩晕状态
function AttackEffectManager:Start()  
    CJ.TimerStart(self.JiShiQI, 0.1, true,  function () 
        --眩晕状态
        for i=#self.VertigoList, 1, -1 do 
            if self.VertigoList[i].Timing >= self.VertigoList[i].Time then
                --CJ.UnitRemoveAbility (self.VertigoList[i].TriggerUnit, Global:GetId('BPSE') )
                self.VertigoList[i]:Destroy() 
                table.remove(self.VertigoList,i) 
            else
                -- body
                self.VertigoList[i]:Update() 
            end
            
            --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,self.ForceAuraList[i].JuLi)
        end 
        --眩晕状态
    end)
end

return AttackEffectManager