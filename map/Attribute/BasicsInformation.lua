BasicsInformation = {
    -- 物品ID
    ID = 0,
    -- 物品名称
    Name = '无',
    -- 物品类型
    Types = '无',
    -- 物品品质
    Quality = '无',
    -- 位置
    Position = '无',
    -- 星
    Star = "★★★★☆",
    -- 词缀
    Affix = '词缀',
    -- 强化
    Strengthen = 0,
    -- 图标
    Icon = '无',
    -- 自定义值
    CustomValue = 'ZiDingYi',
    -- 说明
    Explain = '无',
    -- 等级
    level = 0
}

function BasicsInformation:new(o)
    o = o or {}
    setmetatable(o,self)
    -----
     -- 物品ID
     o.ID = 0
     -- 物品名称
     o.Name = '无'
     -- 物品类型
     o.Types = '无'
     -- 物品品质
     o.Quality = '无'
     -- 位置
     o.Position = '无'
     -- 星
     o.Star = "★★★★☆"
     -- 词缀
     o.Affix = '词缀'
     -- 强化
     o.Strengthen = 0
     -- 物品图标
     o.Icon = '无'
     -- 物品自定义值
     o.CustomValue = 'ZiDingYi'
     -- 物品说明
     o.Explain = '无'
     -- 装备等级
     o.level = 0
    -----
    return o
end
BasicsInformation.__index = BasicsInformation
return BasicsInformation
