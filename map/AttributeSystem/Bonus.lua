require "ECS\\Model\\Maths"
local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"

-- 常量
BONUS_ARMOR = 1 -- 护甲
BONUS_DAMAGE = 2 -- 攻击力
BONUS_MANA_REGEN = 3 -- 魔法回复速度
BONUS_LIFE_REGEN = 4 -- 生命回复速度
BONUS_SPEED_ATTACK = 5 -- 攻击速度
BONUS_LIFE_max = 6 -- 生命
BONUS_MANA_max = 7 -- 魔法
BONUS_L = 8 -- 力量
BONUS_M = 9 -- 敏捷
BONUS_Z = 10 -- 智力

BONUS_TYPES = 11
PRELOAD_ABILITYS = true
-- 万能属性系统

Bonus = {
    ABILITY_COUNT = {},
    ABILITY_NUM = {},
    BonusAbilitys = {},
    PowersOf2 = {},
    MaxBonus = {},
    MinBonus = {},
    PRELOAD_DUMMY_UNIT = 0
}

function Bonus:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Bonus:Int()
    local u = 0
    local add = 1
    self:InitializeAbilitys()
    for n = 1, 10 do
        self.PowersOf2[add] = 1
        for i = 1, self.ABILITY_NUM[n] do
            self.PowersOf2[add + 1] = self.PowersOf2[add] * 2
            add = add + 1
        end
        add = add - 1
        self.MaxBonus[n] = self.PowersOf2[add] - 1
        self.MinBonus[n] = 0 - self.PowersOf2[add]
        add = add + 1
    end
    -- 预读技能
    if PRELOAD_ABILITYS then
        u = CJ.CreateUnit(CJ.Player(15), self.PRELOAD_DUMMY_UNIT, 0, 0, 0)
        for i = 1, self.ABILITY_COUNT[11] - 1 do
            CJ.UnitAddAbility(u, self.BonusAbilitys[i])
        end
        CJ.RemoveUnit(u)
    end
end

function Bonus:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end

------------------------
-- 为清空单位的护甲/攻击等值
function Bonus:UnitClearBonus(u, bonusType)
    for i = 1, self.ABILITY_NUM[bonusType] do
        CJ.UnitRemoveAbility(u,
                             self.BonusAbilitys[self.ABILITY_COUNT[bonusType] +
                                 i - 1])
    end
end

function Bonus:GetId(id)
    local i = string.byte(id, 1) -- (这里的string.byte(id,1)就是把id这个字符串的第1个字符转换成ascii编码的10进制)
    i = i * 256 + string.byte(id, 2)
    i = i * 256 + string.byte(id, 3)
    i = i * 256 + string.byte(id, 4)
    return i
end
-- 设置单位移动速度。直接jass设置
function Bonus:SetUnitSeed(u, ammount)
    local y = CJ.GetUnitMoveSpeed(CJ.GetTriggerUnit())
    CJ.SetUnitMoveSpeed(u, y + ammount)
end
-- 移动速度
function Bonus:UnitSetSeed(u, ammount)
    if CJ.GetUnitAbilityLevel(u, self:GetId("YDSD")) > 0 then
        local d = CJ.GetUnitAbilityLevel(u, self:GetId("YDSD"))
        if (d + ammount / 5) <= 0 then
            CJ.SetUnitAbilityLevel(u, self:GetId("YDSD"), 1)
        else
            CJ.SetUnitAbilityLevel(u, self:GetId("YDSD"), d + ammount / 5)
        end
    else
        CJ.UnitAddAbility(u, self:GetId("YDSD"))
        CJ.SetUnitAbilityLevel(u, self:GetId("YDSD"), ammount / 5)
    end
end
-- --魔法抗性
-- function Bonus:UnitSetMFKX(u,ammount)
--     if CJ.GetUnitAbilityLevel(u, self:GetId("MKJN")) > 0 then
--         local d = CJ.GetUnitAbilityLevel(u, self:GetId("MKJN"))
--         if(d+ammount) <=  0 then
--             CJ.SetUnitAbilityLevel( u, self:GetId("MKJN"), 1 )
--         else
--             CJ.SetUnitAbilityLevel( u, self:GetId("MKJN"), d+ammount )
--         end
--     else
--         CJ.UnitAddAbility(u, self:GetId("MKJN"))
--         CJ.SetUnitAbilityLevel( u, self:GetId("MKJN"), ammount )
--     end
-- end

function Bonus:UnitSetBonus(u, bonusType, ammount)
    -- local i = self.ABILITY_COUNT[bonusType+1]- 2
    if ammount < self.MinBonus[bonusType] or ammount > self.MaxBonus[bonusType] then
        -- debug call BJDebugMsg("BonusSystem Error: Bonus too high or low (" + I2S(ammount) + ")")
        return false
    elseif bonusType < 0 or bonusType >= BONUS_TYPES then
        -- debug call BJDebugMsg("BonusSystem Error: Invalid bonus type (" + I2S(bonusType) + ")")
        return false
    end

    if ammount < 0 then
        ammount = self.MaxBonus[bonusType] + ammount + 1
        CJ.UnitAddAbility(u,
                          self.BonusAbilitys[self.ABILITY_COUNT[bonusType + 1] -
                              1])
        CJ.UnitMakeAbilityPermanent(u, true,
                                    self.BonusAbilitys[self.ABILITY_COUNT[bonusType +
                                        1] - 1])
    else
        CJ.UnitRemoveAbility(u,
                             self.BonusAbilitys[self.ABILITY_COUNT[bonusType + 1] -
                                 1])
    end
    for i = self.ABILITY_COUNT[bonusType + 1] - 1, self.ABILITY_COUNT[bonusType], -1 do
        if ammount >= self.PowersOf2[i] then
            CJ.UnitAddAbility(u, self.BonusAbilitys[i])
            CJ.UnitMakeAbilityPermanent(u, true, self.BonusAbilitys[i])
            ammount = ammount - self.PowersOf2[i]
        else
            CJ.UnitRemoveAbility(u, self.BonusAbilitys[i])
        end
    end
    return true
end

function Bonus:UnitGetBonus(u, bonusType)
    -- local i = 0
    local ammount = 0

    if CJ.GetUnitAbilityLevel(u,
                              self.BonusAbilitys[self.ABILITY_COUNT[bonusType +
                                  1] - 1]) > 0 then
        ammount = self.MinBonus[bonusType]
    end
    for i = 1, self.ABILITY_NUM[bonusType] do
        if CJ.GetUnitAbilityLevel(u,
                                  self.BonusAbilitys[self.ABILITY_COUNT[bonusType] +
                                      i - 1]) > 0 then
            ammount = ammount +
                          self.PowersOf2[self.ABILITY_COUNT[bonusType] + i - 1]
        end
    end

    return ammount
end

function Bonus:UnitAddBonus(u, bonusType, ammount)
    self:UnitSetBonus(u, bonusType, self:UnitGetBonus(u, bonusType) + ammount)
end

function Bonus:InitializeAbilitys()
    -- local Global = EquipmentSystem:Instance() 

    self.PRELOAD_DUMMY_UNIT = Maths.GetId('hpea')

    self.ABILITY_COUNT[1] = 1
    self.ABILITY_COUNT[2] = 14
    self.ABILITY_COUNT[3] = 38
    self.ABILITY_COUNT[4] = 51
    self.ABILITY_COUNT[5] = 64
    self.ABILITY_COUNT[6] = 77
    self.ABILITY_COUNT[7] = 90
    self.ABILITY_COUNT[8] = 103
    self.ABILITY_COUNT[9] = 116
    self.ABILITY_COUNT[10] = 129
    self.ABILITY_COUNT[11] = 142

    self.ABILITY_NUM[1] = 13
    self.ABILITY_NUM[2] = 24
    self.ABILITY_NUM[3] = 13
    self.ABILITY_NUM[4] = 13
    self.ABILITY_NUM[5] = 13
    self.ABILITY_NUM[6] = 13
    self.ABILITY_NUM[7] = 13
    self.ABILITY_NUM[8] = 13
    self.ABILITY_NUM[9] = 13
    self.ABILITY_NUM[10] = 13
    local i = 1

    self.BonusAbilitys[i + 0] = Maths.GetId('ZxA0') -- // +1
    self.BonusAbilitys[i + 1] = Maths.GetId('ZxA1') -- // +2
    self.BonusAbilitys[i + 2] = Maths.GetId('ZxA2') -- // +4
    self.BonusAbilitys[i + 3] = Maths.GetId('ZxA3') -- // +8
    self.BonusAbilitys[i + 4] = Maths.GetId('ZxA4') -- // +16
    self.BonusAbilitys[i + 5] = Maths.GetId('ZxA5') -- // +32
    self.BonusAbilitys[i + 6] = Maths.GetId('ZxA6') -- // +64
    self.BonusAbilitys[i + 7] = Maths.GetId('ZxA7') -- // +128
    self.BonusAbilitys[i + 8] = Maths.GetId('ZxA8') -- // +256
    self.BonusAbilitys[i + 9] = Maths.GetId('ZxA9') -- // +512
    self.BonusAbilitys[i + 10] = Maths.GetId('ZxAa') -- // +1024
    self.BonusAbilitys[i + 11] = Maths.GetId('ZxAb') -- // +2048
    self.BonusAbilitys[i + 12] = Maths.GetId('ZxAc') -- // -4096

    i = 14
    self.BonusAbilitys[i + 0] = Maths.GetId('ZxB0') -- // +1
    self.BonusAbilitys[i + 1] = Maths.GetId('ZxB1') -- // +2
    self.BonusAbilitys[i + 2] = Maths.GetId('ZxB2') -- // +4
    self.BonusAbilitys[i + 3] = Maths.GetId('ZxB3') -- // +8
    self.BonusAbilitys[i + 4] = Maths.GetId('ZxB4') -- // +16
    self.BonusAbilitys[i + 5] = Maths.GetId('ZxB5') -- // +32
    self.BonusAbilitys[i + 6] = Maths.GetId('ZxB6') -- // +64
    self.BonusAbilitys[i + 7] = Maths.GetId('ZxB7') -- // +128
    self.BonusAbilitys[i + 8] = Maths.GetId('ZxB8') -- // +256
    self.BonusAbilitys[i + 9] = Maths.GetId('ZxB9') -- // +512
    self.BonusAbilitys[i + 10] = Maths.GetId('ZxBa') -- // 
    self.BonusAbilitys[i + 11] = Maths.GetId('ZxBb') -- //
    self.BonusAbilitys[i + 12] = Maths.GetId('ZxBc') -- // 
    self.BonusAbilitys[i + 13] = Maths.GetId('ZxBd') -- // 
    self.BonusAbilitys[i + 14] = Maths.GetId('ZxBe') -- // 
    self.BonusAbilitys[i + 15] = Maths.GetId('ZxBf') -- // 
    self.BonusAbilitys[i + 16] = Maths.GetId('ZxBg') -- // 
    self.BonusAbilitys[i + 17] = Maths.GetId('ZxBh') -- // 
    self.BonusAbilitys[i + 18] = Maths.GetId('ZxBi') -- // 
    self.BonusAbilitys[i + 19] = Maths.GetId('ZxBj') -- // 
    self.BonusAbilitys[i + 20] = Maths.GetId('ZxBk') -- // 
    self.BonusAbilitys[i + 21] = Maths.GetId('ZxBl') -- // 
    self.BonusAbilitys[i + 22] = Maths.GetId('ZxBm') -- // 4194304
    self.BonusAbilitys[i + 23] = Maths.GetId('ZxBn') -- // -8388608

    i = 38
    self.BonusAbilitys[i + 0] = Maths.GetId('ZxD0') -- // +1
    self.BonusAbilitys[i + 1] = Maths.GetId('ZxD1') -- // +2
    self.BonusAbilitys[i + 2] = Maths.GetId('ZxD2') -- // +4
    self.BonusAbilitys[i + 3] = Maths.GetId('ZxD3') -- // +8
    self.BonusAbilitys[i + 4] = Maths.GetId('ZxD4') -- // +16
    self.BonusAbilitys[i + 5] = Maths.GetId('ZxD5') -- // +32
    self.BonusAbilitys[i + 6] = Maths.GetId('ZxD6') -- // +64
    self.BonusAbilitys[i + 7] = Maths.GetId('ZxD7') -- // +128
    self.BonusAbilitys[i + 8] = Maths.GetId('ZxD8') -- // +256
    self.BonusAbilitys[i + 9] = Maths.GetId('ZxD9') -- // +512
    self.BonusAbilitys[i + 10] = Maths.GetId('ZxDa') -- // +1024
    self.BonusAbilitys[i + 11] = Maths.GetId('ZxDb') -- // +2048
    self.BonusAbilitys[i + 12] = Maths.GetId('ZxDc') -- // -4096

    i = 51
    self.BonusAbilitys[i + 0] = Maths.GetId('ZxE0') -- //+1
    self.BonusAbilitys[i + 1] = Maths.GetId('ZxE1') -- // +2
    self.BonusAbilitys[i + 2] = Maths.GetId('ZxE2') -- // +4
    self.BonusAbilitys[i + 3] = Maths.GetId('ZxE3') -- // +8
    self.BonusAbilitys[i + 4] = Maths.GetId('ZxE4') -- // +16
    self.BonusAbilitys[i + 5] = Maths.GetId('ZxE5') -- // +32
    self.BonusAbilitys[i + 6] = Maths.GetId('ZxE6') -- //+64
    self.BonusAbilitys[i + 7] = Maths.GetId('ZxE7') -- // +128
    self.BonusAbilitys[i + 8] = Maths.GetId('ZxE8') -- // +256
    self.BonusAbilitys[i + 9] = Maths.GetId('ZxE9') -- // +512
    self.BonusAbilitys[i + 10] = Maths.GetId('ZxEa') -- // +1024
    self.BonusAbilitys[i + 11] = Maths.GetId('ZxEb') -- // +2048
    self.BonusAbilitys[i + 12] = Maths.GetId('ZxEc') -- // -4096

    i = 64
    self.BonusAbilitys[i + 0] = Maths.GetId('ZxJ0')
    self.BonusAbilitys[i + 1] = Maths.GetId('ZxJ1')
    self.BonusAbilitys[i + 2] = Maths.GetId('ZxJ2')
    self.BonusAbilitys[i + 3] = Maths.GetId('ZxJ3')
    self.BonusAbilitys[i + 4] = Maths.GetId('ZxJ4')
    self.BonusAbilitys[i + 5] = Maths.GetId('ZxJ5')
    self.BonusAbilitys[i + 6] = Maths.GetId('ZxJ6')
    self.BonusAbilitys[i + 7] = Maths.GetId('ZxJ7')
    self.BonusAbilitys[i + 8] = Maths.GetId('ZxJ8')
    self.BonusAbilitys[i + 9] = Maths.GetId('ZxJ9')
    self.BonusAbilitys[i + 10] = Maths.GetId('ZxJa')
    self.BonusAbilitys[i + 11] = Maths.GetId('ZxJb')
    self.BonusAbilitys[i + 12] = Maths.GetId('ZxJc')

    i = 77
    self.BonusAbilitys[i + 0] = Maths.GetId('ZxL0')
    self.BonusAbilitys[i + 1] = Maths.GetId('ZxL1')
    self.BonusAbilitys[i + 2] = Maths.GetId('ZxL2')
    self.BonusAbilitys[i + 3] = Maths.GetId('ZxL3')
    self.BonusAbilitys[i + 4] = Maths.GetId('ZxL4')
    self.BonusAbilitys[i + 5] = Maths.GetId('ZxL5')
    self.BonusAbilitys[i + 6] = Maths.GetId('ZxL6')
    self.BonusAbilitys[i + 7] = Maths.GetId('ZxL7')
    self.BonusAbilitys[i + 8] = Maths.GetId('ZxL8')
    self.BonusAbilitys[i + 9] = Maths.GetId('ZxL9')
    self.BonusAbilitys[i + 10] = Maths.GetId('ZxLa')
    self.BonusAbilitys[i + 11] = Maths.GetId('ZxLb')
    self.BonusAbilitys[i + 12] = Maths.GetId('ZxLc')

    i = 90
    self.BonusAbilitys[i + 0] = Maths.GetId('ZxK0')
    self.BonusAbilitys[i + 1] = Maths.GetId('ZxK1')
    self.BonusAbilitys[i + 2] = Maths.GetId('ZxK2')
    self.BonusAbilitys[i + 3] = Maths.GetId('ZxK3')
    self.BonusAbilitys[i + 4] = Maths.GetId('ZxK4')
    self.BonusAbilitys[i + 5] = Maths.GetId('ZxK5')
    self.BonusAbilitys[i + 6] = Maths.GetId('ZxK6')
    self.BonusAbilitys[i + 7] = Maths.GetId('ZxK7')
    self.BonusAbilitys[i + 8] = Maths.GetId('ZxK8')
    self.BonusAbilitys[i + 9] = Maths.GetId('ZxK9')
    self.BonusAbilitys[i + 10] = Maths.GetId('ZxKa')
    self.BonusAbilitys[i + 11] = Maths.GetId('ZxKb')
    self.BonusAbilitys[i + 12] = Maths.GetId('ZxKc')

    i = 103
    self.BonusAbilitys[i + 0] = Maths.GetId('ZxX0')
    self.BonusAbilitys[i + 1] = Maths.GetId('ZxX1')
    self.BonusAbilitys[i + 2] = Maths.GetId('ZxX2')
    self.BonusAbilitys[i + 3] = Maths.GetId('ZxX3')
    self.BonusAbilitys[i + 4] = Maths.GetId('ZxX4')
    self.BonusAbilitys[i + 5] = Maths.GetId('ZxX5')
    self.BonusAbilitys[i + 6] = Maths.GetId('ZxX6')
    self.BonusAbilitys[i + 7] = Maths.GetId('ZxX7')
    self.BonusAbilitys[i + 8] = Maths.GetId('ZxX8')
    self.BonusAbilitys[i + 9] = Maths.GetId('ZxX9')
    self.BonusAbilitys[i + 10] = Maths.GetId('ZxXa')
    self.BonusAbilitys[i + 11] = Maths.GetId('ZxXb')
    self.BonusAbilitys[i + 12] = Maths.GetId('ZxXc')

    i = 116
    self.BonusAbilitys[i + 0] = Maths.GetId('ZxY0')
    self.BonusAbilitys[i + 1] = Maths.GetId('ZxY1')
    self.BonusAbilitys[i + 2] = Maths.GetId('ZxY2')
    self.BonusAbilitys[i + 3] = Maths.GetId('ZxY3')
    self.BonusAbilitys[i + 4] = Maths.GetId('ZxY4')
    self.BonusAbilitys[i + 5] = Maths.GetId('ZxY5')
    self.BonusAbilitys[i + 6] = Maths.GetId('ZxY6')
    self.BonusAbilitys[i + 7] = Maths.GetId('ZxY7')
    self.BonusAbilitys[i + 8] = Maths.GetId('ZxY8')
    self.BonusAbilitys[i + 9] = Maths.GetId('ZxY9')
    self.BonusAbilitys[i + 10] = Maths.GetId('ZxYa')
    self.BonusAbilitys[i + 11] = Maths.GetId('ZxYb')
    self.BonusAbilitys[i + 12] = Maths.GetId('ZxYc')

    i = 129
    self.BonusAbilitys[i + 0] = Maths.GetId('ZxZ0')
    self.BonusAbilitys[i + 1] = Maths.GetId('ZxZ1')
    self.BonusAbilitys[i + 2] = Maths.GetId('ZxZ2')
    self.BonusAbilitys[i + 3] = Maths.GetId('ZxZ3')
    self.BonusAbilitys[i + 4] = Maths.GetId('ZxZ4')
    self.BonusAbilitys[i + 5] = Maths.GetId('ZxZ5')
    self.BonusAbilitys[i + 6] = Maths.GetId('ZxZ6')
    self.BonusAbilitys[i + 7] = Maths.GetId('ZxZ7')
    self.BonusAbilitys[i + 8] = Maths.GetId('ZxZ8')
    self.BonusAbilitys[i + 9] = Maths.GetId('ZxZ9')
    self.BonusAbilitys[i + 10] = Maths.GetId('ZxZa')
    self.BonusAbilitys[i + 11] = Maths.GetId('ZxZb')
    self.BonusAbilitys[i + 12] = Maths.GetId('ZxZc')

end

return Bonus
