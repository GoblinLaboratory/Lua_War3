json = require "Lib\\json\\json"
require "ECS\\Skill\\SkillData"
require "ECS\\Skill\\Skill"
require "ECS\\Skill\\Effects"
require "ECS\\Struct\\Data"
require "ECS\\Global"
require "Lib\\Guid"
SkillManager = {SkillList = {}}
function SkillManager:new(o)
    o = o or {}
    setmetatable(o, self)
    --
    o.SkillList = {}
    o:Int()
    --
    return o
end
function SkillManager:Int()
    -- statements
    local decoded = json.decode(SkillData.Skill)
    for i = #decoded, 1, -1 do
        self.SkillList[decoded[i].Name] = Skill:new(nil)
        self.SkillList[decoded[i].Name].Name = decoded[i].Name
        -- self.SkillList[decoded[i].Name].ID = decoded[i].ID
        self.SkillList[decoded[i].Name].ID = Guid.New()
        self.SkillList[decoded[i].Name].Explain = decoded[i].Explain
        self.SkillList[decoded[i].Name].Duration = decoded[i].Duration
        self.SkillList[decoded[i].Name].Probability = decoded[i].Probability
        self.SkillList[decoded[i].Name].Trigger = decoded[i].Trigger
        self.SkillList[decoded[i].Name].TargetUnit = decoded[i].TargetUnit
        -- 条件
        self.SkillList[decoded[i].Name].Condition = {}
        for j = #decoded[i].Condition, 1, -1 do
            -- statements
            self.SkillList[decoded[i].Name].Condition[j] = Data:new(nil)
            self.SkillList[decoded[i].Name].Condition[j].Name =
                decoded[i].Condition[j].Name
            self.SkillList[decoded[i].Name].Condition[j].Value =
                decoded[i].Condition[j].Value
        end
        -- 动作
        self.SkillList[decoded[i].Name].Action = {}
        for j = #decoded[i].Action, 1, -1 do
            -- statements
            self.SkillList[decoded[i].Name].Action[j] = Effects:new(nil)
            self.SkillList[decoded[i].Name].Action[j].Name =
                decoded[i].Action[j].Name
            self.SkillList[decoded[i].Name].Action[j].ID =
                decoded[i].Action[j].ID
            self.SkillList[decoded[i].Name].Action[j].BuffID =
                decoded[i].Action[j].BuffID
            self.SkillList[decoded[i].Name].Action[j].Typrs =
                decoded[i].Action[j].Typrs
            self.SkillList[decoded[i].Name].Action[j].Beneficial =
                decoded[i].Action[j].Beneficial
            self.SkillList[decoded[i].Name].Action[j].SuperPosition =
                decoded[i].Action[j].SuperPosition
                self.SkillList[decoded[i].Name].Action[j].Duration =
                decoded[i].Action[j].Duration
            for l = #decoded[i].Action[j].Action, 1, -1 do
                -- statements
                self.SkillList[decoded[i].Name].Action[j].Action[l] =
                    Data:new(nil)
                    self.SkillList[decoded[i].Name].Action[j].Action[l].Name =
                    decoded[i].Action[j].Action[l].Name
                    self.SkillList[decoded[i].Name].Action[j].Action[l].Value =
                    decoded[i].Action[j].Action[l].Value
            end
        end
        -- self.SkillList[decoded[i].Name].Value = 0
    end
end
SkillManager.__index = SkillManager
function SkillManager:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end
function SkillManager:CretaSkill(n)
    print("CretaSkill" .. n)
    local o = Global.clone(self.SkillList[n])
    return o
end
return SkillManager

-- s= SkillManager:Instance()
-- print(s.SkillList["暴击"].Trigger)
-- print(s.SkillList["毒性攻击"].Trigger)
