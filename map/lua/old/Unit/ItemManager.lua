require "Item"
require "math"
require "Global"
require "ItemDota"
require "Picture"

--装备系统
ItemManager = {ItemList = {},UseItemList = {},Item_Dota = 0,Dota = {},Item_TuBiao = 0}  

function ItemManager:new(o)  
    o = o or {}  
    setmetatable(o,self)  
    self.__index = self  

    self:Int() 

    math.randomseed(tostring(os.time()):reverse():sub(1, 7))
    return o  
end  
ItemManager.__index=ItemManager
function ItemManager:Instance()  
    if self.instance == nil then  
        self.instance = self:new()  
    end  
    return self.instance  
end 

--初始化
function ItemManager:Int() 
    local x = "ZB00"
    for i= 0 ,899 do
        table.insert(self.ItemList,Global:GetId(x))
        x = Global:GetNextStrId(x) 
    end
    self.Item_TuBiao = Picture:Instance()
    --self.Item_Dota:Int()
end

--从物品池获得一个物品ID
function ItemManager:GetEquipment() 
    local n = #self.ItemList
    local s = #self.UseItemList
    
    table.insert(self.UseItemList,self.ItemList[n])
    table.remove(self.ItemList)

    return  self.UseItemList[s+1]
end

--将物品ID加入物品池
function ItemManager:SetEquipment(num1) 
    local count = 0
    for i=#self.ItemList, 1, -1 do 
        if self.ItemList[i] == num1 then 
            count = 1
        end         
    end 
    if count == 0 then 
        table.insert(self.ItemList,num1)
    end   
    ------------------------------------
    for i=#self.UseItemList, 1, -1 do 
        if self.UseItemList[i] == num1 then 
            table.remove(self.UseItemList,i) 
        end         
    end 
end

--根据物品ID获得物品数据
function ItemManager:GetItemDota(num1) 
    print("参数 = ".."   "..tostring(num1)) 
    local s = #self.Dota
    local x 
    print("Dota".."   "..tostring(s)) 
    for i=#self.Dota, 1, -1 do 
        if self.Dota[i].ID == num1 then            
            return self.Dota[i]
        end         
    end 
    return  0
end


----------------
--随机属性系统
-----------------


--设置属性
function ItemManager:SetItemprototype(l)  

    local item1 = {}
    setmetatable(item1,Item) 
    --id = 1,
    item1.name = ItemDota[l].name
    item1.Types = ItemDota[l].Types
    --PinZhi = '普通',
    --TuBiao = '图标',
    item1.ZiDingYi = ItemDota[l].ZiDingYi
    item1.Explain = ItemDota[l].Explain

    item1.Liliang = ItemDota[l].Liliang
    item1.MinJie = ItemDota[l].MinJie
    item1.ZhiHui = ItemDota[l].ZhiHui
    item1.XingYun = ItemDota[l].XingYun
    item1.GongJi = ItemDota[l].GongJi
    item1.FSBJ = ItemDota[l].FSBJ
    item1.WLBJ = ItemDota[l].WLBJ
    item1.ShengMingShangXian = ItemDota[l].ShengMingShangXian
    item1.ShengMingHuiFu = ItemDota[l].ShengMingHuiFu
    item1.SB = ItemDota[l].SB
    item1.YiDongSuDu = ItemDota[l].YiDongSuDu
    item1.GongJiSuDu = ItemDota[l].GongJiSuDu
    item1.HuJia = ItemDota[l].HuJia
    item1.MoFaKangXing = ItemDota[l].MoFaKangXing
    item1.FSQD = ItemDota[l].FSQD
    item1.MoFaShangXian = ItemDota[l].MoFaShangXian
    item1.MoFaHuiFu = ItemDota[l].MoFaHuiFu
    item1.FSBJJL = ItemDota[l].FSBJJL
    item1.WUBJJL = ItemDota[l].WUBJJL
    item1.ZBBL = ItemDota[l].ZBBL
    item1.WLJM = ItemDota[l].WLJM
    item1.MFJM = ItemDota[l].MFJM
    item1.SHJM = ItemDota[l].SHJM
    item1.WLXX = ItemDota[l].WLXX
    item1.FSXX = ItemDota[l].FSXX
    
    return item1
end 

--添加属性
function ItemManager:AddItemAttribute(item1, l)  
    item1.Liliang =item1.Liliang + ItemDota[l].Liliang
    item1.MinJie = item1.MinJie + ItemDota[l].MinJie
    item1.ZhiHui = item1.ZhiHui + ItemDota[l].ZhiHui
    item1.XingYun = item1.XingYun + ItemDota[l].XingYun
    item1.GongJi = item1.GongJi + ItemDota[l].GongJi
    item1.FSBJ = item1.FSBJ + ItemDota[l].FSBJ
    item1.WLBJ = item1.WLBJ + ItemDota[l].WLBJ
    item1.ShengMingShangXian = item1.ShengMingShangXian + ItemDota[l].ShengMingShangXian
    item1.ShengMingHuiFu = item1.ShengMingHuiFu + ItemDota[l].ShengMingHuiFu
    item1.SB = item1.SB + ItemDota[l].SB
    item1.YiDongSuDu = item1.YiDongSuDu + ItemDota[l].YiDongSuDu
    item1.GongJiSuDu = item1.GongJiSuDu + ItemDota[l].GongJiSuDu
    item1.HuJia = item1.HuJia + ItemDota[l].HuJia
    item1.MoFaKangXing = item1.MoFaKangXing + ItemDota[l].MoFaKangXing
    item1.FSQD = item1.FSQD + ItemDota[l].FSQD
    item1.MoFaShangXian = item1.MoFaShangXian + ItemDota[l].MoFaShangXian
    item1.MoFaHuiFu = item1.MoFaHuiFu + ItemDota[l].MoFaHuiFu
    item1.FSBJJL = item1.FSBJJL + ItemDota[l].FSBJJL
    item1.WUBJJL = item1.WUBJJL + ItemDota[l].WUBJJL
    item1.ZBBL = item1.ZBBL  + ItemDota[l].ZBBL
    item1.WLJM = item1.WLJM + ItemDota[l].WLJM
    item1.MFJM = item1.MFJM + ItemDota[l].MFJM
    item1.SHJM = item1.SHJM + ItemDota[l].SHJM
    item1.WLXX = item1.WLXX + ItemDota[l].WLXX
    item1.FSXX = item1.FSXX + ItemDota[l].FSXX
    
    return item1
end 
--设置物品等级
function ItemManager:SetItemlevel(item1,level)  
    local l = level/4
    local z = 1+math.random(10,25)/100

    local xszd1 =0

    if (item1.PinZhi =="普通") then
        xszd1 =math.random(0,2)
    elseif(item1.PinZhi =="优秀") then
        xszd1 = math.random(1,3)
    elseif(item1.PinZhi =="精良") then
        xszd1 = math.random(2,4)
    elseif(item1.PinZhi =="史诗") then
        xszd1 = math.random(3,5)
    elseif(item1.PinZhi =="神器") then
        xszd1 = math.random(4,6)
    end
    local xszd = Global:getIntPart(level/5 +xszd1)

    item1.Liliang =item1.Liliang*xszd
    item1.MinJie = item1.MinJie *xszd
    item1.ZhiHui = item1.ZhiHui *xszd

    item1.XingYun = item1.XingYun*xszd

    item1.GongJi = item1.GongJi *xszd

    item1.FSBJ = item1.FSBJ *xszd
    item1.WLBJ = item1.WLBJ*xszd
    
    item1.ShengMingShangXian = item1.ShengMingShangXian *xszd
    item1.ShengMingHuiFu = item1.ShengMingHuiFu
    item1.SB = item1.SB 
    item1.YiDongSuDu = item1.YiDongSuDu 

    item1.GongJiSuDu = item1.GongJiSuDu 

    item1.HuJia = item1.HuJia *xszd

    item1.MoFaKangXing = item1.MoFaKangXing 
    item1.FSQD = item1.FSQD 
    item1.MoFaShangXian = item1.MoFaShangXian 
    item1.MoFaHuiFu = item1.MoFaHuiFu 
    item1.FSBJJL = item1.FSBJJL
    item1.WUBJJL = item1.WUBJJL 
    item1.ZBBL = item1.ZBBL 
    item1.WLJM = item1.WLJM 
    item1.MFJM = item1.MFJM 
    item1.SHJM = item1.SHJM 
    item1.WLXX = item1.WLXX 
    item1.FSXX = item1.FSXX 

    item1.ZHUANGBEIDENGJI =level

end

--获取物品名称
function ItemManager:GetName(item1)  
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
    local Ep = Ys..item1.name.."|r"
    return Ep
end

--获取说明
function ItemManager:GetExplain(item1)  
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
    Ep = Ep.."|cffcc99ff".."物品等级".."   "..tostring(item1.ZHUANGBEIDENGJI).."|r|n"

    --Ep = Ep.."ID:"..item1.ID.."|n"
    Ep = Ep..Ys..item1.Types.."|r|n"

    if (item1.GongJi ~=0) then
        Ep = Ep.."提升"..item1.GongJi.."点攻击力。".."|n"
    end
    if (item1.FSQD ~=0) then
        Ep = Ep.."提升"..item1.FSQD.."点法术强度。".."|n"
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
        Ep = Ep..Ys.."增加"..tostring(item1.GongJiSuDu*100).."%攻击速度。".."|r|n"
    end
    if (item1.YiDongSuDu ~=0) then
        Ep = Ep..Ys.."增加"..item1.YiDongSuDu.."点移动速度。".."|r|n"
    end
    if (item1.SB ~=0) then
        Ep = Ep..Ys.."增加"..tostring(item1.SB*100).."%闪避。".."|r|n"
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
        Ep = Ep..Ys.."增加"..tostring(item1.MoFaHuiFu*100).."%的魔法值恢复速度。".."|r|n"
    end

    if (item1.FSBJ ~=0) then
        Ep = Ep..Ys.."增加"..item1.FSBJ.."点法术暴击强度。".."|r|n"
    end
    if (item1.FSBJJL ~=0) then
        Ep = Ep..Ys.."增加"..tostring(item1.FSBJJL*100).."%法术暴击几率。".."|r|n"
    end
    if (item1.WLBJ ~=0) then
        Ep = Ep..Ys.."增加"..item1.WLBJ.."点攻击暴击强度。".."|r|n"
    end
    if (item1.WUBJJL ~=0) then
        Ep = Ep..Ys.."增加"..tostring(item1.WUBJJL*100).."%攻击暴击几率。".."|r|n"
    end

    if (item1.WLJM ~=0) then
        Ep = Ep..Ys.."增加"..tostring(item1.WLJM*100).."%普通伤害减免。".."|r|n"
    end
    if (item1.MFJM ~=0) then
        Ep = Ep..Ys.."增加"..tostring(item1.MFJM*100).."%魔法伤害减免。".."|r|n"
    end
    if (item1.SHJM ~=0) then
        Ep = Ep..Ys.."增加"..tostring(item1.SHJM*100).."%伤害减免。".."|r|n"
    end

    if (item1.WLXX ~=0) then
        Ep = Ep..Ys.."增加"..tostring(item1.WLXX*100).."%攻击吸血。".."|r|n"
    end
    if (item1.FSXX ~=0) then
        Ep = Ep..Ys.."增加"..tostring(item1.FSXX*100).."%法术吸血。".."|r|n"
    end
    --Ep = Ep..Ys.."自定义"..item1.ZiDingYi.."|r|n"
    Ep = Ep.."————————————".."|n"

    Ep = Ep..item1.Explain.."|n"

    return Ep
end 
--属性过滤
function ItemManager:ItemAttributeFilter(item1)  
    if (item1.ZiDingYi =="A") then --主手 装备

        item1.YiDongSuDu = 0

        item1.HuJia = 0
        item1.MoFaKangXing = 0
        
            
        item1.WLJM = 0
        item1.MFJM = 0
        item1.SHJM = 0

        item1.WLXX = 0
        item1.FSXX = 0
    elseif(item1.ZiDingYi =="B") then--副手装备
        item1.MoFaKangXing = 0
        
    elseif(item1.ZiDingYi =="C") then--头盔装备
        item1.GongJi = 0
        item1.FSQD = 0
        item1.SB = 0

        item1.YiDongSuDu = 0
        item1.GongJiSuDu = 0 

        item1.WLXX = 0
        item1.FSXX = 0
    elseif(item1.ZiDingYi =="D") then--铠甲装备
        item1.GongJi = 0
        item1.FSQD = 0

        item1.YiDongSuDu = 0
        item1.GongJiSuDu = 0 

        item1.FSBJ = 0
        item1.WLBJ = 0
        item1.FSBJJL = 0
        item1.WUBJJL = 0

        item1.WLXX = 0
        item1.FSXX = 0
    elseif(item1.ZiDingYi =="E") then--披风装备
        item1.GongJi = 0

        item1.ShengMingShangXian = 0
        item1.ShengMingHuiFu = 0
        item1.MoFaShangXian = 0
        item1.MoFaHuiFu = 0 

        item1.FSBJ = 0
        item1.WLBJ = 0
        item1.FSBJJL = 0
        item1.WUBJJL = 0

        item1.WLXX = 0
        item1.FSXX = 0
    elseif(item1.ZiDingYi =="F") then--手套装备
        item1.GongJi = 0
        item1.FSQD = 0

        item1.YiDongSuDu = 0

        item1.ShengMingShangXian = 0
        item1.ShengMingHuiFu = 0
        item1.MoFaShangXian = 0
        item1.MoFaHuiFu = 0 

        item1.FSBJ = 0
        item1.WLBJ = 0
        item1.FSBJJL = 0
        item1.WUBJJL = 0

        item1.WLXX = 0
        item1.FSXX = 0
    elseif(item1.ZiDingYi =="G") then--鞋装备
        item1.GongJi = 0
        item1.FSQD = 0

        item1.ShengMingShangXian = 0
        item1.ShengMingHuiFu = 0
        item1.MoFaShangXian = 0
        item1.MoFaHuiFu = 0 

        item1.FSBJ = 0
        item1.WLBJ = 0
        item1.FSBJJL = 0
        item1.WUBJJL = 0

        item1.WLXX = 0
        item1.FSXX = 0
    elseif(item1.ZiDingYi =="H") then--面具装备
        item1.GongJi = 0
        item1.HuJia = 0
        item1.FSQD = 0

        item1.SB = 0

        item1.ShengMingShangXian = 0
        item1.ShengMingHuiFu = 0
        item1.MoFaShangXian = 0
        item1.MoFaHuiFu = 0 
        
        item1.FSBJ = 0
        item1.WLBJ = 0
        item1.FSBJJL = 0
        item1.WUBJJL = 0
    elseif(item1.ZiDingYi =="I") then--项链装备
        item1.GongJi = 0
        item1.HuJia = 0

        item1.SB = 0

        item1.YiDongSuDu = 0
        item1.GongJiSuDu = 0 

        item1.WLXX = 0
        item1.FSXX = 0
    elseif(item1.ZiDingYi =="J") then--饰品装备
        item1.GongJi = 0
        item1.HuJia = 0

        item1.SB = 0

        item1.YiDongSuDu = 0
        item1.GongJiSuDu = 0 

        item1.WLXX = 0
        item1.FSXX = 0
    elseif(item1.ZiDingYi =="K") then--戒指装备
        item1.GongJi = 0
        item1.HuJia = 0

        item1.SB = 0

        item1.YiDongSuDu = 0
        item1.GongJiSuDu = 0 
        
        item1.WLXX = 0
        item1.FSXX = 0
    end
end
--创建随机物品
function ItemManager:CreateRandomItem(level)  
    local Rn = math.random(1,10000)
    --local Rn =5

    local x1 = math.random(1,11)
    local x2 = math.random(1,30)
    local x3 = math.random(1,50)
    local x4 = math.random(1,50)
    local l = 10000 + x1*100 + x2

    local item = self:SetItemprototype(l)
    item.ID = self:GetEquipment()
    
    table.insert(self.Dota,item)

    if( 0 <= Rn and  Rn <= 10 ) then
        --添加装备品质
        item.PinZhi = "神器"
        --添加前缀
        item.name = ItemDota[x3].name..item.name
        self:AddItemAttribute(item,x3) 
        --添加后缀
        self:AddItemAttribute(item,math.random(1,50)) 
        self:AddItemAttribute(item,math.random(1,50)) 
        self:AddItemAttribute(item,math.random(1,50)) 
        self:AddItemAttribute(item,math.random(1,50)) 
    elseif(  10 <= Rn and  Rn <= 50  ) then  
        --添加装备品质 
        item.PinZhi = "史诗"
        --添加前缀
        item.name = ItemDota[x3].name..item.name
        self:AddItemAttribute(item,x3) 
        --添加后缀
        self:AddItemAttribute(item,math.random(1,50)) 
        self:AddItemAttribute(item,math.random(1,50)) 
        self:AddItemAttribute(item,math.random(1,50)) 
    elseif(  50 <= Rn and  Rn <= 150  ) then 
        --添加装备品质  
        item.PinZhi = "精良"
                --添加前缀
        item.name = ItemDota[x3].name..item.name
        self:AddItemAttribute(item,x3) 
        --添加前缀
        item.name = ItemDota[x3].name..item.name
        self:AddItemAttribute(item,x3) 
        --添加后缀
        self:AddItemAttribute(item,math.random(1,50)) 
        self:AddItemAttribute(item,math.random(1,50)) 
    elseif(  150 <= Rn and  Rn <= 300  ) then 
        --添加装备品质
        item.PinZhi = "优秀"
        --添加前缀
        item.name = ItemDota[x3].name..item.name
        self:AddItemAttribute(item,x3) 
        --添加后缀
        self:AddItemAttribute(item,math.random(1,50)) 
    else
        --添加装备品质
        item.PinZhi = "普通"
        --添加前缀
        item.name = ItemDota[x3].name..item.name
        self:AddItemAttribute(item,x3) 

    end
    --添加图标
    local sj = #self.Item_TuBiao.TuBiao[item.Types]
    item.TuBiao = self.Item_TuBiao.TuBiao[item.Types][math.random(1,sj)]

    --设置物品等级
    self:SetItemlevel(item,level) 
    --属性过滤
    self:ItemAttributeFilter(item)  
    return item
end
--创建随机物品，指定品质
function ItemManager:CreatePinZhiItem(p,level)  
    local Rn = math.random(1,10000)
    --local Rn =5

    local x1 = math.random(1,11)
    local x2 = math.random(1,30)
    local x3 = math.random(1,50)
    local x4 = math.random(1,50)
    local l = 10000 + x1*100 + x2

    local item = self:SetItemprototype(l)
    item.ID = self:GetEquipment()
    
    table.insert(self.Dota,item)

    if( p == "神器" ) then
        --添加装备品质
        item.PinZhi = "神器"
        --添加前缀
        item.name = ItemDota[x3].name..item.name
        self:AddItemAttribute(item,x3) 
        --添加后缀
        self:AddItemAttribute(item,math.random(1,50)) 
        self:AddItemAttribute(item,math.random(1,50)) 
        self:AddItemAttribute(item,math.random(1,50)) 
        self:AddItemAttribute(item,math.random(1,50)) 
    elseif( p == "史诗"  ) then  
        --添加装备品质 
        item.PinZhi = "史诗"
        --添加前缀
        item.name = ItemDota[x3].name..item.name
        self:AddItemAttribute(item,x3) 
        --添加后缀
        self:AddItemAttribute(item,math.random(1,50)) 
        self:AddItemAttribute(item,math.random(1,50)) 
        self:AddItemAttribute(item,math.random(1,50)) 
    elseif( p == "精良"   ) then 
        --添加装备品质  
        item.PinZhi = "精良"
                --添加前缀
        item.name = ItemDota[x3].name..item.name
        self:AddItemAttribute(item,x3) 
        --添加前缀
        item.name = ItemDota[x3].name..item.name
        self:AddItemAttribute(item,x3) 
        --添加后缀
        self:AddItemAttribute(item,math.random(1,50)) 
        self:AddItemAttribute(item,math.random(1,50)) 
    elseif(  p == "优秀"  ) then 
        --添加装备品质
        item.PinZhi = "优秀"
        --添加前缀
        item.name = ItemDota[x3].name..item.name
        self:AddItemAttribute(item,x3) 
        --添加后缀
        self:AddItemAttribute(item,math.random(1,50)) 
    else
        --添加装备品质
        item.PinZhi = "普通"
        --添加前缀
        item.name = ItemDota[x3].name..item.name
        self:AddItemAttribute(item,x3) 

    end
    --添加图标
    local sj = #self.Item_TuBiao.TuBiao[item.Types]
    item.TuBiao = self.Item_TuBiao.TuBiao[item.Types][math.random(1,sj)]
    --设置物品等级
    self:SetItemlevel(item,level) 
    --属性过滤
    self:ItemAttributeFilter(item)  
    return item
end
--删除指定物品
function ItemManager:RemoveAppointItem(item)  
    self:SetEquipment(item.ID) 
    for i=#self.Dota, 1, -1 do 
        if self.Dota[i].ID == item.ID then 
            table.remove(self.Dota,i) 
        end         
    end 
end 
--删除指定ID物品
function ItemManager:RemoveAppointIDItem(ID)  
    self:SetEquipment(ID) 
    for i=#self.Dota, 1, -1 do 
        if self.Dota[i].ID == ID then 
            table.remove(self.Dota,i) 
        end         
    end 
end 
--创建指定物品
function ItemManager:CreateAppointItem(item)  

    --local  itemc = self:SetItemprototype(3)

    local itemc = {}
    setmetatable(itemc,Item) 
    
    itemc:CoverPrototype(item)
    itemc.ID = self:GetEquipment()
    --itemc.ZHUANGBEIDENGJI = item.ZHUANGBEIDENGJI
    table.insert(self.Dota,itemc)

    return itemc
end 
--创建指定NAJIA物品
function ItemManager:CreatemjItem()  

    local itemc = self:CreateRandomItem(1)  
    itemc.ZiDingYi ="A"
    return itemc
end 

return ItemManager