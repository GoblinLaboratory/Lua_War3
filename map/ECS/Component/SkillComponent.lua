SkillComponent = {}

function SkillComponent:new(o)
    o = o or {}
    setmetatable(o, self)
    -- 任意单位被攻击
    o["单位被攻击"] = {}
    -- 任意单位发动攻击
    o["单位发动攻击"] = {}
    -- 任意单位受到伤害
    o["单位受到伤害"] = {}
    -- 任意造成受到伤害
    o["单位造成伤害"] = {}
    -- 准备施放技能
    o["准备施放技能"] = {}
    -- 开始施放技能
    o["开始施放技能"] = {}
    -- 发动技能效果
    o["发动技能效果"] = {}
    -- 施放技能结束
    o["施放技能结束"] = {}
    -- 停止施放技能
    o["停止施放技能"] = {}
    -----
    -- 发动攻击
    o.ATTACK = function()
        -- statements
        print("111")
        for i = #o["单位发动攻击"], 1, -1 do
            -- statements
            print("const" .. i)
            o["单位发动攻击"][i]:Fire()
        end
    end
    -- 被攻击
    o.ATTACKED = function()
        -- statements
        print("222")
        for i = #o["单位被攻击"], 1, -1 do
            -- statements
            print("consts" .. i)
            o["单位被攻击"][i]:Fire()
        end
    end
    -- 受到伤害
    o.Damaged = function()
        -- statements
        print("333")
        for i = #o["单位受到伤害"], 1, -1 do
            -- statements
            print("constssh" .. i)
            o["单位受到伤害"][i]:Fire()
        end
    end
    --单位造成伤害
    o.Damag = function()
        -- statements
        print("333")
        for i = #o["单位造成伤害"], 1, -1 do
            -- statements
            print("bconsts" .. i)
            o["单位造成伤害"][i]:Fire()
        end
    end
    -- 准备施放技能
    o.CHANNEL = function()
        -- statements
        print("444")
        for i = #o["准备施放技能"], 1, -1 do
            -- statements
            o["准备施放技能"][i]:Fire()
        end
    end
    -- 开始施放技能
    o.CAST = function()
        -- statements
        print("555")
        for i = #o["开始施放技能"], 1, -1 do
            -- statements
            o["开始施放技能"][i]:Fire()
        end
    end
    -- 发动技能效果
    o.EFFECT = function()
        -- statements
        print("666")
        for i = #o["发动技能效果"], 1, -1 do
            -- statements
            o["发动技能效果"][i]:Fire()
        end
    end
    -- 施放技能结束
    o.FINISH = function()
        -- statements
        print("777")
        for i = #o["施放技能结束"], 1, -1 do
            -- statements
            o["施放技能结束"][i].Fire()
        end
    end
    -- 停止施放技能
    o.ENDCAST = function()
        -- statements
        print("888")
        for i = #o["停止施放技能"], 1, -1 do
            -- statements
            o["停止施放技能"][i]:Fire()
        end
    end
    -----
    return o
end
SkillComponent.__index = SkillComponent
function SkillComponent:TriggerAddEvent(t)
    -- statements
    print("TIANJIA SKILL")
    local n = 0
    for i = #self[t.Trigger], 1, -1 do
        -- statements
        if self[t.Trigger][i].ID == t.ID then
            if self[t.Trigger][i].Name == t.Name then
                -- statements
                n = 1
            end
        end
    end
    print("n:"..n)
    if n == 0 then
        -- statements
        table.insert(self[t.Trigger], t)
    end
    -- table.insert(self[e], t)
end
-- 移除事件
function SkillComponent:TriggerRemoveEvent(t)
    -- statements
    for i = #self[t.Trigger], 1, -1 do
        -- statements
        if self[t.Trigger][i].ID == t.ID then
            -- statements
            if self[t.Trigger][i].Name == t.Name then
                -- statements
                table.remove(self[t.Trigger], i)
            end
        end
    end
end
return SkillComponent
