local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
require "math"
require "MaJia"
-- 文件名为 Global.lua
-- 定义一个名为 Global 的模块
Global = {TriggerList = {}, MaJia = {}}

----------------
-- ID转换
----------------
function Global:GetId(id)
    local i = string.byte(id, 1, 1) -- (这里的string.byte(id,1)就是把id这个字符串的第1个字符转换成ascii编码的10进制)
    i = i * 256 + string.byte(id, 2, 2)
    i = i * 256 + string.byte(id, 3, 3)
    i = i * 256 + string.byte(id, 4, 4)
    return i
end

function Global:GetStrId(id)
    local n4 = string.char(id % 256)
    print(id % 256)
    local s3 = (id - id % 256) / 256
    -- print(s3.."   "..math.ceil(s3%256))
    local n3 = string.char(s3 % 256)
    local s2 = ((id - id % 256) / 256 - (id - id % 256) / 256 % 256) / 256
    local n2 = string.char(s2 % 256)
    local s1 = (((id - id % 256) / 256 - (id - id % 256) / 256 % 256) / 256 -
                   ((id - id % 256) / 256 - (id - id % 256) / 256 % 256) / 256 %
                   256) / 256
    local n1 = string.char(s1 % 256)
    return n1 .. n2 .. n3 .. n4
end

function Global:GetNextStrId(id)
    local str = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local str1 = string.sub(id, 1, 1)
    local str2 = string.sub(id, 2, 2)
    local str3 = string.sub(id, 3, 3)
    local str4 = string.sub(id, 4, 4)

    if (str4 == "Z") then
        str4 = string.sub(str, 1, 1)
        if (str3 == "Z") then
            str3 = string.sub(str, 1, 1)
            if (str2 == "Z") then
                str2 = string.sub(str, 1, 1)
                local j1 = string.find(str, str1)
                str1 = string.sub(str, j1 + 1, j1 + 1)
            else
                local j2 = string.find(str, str2)
                str2 = string.sub(str, j2 + 1, j2 + 1)
            end
        else
            local j3 = string.find(str, str3)
            str3 = string.sub(str, j3 + 1, j3 + 1)
        end
    else
        local j4 = string.find(str, str4)
        str4 = string.sub(str, j4 + 1, j4 + 1)
    end
    return str1 .. str2 .. str3 .. str4
end

-- 取一个数的整数部分
function Global:getIntPart(x)
    if x <= 0 then return math.ceil(x) end

    if math.ceil(x) == x then
        x = math.ceil(x)
    else
        x = math.ceil(x) - 1
    end
    return x
end

-- 马甲列表操作
-- 添加马甲信息
function Global:AddMaJia(m, u)
    local mj = {}
    setmetatable(mj, MaJia)
    mj.MaJia_Unit = m
    mj.Hero_Unit = u
    table.insert(self.MaJia, mj)
end
-- 获取马甲信息
function Global:GetMaJia(m)
    for i = #self.MaJia, 1, -1 do
        if self.MaJia[i].MaJia_Unit == m then
            return self.MaJia[i].Hero_Unit
        end
    end
    return 0
end
-- 删除马甲信息
function Global:RemoveMaJia(m)
    for i = #self.MaJia, 1, -1 do
        if self.MaJia[i].MaJia_Unit == m then table.remove(self.MaJia, i) end
    end
end
-- 任意单位受到伤害列表

return Global
