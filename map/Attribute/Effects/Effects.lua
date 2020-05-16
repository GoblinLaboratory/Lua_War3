--require "Attribute\\Effects\\Action"
Effects = {
    -- 名称
    Name = 0,
    -- ID
    ID = 1,
    -- 单位类型限定
    Hero = true,
    Unit = true,
    -- BuffID
    BuffID = 0,
    -- 是否为增益
    Beneficial = true,
    UnitList = {},
    -----------------------------------------
    -- -- 几率
    -- Probability = 0,
    -- -- 触发单位
    -- TriggerUnit = 0,
    -- -- 目标单位
    -- Unit = {
    --     -- 是否为单位组
    --     Units = false,
    --     Unit = 0
    -- },
    -- -- 是否为持续技能
    -- Time = {
    --     UnDuration = false,
    --     -- 持续时间
    --     Duration = 0
    -- },
    -----------------------------------------
    -- 属性
    Attribute = {},
    -- 绑定技能
    Skill = {
        -- 是否绑定技能
        Binding = false,
        Skill = 0
    },
    -- 触发
    Trigger = 0
    -- 添加
    -- 删除
    -- 叠加
    -- 完成
    -- 更新
    -- 更新
    -- Update = 0
}
function Effects:new(o)
    o = o or {}
    setmetatable(o, self)
    -- o.__index = self
    -----
    o.Attribute = {}
    -----
    return o
end
-- -- 添加
-- function Effects:AddTo(u)
--     for i = #self.UnitList, 1, -1 do
--         if self.UnitList[i].Unit == u.Uint then
--             -- statements
--             if self.UnitList[i].Duration < u.Duration then
--                 -- statements
--                 self.UnitList[i].Duration = u.Duration
--             end
--             for ii = #self.UnitList.Attribute, 1, -1 do
--                 if self.UnitList.Attribute[ii].Value < u.Attribute[ii].Value then
--                     -- statements
--                     self.UnitList.Attribute[ii].Value = u.Attribute[ii].Value
--                 end
--             end
--         else
--             table.insert(self.UnitList, u)
--         end
--         -- self.UnitList[i].
--     end
-- end
-- -- 删除
-- function Effects:Remove(u)
--     for i = #self.UnitList, 1, -1 do
--         if self.UnitList[i].Unit == u.Uint then
--             -- table.remove(self.UnitList, i)
--             self.UnitList[i].Duration = 0
--         end
--     end
-- end
-- -- 叠加
-- function Effects:SuperPosition(u)
--     for i = #self.UnitList, 1, -1 do
--         if self.UnitList[i].Unit == u.Uint then
--             -- statements
--             if self.UnitList[i].Duration < u.Duration then
--                 -- statements
--                 self.UnitList[i].Duration =
--                     self.UnitList[i].Duration + u.Duration
--             end
--             for ii = #self.UnitList.Attribute, 1, -1 do
--                 if self.UnitList.Attribute[ii].Value < u.Attribute[ii].Value then
--                     -- statements
--                     self.UnitList.Attribute[ii].Value =
--                         self.UnitList.Attribute[ii].Value +
--                             u.Attribute[ii].Value
--                 end
--             end
--         else
--             table.insert(self.UnitList, u)
--         end
--         -- self.UnitList[i].
--     end
-- end
-- -- 完成
-- function Effects:End(u)
--     for i = #self.UnitList, 1, -1 do
--         if self.UnitList[i].Unit == u.Uint then
--             for ii = #self.UnitList[i].Attribute, 1, -1 do

--                 if self.UnitList.Attribute[ii].OriginalValue ~=
--                     self.UnitList.Attribute[ii].Value then
--                     -- statements
--                     -- 发送属性变更Action
--                     local AC = Action:Instance()
--                     AC:CommandEnd(self.UnitList.Attribute[ii].Name,
--                                   self.UnitList.Unit,
--                                   self.UnitList.Attribute[ii].Value)
--                 end
--                 self.UnitList.Attribute[ii].OriginalValue =
--                     self.UnitList.Attribute[ii].Value
--             end
--             table.remove(self.UnitList, i)
--         end
--     end
-- end
-- -- 更新
-- function Effects:Update()
--     -----
--     for i = #self.UnitList, 1, -1 do
--         if self.UnitList[i].Duration == 0 then
--             -- statements
--             -- table.remove(self.UnitList, i)
--             self:End(self.UnitList[i])
--         else
--             self.UnitList[i].Duration = self.UnitList[i].Duration - 1
--             -- self.UnitList.Attribute[i].OriginalValue = self.UnitList.Attribute[i].Value
--             for ii = #self.UnitList[i].Attribute, 1, -1 do

--                 if self.UnitList.Attribute[ii].OriginalValue ~=
--                     self.UnitList.Attribute[ii].Value then
--                     -- statements
--                     -- 发送属性变更Action
--                     local AC = Action:Instance()
--                     AC:CommandEnd(self.UnitList.Attribute[ii].Name,
--                                   self.UnitList.Unit,
--                                   self.UnitList.Attribute[ii].OriginalValue)
--                     AC:Command(self.UnitList.Attribute[ii].Name,
--                                self.UnitList.Unit,
--                                self.UnitList.Attribute[ii].Value)
--                 end
--                 self.UnitList.Attribute[ii].OriginalValue =
--                     self.UnitList.Attribute[ii].Value
--             end
--         end
--         -- self.UnitList[i].
--     end
--     -----
-- end
Effects.__index = Effects
----------
-- function Effects:Update()
-- end
----------
return Effects
