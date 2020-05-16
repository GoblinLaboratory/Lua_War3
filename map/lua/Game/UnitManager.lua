require 'Unit'
local CJ = require 'jass.common'
local BJ = require 'blizzard'
local japi = require 'jass.japi'

UnitManager = {
    Units = {}
}

function UnitManager:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    ----------
    --setmetatable(self.["玩家1"],Player)

    ----------
    return o
end
UnitManager.__index = UnitManager
--单件模式
function UnitManager:Instance()
    if self.instance == nil then
        self.instance = self:new()
    end
    return self.instance
end

function UnitManager:AddUnit(id)
    local u = Unit:new()
    u:Int()
    table.insert(self.Units, u)
    u.UnitID = id
    --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, CJ.GetUnitName(id))
    return u
end
function UnitManager:AddHero(id)
    local u = Unit:new()
    u:Int()
    table.insert(self.Units, u)
    u.UnitID = id
    u.IsHroe = true
    --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, CJ.GetUnitName(id))
    return u
end
function UnitManager:GetUnit(id)
    --local u = 0
    if self:IsUnit(id) == false then
        self:AddUnit(id)
    end

    for i, v in ipairs(self.Units) do
        if v.UnitID == id then
            return self.Units[i]
        end
    end

    --return Units[u]
end
function UnitManager:IsUnit(id)
    for i, v in ipairs(self.Units) do
        if v.UnitID == id then
            return true
        end
    end
    return false
end
function UnitManager:RemoveUnit(id)
    for i, v in ipairs(self.Units) do
        if v.UnitID == id then
            table.remove(self.Units, i)
        end
    end
end

return UnitManager
