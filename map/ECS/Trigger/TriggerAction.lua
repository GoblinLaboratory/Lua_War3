require "EventTemplate"
require "ECS\\Global"
TriggerAction = {}
-- 参数  v数值 t时间 u目标单位 tu触发单位
TriggerAction["暴击"] = function(...)
    -- statements
    local v = ...
    local ev = EventTemplate:Instance()
    ev.Crit:Fire(v)
end
TriggerAction["结束暴击"] = function(...)
    -- statements
    -- local u, v = ...
end
TriggerAction["背刺"] = function(...)
    -- statements
    local v, t, u, tu = ...
    local ev = EventTemplate:Instance()
    ev.BacThorn:Fire(v, u, tu)
end
TriggerAction["结束背刺"] = function(...)
    -- statements
    -- local u, v = ...
end
TriggerAction["移动速度降低"] = function(...)
    -- statements
    local v, t, u = ...
    local ev = EventTemplate:Instance()
    -- ev.SetPrototype:Fire(u, "移动速度", 0 - num)
    ev.SetPrototype:Fire(u, "移动速度", 0 - v) -- 发送消息
end
TriggerAction["结束移动速度降低"] = function(...)
    -- statements
    local v, t, u = ...
    -- ev.SetPrototype:Fire(u, "移动速度", num)
    local ev = EventTemplate:Instance()
    ev.SetPrototype:Fire(u, "移动速度", v) -- 发送消息
end
return TriggerAction
