--光环管理器
local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
require "Global"
require "Bonus"
require "ForceAura"
require "LifeAura"

AuraManager = {
    JiShiQI = nil,--计时器
    ForceAuraList = {},--力量光环
    LifeAuraList = {},--生命光环
}

function AuraManager:new(o)  
    o = o or {}  
    setmetatable(o,self)  
	self.__index = self 
	----
    self.JiShiQI =CJ.CreateTimer()
	-----
    return o  
end 
AuraManager.__index=AuraManager

function AuraManager:Instance()  
    if self.instance == nil then  
        self.instance = self:new()  
    end  
    return self.instance  
end 

--力量光环
--添加单位
function AuraManager:ForceAuraAddUnit(u)  
    for i=#self.ForceAuraList, 1, -1 do 
        if self.ForceAuraList[i].TriggerUnit == u then 
            return false
        end         
    end 
    local x = ForceAura:new()
    x:Int(u,900) 
    x.Level = CJ.GetUnitLevel(u)
    x.Force = CJ.GetUnitLevel(u)
    table.insert(self.ForceAuraList,x)
    return true
end 
function AuraManager:ForceAuraRemoveUnit(u)  
    for i=#self.ForceAuraList, 1, -1 do 
        if self.ForceAuraList[i].TriggerUnit == u then 
            self.ForceAuraList[i]:Destroy()  
            table.remove(self.ForceAuraList,i) 
        end         
    end 
end
function AuraManager:ForceAuraGetUnit(u)  
    for i=#self.ForceAuraList, 1, -1 do 
        if self.ForceAuraList[i].TriggerUnit == u then 
            return self.ForceAuraList[i]
        end         
    end 
end
--力量光环
--生命光环
function AuraManager:LifeAuraAddUnit(u)  
    for i=#self.LifeAuraList, 1, -1 do 
        if self.FLifeAuraList[i].TriggerUnit == u then 
            return false
        end         
    end 
    local x = LifeAura:new()
    x:Int(u,900) 
    x.Level = CJ.GetUnitLevel(u)
    x.Life = CJ.GetUnitLevel(u)
    table.insert(self.LifeAuraList,x)
    return true
end 
function AuraManager:LifeAuraRemoveUnit(u)  
    for i=#self.LifeAuraList, 1, -1 do 
        if self.LifeAuraList[i].TriggerUnit == u then 
            self.LifeAuraList[i]:Destroy()  
            table.remove(self.LifeAuraList,i) 
        end         
    end 
end
function AuraManager:LifeAuraGetUnit(u)  
    for i=#self.LifeAuraList, 1, -1 do 
        if self.LifeAuraList[i].TriggerUnit == u then 
            return self.LifeAuraList[i]
        end         
    end 
end
--生命光环
--计时器

function AuraManager:Start()  
    CJ.TimerStart(self.JiShiQI, 1.50, true,  function () 
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,"光环计时器")
        --力量光环
        for i=#self.ForceAuraList, 1, -1 do 
            self.ForceAuraList[i]:ClearGroup()  
            --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,self.ForceAuraList[i].JuLi)
        end 
        table.sort(self.ForceAuraList,function(a,b)
            return a.Level > b.Level
        end)
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,#self.ForceAuraList)
        for i=#self.ForceAuraList, 1, -1 do 
            self.ForceAuraList[i]:Start()
            --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,self.ForceAuraList[i].JuLi)
        end 
        --力量光环
        --生命光环
        for i=#self.LifeAuraList, 1, -1 do 
            self.LifeAuraList[i]:ClearGroup()  
            --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,self.ForceAuraList[i].JuLi)
        end 
        table.sort(self.LifeAuraList,function(a,b)
            return a.Level > b.Level
        end)
        --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,#self.ForceAuraList)
        for i=#self.LifeAuraList, 1, -1 do 
            self.LifeAuraList[i]:Start()
            --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,self.ForceAuraList[i].JuLi)
        end 
        --生命光环
    end)
end

--计时器

return AuraManager