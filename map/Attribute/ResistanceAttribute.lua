json = require "Lib\\json\\json"
require "Attribute\\Term"
require "Attribute\\AttributeDota"
-- 抗性属性
ResistanceAttribute = {
}

function ResistanceAttribute:new(o)
    o = o or {}
    setmetatable(o, self)
    local testString = AttributeDota:Instance().ResistanceAttribute
    -- print(testString)
    local decoded = json.decode(testString)
    for i = #decoded, 1, -1 do
        -- print(decoded[i].Name)
        o[decoded[i].Name] = Term:new(nil)
        o[decoded[i].Name].Name = decoded[i].Name
        o[decoded[i].Name].Explain = decoded[i].Explain
        o[decoded[i].Name].Value = decoded[i].Value
        o[decoded[i].Name].Probability = decoded[i].Probability
        o[decoded[i].Name].Duration = decoded[i].Duration
    end
    -----
    return o
end
ResistanceAttribute.__index = ResistanceAttribute
-- return ResistanceAttribute

-- test
m = ResistanceAttribute:new(nil)
print(m["伤害减免"].Explain)
print(m["火焰抗性"].Explain)
print(json.encode(m))