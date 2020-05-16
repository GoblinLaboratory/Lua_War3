local items = {
    {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "1"},
            {Type = "Name", Value = "短裤"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "腿部布甲"},
            {Type = "Position", Value = "腿部装备"}
        }, {Type = "ExtendAttribute"},
        {Type = "BasicsAttribute", {Type = "护甲", Value = 1}},
        {Type = "ResistanceAttribute"}
    }, {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "2"},
            {Type = "Name", Value = "长裤"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "腿部布甲"},
            {Type = "Position", Value = "腿部装备"}
        }, {Type = "ExtendAttribute"},
        {Type = "BasicsAttribute", {Type = "护甲", Value = 1}},
        {Type = "ResistanceAttribute"}
    }, {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "3"},
            {Type = "Name", Value = "褶皱裙"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "腿部布甲"},
            {Type = "Position", Value = "腿部装备"}
        }, {Type = "ExtendAttribute"},
        {Type = "BasicsAttribute", {Type = "护甲", Value = 1}},
        {Type = "ResistanceAttribute"}
    }, {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "4"},
            {Type = "Name", Value = "裹腿"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "腿部布甲"},
            {Type = "Position", Value = "腿部装备"}
        }, {Type = "ExtendAttribute"},
        {Type = "BasicsAttribute", {Type = "护甲", Value = 1}},
        {Type = "ResistanceAttribute"}
    }, {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "5"},
            {Type = "Name", Value = "热裤"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "腿部布甲"},
            {Type = "Position", Value = "腿部装备"}
        }, {Type = "ExtendAttribute"},
        {Type = "BasicsAttribute", {Type = "护甲", Value = 1}},
        {Type = "ResistanceAttribute"}
    }, {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "6"},
            {Type = "Name", Value = "皮裤"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "腿部皮甲"},
            {Type = "Position", Value = "腿部装备"}
        }, {Type = "ExtendAttribute"},
        {Type = "BasicsAttribute", {Type = "护甲", Value = 2}},
        {Type = "ResistanceAttribute"}
    }, {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "7"},
            {Type = "Name", Value = "胫甲"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "腿部皮甲"},
            {Type = "Position", Value = "腿部装备"}
        }, {Type = "ExtendAttribute"},
        {Type = "BasicsAttribute", {Type = "护甲", Value = 2}},
        {Type = "ResistanceAttribute"}
    }, {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "8"},
            {Type = "Name", Value = "马裤"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "腿部皮甲"},
            {Type = "Position", Value = "腿部装备"}
        }, {Type = "ExtendAttribute"},
        {Type = "BasicsAttribute", {Type = "护甲", Value = 2}},
        {Type = "ResistanceAttribute"}
    }, {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "9"},
            {Type = "Name", Value = "护腿"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "腿部板甲"},
            {Type = "Position", Value = "腿部装备"}
        }, {Type = "ExtendAttribute"},
        {Type = "BasicsAttribute", {Type = "护甲", Value = 3}},
        {Type = "ResistanceAttribute"}
    }, {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "10"},
            {Type = "Name", Value = "腿甲"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "腿部板甲"},
            {Type = "Position", Value = "腿部装备"}
        }, {Type = "ExtendAttribute"},
        {Type = "BasicsAttribute", {Type = "护甲", Value = 3}},
        {Type = "ResistanceAttribute"}
    }, {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "11"},
            {Type = "Name", Value = "护颈"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "腿部板甲"},
            {Type = "Position", Value = "腿部装备"}
        }, {Type = "ExtendAttribute"},
        {Type = "BasicsAttribute", {Type = "护甲", Value = 3}},
        {Type = "ResistanceAttribute"}
    }, {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "12"},
            {Type = "Name", Value = "腿凯"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "腿部板甲"},
            {Type = "Position", Value = "腿部装备"}
        }, {Type = "ExtendAttribute"},
        {Type = "BasicsAttribute", {Type = "护甲", Value = 3}},
        {Type = "ResistanceAttribute"}
    }, {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "13"},
            {Type = "Name", Value = "胫凯"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "腿部板甲"},
            {Type = "Position", Value = "腿部装备"}
        }, {Type = "ExtendAttribute"},
        {Type = "BasicsAttribute", {Type = "护甲", Value = 3}},
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
    [10] = items[10],
    [11] = items[11],
    [12] = items[12],
    [13] = items[13]
}
local data = {Items = items, IdItems = idItems}
function data:getById(id) return self.IdItems[id] end

return data
