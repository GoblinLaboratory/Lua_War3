require "ECS\\Global"
require "Lib\\Guid"
WeaponryComponent = {}

function WeaponryComponent:new(o)
    o = o or {}
    setmetatable(o, self)
    -- o.__index = self
    -----
    --o.ID = 0
    --o.GUID = Guid.New()
    -----
    return o
end
WeaponryComponent.__index = WeaponryComponent
-- -- 设置装备数据
-- function WeaponryComponent:SetItem(item1)
--     self[item1["Base"]["自定义值"].Value] = Global.clone(item1)
-- end
-- -- 清空装备数据
-- function WeaponryComponent:IntItem(item1)
--     self[item1["Base"]["自定义值"].Value] = {}
-- end
return WeaponryComponent
