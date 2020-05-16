local items = {
    {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "1"},
            {Type = "Name", Value = "腰带"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "腰部布甲"},
            {Type = "Position", Value = "腰部装备"}
        }, {Type = "ExtendAttribute"},
        {Type = "BasicsAttribute", {Type = "护甲", Value = 2}},
        {Type = "ResistanceAttribute"}
    }, {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "2"},
            {Type = "Name", Value = "束带"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "腰部布甲"},
            {Type = "Position", Value = "腰部装备"}
        }, {Type = "ExtendAttribute"},
        {Type = "BasicsAttribute", {Type = "护甲", Value = 2}},
        {Type = "ResistanceAttribute"}
    }, {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "3"},
            {Type = "Name", Value = "套索"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "腰部皮甲"},
            {Type = "Position", Value = "腰部装备"}
        }, {Type = "ExtendAttribute"},
        {Type = "BasicsAttribute", {Type = "护甲", Value = 2}},
        {Type = "ResistanceAttribute"}
    }, {
        {
            Type = "BasicsInformation",
            {Type = "ID", Value = "4"},
            {Type = "Name", Value = "护腰"},
            {Type = "Explain", Value = "无"},
            {Type = "Types", Value = "腰部板甲"},
            {Type = "Position", Value = "腰部装备"}
        }, {Type = "ExtendAttribute"},
        {Type = "BasicsAttribute", {Type = "护甲", Value = 2}},
        {Type = "ResistanceAttribute"}
    }
}
local idItems = {[1] = items[1], [2] = items[2], [3] = items[3], [4] = items[4]}
local data = {Items = items, IdItems = idItems}
function data:getById(id) return self.IdItems[id] end

return data
