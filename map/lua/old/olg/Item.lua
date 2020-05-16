local GL = require "Global"
-- 装备类

Item = {
    Liliang = 0, 
    ZhiHui = 0, 
    MinJie = 0,
    GongJi = 0 ,
    HuJia = 0,
    YiDongSuDu = 0,
    GongJiSuDu = 0, 
    ShengMingShangXian = 0,
    ShengMingHuiFu = 0,
    MoFaShangXian = 0 ,
    MoFaHuiFu = 0, 
    ZiDingYi = 0,
    MoFaKangXing = 0 ,
    Types = "物品",
    PinZhi = "普通" , 
    Name = "名称",
    TuBiao = "图标", 
    Explain = "说明",
    ID = 0,
    ZHUANGBEIDENGJI = 1
}
--定义元表的__index 的元方法  
--对任何找不到的键，都会返回'undefined'  
Item.__index=Item

function Item:new(o)
    o = o or {}
    setmetatable(o, self)
    self:Int() 

    return o
end

--初始化
function Item:Int() 
    self.Liliang = 0
    self.ZhiHui = 0
    self.MinJie = 0
    self.GongJi = 0 
    self.HuJia = 0
    self.YiDongSuDu = 0
    self.GongJiSuDu = 0
    self.ShengMingShangXian = 0
    self.ShengMingHuiFu = 0
    self.MoFaShangXian = 0 
    self.MoFaHuiFu = 0
    self.ZiDingYi = 0
    self.MoFaKangXing = 0
    self.Types = "物品"
    self.PinZhi = "普通" 
    self.Name = "名称"
    self.TuBiao = "图标"
    self.Explain = "说明"
    self.ID = 0
    self.ZHUANGBEIDENGJI = 1
end

--设置属性

function Item:SetValue (ll,zh,mj,gj,hj,yd,gs,smsx,smhf,mfsx,mfhf,mfkx,zdy,ty,pz,na,tb,ex)
    self.Liliang = ll or 0
    self.ZhiHui = zh or 0
    self.MinJie = mj or 0
    self.GongJi = gj or 0
    self.HuJia = hj or 0
    self.YiDongSuDu = yd or 0
    self.GongJiSuDu = gs or 0
    self.ShengMingShangXian = smsx or 0
    self.ShengMingHuiFu = smhf or 0
    self.MoFaShangXian = mfsx or 0
    self.MoFaHuiFu = mfhf or 0
    self.MoFaKangXing  =mfkx or 0
    self.ZiDingYi = zdy or 0
    self.Types = ty or "物品"
    self.PinZhi = pz or "普通"
    self.Name = na or "名称"
    self.TuBiao = tb or "图标"
    self.Explain = ex or "说明"
    --self.ZHUANGBEIDENGJI = 1
end

function Item:SetPrototype(item1)
    if self.ZiDingYi == item1.ZiDingYi then
        self.Liliang = item1.Liliang
        self.ZhiHui =item1.ZhiHui
        self.MinJie = item1.MinJie
        self.GongJi =item1.GongJi
        self.HuJia =item1.HuJia
        self.YiDongSuDu =item1.YiDongSuDu
        self.GongJiSuDu =item1.GongJiSuDu
        self.ShengMingShangXian = item1.ShengMingShangXian
        self.ShengMingHuiFu = item1.ShengMingHuiFu
        self.MoFaShangXian = item1.MoFaShangXian
        self.MoFaHuiFu =item1.MoFaHuiFu
        self.MoFaKangXing =item1.MoFaKangXing
        self.Types = item1.Types
        self.PinZhi = item1.PinZhi
        self.Name = item1.Name
        self.TuBiao =item1.TuBiao
        self.Explain = item1.Explain
        self.ID =item1.ID
        self.ZHUANGBEIDENGJI = item1.ZHUANGBEIDENGJI
    end
end
return Item

--测试
-- 创建对象
--m = Item:new(nil)

--myshape:printArea()

--print(m.Types)