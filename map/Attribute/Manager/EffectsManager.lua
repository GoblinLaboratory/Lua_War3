require "Attribute\\Effects\\Effects"
require "Attribute\\Effects\\cell"
json = require "Lib\\json\\json"
require "Attribute\\AttributeDota"
EffectsManager = {
    -- 攻击特效
    --AttackEffects = {},
    -- 防御特效
    --DefenseEffects = {},
}

function EffectsManager:new(o)
    o = o or {}
    setmetatable(o, self)
    -----
    local Dota = AttributeDota:Instance()
    local decoded = json.decode(Dota.Effects)
    for i = #decoded, 1, -1 do
        -- print(decoded[i].Name)
        o[decoded[i].Name] = Effects:new(nil)
        o[decoded[i].Name].Name = decoded[i].Name
        o[decoded[i].Name].Beneficial = decoded[i].Beneficial
        o[decoded[i].Name].ID = decoded[i].ID
        o[decoded[i].Name].Hero = decoded[i].Hero
        o[decoded[i].Name].Unit = decoded[i].Unit
        o[decoded[i].Name].BuffID = decoded[i].BuffID
        for ii = #decoded[i].Attribute, 1, -1 do
            --o[decoded[i].Name].Attribute[ii] = cell:new(nil)
            --print(ii)
            --o[decoded[i].Name].Attribute[ii].Name = decoded[i].Attribute[ii].Name
            local c = cell:new(nil)
            c.Name = decoded[i].Attribute[ii].Name
            table.insert(o[decoded[i].Name].Attribute, c)
        end
        print("i = "..i)
    end
    -----
    return o
end
EffectsManager.__index = EffectsManager
-- 单件模式
function EffectsManager:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end
----------
-- 添加
-- 删除
-- 叠加
-- 完成
-- 更新
function EffectsManager:Update()
end
----------
--return EffectsManager
m = EffectsManager:Instance()
-- print(m["毒性攻击"].Name)
-- print(m["毒性攻击"].BuffID)
-- print("毒性攻击ID"..m["毒性攻击"].ID)
-- print("灼烧攻击ID"..m["灼烧攻击"].ID)
print("毒性攻击 = "..#m["毒性攻击"].Attribute)
for iii = #m["毒性攻击"].Attribute, 1, -1 do
    print("毒性攻击ID"..m["毒性攻击"].Attribute[iii].Name)
    --print(iii)
end
for iii = #m["灼烧攻击"].Attribute, 1, -1 do
    print("灼烧攻击ID"..m["灼烧攻击"].Attribute[iii].Name)
end