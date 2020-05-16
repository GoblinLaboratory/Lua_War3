require "Equipment"
local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
require "Bonus"

Liliang = 0
ZhiHui = 0
MinJie = 0
GongJi = 0 
HuJia = 0
YiDongSuDu = 0
GongJiSuDu = 0
ShengMing = 0
ShengMingShangXian = 0
ShengMingHuiFu = 0
MoFa = 0
MoFaShangXian = 0
MoFaHuiFu = 0
MoFaKangXing = 0
ZiDingYi = "A"
Types = "物品"
PinZhi = "普通" 
Name = "名称"
TuBiao = "图标"
Explain = "说明"


Hero = {
	name = "虐农先锋",
	ID = 0,
	WanJiaID = 0,
	heroID = 0,
	Equipment_Maji_ID = 0,
	ZhuangBei = {},
	
}

function Hero:new(o)  
    o = o or {}  
    setmetatable(o,self)  
	self.__index = self 
	----

	-----
    return o  
end 


--定义元表的__index 的元方法  
--对任何找不到的键，都会返回'undefined'  
Hero.__index=Hero

function Hero:Int()
	--for i= 1 ,10 do
        --self.ZhuangBei[i] = {}
		--setmetatable(self.ZhuangBei[i],Equipment) 
		--self.ZhuangBei[i]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,ZiDingYi, 
        --Types,PinZhi, Name,TuBiao, Explain)
	--end
	self.ZhuangBei[1] = {}
	setmetatable(self.ZhuangBei[1],Equipment) 
	self.ZhuangBei[1]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"A", 
	Types,PinZhi, Name,TuBiao, Explain)
	
	self.ZhuangBei[2] = {}
	setmetatable(self.ZhuangBei[2],Equipment) 
	self.ZhuangBei[2]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"B", 
	Types,PinZhi, Name,TuBiao, Explain)

	self.ZhuangBei[3] = {}
	setmetatable(self.ZhuangBei[3],Equipment) 
	self.ZhuangBei[3]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
	Types,PinZhi, Name,TuBiao, Explain)

	self.ZhuangBei[4] = {}
	setmetatable(self.ZhuangBei[4],Equipment) 
	self.ZhuangBei[4]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"D", 
	Types,PinZhi, Name,TuBiao, Explain)

	self.ZhuangBei[5] = {}
	setmetatable(self.ZhuangBei[5],Equipment) 
	self.ZhuangBei[5]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"E", 
	Types,PinZhi, Name,TuBiao, Explain)

	self.ZhuangBei[6] = {}
	setmetatable(self.ZhuangBei[6],Equipment) 
	self.ZhuangBei[6]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
	Types,PinZhi, Name,TuBiao, Explain)

	self.ZhuangBei[7] = {}
	setmetatable(self.ZhuangBei[7],Equipment) 
	self.ZhuangBei[7]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
	Types,PinZhi, Name,TuBiao, Explain)

	self.ZhuangBei[8] = {}
	setmetatable(self.ZhuangBei[8],Equipment) 
	self.ZhuangBei[8]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"H", 
	Types,PinZhi, Name,TuBiao, Explain)

	self.ZhuangBei[9] = {}
	setmetatable(self.ZhuangBei[9],Equipment) 
	self.ZhuangBei[9]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"I", 
	Types,PinZhi, Name,TuBiao, Explain)

	self.ZhuangBei[10] = {}
	setmetatable(self.ZhuangBei[10],Equipment) 
	self.ZhuangBei[10]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"J", 
	Types,PinZhi, Name,TuBiao, Explain)

	self.ZhuangBei[11] = {}
	setmetatable(self.ZhuangBei[11],Equipment) 
	self.ZhuangBei[11]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"K", 
	Types,PinZhi, Name,TuBiao, Explain)

end

--装备
function Hero:SetItemprototype(item1)  
	self:AddAttribute(item1)
	local i = item1.ZiDingYi
	
	local x = self:GetZhuangBei(i)
	
	x.Liliang = item1.Liliang
    x.ZhiHui =item1.ZhiHui
    x.MinJie = item1.MinJie
    x.GongJi =item1.GongJi
    x.HuJia =item1.HuJia
    x.YiDongSuDu =item1.YiDongSuDu
    x.GongJiSuDu =item1.GongJiSuDu
    x.ShengMingShangXian = item1.ShengMingShangXian
    x.ShengMingHuiFu = item1.ShengMingHuiFu
    x.MoFaShangXian = item1.MoFaShangXian
    x.MoFaHuiFu =item1.MoFaHuiFu
    x.MoFaKangXing =item1.MoFaKangXing
    --self.ZhuangBei[i][1].ZiDingYi = item1.ZiDingYi
    x.Types = item1.Types
    x.PinZhi = item1.PinZhi
    x.Name = item1.Name
    x.TuBiao =item1.TuBiao
	x.Explain = item1.Explain
	x.ID =item1.ID
	x.ZHUANGBEIDENGJI = item1.ZHUANGBEIDENGJI

	print(x.GongJi )
    return x
end
--卸下
function Hero:RemoveItemprototype(item1)  
	local i = item1.ZiDingYi
	--print(item1.Name)
	local x = self:GetZhuangBei(i)

	self:RemoveAttribute(x )

	x.Liliang =Liliang 
    x.ZhiHui =ZhiHui
    x.MinJie = MinJie
    x.GongJi =GongJi
    x.HuJia = HuJia
    x.YiDongSuDu = YiDongSuDu
    x.GongJiSuDu = GongJiSuDu
    x.ShengMingShangXian = ShengMingShangXian
    x.ShengMingHuiFu = ShengMingHuiFu
    x.MoFaShangXian = MoFaShangXian
    x.MoFaHuiFu =MoFaHuiFu
    x.MoFaKangXing =MoFaKangXing
    --self.ZhuangBei[i][1].ZiDingYi = item1.ZiDingYi
    x.Types = Types
    x.PinZhi = PinZhi
    x.Name = Name
    x.TuBiao =TuBiao
	x.Explain = Explain
	x.ID =0
	x.ZHUANGBEIDENGJI = 0
	print(self:GetExplain(x))
    return x
end
--增加属性
function  Hero:AddAttribute(item1)
	local bu = Bonus:Instance()  
    
   -- CJ.SetHeroStr(self.heroID, CJ.GetHeroStr(self.heroID, true) + item1.Liliang, true )
    --CJ.SetHeroAgi(self.heroID, CJ.GetHeroAgi(self.heroID, true) + item1.MinJie, true )
   -- CJ.SetHeroInt(self.heroID, CJ.GetHeroInt(self.heroID, true) + item1.ZhiHui, true )

	bu:UnitAddBonus(self.heroID, 1, item1.HuJia)
	bu:UnitAddBonus(self.heroID, 2, item1.GongJi )
	bu:UnitAddBonus(self.heroID, 3, item1.MoFaHuiFu*100 )
	bu:UnitAddBonus(self.heroID, 4, item1.ShengMingHuiFu )
	bu:UnitAddBonus(self.heroID, 5, item1.GongJiSuDu )
	bu:UnitAddBonus(self.heroID, 6, item1.ShengMingShangXian )
    bu:UnitAddBonus(self.heroID, 7, item1.MoFaShangXian )
    bu:UnitAddBonus(self.heroID, 8, item1.Liliang )
    bu:UnitAddBonus(self.heroID, 9, item1.MinJie )
    bu:UnitAddBonus(self.heroID, 10, item1.ZhiHui )
    bu:UnitSetSeed(self.heroID,item1.YiDongSuDu)
    bu:UnitSetMFKX(self.heroID,item1.MoFaKangXing)
    --print(item1.MoFaShangXian)
end

function  Hero:RemoveAttribute(item1)
	local bu = Bonus:Instance()  
    
    --CJ.SetHeroStr(self.heroID, CJ.GetHeroStr(self.heroID, true) - item1.Liliang, true )
    --CJ.SetHeroAgi(self.heroID, CJ.GetHeroAgi(self.heroID, true) - item1.MinJie, true )
    --CJ.SetHeroInt(self.heroID, CJ.GetHeroInt(self.heroID, true) - item1.ZhiHui, true )

	bu:UnitAddBonus(self.heroID, 1, 0-item1.HuJia)
	bu:UnitAddBonus(self.heroID, 2, 0-item1.GongJi )
	bu:UnitAddBonus(self.heroID, 3, 0-item1.MoFaHuiFu*100 )
	bu:UnitAddBonus(self.heroID, 4, 0-item1.ShengMingHuiFu )
	bu:UnitAddBonus(self.heroID, 5, 0-item1.GongJiSuDu )
    bu:UnitAddBonus(self.heroID, 6, 0-item1.ShengMingShangXian )
    bu:UnitAddBonus(self.heroID, 7, 0-item1.MoFaShangXian )
    bu:UnitAddBonus(self.heroID, 8, 0-item1.Liliang )
    bu:UnitAddBonus(self.heroID, 9, 0-item1.MinJie )
    bu:UnitAddBonus(self.heroID, 10, 0-item1.ZhiHui )
    bu:UnitSetSeed(self.heroID,0-item1.YiDongSuDu)
    bu:UnitSetMFKX(self.heroID,0-item1.MoFaKangXing)
    --print(item1.MoFaShangXian)
end

function  Hero:GetZhuangBei(id)
	--print(#self.ZhuangBei)
	for i=#self.ZhuangBei, 1, -1 do 
        if self.ZhuangBei[i].ZiDingYi == id then 
            return self.ZhuangBei[i]
        end         
    end 
end
function  Hero:printArea ()
	print("....................................................")
end
function Hero:GetExplain(item1)  
    local Ys = " "
    if (item1.PinZhi =="普通") then
        Ys = "|cffccffff"
    elseif(item1.PinZhi =="优秀") then
        Ys = "|cffffff00"
    elseif(item1.PinZhi =="精良") then
        Ys = "|cffcc99ff"
    elseif(item1.PinZhi =="史诗") then
        Ys = "|cff0000ff"
    elseif(item1.PinZhi =="神器") then
        Ys = "|cffff6800"
    end
    local Ep = "|n"
    Ep = Ep.."|cffcc99ff".."物品等级"..item1.ZHUANGBEIDENGJI.."|r|n"
    Ep = Ep.."ID:"..item1.ID.."|n"
    Ep = Ep..Ys..item1.Types.."     "..item1.PinZhi.."|r|n"
    if (item1.GongJi ~=0) then
        Ep = Ep.."提升"..item1.GongJi.."点攻击力。".."|n"
    end
    if (item1.HuJia ~=0) then
        Ep = Ep.."提升"..item1.HuJia.."点护甲。".."|n"
    end
    if (item1.MoFaKangXing ~=0) then
        Ep = Ep.."提升"..item1.MoFaKangXing.."点魔法抗性。".."|n"
    end

    Ep = Ep.."————————————".."|n"
   
    if (item1.Liliang ~=0) then
        Ep = Ep..Ys.."增加"..item1.Liliang.."点力量。".."|r|n"
    end
    if (item1.MinJie ~=0) then
        Ep = Ep..Ys.."增加"..item1.MinJie.."点敏捷。".."|r|n"
    end
    if (item1.ZhiHui ~=0) then
        Ep = Ep..Ys.."增加"..item1.ZhiHui.."点智力。".."|r|n"
    end
    if (item1.GongJiSuDu ~=0) then
        Ep = Ep..Ys.."增加"..item1.GongJiSuDu.."点攻击速度。".."|r|n"
    end
    if (item1.YiDongSuDu ~=0) then
        Ep = Ep..Ys.."增加"..item1.YiDongSuDu.."点移动速度。".."|r|n"
    end
    if (item1.ShengMingShangXian ~=0) then
        Ep = Ep..Ys.."增加"..item1.ShengMingShangXian.."点生命。".."|r|n"
    end
    if (item1.ShengMingHuiFu ~=0) then
        Ep =Ep..Ys.."增加"..item1.ShengMingHuiFu.."点的生命值恢复速度。".."|r|n"
    end
    if (item1.MoFaShangXian ~=0) then
        Ep = Ep..Ys.."增加"..item1.MoFaShangXian.."点魔法值。".."|r|n"
    end
    if (item1.MoFaHuiFu ~=0) then
        Ep = Ep..Ys.."增加"..item1.MoFaHuiFu.."点的魔法值恢复速度。".."|r|n"
    end
    Ep = Ep..Ys.."自定义"..item1.ZiDingYi.."|r|n"
    Ep = Ep.."————————————".."|n"

    Ep = Ep..item1.Explain.."|n"

    return Ep
end  
return Hero
--si=Hero:new() 
--print(si.ZhuangBei["K"][1].Name)
--local itemKs = {}
--setmetatable(itemKs,Equipment) 
--itemKs.ZiDingYi = "K"
--si:SetItemprototype(itemKs)  