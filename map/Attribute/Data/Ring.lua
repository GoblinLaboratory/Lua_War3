local items = {
    {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "1"},
            {Type = "Name", Value = "戒指"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "戒指"},
            {Type = "Position", Value = "戒指"}
        }, {Type = "ExtendAttribute"}, {
            Type = "BasicsAttribute",
            {Type = "生命值", Value = 10},
            {Type = "生命回复速度", Value = 5}
        }, {Type = "ResistanceAttribute"}
    }, {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "2"},
            {Type = "Name", Value = "指环"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "戒指"},
            {Type = "Position", Value = "戒指"}
        }, {Type = "ExtendAttribute"}, {
            Type = "BasicsAttribute",
            {Type = "魔法值", Value = 10},
            {Type = "魔法回复速度", Value = 20}
        }, {Type = "ResistanceAttribute"}
    }, {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "3"},
            {Type = "Name", Value = "之戒"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "戒指"},
            {Type = "Position", Value = "戒指"}
        }, {Type = "ExtendAttribute"}, {
            Type = "BasicsAttribute",
            {Type = "生命值", Value = 10},
            {Type = "魔法值", Value = 10}
        }, {Type = "ResistanceAttribute"}
    }, {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "4"},
            {Type = "Name", Value = "徽记"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "戒指"},
            {Type = "Position", Value = "戒指"}
        }, {Type = "ExtendAttribute"}, {
            Type = "BasicsAttribute",
            {Type = "生命回复速度", Value = 5},
            {Type = "魔法回复速度", Value = 20}
        }, {Type = "ResistanceAttribute"}
    }, {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "5"},
            {Type = "Name", Value = "黄金戒指"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "戒指"},
            {Type = "Position", Value = "戒指"}
        }, {Type = "ExtendAttribute"},
        {Type = "BasicsAttribute", {Type = "法术强度", Value = 15}},
        {Type = "ResistanceAttribute"}
    }, {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "6"},
            {Type = "Name", Value = "白银戒指"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "戒指"},
            {Type = "Position", Value = "戒指"}
        }, {Type = "ExtendAttribute"},
        {Type = "BasicsAttribute", {Type = "魔法抗性", Value = 15}},
        {Type = "ResistanceAttribute"}
    }, {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "7"},
            {Type = "Name", Value = "月光石戒指"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "戒指"},
            {Type = "Position", Value = "戒指"}
        }, {Type = "ExtendAttribute"},
        {Type = "BasicsAttribute", {Type = "攻击速度", Value = 15}},
        {Type = "ResistanceAttribute"}
    }, {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "8"},
            {Type = "Name", Value = "红宝石戒指"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "戒指"},
            {Type = "Position", Value = "戒指"}
        }, {Type = "ExtendAttribute"},
        {Type = "BasicsAttribute", {Type = "法术强度", Value = 15}},
        {Type = "ResistanceAttribute"}
    }, {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "9"},
            {Type = "Name", Value = "蓝宝石戒指"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "戒指"},
            {Type = "Position", Value = "戒指"}
        }, {Type = "ExtendAttribute"},
        {Type = "BasicsAttribute", {Type = "闪避", Value = 10}},
        {Type = "ResistanceAttribute"}
    }, {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "10"},
            {Type = "Name", Value = "黄宝石戒指"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "戒指"},
            {Type = "Position", Value = "戒指"}
        }, {Type = "ExtendAttribute"},
        {Type = "BasicsAttribute", {Type = "移动速度", Value = 10}},
        {Type = "ResistanceAttribute"}
    }
}
local idItems = {
    [1] = items[1],
    [2] = items[2],
    [3] = items[3],
    [4] = items[4],
    [5] = items[5],
    [6] = items[6],
    [7] = items[7],
    [8] = items[8],
    [9] = items[9],
    [10] = items[10]
}
local data = {Items = items, IdItems = idItems}
function data:getById(id) return self.IdItems[id] end

return data
