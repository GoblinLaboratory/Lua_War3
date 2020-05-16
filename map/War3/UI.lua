--           0               1         2            3
-- 0    | wispharvest | windwalk |   whirlwind  |  webon          |
-- 1    |  weboff     | web      | wateryminion |  waterlemental  |
-- 2    |  ward       | voodoo   | volcano      |  vengenceon     |
--           0               1         2            3
-- 0    | FWXA        | FWXB     |   FWXC       |  FWXD           |
-- 1    | FWXAE       | FWXF     |   FWXG       |  FWXH           |
-- 2    | FWXI        | FWXJ     |   FWXK       |  FWXL           |
--           0               1         2            3
-- 0    |     A       |       B   |     C       |    D            |
-- 1    |     E       |       F   |     G       |    H            |
-- 2    |     I       |       J   |     K       |    L             |
local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
require "math"
require "Global"
UI = {}
UICoordinate = {
    --      o    1    2    3 
    ["0"] = {
        ["0"] = {ID = "FWXA", Type = "A", Custom = "wispharvest"},
        ["1"] = {ID = "FWXB", Type = "B", Custom = "windwalk"},
        ["2"] = {ID = "FWXC", Type = "C", Custom = "whirlwind"},
        ["3"] = {ID = " FWXD", Type = "D", Custom = "wispharvest"}
    },
    ["1"] = {
        ["0"] = {ID = "FWXE", Type = "E", Custom = "weboff"},
        ["1"] = {ID = "FWXF", Type = "F", Custom = "web"},
        ["2"] = {ID = "FWXG", Type = "G", Custom = "wateryminion"},
        ["3"] = {ID = " FWXH", Type = "H", Custom = "waterlemental"}
    },
    ["2"] = {
        ["0"] = {ID = "FWXI", Type = "I", Custom = "ward"},
        ["1"] = {ID = "FWXJ", Type = "J", Custom = "voodoo"},
        ["2"] = {ID = "FWXK", Type = "K", Custom = "volcano"},
        ["3"] = {ID = " FWXL", Type = "L", Custom = "vengenceon"}
    }
}
-- 清空界面
-- 清空技能
function UI:RemoveAbility(u, id)
    -- 清空技能
    CJ.UnitRemoveAbility(u, Global:GetId("FW" .. tostring(id - 1) .. "A"))
    CJ.UnitRemoveAbility(u, Global:GetId("FW" .. tostring(id - 1) .. "B"))
    CJ.UnitRemoveAbility(u, Global:GetId("FW" .. tostring(id - 1) .. "C"))
    CJ.UnitRemoveAbility(u, Global:GetId("FW" .. tostring(id - 1) .. "D"))
    CJ.UnitRemoveAbility(u, Global:GetId("FW" .. tostring(id - 1) .. "E"))
    CJ.UnitRemoveAbility(u, Global:GetId("FW" .. tostring(id - 1) .. "F"))
    CJ.UnitRemoveAbility(u, Global:GetId("FW" .. tostring(id - 1) .. "G"))
    CJ.UnitRemoveAbility(u, Global:GetId("FW" .. tostring(id - 1) .. "H"))
    CJ.UnitRemoveAbility(u, Global:GetId("FW" .. tostring(id - 1) .. "I"))
    CJ.UnitRemoveAbility(u, Global:GetId("FW" .. tostring(id - 1) .. "J"))
    CJ.UnitRemoveAbility(u, Global:GetId("FW" .. tostring(id - 1) .. "K"))
    CJ.UnitRemoveAbility(u, Global:GetId("FW" .. tostring(id - 1) .. "L"))
end
-- 显示图标
-- 参数 i 图标位置  u  图标栏马甲 id 触发玩家ID 
function UI:RemoveAbility(i, u, id, name, explain, icon)
    local s1 = i / 4
    local s2 = i % 4

    if s1 < 1 then s1 = 0 end
    local _ID = UICoordinate[tostring(math.floor(s1))][tostring(math.floor(s2))]
                    .Type
    -- 添加图标
    CJ.UnitAddAbility(u, Global:GetId("FW" .. tostring(id - 1) .. _ID))
    -- 设置名称
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId(
                                                          "FW" ..
                                                              tostring(id - 1) ..
                                                              _ID)), 1, 215,
                                name)
    -- 设置说明
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId(
                                                          "FW" ..
                                                              tostring(id - 1) ..
                                                              _ID)), 1, 218,
                                explain)
    -- 设置图标
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId(
                                                          "FW" ..
                                                              tostring(id - 1) ..
                                                              _ID)), 1, 204,
                                icon)
end
return UI

