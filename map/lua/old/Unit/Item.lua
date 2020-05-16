-- 装备类


Item = {
    ID = 1,
    name = '无',
    Types = '无',
    PinZhi = '无',
    TuBiao = '无',
    ZiDingYi = 'ZiDingYi',
    Explain = '无',

    Liliang = 0,
    MinJie = 0,
    ZhiHui = 0,

    XingYun = 0,
    GongJi = 0,
    
    
    ShengMingShangXian = 0,
    ShengMingHuiFu = 0,
    SB = 0,
    YiDongSuDu = 0,
    GongJiSuDu = 0.0,

    HuJia = 0,
    MoFaKangXing = 0.0,

    FSQD = 0,
    MoFaShangXian = 0,
    MoFaHuiFu = 0.0,

    FSBJ = 0,
    WLBJ = 0,
    FSBJJL = 0.0,
    WUBJJL = 0.0,
    ZBBL = 0,

    WLJM = 0.0,
    MFJM = 0.0,
    SHJM = 0.0,

    WLXX = 0.0,
    FSXX = 0.0,

    ZHUANGBEIDENGJI = 0,
}

function Item:new(o)
    o = o or {}
    setmetatable(o, self)
    --
    
    --
    return o
end
Item.__index=Item

function Item:SetPrototype(item1)
    if self.ZiDingYi == item1.ZiDingYi then
        --self.ID = item1.ID
        self.name = item1.name 
        self.Types = item1.Types
        self.PinZhi = item1.PinZhi
        self.TuBiao = item1.TuBiao 
        --self.ZiDingYi = item1.ZiDingYi
        self.Explain = item1.Explain

        self.Liliang = item1.Liliang
        self.MinJie = item1.MinJie
        self.ZhiHui = item1.ZhiHui

        self.XingYun = item1.XingYun
        self.GongJi = item1.GongJi
    
    
        self.ShengMingShangXian = item1.ShengMingShangXian
        self.ShengMingHuiFu = item1.ShengMingHuiFu
        self.SB = item1.SB
        self.YiDongSuDu = item1.YiDongSuDu
        self.GongJiSuDu = item1.GongJiSuDu

        self.HuJia = item1.HuJia
        self.MoFaKangXing = item1.MoFaKangXing

        self.FSQD = item1.FSQD
        self.MoFaShangXian = item1.MoFaShangXian
        self.MoFaHuiFu = item1.MoFaHuiFu

        self.FSBJ = item1.FSBJ 
        self.WLBJ = item1.WLBJ
        self.FSBJJL = item1.FSBJJL
        self.WUBJJL = item1.WUBJJL
        self.ZBBL = item1.ZBBL

        self.WLJM = item1.WLJM
        self.MFJM = item1.MFJM
        self.SHJM = item1.SHJM

        self.WLXX = item1.WLXX
        self.FSXX = item1.FSXX

        self.ZHUANGBEIDENGJI = item1.ZHUANGBEIDENGJI
    end
end

function Item:CoverPrototype(item1)
    
        --self.ID = item1.ID
        self.name = item1.name 
        self.Types = item1.Types
        self.PinZhi = item1.PinZhi
        self.TuBiao = item1.TuBiao 
        self.ZiDingYi = item1.ZiDingYi
        self.Explain = item1.Explain

        self.Liliang = item1.Liliang
        self.MinJie = item1.MinJie
        self.ZhiHui = item1.ZhiHui

        self.XingYun = item1.XingYun
        self.GongJi = item1.GongJi
    
    
        self.ShengMingShangXian = item1.ShengMingShangXian
        self.ShengMingHuiFu = item1.ShengMingHuiFu
        self.SB = item1.SB
        self.YiDongSuDu = item1.YiDongSuDu
        self.GongJiSuDu = item1.GongJiSuDu

        self.HuJia = item1.HuJia
        self.MoFaKangXing = item1.MoFaKangXing

        self.FSQD = item1.FSQD
        self.MoFaShangXian = item1.MoFaShangXian
        self.MoFaHuiFu = item1.MoFaHuiFu

        self.FSBJ = item1.FSBJ 
        self.WLBJ = item1.WLBJ
        self.FSBJJL = item1.FSBJJL
        self.WUBJJL = item1.WUBJJL
        self.ZBBL = item1.ZBBL

        self.WLJM = item1.WLJM
        self.MFJM = item1.MFJM
        self.SHJM = item1.SHJM

        self.WLXX = item1.WLXX
        self.FSXX = item1.FSXX

        self.ZHUANGBEIDENGJI = item1.ZHUANGBEIDENGJI
    
end
function Item:ClearPrototype()
    
    --self.ID = item1.ID
    self.name = '无'
    self.Types = '无'
    self.PinZhi = '无'
    self.TuBiao = '无'
    --self.ZiDingYi = item1.ZiDingYi
    self.Explain = '无'

    self.Liliang = 0
    self.MinJie = 0
    self.ZhiHui = 0

    self.XingYun = 0
    self.GongJi = 0


    self.ShengMingShangXian = 0
    self.ShengMingHuiFu = 0
    self.SB = 0
    self.YiDongSuDu = 0
    self.GongJiSuDu = 0

    self.HuJia = 0
    self.MoFaKangXing = 0

    self.FSQD = 0
    self.MoFaShangXian = 0
    self.MoFaHuiFu = 0

    self.FSBJ = 0
    self.WLBJ = 0
    self.FSBJJL = 0
    self.WUBJJL = 0
    self.ZBBL = 0

    self.WLJM = 0
    self.MFJM = 0
    self.SHJM = 0

    self.WLXX = 0
    self.FSXX = 0

    self.ZHUANGBEIDENGJI = 0

end
return Item