require "math"
local CJ = require "jass.common"

Game = {
    MajiID = {
        ["玩家1"] = {
            -- 装备马甲
            Equipment_Maji = 0,
            --玩家当前选择的英雄
            Hero_ID = 0,
            FuWen_Maji = 0
        },
        ["玩家10"] = {
            -- 装备马甲
            Equipment_Maji = 0,
            --玩家当前选择的英雄
            Hero_ID = 0,
            -- 天赋界面马甲
            FuWen_Maji = 0
        },
        ["玩家2"] = {
            -- 装备马甲
            Equipment_Maji = 0,
            --玩家当前选择的英雄
            Hero_ID = 0,
            -- 天赋界面马甲
            FuWen_Maji = 0
        },
        ["玩家3"] = {
            -- 装备马甲
            Equipment_Maji = 0,
            --玩家当前选择的英雄
            Hero_ID = 0,
            -- 天赋界面马甲
            FuWen_Maji = 0
        },
        ["玩家4"] = {
            -- 装备马甲
            Equipment_Maji = 0,
            --玩家当前选择的英雄
            Hero_ID = 0,
            -- 天赋界面马甲
            FuWen_Maji = 0
        },
        ["玩家5"] = {
            -- 装备马甲
            Equipment_Maji = 0,
            --玩家当前选择的英雄
            Hero_ID = 0,
            -- 天赋界面马甲
            FuWen_Maji = 0
        },
        ["玩家6"] = {
            -- 装备马甲
            Equipment_Maji = 0,
            --玩家当前选择的英雄
            Hero_ID = 0,
            -- 天赋界面马甲
            FuWen_Maji = 0
        },
        ["玩家7"] = {
            -- 装备马甲
            Equipment_Maji = 0,
            --玩家当前选择的英雄
            Hero_ID = 0,
            -- 天赋界面马甲
            FuWen_Maji = 0
        },
        ["玩家8"] = {
            -- 装备马甲
            Equipment_Maji = 0,
            --玩家当前选择的英雄
            Hero_ID = 0,
            -- 天赋界面马甲
            FuWen_Maji = 0
        },
        ["玩家9"] = {
            -- 装备马甲
            Equipment_Maji = 0,
            --玩家当前选择的英雄
            Hero_ID = 0,
            -- 天赋界面马甲
            FuWen_Maji = 0
        },
        ["玩家11"] = {
            -- 装备马甲
            Equipment_Maji = 0,
            --玩家当前选择的英雄
            Hero_ID = 0,
            -- 天赋界面马甲
            FuWen_Maji = 0
        },
        ["玩家12"] = {
            -- 装备马甲
            Equipment_Maji = 0,
            --玩家当前选择的英雄
            Hero_ID = 0,
            -- 天赋界面马甲
            FuWen_Maji = 0
        }
    }
}

function Game:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end
Game.__index = Game
-- 单件模式
function Game:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end
return Game
