Attribute = {
    --力量
    Power = 0,
    --敏捷
    Agile = 0,
    --智力
    Intelligence = 0,
    --幸运
    Lucky = 0,
    --生命值
    LifeValue = 0,
    --魔法值
    MagicValue = 0,
    --生命恢复速度
    LifeRecoverySpeed = 0,
    --魔法回复速度
    MagicRecoverySpeed = 0,
    --攻击力
    AttackValue = 0,
    --法术攻击强度
    MagicAttackIntensity = 0,
    --护甲
    Armor = 0,
    --魔法抗性
    MagicResistance = 0,
    --物理攻击暴击强度
    AttackCriticismIntensity = 0,
    --物理暴击几率
    CriticalHitProbability = 0,
    --法术攻击暴击强度
    MagicCriticismIntensity = 0,
    --法术暴击几率
    MagicCriticalHitProbability = 0,
    --移动速度
    MovingSpeed = 0,
    --攻击速度
    AttackSpeed = 0,
    --闪避
    Dodge = 0,
    --格挡
    Block = 0,
    --物理伤害减免
    PhysicalInjuryRelief = 0,
    --法术伤害减免
    MagicInjuryRelief = 0,
    --伤害减免
    InjuryRelief = 0,
    --物理攻击吸血
    AttackBloodSucking = 0,
    --法术攻击吸血
    MagicBloodSucking = 0
    --其他设定属性
    --精神 :  精神越高，你的法力值就越高，一定时间能放更多的技能
    --火焰抗性
    --水系抗性
    --自然抗性
    --暗影抗性
    --邪能抗性
    --神圣抗性
}

function Attribute:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    --
    --
    return o
end

Attribute.__index = Attribute

function Attribute:Init()
    --力量
    self.Power = 0
    --敏捷
    self.Agile = 0
    --智力
    self.Intelligence = 0
    --幸运
    self.Lucky = 0
    --生命值
    self.LifeValue = 0
    --魔法值
    self.MagicValue = 0
    --生命恢复速度
    self.LifeRecoverySpeed = 0
    --魔法回复速度
    self.MagicRecoverySpeed = 0
    --攻击力
    self.AttackValue = 0
    --法术攻击强度
    self.MagicAttackIntensity = 0
    --护甲
    self.Armor = 0
    --魔法抗性
    self.MagicResistance = 0
    --物理攻击暴击强度
    self.AttackCriticismIntensity = 0
    --物理暴击几率
    self.CriticalHitProbability = 0
    --法术攻击暴击强度
    self.MagicCriticismIntensity = 0
    --法术暴击几率
    self.MagicCriticalHitProbability = 0
    --移动速度
    self.MovingSpeed = 0
    --攻击速度
    self.AttackSpeed = 0
    --闪避
    self.Dodge = 0
    --格挡
    self.Block = 0
    --物理伤害减免
    self.PhysicalInjuryRelief = 0
    --法术伤害减免
    self.MagicInjuryRelief = 0
    --伤害减免
    self.InjuryRelief = 0
    --物理攻击吸血
    self.AttackBloodSucking = 0
    --法术攻击吸血
    self.MagicBloodSucking = 0
    --其他设定属性
    --精神 :  精神越高，你的法力值就越高，一定时间能放更多的技能
    --火焰抗性
    --水系抗性
    --自然抗性
    --暗影抗性
    --邪能抗性
    --神圣抗性
end

function Attribute:Add(Attribute_s)
    --力量
    self.Power = self.Power + Attribute_s.Power
    --敏捷
    self.Agile = self.Agile + Attribute_s.Agile
    --智力
    self.Intelligence = self.Intelligence + Attribute_s.Intelligence
    --幸运
    self.Lucky = self.Lucky + Attribute_s.Lucky
    --生命值
    self.LifeValue = self.LifeValue + Attribute_s.Power
    --魔法值
    self.MagicValue = self.MagicValue + Attribute_s.MagicValue
    --生命恢复速度
    self.LifeRecoverySpeed = self.LifeRecoverySpeed + Attribute_s.LifeRecoverySpeed
    --魔法回复速度
    self.MagicRecoverySpeed = self.MagicRecoverySpeed + Attribute_s.MagicRecoverySpeed
    --攻击力
    self.AttackValue = self.AttackValue + Attribute_s.AttackValue
    --法术攻击强度
    self.MagicAttackIntensity = self.MagicAttackIntensity + Attribute_s.MagicAttackIntensity
    --护甲
    self.Armor = self.Armor + Attribute_s.Armor
    --魔法抗性
    self.MagicResistance = self.MagicResistance + Attribute_s.MagicResistance
    --物理攻击暴击强度
    self.AttackCriticismIntensity = self.AttackCriticismIntensity + Attribute_s.AttackCriticismIntensity
    --物理暴击几率
    self.CriticalHitProbability = self.CriticalHitProbability + Attribute_s.CriticalHitProbability
    --法术攻击暴击强度
    self.MagicCriticismIntensity = self.MagicCriticismIntensity + Attribute_s.MagicCriticismIntensity
    --法术暴击几率
    self.MagicCriticalHitProbability = self.MagicCriticalHitProbability + Attribute_s.MagicCriticalHitProbability
    --移动速度
    self.MovingSpeed = self.MovingSpeed + Attribute_s.MovingSpeed
    --攻击速度
    self.AttackSpeed = self.AttackSpeed + Attribute_s.AttackSpeed
    --闪避
    self.Dodge = self.Dodge + Attribute_s.Dodge
    --格挡
    self.Block = self.Block + Attribute_s.Block
    --物理伤害减免
    self.PhysicalInjuryRelief = self.PhysicalInjuryRelief + Attribute_s.PhysicalInjuryRelief
    --法术伤害减免
    self.MagicInjuryRelief = self.MagicInjuryRelief + Attribute_s.MagicInjuryRelief
    --伤害减免
    self.InjuryRelief = self.InjuryRelief + Attribute_s.InjuryRelief
    --物理攻击吸血
    self.AttackBloodSucking = self.AttackBloodSucking + Attribute_s.AttackBloodSucking
    --法术攻击吸血
    self.MagicBloodSucking = self.MagicBloodSucking + Attribute_s.MagicBloodSucking
    --其他设定属性
    --精神 :  精神越高，你的法力值就越高，一定时间能放更多的技能
    --火焰抗性
    --水系抗性
    --自然抗性
    --暗影抗性
    --邪能抗性
    --神圣抗性
end
function Attribute:Remove(Attribute_s)
    --力量
    self.Power = self.Power - Attribute_s.Power
    --敏捷
    self.Agile = self.Agile - Attribute_s.Agile
    --智力
    self.Intelligence = self.Intelligence - Attribute_s.Intelligence
    --幸运
    self.Lucky = self.Lucky - Attribute_s.Lucky
    --生命值
    self.LifeValue = self.LifeValue - Attribute_s.Power
    --魔法值
    self.MagicValue = self.MagicValue - Attribute_s.MagicValue
    --生命恢复速度
    self.LifeRecoverySpeed = self.LifeRecoverySpeed - Attribute_s.LifeRecoverySpeed
    --魔法回复速度
    self.MagicRecoverySpeed = self.MagicRecoverySpeed - Attribute_s.MagicRecoverySpeed
    --攻击力
    self.AttackValue = self.AttackValue - Attribute_s.AttackValue
    --法术攻击强度
    self.MagicAttackIntensity = self.MagicAttackIntensity - Attribute_s.MagicAttackIntensity
    --护甲
    self.Armor = self.Armor - Attribute_s.Armor
    --魔法抗性
    self.MagicResistance = self.MagicResistance - Attribute_s.MagicResistance
    --物理攻击暴击强度
    self.AttackCriticismIntensity = self.AttackCriticismIntensity - Attribute_s.AttackCriticismIntensity
    --物理暴击几率
    self.CriticalHitProbability = self.CriticalHitProbability - Attribute_s.CriticalHitProbability
    --法术攻击暴击强度
    self.MagicCriticismIntensity = self.MagicCriticismIntensity - Attribute_s.MagicCriticismIntensity
    --法术暴击几率
    self.MagicCriticalHitProbability = self.MagicCriticalHitProbability - Attribute_s.MagicCriticalHitProbability
    --移动速度
    self.MovingSpeed = self.MovingSpeed - Attribute_s.MovingSpeed
    --攻击速度
    self.AttackSpeed = self.AttackSpeed - Attribute_s.AttackSpeed
    --闪避
    self.Dodge = self.Dodge - Attribute_s.Dodge
    --格挡
    self.Block = self.Block - Attribute_s.Block
    --物理伤害减免
    self.PhysicalInjuryRelief = self.PhysicalInjuryRelief - Attribute_s.PhysicalInjuryRelief
    --法术伤害减免
    self.MagicInjuryRelief = self.MagicInjuryRelief - Attribute_s.MagicInjuryRelief
    --伤害减免
    self.InjuryRelief = self.InjuryRelief - Attribute_s.InjuryRelief
    --物理攻击吸血
    self.AttackBloodSucking = self.AttackBloodSucking - Attribute_s.AttackBloodSucking
    --法术攻击吸血
    self.MagicBloodSucking = self.MagicBloodSucking - Attribute_s.MagicBloodSucking
    --其他设定属性
    --精神 :  精神越高，你的法力值就越高，一定时间能放更多的技能
    --体质
    --感知
    --魅力
    --火焰抗性
    --水系抗性
    --自然抗性
    --暗影抗性
    --邪能抗性
    --神圣抗性
end
function Attribute:Set(Attribute_s)
    --力量
    self.Power = Attribute_s.Power
    --敏捷
    self.Agile = Attribute_s.Agile
    --智力
    self.Intelligence = Attribute_s.Intelligence

    --幸运
    self.Lucky = Attribute_s.Lucky
    --生命值
    self.LifeValue = Attribute_s.Power
    --魔法值
    self.MagicValue = Attribute_s.MagicValue
    --生命恢复速度
    self.LifeRecoverySpeed = Attribute_s.LifeRecoverySpeed
    --魔法回复速度
    self.MagicRecoverySpeed = Attribute_s.MagicRecoverySpeed
    --攻击力
    self.AttackValue = Attribute_s.AttackValue
    --法术攻击强度

    self.MagicAttackIntensity = Attribute_s.MagicAttackIntensity
    --护甲
    self.Armor = Attribute_s.Armor
    --魔法抗性
    self.MagicResistance = Attribute_s.MagicResistance
    --物理攻击暴击强度
    self.AttackCriticismIntensity = Attribute_s.AttackCriticismIntensity
    --物理暴击几率
    self.CriticalHitProbability = Attribute_s.CriticalHitProbability
    --法术攻击暴击强度
    self.MagicCriticismIntensity = Attribute_s.MagicCriticismIntensity
    --法术暴击几率
    self.MagicCriticalHitProbability = Attribute_s.MagicCriticalHitProbability
    --移动速度
    self.MovingSpeed = Attribute_s.MovingSpeed
    --攻击速度
    self.AttackSpeed = Attribute_s.AttackSpeed
    --闪避
    self.Dodge = Attribute_s.Dodge
    --格挡
    self.Block = Attribute_s.Block
    --物理伤害减免
    self.PhysicalInjuryRelief = Attribute_s.PhysicalInjuryRelief
    --法术伤害减免
    self.MagicInjuryRelief = Attribute_s.MagicInjuryRelief
    --伤害减免
    self.InjuryRelief = Attribute_s.InjuryRelief
    --物理攻击吸血
    self.AttackBloodSucking = Attribute_s.AttackBloodSucking
    --法术攻击吸血
    self.MagicBloodSucking = Attribute_s.MagicBloodSucking
    --其他设定属性
    --精神 :  精神越高，你的法力值就越高，一定时间能放更多的技能
    --火焰抗性
    --水系抗性
    --自然抗性
    --暗影抗性
    --邪能抗性
    --神圣抗性
end

function Attribute:Level(levels)
    --力量
    self.Power = self.Power * levels
    --敏捷
    self.Agile = self.Agile * levels
    --智力
    self.Intelligence = self.Intelligence * levels
    --幸运
    --self.Lucky = self.Lucky + Attribute_s.Lucky
    --生命值
    self.LifeValue = self.LifeValue * levels
    --魔法值
    self.MagicValue = self.MagicValue * levels
    --生命恢复速度
    self.LifeRecoverySpeed = self.LifeRecoverySpeed * levels
    --魔法回复速度
    self.MagicRecoverySpeed = self.MagicRecoverySpeed * levels
    --攻击力
    self.AttackValue = self.AttackValue * levels
    --法术攻击强度
    self.MagicAttackIntensity = self.MagicAttackIntensity * levels
    --护甲
    self.Armor = self.Armor * levels
    --魔法抗性
    --self.MagicResistance = self.MagicResistance + Attribute_s.MagicResistance
    --物理攻击暴击强度
    self.AttackCriticismIntensity = self.AttackCriticismIntensity * levels
    --物理暴击几率
    --self.CriticalHitProbability = self.CriticalHitProbability + Attribute_s.CriticalHitProbability
    --法术攻击暴击强度
    self.MagicCriticismIntensity = self.MagicCriticismIntensity * levels
    --法术暴击几率
    --self.MagicCriticalHitProbability = self.MagicCriticalHitProbability + Attribute_s.MagicCriticalHitProbability
    --移动速度
    --self.MovingSpeed = self.MovingSpeed + Attribute_s.MovingSpeed
    --攻击速度
    --self.AttackSpeed = self.AttackSpeed  + Attribute_s.AttackSpeed
    --闪避
    --self.Dodge = self.Dodge + Attribute_s.Dodge
    --格挡
    --self.Block = self.Block + Attribute_s.Block
    --物理伤害减免
    --self.PhysicalInjuryRelief = self.PhysicalInjuryRelief + Attribute_s.PhysicalInjuryRelief
    --法术伤害减免
    --self.MagicInjuryRelief = self.MagicInjuryRelief + Attribute_s.MagicInjuryRelief
    --伤害减免
    --self.InjuryRelief = self.InjuryRelief + Attribute_s.InjuryRelief
    --物理攻击吸血
    --self.AttackBloodSucking = self.AttackBloodSucking + Attribute_s.AttackBloodSucking
    --法术攻击吸血
    --self.MagicBloodSucking = self.MagicBloodSucking  + Attribute_s.MagicBloodSucking
    --其他设定属性
    --精神 :  精神越高，你的法力值就越高，一定时间能放更多的技能
    --火焰抗性
    --水系抗性
    --自然抗性
    --暗影抗性
    --邪能抗性
    --神圣抗性
end

return Attribute
