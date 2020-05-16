local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
require "Global"
require "EventTemplate"

TreatmentSystem = {TreatmentValue = 0 }
local ev = EventTemplate:Instance()
function TreatmentSystem:new(o)  
    o = o or {}  
    setmetatable(o,self)  
	self.__index = self 
    -----
    self.TreatmentValue = 0
	-----
    return o  
end

TreatmentSystem.__index=TreatmentSystem

function TreatmentSystem:Instance()  
    if self.instance == nil then  
        self.instance = self:new()  
    end  
    return self.instance  
end 

function TreatmentSystem:TreatmentUnit(u,s)  
    ev.AnyUnitTreatmented:Fire()--发送消息
    self.TreatmentValue = s
    local lifeMax = CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_LIFE))
    local life = CJ.GetUnitState(u, CJ.UNIT_STATE_LIFE))
    --
    if life < lifeMax and self.TreatmentValue > 0 then
        local x = life + self.TreatmentValue
        if x < lifeMax then
            BJ.SetUnitLifeBJ(u, x )
        else  
            BJ.SetUnitLifeBJ(u, lifeMax )
        end 
    end
    --
    
end 


return TreatmentSystem