require "Attribute\\Attribute"
require "Attribute\\AttributeDota"
require "Attribute\\BasicsInformation"
require "Attribute\\Factory"
require "Attribute\\ItemAttribute"
require "EventTemplate"
require "Attribute\\FSM\\FSM"
HeroAttribute = {
    ID = 0,
    -- 状态机
    Fsms = 0,
    -- buff列表
    Buff = {},
    -- 说明
    BasicsInformation = {},
    -- 单位基础属性
    BasicsAttribute = {},
    -- 扩展属性
    ExtendAttribute = {},
    -- 抗性
    ResistanceAttribute = {},
    -- 装备列表
    Equipment = {}
}

function HeroAttribute:new(o)
    o = o or {}
    setmetatable(o, self)
    ----
    local Factory = Factory:Instance()
    o.ID = 0
    o.Fsms = FSM:new()
    -- o.BasicsInformation = BasicsInformation:new(nil)
    o.BasicsInformation = Factory:BasicsInformationFactory()
    o.BasicsAttribute = Factory:BasicsAttributeFactory()
    o.ExtendAttribute = Factory:ExtendAttributeFactory()
    o.ResistanceAttribute = Factory:ResistanceAttributeFactory()
    -- o.ItemsList = {}
    o.Equipment = {}
    o.Buff = {}
    -----
    return o
end
HeroAttribute.__index = HeroAttribute
function HeroAttribute:SetItem(item1)
    local Factory = Factory:Instance()
    -- self.ItemsList[item1.BasicsInformation["自定义值"].Value].Dota =
    --     Factory:clone(item1)
    -- self:AddPrototype(item1)
    ---------------------
    local i = Factory:clone(item1)
    table.insert(self.Equipment, i)
    self:AddPrototype(item1)
end
-- 清空装备数据
function HeroAttribute:IntItem(item1)
    -- self.ItemsList[item1.BasicsInformation["自定义值"].Value].Dota =
    --     ItemAttribute:new(nil)
    -- self:RemovePrototype(item1)
    -------------------------------------
    for i = #self.Equipment, 1, -1 do
        if self.Equipment[i].BasicsInformation["自定义值"].Value ==
            item1.BasicsInformation["自定义值"].Value then
            table.remove(self.Equipment, i)
        end
    end
    self:RemovePrototype(item1)
end
-- 判断是否有装备

-- 获取装备
function HeroAttribute:GetEquipment(Custom)
    -- return self.ItemsList[Custom].Dota
    for i = #self.Equipment, 1, -1 do
        if self.Equipment[i].BasicsInformation["自定义值"].Value == Custom then
            return self.Equipment[i]
        end
    end
    return 1
end
-- 添加属性
function HeroAttribute:AddPrototype(item1)
    -----
    local Factory = Factory:Instance()
    -- 基础属性
    for j = #Factory.BasicsAttributedecoded, 1, -1 do
        self.BasicsAttribute[Factory.BasicsAttributedecoded[j].Name].Value =
            self.BasicsAttribute[Factory.BasicsAttributedecoded[j].Name].Value +
                item1.BasicsAttribute[Factory.BasicsAttributedecoded[j].Name]
                    .Value
        if Factory.BasicsAttributedecoded[j].Name == "生命值" or
            Factory.BasicsAttributedecoded[j].Name == "生命回复速度" or
            Factory.BasicsAttributedecoded[j].Name == "魔法值" or
            Factory.BasicsAttributedecoded[j].Name == "魔法回复速度" or
            Factory.BasicsAttributedecoded[j].Name == "护甲" or
            Factory.BasicsAttributedecoded[j].Name == "攻击力" or
            Factory.BasicsAttributedecoded[j].Name == "攻击速度" or
            Factory.BasicsAttributedecoded[j].Name == "移动速度" then
            -- statements
            local ev = EventTemplate:Instance()
            ev.SetPrototype:Fire(self.ID,
                                 Factory.BasicsAttributedecoded[j].Name,
                                 item1.BasicsAttribute[Factory.BasicsAttributedecoded[j]
                                     .Name].Value) -- 发送消息
        end
    end
    -- 扩展属性
    for j = #Factory.ExtendAttributedecoded, 1, -1 do
        self.ExtendAttribute[Factory.ExtendAttributedecoded[j].Name].Value =
            self.ExtendAttribute[Factory.ExtendAttributedecoded[j].Name].Value +
                item1.ExtendAttribute[Factory.ExtendAttributedecoded[j].Name]
                    .Value
        if Factory.ExtendAttributedecoded[j].Name == "力量" or
            Factory.ExtendAttributedecoded[j].Name == "敏捷" or
            Factory.ExtendAttributedecoded[j].Name == "智力" then
            -- statements
            local ev = EventTemplate:Instance()
            ev.SetPrototype:Fire(self.ID,
                                 Factory.ExtendAttributedecoded[j].Name,
                                 item1.ExtendAttribute[Factory.ExtendAttributedecoded[j]
                                     .Name].Value) -- 发送消息
        end
    end
    -- 抗性
    for j = #Factory.ResistanceAttributedecoded, 1, -1 do
        self.ResistanceAttribute[Factory.ResistanceAttributedecoded[j].Name]
            .Value =
            self.ResistanceAttribute[Factory.ResistanceAttributedecoded[j].Name]
                .Value +
                item1.ResistanceAttribute[Factory.ResistanceAttributedecoded[j]
                    .Name].Value
    end
    -- 添加技能
    for i = #item1.SkillList, 1, -1 do
        -- statements
        --item1.SkillList[i].Tag = item1.BasicsInformation["自定义值"].Value
        -- self.Fsms:TriggerAddEvent(item1.SkillList[i], item1.SkillList[i].Trigger)
        self:AddSkill(item1.SkillList[i])
    end
    -----
end
-- 移除装备属性
function HeroAttribute:RemovePrototype(item1)
    -----
    local Factory = Factory:Instance()
    -- 基础属性
    for j = #Factory.BasicsAttributedecoded, 1, -1 do
        self.BasicsAttribute[Factory.BasicsAttributedecoded[j].Name].Value =
            self.BasicsAttribute[Factory.BasicsAttributedecoded[j].Name].Value -
                item1.BasicsAttribute[Factory.BasicsAttributedecoded[j].Name]
                    .Value
        if Factory.BasicsAttributedecoded[j].Name == "生命值" or
            Factory.BasicsAttributedecoded[j].Name == "生命回复速度" or
            Factory.BasicsAttributedecoded[j].Name == "魔法值" or
            Factory.BasicsAttributedecoded[j].Name == "魔法回复速度" or
            Factory.BasicsAttributedecoded[j].Name == "护甲" or
            Factory.BasicsAttributedecoded[j].Name == "攻击力" or
            Factory.BasicsAttributedecoded[j].Name == "攻击速度" or
            Factory.BasicsAttributedecoded[j].Name == "移动速度" then
            -- statements
            local ev = EventTemplate:Instance()
            ev.SetPrototype:Fire(self.ID,
                                 Factory.BasicsAttributedecoded[j].Name, 0 -
                                     item1.BasicsAttribute[Factory.BasicsAttributedecoded[j]
                                         .Name].Value) -- 发送消息
        end
    end
    -- 扩展属性
    for j = #Factory.ExtendAttributedecoded, 1, -1 do
        self.ExtendAttribute[Factory.ExtendAttributedecoded[j].Name].Value =
            self.ExtendAttribute[Factory.ExtendAttributedecoded[j].Name].Value -
                item1.ExtendAttribute[Factory.ExtendAttributedecoded[j].Name]
                    .Value
        if Factory.ExtendAttributedecoded[j].Name == "力量" or
            Factory.ExtendAttributedecoded[j].Name == "敏捷" or
            Factory.ExtendAttributedecoded[j].Name == "智力" then
            -- statements
            local ev = EventTemplate:Instance()
            ev.SetPrototype:Fire(self.ID,
                                 Factory.ExtendAttributedecoded[j].Name, 0 -
                                     item1.ExtendAttribute[Factory.ExtendAttributedecoded[j]
                                         .Name].Value) -- 发送消息
        end
    end
    -- 抗性
    for j = #Factory.ResistanceAttributedecoded, 1, -1 do
        self.ResistanceAttribute[Factory.ResistanceAttributedecoded[j].Name]
            .Value =
            self.ResistanceAttribute[Factory.ResistanceAttributedecoded[j].Name]
                .Value -
                item1.ResistanceAttribute[Factory.ResistanceAttributedecoded[j]
                    .Name].Value
    end
    -- 删除技能
    for i = #item1.SkillList, 1, -1 do
        -- statements
        -- item1.SkillList[i].Tag = item1.BasicsInformation["自定义值"].Value
        -- self.Fsms:TriggerAddEvent(item1.SkillList[i], item1.SkillList[i].Trigger)
        self:RemoveSkill(item1.SkillList[i])
    end
    -----
end
function HeroAttribute:SetBasicsAttribute(Type, Num)
    self.BasicsAttribute[Type].Value = self.BasicsAttribute[Type].Value + Num
    if Type == "生命值" or Type == "生命回复速度" or Type ==
        "魔法值" or Type == "魔法回复速度" or Type == "护甲" or Type ==
        "攻击力" or Type == "攻击速度" or Type == "移动速度" then
        -- statements
        local ev = EventTemplate:Instance()
        ev.SetPrototype:Fire(self.ID, Type, Num) -- 发送消息
    end
end
function HeroAttribute:SetExtendAttribute(Type, Num)
    self.ExtendAttribute[Type].Value = self.ExtendAttribute[Type].Value + Num
    if Type == "力量" or Type == "敏捷" or Type == "智力" then
        -- statements
        local ev = EventTemplate:Instance()
        ev.SetPrototype:Fire(self.ID, Type, Num) -- 发送消息
    end
end
function HeroAttribute:SetResistanceAttribute(Type, Num)
    self.ResistanceAttribute[Type].Value =
        self.ResistanceAttribute[Type].Value + Num
end
-- 添加技能
function HeroAttribute:AddSkill(t) self.Fsms:TriggerAddEvent(t, t.Trigger) end
-- 移除技能
function HeroAttribute:RemoveSkill(t)
    self.Fsms:TriggerRemoveEvent(t, t.Trigger)
end
return HeroAttribute

-- test
-- m = HeroAttribute:new(nil)
-- print(m.BasicsAttribute["移动速度"].value)
-- m.BasicsAttribute["移动速度"].value = 10
-- print(m.BasicsAttribute["移动速度"].value)
-- print(m.BasicsAttribute["移动速度"].Explain)
-- print(json.encode(m))
