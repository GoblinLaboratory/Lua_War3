--require "Bonus"
require "master/Item"
require "master/Global"


Hero = {
	name = "虐农先锋",
    ID = 0,
    heroType = 0,
	WanJiaID = 0,
	heroID = 0,
	Equipment_Maji_ID = 0,
	Equipment = {} -- 装备
	
}

function Hero:new(o)  
    o = o or {}  
    setmetatable(o,self)  
	self.__index = self 
	----
    self:Int()
	-----
    return o  
end 

function Hero:Int()
    --创建装备
    s = string.byte("A",1)
    for i= 1 ,11 do
        self.Equipment[i] = {}
        setmetatable(self.Equipment[i],Item) 
        self.Equipment[i]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,string.char(s), 
        Types,PinZhi, Name,TuBiao, Explain)
        --print(string.char(s))
        s = s+1
    end

end
--获取装备数据
function  Hero:GetEquipment(id)
	--print(#self.ZhuangBei)
	for i=#self.Equipment, 1, -1 do 
        if self.Equipment[i].ZiDingYi == id then 
            return self.Equipment[i]
        end         
    end 
end

--穿戴装备
function Hero:SetItemprototype(item1)  
	self:AddAttribute(item1)
	local i = item1.ZiDingYi
	
	local x = self:GetEquipment(i)
	
    x:SetPrototype(item1)
    
    return x
end

--卸下装备
function Hero:RemoveItemprototype(item1)  
	local i = item1.ZiDingYi
	--print(item1.Name)
	local x = self:GetZhuangBei(i)

	self:RemoveAttribute(x )

	x.Liliang =0 
    x.ZhiHui =0
    x.MinJie = 0
    x.GongJi =0
    x.HuJia = 0
    x.YiDongSuDu =0
    x.GongJiSuDu = 0
    x.ShengMingShangXian = 0
    x.ShengMingHuiFu =0
    x.MoFaShangXian = 0
    x.MoFaHuiFu =0
    x.MoFaKangXing =0
    x.Types = "物品"
    x.PinZhi =  "普通"
    x.Name = "名称"
    x.TuBiao ="图标"
	x.Explain = "说明"
	x.ID =0
    x.ZHUANGBEIDENGJI = 0
    return x
end
--s = string.byte("A",1)

--print(s)
m = Hero:new()  

for i=#m.Equipment, 1, -1 do 
    print(m.Equipment[i].ZiDingYi)
end 
	