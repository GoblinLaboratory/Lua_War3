-- require "struct\\Item"
-- 混合属性类
MixedAttribute = {
    -- 攻击力
    AttackPower = 0,
    -- 护甲值
    Armor = 0,
    -- 魔法抗性
    MagicResistance = 0,
    -- 生命值
    Health = 0,
    -- 魔法值
    Magic = 0,
    -- 生命回复速度
    HPRecoverySpeed = 0,
    -- 魔法回复速度
    MagicRecoverySpeed = 0,
    -- 攻击速度
    AttackSpeed = 0,
    -- 移动速度
    MoveSpeed = 0
}

-- 创建MixedAttribute类
function MixedAttribute:new(o)
    o = o or {}
    setmetatable(o, self)
    --
    --
    return o
end
MixedAttribute.__index = MixedAttribute

-- 此处下面写代码
-- 设置属性
function MixedAttribute:SetPrototype(item1)
    self.AttackPower = item1.AttackPower
    self.Armor = item1.Armor
    self.MagicResistance = item1.MagicResistance
    self.Health = item1.Health
    self.Magic = item1.Magic
    self.HPRecoverySpeed = item1.HPRecoverySpeed
    self.MagicRecoverySpeed = item1.MagicRecoverySpeed
    self.AttackSpeed = item1.AttackSpeed
    self.MoveSpeed = item1.MoveSpeed
end
-- 清空属性
function MixedAttribute:Int()
    self.AttackPower = 0
    self.Armor = 0
    self.MagicResistance = 0
    self.Health = 0
    self.Magic = 0
    self.HPRecoverySpeed = 0
    self.MagicRecoverySpeed = 0
    self.AttackSpeed = 0
    self.MoveSpeed = 0
end
-- 添加属性
function MixedAttribute:AddPrototype(item1)
    self.AttackPower = self.AttackPower + item1.AttackPower
    self.Armor = self.Armor + item1.Armor
    self.MagicResistance = self.MagicResistance + item1.MagicResistance
    self.Health = self.Health + item1.Health
    self.Magic = self.Magic + item1.Magic
    self.HPRecoverySpeed = self.HPRecoverySpeed + item1.HPRecoverySpeed
    self.MagicRecoverySpeed = self.MagicRecoverySpeed + item1.MagicRecoverySpeed
    self.AttackSpeed = self.AttackSpeed + item1.AttackSpeed
    self.MoveSpeed = self.MoveSpeed + item1.MoveSpeed
end
-- 移除属性
function MixedAttribute:RemovePrototype(item1)
    self.AttackPower = self.AttackPower - item1.AttackPower
    self.Armor = self.Armor - item1.Armor
    self.MagicResistance = self.MagicResistance - item1.MagicResistance
    self.Health = self.Health - item1.Health
    self.Magic = self.Magic - item1.Magic
    self.HPRecoverySpeed = self.HPRecoverySpeed - item1.HPRecoverySpeed
    self.MagicRecoverySpeed = self.MagicRecoverySpeed - item1.MagicRecoverySpeed
    self.AttackSpeed = self.AttackSpeed - item1.AttackSpeed
    self.MoveSpeed = self.MoveSpeed - item1.MoveSpeed
end
-- 此处上面写代码

return MixedAttribute
