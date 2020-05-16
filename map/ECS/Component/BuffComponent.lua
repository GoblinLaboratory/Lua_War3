require "ECS\\Global"
BuffComponent = {}
function BuffComponent:new(o)
    -- statements
    o = o or {}
    setmetatable(o, self)
    o["永久Buff"] = {}
    o["永久Debuff"] = {}
    o["持续Buff"] = {}
    o["持续Debuff"] = {}
    return o
end
function BuffComponent:Update()
    -- statements
    for i = #self["持续Buff"], 1, -1 do
        -- statements
        self["持续Buff"][i].Duration =
            self["持续Buff"][i].Duration - Global.Update
        if self["持续Buff"][i].Duration <= 0 then
            -- statements
            self:RemoveBuff(self["持续Buff"][i])
        end
    end
    for i = #self["持续Debuff"], 1, -1 do
        -- statements
        self["持续Debuff"][i].Duration =
            self["持续Debuff"][i].Duration - Global.Update
        if self["持续Debuff"][i].Duration <= 0 then
            -- statements
            self:RemoveBuff(self["持续Debuff"][i])
        end
    end
end
-- 添加buff
function BuffComponent:AddBuff(params)
    -- statements
    if params.Beneficial == true then
        -- statements
        if params.Typrs == "永久" then
            -- statements
            table.insert(self["永久Buff"], params)
        else
            table.insert(self["持续Buff"], params)
        end
    else
        if params.Typrs == "永久" then
            -- statements
            table.insert(self["永久Debuff"], params)
        else
            table.insert(self["持续Debuff"], params)
        end
    end
    params:Fire()
end
-- 移除buff
function BuffComponent:RemoveBuff(params)
    -- statements
    if params.Beneficial == true then
        -- statements
        if params.Typrs == "永久" then
            -- statements
            for i = #self["永久Buff"], 1, -1 do
                -- statements
                if self["永久Buff"][i].Name == params.Name then
                    -- statements
                    self["永久Buff"][i]:End()
                    table.remove(self["永久Buff"], i)
                end
            end
        else
            for i = #self["持续Buff"], 1, -1 do
                -- statements
                if self["持续Buff"][i].Name == params.Name then
                    -- statements
                    self["持续Buff"][i]:End()
                    table.remove(self["持续Buff"], i)
                end
            end
        end
    else
        if params.Typrs == "永久" then
            -- statements
            for i = #self["永久Debuff"], 1, -1 do
                -- statements
                if self["永久Debuff"][i].Name == params.Name then
                    -- statements
                    self["永久Debuff"][i]:End()
                    table.remove(self["永久Debuff"], i)
                end
            end
        else
            for i = #self["持续Debuff"], 1, -1 do
                -- statements
                if self["持续Debuff"][i].Name == params.Name then
                    -- statements
                    self["持续Debuff"][i]:End()
                    table.remove(self["持续Debuff"], i)
                end
            end
        end
    end
end
return BuffComponent
