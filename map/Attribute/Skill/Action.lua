require "EventTemplate"
require "Algorithm\\OngoingDamage"
Action = {}

function Action:new(o)
    o = o or {}
    setmetatable(o, self)
    -- o.__index = self
    ----------
    o["移动速度降低"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "移动速度", 0 - num)
        ev.SetBasicsAttribute:Fire(u, "移动速度", 0 - num)
    end
    o["结束移动速度降低"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "移动速度", num)
        ev.SetBasicsAttribute:Fire(u, "移动速度", num)
    end
    ----------
    o["移动速度增加"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "移动速度", num)
        ev.SetBasicsAttribute:Fire(u, "移动速度", num)
    end
    o["结束移动速度增加"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "移动速度", 0 - num)
        ev.SetBasicsAttribute:Fire(u, "移动速度", 0 - num)
    end
    ----------
    o["攻击速度降低"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "攻击速度", 0 - num)
        ev.SetBasicsAttribute:Fire(u, "攻击速度", 0 - num)
    end
    o["结束攻击速度降低"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "攻击速度", num)
        ev.SetBasicsAttribute:Fire(u, "攻击速度", num)
    end
    ----------
    o["攻击速度增加"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "攻击速度", num)
        ev.SetBasicsAttribute:Fire(u, "攻击速度", num)
    end
    o["结束攻击速度增加"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "攻击速度", 0 - num)
        ev.SetBasicsAttribute:Fire(u, "攻击速度", 0 - num)
    end
    ----------
    o["最大生命值增加"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "生命值", num)
        ev.SetBasicsAttribute:Fire(u, "生命值", num)
    end
    o["结束最大生命值增加"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "生命值", 0 - num)
        ev.SetBasicsAttribute:Fire(u, "生命值", 0 - num)
    end
    ----------
    o["最大魔法值增加"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "魔法值", num)
        ev.SetBasicsAttribute:Fire(u, "魔法值", num)
    end
    o["结束最大魔法值增加"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "魔法值", 0 - num)
        ev.SetBasicsAttribute:Fire(u, "魔法值", 0 - num)
    end
    ----------
    o["护甲降低"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "护甲", 0 - num)
        ev.SetBasicsAttribute:Fire(u, "护甲", 0 - num)
    end
    o["结束护甲降低"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "护甲", num)
        ev.SetBasicsAttribute:Fire(u, "护甲", num)
    end
    o["护甲增加"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "护甲", num)
        ev.SetBasicsAttribute:Fire(u, "护甲", num)
    end
    o["结束护甲增加"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "护甲", 0 - num)
        ev.SetBasicsAttribute:Fire(u, "护甲", 0 - num)
    end
    ----------
    o["攻击力降低"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "攻击力", 0 - num)
        ev.SetBasicsAttribute:Fire(u, "攻击力", 0 - num)
    end
    o["结束攻击力降低"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "攻击力", num)
        ev.SetBasicsAttribute:Fire(u, "攻击力", num)
    end
    o["攻击力增加"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "攻击力", num)
        ev.SetBasicsAttribute:Fire(u, "攻击力", num)
    end
    o["结束攻击力增加"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "攻击力", 0 - num)
        ev.SetBasicsAttribute:Fire(u, "攻击力", 0 - num)
    end
    ----------
    o["力量降低"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "力量", 0 - num)
        ev.SetExtendAttribute:Fire(u, "力量", 0 - num)
    end
    o["结束力量降低"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "力量", num)
        ev.SetExtendAttribute:Fire(u, "力量", num)
    end
    o["力量增加"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "力量", num)
        ev.SetExtendAttribute:Fire(u, "力量", num)
    end
    o["结束力量增加"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "力量", 0 - num)
        ev.SetExtendAttribute:Fire(u, "力量", 0 - num)
    end
    ----------
    o["敏捷降低"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "敏捷", 0 - num)
        ev.SetExtendAttribute:Fire(u, "敏捷", 0 - num)
    end
    o["结束敏捷降低"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "敏捷", num)
        ev.SetExtendAttribute:Fire(u, "敏捷", num)
    end
    o["敏捷增加"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "敏捷", num)
        ev.SetExtendAttribute:Fire(u, "敏捷", num)
    end
    o["结束敏捷增加"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "敏捷", 0 - num)
        ev.SetExtendAttribute:Fire(u, "敏捷", 0 - num)
    end
    ----------
    o["智力降低"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "智力", 0 - num)
        ev.SetExtendAttribute:Fire(u, "智力", 0 - num)
    end
    o["结束智力降低"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "智力", num)
        ev.SetExtendAttribute:Fire(u, "智力", num)
    end
    o["智力增加"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "智力", num)
        ev.SetExtendAttribute:Fire(u, "智力", num)
    end
    o["结束智力增加"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        -- ev.SetPrototype:Fire(u, "智力", 0 - num)
        ev.SetExtendAttribute:Fire(u, "智力", 0 - num)
    end
    ----------
    o["增加基础属性"] = function(u, Type, num)
        -- statements
        local ev = EventTemplate:Instance()
        ev.SetBasicsAttribute:Fire(u, Type, num)
    end
    o["结束增加基础属性"] = function(u, Type, num)
        -- statements
        local ev = EventTemplate:Instance()
        ev.SetBasicsAttribute:Fire(u, Type, 0 - num)
    end
    o["增加扩展属性"] = function(u, Type, num)
        -- statements
        local ev = EventTemplate:Instance()
        ev.SetExtendAttribute:Fire(u, Type, num)
    end
    o["结束增加扩展属性"] = function(u, Type, num)
        -- statements
        local ev = EventTemplate:Instance()
        ev.SetExtendAttribute:Fire(u, Type, 0 - num)
    end
    o["增加抗性属性"] = function(u, Type, num)
        -- statements
        local ev = EventTemplate:Instance()
        ev.SetResistanceAttribute:Fire(u, Type, num)
    end
    o["结束增加抗性属性"] = function(u, Type, num)
        -- statements
        local ev = EventTemplate:Instance()
        ev.SetResistanceAttribute:Fire(u, Type, 0 - num)
    end
    ----------
    o["单位受到伤害"] = function(t, u, num)
        -- statements
        local ev = EventTemplate:Instance()
        ev.Damage:Fire(t, u, num)
    end
    o["单位受到持续伤害"] = function(t, u, v, e)
        -- statements
        local ev = OngoingDamage:Instance()
        ev:AddUnit(t, u, v, e)
    end
    o["结束单位受到持续伤害"] =
        function(u, e)
            -- statements
            local ev = OngoingDamage:Instance()
            ev:RemoveUnit(u, e)
        end
    ----------
    o["治疗单位"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        ev.Treatment:Fire(u, num)
    end
    o["魔法回复"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        ev.Evil:Fire(u, num)
    end
    o["吸血"] = function(u, num)
        -- statements
        local ev = EventTemplate:Instance()
        ev.BloodSucking:Fire(u, num)
    end
    ----------
    o["添加魔法效果"] = function(u, e)
        -- statements
        local ev = EventTemplate:Instance()
        --ev.BloodSucking:Fire(u, num)
    end
    o["删除魔法效果"] = function(u,e)
        -- statements
        local ev = EventTemplate:Instance()
        --ev.BloodSucking:Fire(u, num)
    end
    -----
    return o
end
function Action:Command(Com, u, Num)
    -- statements
    self[Com](u, Num)
end
function Action:CommandEnd(Com, u, Num)
    -- statements
    self["结束" .. Com](u, Num)
end
Action.__index = Action
function Action:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end
return Action
