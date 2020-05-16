-- 文件名为 Global.lua
-- 定义一个名为 Global 的模块
require "EventTemplate"
Global = {}
Global.Update = 1
function Global.Log(x) return x end
-- 拷贝类
function Global.clone(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for key, value in pairs(object) do
            new_table[_copy(key)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(object))
    end
    return _copy(object)
end
-- 单位添加属性
function Global.AddPrototype(o, u)
    for k, v in pairs(o["Unit"]) do --
        v.Value = v.Value + u["Unit"][k].Value
        local ev = EventTemplate:Instance()
        ev.SetPrototype:Fire(o.ID, u["Unit"][k].Name, u["Unit"][k].Value) -- 发送消息
    end
    for k, v in pairs(o["Hero"]) do --
        v.Value = v.Value + u["Hero"][k].Value
        local ev = EventTemplate:Instance()
        ev.SetPrototype:Fire(o.ID, u["Hero"][k].Name, u["Hero"][k].Value) -- 发送消息
    end
    for k, v in pairs(o["Extra"]) do --
        v.Value = v.Value + u["Extra"][k].Value
    end
end
-- 移除属性
function Global.RemovePrototype(o, u)
    for k, v in pairs(o["Unit"]) do --
        v.Value = v.Value - u["Unit"][k].Value
        local ev = EventTemplate:Instance()
        ev.SetPrototype:Fire(o.ID, u["Unit"][k].Name, 0 - u["Unit"][k].Value) -- 发送消息
    end
    for k, v in pairs(o["Hero"]) do --
        v.Value = v.Value - u["Hero"][k].Value
        local ev = EventTemplate:Instance()
        ev.SetPrototype:Fire(o.ID, u["Hero"][k].Name, 0 - u["Hero"][k].Value) -- 发送消息
    end
    for k, v in pairs(o["Extra"]) do --
        v.Value = v.Value - u["Extra"][k].Value
    end
end
-- 武器系统序列值
Global.WeaponryCustom = {
    ['Mainhandweapon'] = "A",
    ['OffHandWeapon'] = "B",
    ['HeadEquipment'] = "C",
    ['ChestEquipment'] = "D",
    ['WaistEquipment'] = "E",
    ['LegEquipment'] = "F",
    ['HandEquipment'] = "G",
    ['FootEquipment'] = "H",
    ['Necklace'] = "I",
    ['Ring'] = "J",
    ['Cloak'] = "K"
}
function Global.GetCustom(o)
    return Global.WeaponryCustom[o]
end
return Global
