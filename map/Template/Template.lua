local items = {
    {
        {
            Type = "ExtendAttribute",
            {
                Type = "体质",
                Value = 10
            },
            {
                Type = "敏捷",
                Value = 15
            }
        },
        {
            Type = "BasicsAttribute",
            {
                Type = "法术强度",
                Value = 2
            },
            {
                Type = "格挡",
                Value = 3
            }
        }
    }
}

for i = #items, 1, -1 do
    local name = items[i]
    for i1 = #name, 1, -1 do
        print("a"..name[i1].Type)
        for i2 = #items[i][i1], 1, -1 do
            print("f"..items[i][i1][i2].Type)
        end
    end
end
print("END")