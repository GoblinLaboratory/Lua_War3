local items = {
    {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "1"},
            {Type = "Name", Value = "披风"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "披风"},
            {Type = "Position", Value = "披风"}
        }, {Type = "ExtendAttribute", {Type = "力量", Value = 1}},
        {Type = "BasicsAttribute", {Type = "魔法抗性", Value = 15}},
        {Type = "ResistanceAttribute"}
    }, {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "2"},
            {Type = "Name", Value = "毛皮"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "披风"},
            {Type = "Position", Value = "披风"}
        }, {Type = "ExtendAttribute", {Type = "敏捷", Value = 1}},
        {Type = "BasicsAttribute", {Type = "魔法抗性", Value = 15}},
        {Type = "ResistanceAttribute"}
    }, {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "3"},
            {Type = "Name", Value = "斗篷"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "披风"},
            {Type = "Position", Value = "披风"}
        }, {Type = "ExtendAttribute", {Type = "智力", Value = 1}},
        {Type = "BasicsAttribute", {Type = "魔法抗性", Value = 15}},
        {Type = "ResistanceAttribute"}
    }, {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "4"},
            {Type = "Name", Value = "之幕"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "披风"},
            {Type = "Position", Value = "披风"}
        }, {Type = "ExtendAttribute"}, {
            Type = "BasicsAttribute",
            {Type = "生命值", Value = 10},
            {Type = "生命回复速度", Value = 2},
            {Type = "魔法抗性", Value = 15}
        }, {Type = "ResistanceAttribute"}
    }, {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "5"},
            {Type = "Name", Value = "裹衣"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "披风"},
            {Type = "Position", Value = "披风"}
        }, {Type = "ExtendAttribute"}, {
            Type = "BasicsAttribute",
            {Type = "魔法值", Value = 10},
            {Type = "魔法回复速度", Value = 2},
            {Type = "魔法抗性", Value = 15}
        }, {Type = "ResistanceAttribute"}
    }
}
local idItems = {
    [1] = items[1],
    [2] = items[2],
    [3] = items[3],
    [4] = items[4],
    [5] = items[5]
}
local data = {Items = items, IdItems = idItems}
function data:getById(id) return self.IdItems[id] end

return data
