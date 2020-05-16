local CJ = require "jass.common"
local BJ = require "blizzard"
require "Global"
local el = require'EventLib'

EventTemplate = {}

function EventTemplate:new(o)  
    o = o or {}  
    setmetatable(o,self)  
    self.__index = self  
    return o  
end  

function EventTemplate:Instance()  
    if self.instance == nil then  
        self.instance = self:new()  
    end  
    return self.instance  
end 

--EventTemplate:
EventTemplate.AnyUnitDamaged = el:new("AnyUnitDamaged")
--function EventTemplate:RegisterAnyUnitDamagedEvent(handler)
   -- AnyUnitDamaged:connect(handler)
--end

--function EventTemplate:FireAnyDamagedUnitEvent()
   -- AnyUnitDamaged:Fire()
--end
--任意单位接受治疗事件
EventTemplate.AnyUnitTreatmented = el:new("AnyUnitTreatmented")


return EventTemplate