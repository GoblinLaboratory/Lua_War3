-- require "Attribute\\Effects\\Action"
Skill = {
    -- 名称
    Name = 0,
    -- ID
    ID = 0,
    -- 触发
    -- 触发事件
    Trigger = 0,
    -- ███████████████████████████████████████
    -- 条件判断
    -- 等级
    Level = 0,
    -- 是否为主动技能
    Active = true,
    -- 单位类型限定
    Hero = true,
    Unit = true,
    -- 是否为友军
    Alliance = true,
    -- 是否为敌对
    Hostile = true,
    -- 目标单位
    TargetUnit = 0,
    -- 触发单位
    TriggerUnit = 0,
    -- 触发几率
    Probability = 0,
    -- 持续时间
    Duration = 0,
    -- ███████████████████████████████████████
    -- 动作
    -- 效果
    Ability = {},
    -- 持续效果
    -- SustainedEffect = {},
    -- 发动技能
    Fire = 0,
    Action = 0,
    -- 标记
    Tag = 0
}

function Skill:new(o)
    o = o or {}
    setmetatable(o, self)
    -- o.__index = self
    -----
    -- 名称
    o.Name = 0
    -- ID
    o.ID = 0
    -- 触发事件
    o.Trigger = 0
    -- 触发几率
    o.Probability = 0
    -- 持续时间
    o.Duration = 0
    o.Ability = {}
    o.Fire = function()
        -- statements
        print("jinengxiangying")
        for i = #o.Ability, 1, -1 do
            -- 发送属性变更Action
            print("wupinjinengchufa")
        end
    end
    -----
    return o
end

Skill.__index = Skill
----------
-- function Skill:Update()
-- end
function Skill:GetExplain()
    local str = self.Name .. ":"
    for i = #self.Ability, 1, -1 do
        print(i)
        str = str ..
                  string.format(self.Ability[i].Explain, self.Ability[i].Value)
    end
    if self.Duration ~= 0 then
        -- statements
        str = str .. "持续" .. tostring(self.Duration) .. "秒。"
    end
    return str
end
----------
return Skill
