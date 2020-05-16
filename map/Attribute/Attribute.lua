json = require "Lib\\json\\json"
require "Attribute\\Term"
require "Attribute\\AttributeDota"
-- 抗性属性
Attribute = {}

-- function Attribute:new(o, Str)
--     o = o or {}
--     setmetatable(o, self)
--     -- local testString = AttributeDota:Instance().ResistanceAttribute
--     -- print(testString)
--     local decoded = json.decode(Str)
--     for i = #decoded, 1, -1 do
--         -- print(decoded[i].Name)
--         o[decoded[i].Name] = Term:new(nil)
--         o[decoded[i].Name].Name = decoded[i].Name
--         o[decoded[i].Name].Explain = decoded[i].Explain
--         o[decoded[i].Name].Value = decoded[i].Value
--         o[decoded[i].Name].Probability = decoded[i].Probability
--         o[decoded[i].Name].Duration = decoded[i].Duration
--     end
--     -----
--     return o
-- end
function Attribute:new(o)
    o = o or {}
    setmetatable(o, self)
    -----
    return o
end
Attribute.__index = Attribute
return Attribute

--test
-- m = Attribute:new(nil,AttributeDota:Instance().BasicsAttribute)
-- print(m["移动速度"].Explain)
-- print(m["攻击速度"].Explain)
-- print(json.encode(m))
-- for i = 10000, 1, -1 do
--     m = Attribute:new(nil,AttributeDota:Instance().BasicsAttribute)
-- end