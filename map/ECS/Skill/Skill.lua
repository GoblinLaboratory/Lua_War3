BL = require "ECS\\Blizzard"
require "EventTemplate"
require "ECS\\Trigger\\TriggerCondition"
require "ECS\\Global"
Skill = {
    Name = 0,
    -- ID
    ID = 1,
    -- 说明文本
    Explain = 0,
    -- 值
    Value = 0,
    -- 等级
    Level = 0,
    -- 触发几率
    Probability = 0,
    -- 持续时间
    Duration = 0,
    -- 目标单位
    TargetUnit = 0,
    -- 触发单位
    TriggerUnit = 0,
    -- 触发事件
    Trigger = 0,
    -- 触发条件
    Condition = {},
    -- 触发动作
    Action = {}
}

function Skill:new(o)
    o = o or {}
    setmetatable(o, self)
    -- o.__index = self
    -----
    -- ID
    o.Name = 0
    o.ID = 0
    o.Explain = 0
    o.Value = 0
    o.Level = 0
    o.Probability = 0
    o.Duration = 0
    o.TargetUnit = 0
    o.TriggerUnit = 0
    o.Trigger = 0
    o.Condition = {}
    o.Action = {}
    -- o.GUID = Guid.New()
    -----
    return o
end
Skill.__index = Skill
function Skill:Int(u)
    self.TriggerUnit = u
    for i = #self.Action, 1, -1 do
        -- self.Action[i].TargetUnit = Blizzard[self.TargetUnit]()
        self.Action[i].TriggerUnit = u
    end
end
function Skill:TriggerCondition()
    -- statements
    local t = true
    for i = #self.Condition, 1, -1 do
        -- statements
        --local n = TriggerCondition[self.Condition[i].Name]()
        if TriggerCondition[self.Condition[i].Name]() ~= self.Condition[i].Value then
            -- statements
            t = false
        end
    end
    print(t)
    return t
end
-- 
function Skill:TriggerAction()
    -- statements
    print("TriggerAction")
    for i = #self.Action, 1, -1 do
        -- statements
        print("TriggerAction:" .. i)
        -- self.Action[i]:Fire()
        if self.Action[i].Typrs == "瞬时" then
            -- statements
            local buff = Global.clone(self.Action[i])
            buff.TargetUnit = Blizzard[self.TargetUnit]()
            buff:Fire()
        elseif self.Action[i].Typrs == "持续" then
            -- statements
            local ev = EventTemplate:Instance()
            local buff = Global.clone(self.Action[i])
            buff.TargetUnit = Blizzard[self.TargetUnit]()
            ev.Add_Buff:Fire(Blizzard[self.TargetUnit](), buff)
        elseif self.Action[i].Typrs == "永久" then
            local ev = EventTemplate:Instance()
            local buff = Global.clone(self.Action[i])
            buff.TargetUnit = Blizzard[self.TargetUnit]()
            ev.Add_Buff:Fire(Blizzard[self.TargetUnit](), buff)
        end
    end
end
function Skill:Fire()
    -- statements
    if self:TriggerCondition() == true then
        -- statements
        print("Skill:Fire")
        self:TriggerAction()
    end
end
return Skill
