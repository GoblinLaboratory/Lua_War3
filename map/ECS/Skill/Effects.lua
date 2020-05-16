require "ECS\\Trigger\\TriggerAction"
Effects = {
    -- 名称
    -- ["Name"] = 0,
    -- ["ID"] = 0,
    -- ["Explain"] = 0,
    -- ["增益"] = 0,
    -- ["叠加"] = 0,
    -- ["Value"] = 0,
    -- ["持续时间"] = 0,
    -- Tag = 0,
    -- ["动作"] = {}
    -- 名称
    Name = 0,
    -- ID
    ID = 1,
    -- 说明文本
    Explain = 0,
    -- 类型 瞬时 永久 持续
    Typrs = 0,
    -- 值
    Value = 0,
    -- BuffID
    BuffID = 0,
    -- 是否为增益
    Beneficial = true,
    -- 持续时间
    Duration = 0,
    -- 目标单位
    TargetUnit = 0,
    -- 触发单位
    TriggerUnit = 0,
    -- 叠加
    SuperPosition = true,
    -- 动作
    Action = {}
}
----------
-- function Effects:Update()
-- end
----------
function Effects:new(o)
    o = o or {}
    setmetatable(o, self)
    -----
    o.Name = 0
    -- ID
    o.ID = 1
    -- 说明文本
    o.Explain = 0
    -- 类型
    o.Typrs = 0
    -- 值
    o.Value = 0
    -- BuffID
    o.BuffID = 0
    -- 目标单位
    o.TargetUnit = 0
    -- 触发单位
    o.TriggerUnit = 0
    -- 是否为增益
    o.Beneficial = true
    -- 持续时间
    o.Duration = 0
    -- 叠加
    o.SuperPosition = true
    -- 动作
    o.Action = {}
    -----
    return o
end
Effects.__index = Effects
function Effects:Start(u)
    self.TargetUnit = u
    self:Fire(u)
end
-- 参数u目标单位 t来源单位
function Effects:Fire()
    -- statements
    -- local u, t = ...
    print("Effects:Fire")
    for i = #self.Action, 1, -1 do
        -- statements
        -- 值 ,时间,单位,
        TriggerAction[self.Action[i].Name](self.Action[i].Value, self.Duration,
                                           self.TargetUnit, self.TriggerUnit)
    end
end
function Effects:End()
    -- statements
    --local u, t = ...
    for i = #self.Action, 1, -1 do
        -- statements
        TriggerAction["结束" .. self.Action[i].Name](self.Action[i].Value,
                                                       self.Duration,
                                                       self.TargetUnit,
                                                       self.TriggerUnit)
    end
end
return Effects
