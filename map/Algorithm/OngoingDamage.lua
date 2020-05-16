-- 持续受到伤害
local CJ = require "jass.common"
local BJ = require "blizzard"
require "EventTemplate"
require "math"
require "Algorithm\\struct\\DamageUnit"
OngoingDamage = {Units = {}, Num = 0}

function OngoingDamage:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    --
    o.Num = 0
    --
    return o
end

OngoingDamage.__index = OngoingDamage

-- 单件模式
function OngoingDamage:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end
-- 添加单位
function OngoingDamage:AddUnit(t, u, v, e)
    local o = 0
    for i = #self.Units, 1, -1 do
        if self.Units[i].unit == u and self.Units[i].EffectType == e then
            if self.Units[i].Value < v then
                -- statements
                self.Units[i].Value = v
            end
            o = 1
        end
    end
    if o == 0 then
        -- statements
        self.Num = self.Num + 1
        local d = DamageUnit:new(o, self.Num, t, u, v, e)
        table.insert(self.Units, d)
    end
end
-- 移除单位
function OngoingDamage:RemoveUnit(u, e)
    for i = #self.Units, 1, -1 do
        if self.Units[i].unit == u and self.Units[i].EffectType == e then
            table.remove(self.HeroList, i)
        end
    end
end
-- 更新
OngoingDamage.Update = function()
    --print("...Update")
    for i = #OngoingDamage.Units, 1, -1 do
        if BJ.IsUnitDeadBJ(OngoingDamage.Units[i].unit) == true then
            -- statements
            table.remove(OngoingDamage.HeroList, i)
        else
            if OngoingDamage.Units[i].Value ~= 0 then
                CJ.UnitDamageTarget(OngoingDamage.Units[i].Killerunit,
                                    OngoingDamage.Units[i].unit,
                                    OngoingDamage.Units[i].Value, true, false,
                                    CJ.ATTACK_TYPE_NORMAL,
                                    CJ.DAMAGE_TYPE_NORMAL,
                                    CJ.WEAPON_TYPE_WHOKNOWS)
            end
        end
    end
end
return OngoingDamage

-- local m = OngoingDamage:Instance()
-- --print(1)
-- m:AddUnit(1, 1, 1)
-- m:AddUnit(2, 2, 2)
-- m:AddUnit(2, 2, 2)
-- for i = #m.Units, 1, -1 do
--     print(m.Units[i].ID)
-- end
