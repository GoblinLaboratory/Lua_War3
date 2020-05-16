-- 基础属性类
BaseAttribute = {
    -- 基础属性
    -- 力量
    Power = 0,
    -- 敏捷
    Agility = 0,
    -- 智力
    Lntelligence = 0,
    -- 体质
    Constitution = 0,
    -- 精神
    Spirit = 0,
    -- 意志
    will = 0,
    -- 幸运
    lucky = 0
}

-- 创建BaseAttribute类
function BaseAttribute:new(o)
    o = o or {}
    setmetatable(o, self)
    --
    --
    return o
end
BaseAttribute.__index = BaseAttribute

-- 此处下面写代码
-- 设置属性
function BaseAttribute:SetPrototype(item1)
    self.Power = item1.Power
    self.Agility = item1.Agility
    self.Lntelligence = item1.Lntelligence
    self.Constitution = item1.Constitution
    self.Spirit = item1.Spirit
    self.will = item1.will
    self.lucky = item1.lucky
end
-- 清空属性
function BaseAttribute:Int()
    self.Power = 0
    self.Agility = 0
    self.Lntelligence = 0
    self.Constitution = 0
    self.Spirit = 0
    self.will = 0
    self.lucky = 0
end
-- 添加属性
function BaseAttribute:AddPrototype(item1)
    self.Power = self.Power + item1.Power
    self.Agility = self.Agility + item1.Agility
    self.Lntelligence = self.Lntelligence + item1.Lntelligence
    self.Constitution = self.Constitution + item1.Constitution
    self.Spirit = self.Spirit + item1.Spirit
    self.will = self.will + item1.will
    self.lucky = self.lucky + item1.lucky
end
--移除属性
function BaseAttribute:RemovePrototype(item1)
    self.Power = self.Power - item1.Power
    self.Agility = self.Agility - item1.Agility
    self.Lntelligence = self.Lntelligence - item1.Lntelligence
    self.Constitution = self.Constitution - item1.Constitution
    self.Spirit = self.Spirit - item1.Spirit
    self.will = self.will - item1.will
    self.lucky = self.lucky - item1.lucky
end
-- 此处上面写代码

return BaseAttribute
-- 创建对象

-- 基础类方法 printArea

-- 测试代码
-- function BaseAttribute:print ()
-- print("输出： ",self.Power)
-- end

---myshape = BaseAttribute:new(nil)
-- myshape.Power = 10
-- myshape:print()
