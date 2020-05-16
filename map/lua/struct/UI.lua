
UI = {
    --名字
    Name = '无',
    --类型
    Types = '无',
    --品质
    Quality = '无',
    --图标
    Art = '无',
    --自定义
    Custom = 'ZiDingYi',
    --说明
    Explain = '无',
}
function UI:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    --
    --
    return o
end
function UI:Init()
    --名字
    self.Name = '无'
    --类型
    self.Types = '无'
    --品质
    self.Quality = '无'
    --图标
    self.Art = '无'
    --自定义
    self.Custom = '无'
    --说明
    self.Explain = '无'
end

function UI:Set(UI_s)
    --名字
    self.Name = UI_s.Name
    --类型
    self.Types = UI_s.Types
    --品质
    self.Quality = UI_s.Quality
    --图标
    self.Art = UI_s.Art
    --自定义
    self.Custom = UI_s.Custom
    --说明
    self.Explain = UI_s.Explain
end
UI.__index=UI

return UI