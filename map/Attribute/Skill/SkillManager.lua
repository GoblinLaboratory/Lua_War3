require "Attribute\\Skill\\SkillData"
require "Attribute\\Skill\\Skill"
require "Attribute\\Skill\\Effects"
require "Lib\\Guid"
json = require "Lib\\json\\json"

SkillManager = {SkillName = {}}

function SkillManager:new(o)
    o = o or {}
    setmetatable(o, self)
    --
    -- o.SkillName = {}
    --
    local Dota = SkillData:Instance()
    --
    local decoded = json.decode(Dota.Skill)
    for i = #decoded, 1, -1 do
        o.SkillName[i] = decoded[i].Name
        -- print(decoded[i].Name)
        o[decoded[i].Name] = Skill:new(nil)
        -- 名称
        o[decoded[i].Name].Name = decoded[i].Name
        -- ID
        o[decoded[i].Name].ID = decoded[i].ID
        -- 触发事件
        o[decoded[i].Name].Trigger = decoded[i].Trigger
        -- 触发几率
        o[decoded[i].Name].Probability = decoded[i].Probability
        -- 持续时间
        o[decoded[i].Name].Duration = decoded[i].Duration
        -- 动作
        -- 效果
        for ii = #decoded[i].Ability, 1, -1 do
            local c = Effects:new(nil)
            c.Name = decoded[i].Ability[ii].Name
            -- 说明文本
            c.Explain = decoded[i].Ability[ii].Explain
            c.Duration = decoded[i].Duration
            c.Beneficial = decoded[i].Beneficial
            c.Value = decoded[i].Ability[ii].Value
            c.Tag = Guid.New()
            o[decoded[i].Name].Ability[decoded[i].Ability[ii].ID] = c
            --table.insert(o[decoded[i].Name].Ability, c)
        end
    end
    --
    return o
end
SkillManager.__index = SkillManager
-- 单件模式
function SkillManager:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end
-- 技能工厂
function SkillManager:SkillFactory(n)
    local name = self:clone(self[n])
    name.Tag = Guid.New()
    return name
end
-- 随机技能
function SkillManager:RandomSkill()
    --math.randomseed(tostring(os.time()):reverse():sub(1, 7))
    local s = math.random(1, #self.SkillName)
    print("s = " .. s)
    local name = self:SkillFactory(self.SkillName[s])
    return name
end
-- 拷贝类
function SkillManager:clone(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for key, value in pairs(object) do
            new_table[_copy(key)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(object))
    end
    return _copy(object)
end
-----
return SkillManager

-- m = SkillManager:Instance()
-- for i = #m.SkillName, 1, -1 do
--     -- statements
--     --print(m.SkillName[i])
--     local s = m:RandomSkill()
--     print(s:GetExplain())
--     print(s.Tag)
-- end
