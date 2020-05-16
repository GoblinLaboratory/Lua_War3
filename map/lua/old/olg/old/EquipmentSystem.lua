require "Equipment"
require "math"
require "EquipmentDota"
--装备系统
EquipmentSystem = {EquipmentList = {},UseEquipmentList = {},Equipment_Dota = 0,Dota = {}}  

----------------
--ID转换
----------------
function EquipmentSystem:GetId(id) 
	local i=string.byte(id,1) --(这里的string.byte(id,1)就是把id这个字符串的第1个字符转换成ascii编码的10进制)
	i=i*256+string.byte(id,2)
	i=i*256+string.byte(id,3)
	i=i*256+string.byte(id,4)
	return i
end

function EquipmentSystem:GetStrId(id) 
    local n4=string.char(id%256)
    print(id%256)
    local s3 = (id-id%256)/256
    --print(s3.."   "..math.ceil(s3%256))
    local n3=string.char(s3%256 ) 
    local s2 = ((id-id%256)/256 - (id-id%256)/256%256)/256
    local n2=string.char(s2%256) 
    local s1 = (((id-id%256)/256 - (id-id%256)/256%256)/256 - ((id-id%256)/256 - (id-id%256)/256%256)/256%256)/256
    local n1=string.char(s1%256) 
    return n1..n2..n3..n4
end  
function EquipmentSystem:GetNextStrId(id) 
    local str="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local str1 = string.sub(id,1,1)
    local str2 = string.sub(id,2,2)
    local str3 = string.sub(id,3,3)
    local str4 = string.sub(id,4,4)

    
    if (str4== "Z") then
        str4 = string.sub(str,1,1)
        if (str3== "Z") then
            str3 = string.sub(str,1,1)           
            if (str2== "Z") then
                str2 = string.sub(str,1,1)
                local j1 = string.find(str, str1)
                str1 = string.sub(str,j1+1,j1+1)
            else
                local j2 = string.find(str, str2)
                str2 = string.sub(str,j2+1,j2+1)
            end
        else
            local j3 = string.find(str, str3)
            str3 = string.sub(str,j3+1,j3+1)
        end
    else 
        local j4 = string.find(str, str4)
        str4 = string.sub(str,j4+1,j4+1)  
    end
    return str1..str2..str3..str4
end
----------------
--装备ID系统
----------------
function EquipmentSystem:new(o)  
    o = o or {}  
    setmetatable(o,self)  
    self.__index = self  
    local x = "ZB00"
    for i= 0 ,899 do
        --self.EquipmentList[tostring(i)] = 1514287152+i
        table.insert(self.EquipmentList,self:GetId(x))
        x = self:GetNextStrId(x) 
    end
    self.Equipment_Dota = EquipmentDota:Instance()

    self.Equipment_Dota:Int()
    math.randomseed(tostring(os.time()):reverse():sub(1, 7))
    return o  
end  

function EquipmentSystem:Int() 
    local x = "ZB00"
    for i= 0 ,899 do
        --self.EquipmentList[tostring(i)] = 1514287152+i
        table.insert(self.EquipmentList,self:GetId(x))
        x = self:GetNextStrId(x) 
    end
    self.Equipment_Dota = EquipmentDota:Instance()

    self.Equipment_Dota:Int()

end
function EquipmentSystem:Instance()  
    if self.instance == nil then  
        self.instance = self:new()  
    end  
    return self.instance  
end 


--从物品池获得一个物品ID
function EquipmentSystem:GetEquipment() 
    local n = #self.EquipmentList
    --print("EquipmentList".."   "..tostring(n)) 
    local s = #self.UseEquipmentList
    --print("UseEquipmentList".."   "..tostring(s)) 
    table.insert(self.UseEquipmentList,self.EquipmentList[n])
    table.remove(self.EquipmentList)
    print("UseEquipmentList".."   "..tostring(s)) 
    --print("U=".."   "..tostring(self.UseEquipmentList[s+1])) 

    return  self.UseEquipmentList[s+1]
end
--将物品ID加入物品池
function EquipmentSystem:SetEquipment(num1) 
    local count = 0
    for i=#self.EquipmentList, 1, -1 do 
        if self.EquipmentList[i] == num1 then 
            count = 1
        end         
    end 
    if count == 0 then 
        table.insert(self.EquipmentList,num1)
    end   
    ------------------------------------
    for i=#self.UseEquipmentList, 1, -1 do 
        if self.UseEquipmentList[i] == num1 then 
            table.remove(self.UseEquipmentList,i) 
        end         
    end 
end
--根据物品ID获得物品数据
function EquipmentSystem:GetItemDota(num1) 
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
--设置原型
function EquipmentSystem:SetItemprototype(item1)  

    local item = {}
    setmetatable(item,Equipment) 

    item.Liliang =item1.Liliang
    item.ZhiHui =item1.ZhiHui
    item.MinJie = item1.MinJie
    item.GongJi =item1.GongJi
    item.HuJia =item1.HuJia
    item.YiDongSuDu =item1.YiDongSuDu
    item.GongJiSuDu =item1.GongJiSuDu
    item.ShengMingShangXian = item1.ShengMingShangXian
    item.ShengMingHuiFu = item1.ShengMingHuiFu
    item.MoFaShangXian = item1.MoFaShangXian
    item.MoFaHuiFu =item1.MoFaHuiFu
    item.MoFaKangXing =item1.MoFaKangXing
    item.ZiDingYi = item1.ZiDingYi
    item.Types = item1.Types
    item.PinZhi = item1.PinZhi
    item.Name = item1.Name
    item.TuBiao =item1.TuBiao
    item.Explain = item1.Explain
    return item
end 
--增加属性
function EquipmentSystem:AddItemAttribute(item1, item2)  
    item1.Liliang =item1.Liliang + item2.Liliang
    item1.ZhiHui =item1.ZhiHui+ item2.ZhiHui
    item1.MinJie = item1.MinJie+item2.MinJie
    item1.GongJi =item1.GongJi+ item2.GongJi
    item1.HuJia =item1.HuJia+ item2.HuJia
    item1.YiDongSuDu =item1.YiDongSuDu+ item2.YiDongSuDu
    item1.GongJiSuDu =item1.GongJiSuDu+ item2.GongJiSuDu
    item1.ShengMingShangXian = item1.ShengMingShangXian+item2.ShengMingShangXian
    item1.ShengMingHuiFu = item1.ShengMingHuiFu+item2.ShengMingHuiFu
    item1.MoFaShangXian = item1.MoFaShangXian+item2.MoFaShangXian
    item1.MoFaHuiFu =item1.MoFaHuiFu+ item2.MoFaHuiFu
    item1.MoFaKangXing =item1.MoFaKangXing+ item2.MoFaKangXing
    
    return item1 
end 
--添加前缀
function EquipmentSystem:AddItemPrefix(item1, item2)  
    item1.Liliang =item1.Liliang + item2.Liliang
    item1.ZhiHui =item1.ZhiHui+ item2.ZhiHui
    item1.MinJie = item1.MinJie+item2.MinJie
    item1.GongJi =item1.GongJi+ item2.GongJi
    item1.HuJia =item1.HuJia+ item2.HuJia
    item1.YiDongSuDu =item1.YiDongSuDu+ item2.YiDongSuDu
    item1.GongJiSuDu =item1.GongJiSuDu+ item2.GongJiSuDu
    item1.ShengMingShangXian = item1.ShengMingShangXian+item2.ShengMingShangXian
    item1.ShengMingHuiFu = item1.ShengMingHuiFu+item2.ShengMingHuiFu
    item1.MoFaShangXian = item1.MoFaShangXian+item2.MoFaShangXian
    item1.MoFaHuiFu =item1.MoFaHuiFu+ item2.MoFaHuiFu
    item1.MoFaKangXing =item1.MoFaKangXing+ item2.MoFaKangXing
    
    item1.Name = item2.Name.."——"..item1.Name
    return item1 
end 

--添加后缀
function EquipmentSystem:AddItemSuffix(item1, item2)  

    item1.Liliang =item1.Liliang + item2.Liliang
    item1.ZhiHui =item1.ZhiHui+ item2.ZhiHui
    item1.MinJie = item1.MinJie+item2.MinJie
    item1.GongJi =item1.GongJi+ item2.GongJi
    item1.HuJia =item1.HuJia+ item2.HuJia
    item1.YiDongSuDu =item1.YiDongSuDu+ item2.YiDongSuDu
    item1.GongJiSuDu =item1.GongJiSuDu+ item2.GongJiSuDu
    item1.ShengMingShangXian = item1.ShengMingShangXian+item2.ShengMingShangXian
    item1.ShengMingHuiFu = item1.ShengMingHuiFu+item2.ShengMingHuiFu
    item1.MoFaShangXian = item1.MoFaShangXian+item2.MoFaShangXian
    item1.MoFaHuiFu =item1.MoFaHuiFu+ item2.MoFaHuiFu
    item1.MoFaKangXing =item1.MoFaKangXing + item2.MoFaKangXing
    
    item1.Name = item2.Name..item1.Name
    
    return item1 
end 
function EquipmentSystem:GetName(item1)  
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
    local Ep = Ys..item1.Name.."|r"
    return Ep
end
--获取说明
function EquipmentSystem:GetExplain(item1)  
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
    --Ep = Ep..Ys.."自定义"..item1.ZiDingYi.."|r|n"
    Ep = Ep.."————————————".."|n"

    Ep = Ep..item1.Explain.."|n"

    return Ep
end    
--取一个数的整数部分
function EquipmentSystem:getIntPart(x)
    if x <= 0 then
       return math.ceil(x);
    end
    
    if math.ceil(x) == x then
       x = math.ceil(x);
    else
       x = math.ceil(x) - 1;
    end
    return x;
    end
--设置物品等级
function EquipmentSystem:SetItemlevel(item1,level)  
    local l = level/4
    local z = 1+math.random(10,25)/100
    --local xszd = z^l

    --local xszd = 0
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

    print("xszd1:"..xszd1)
    local xszd = level/12 +xszd1

    item1.Liliang =self:getIntPart(item1.Liliang * xszd*0.8)
    item1.ZhiHui =self:getIntPart(item1.ZhiHui* xszd*0.8)
    item1.MinJie = self:getIntPart(item1.MinJie* xszd*0.8)


    item1.GongJi =self:getIntPart(item1.GongJi* xszd*2)
    item1.HuJia =self:getIntPart(item1.HuJia* xszd*0.6)
    item1.YiDongSuDu =item1.YiDongSuDu
    item1.GongJiSuDu =item1.GongJiSuDu
    item1.ShengMingShangXian = self:getIntPart(item1.ShengMingShangXian* xszd*0.8)
    item1.ShengMingHuiFu = self:getIntPart(item1.ShengMingHuiFu* xszd*0.8)
    item1.MoFaShangXian = self:getIntPart(item1.MoFaShangXian* xszd*0.8)
    item1.MoFaHuiFu =self:getIntPart(item1.MoFaHuiFu* xszd*0.8)
    item1.MoFaKangXing =item1.MoFaKangXing
   -- item1.ZHUANGBEIDENGJI =item1.level

end
--属性过滤
function EquipmentSystem:ItemAttributeFilter(item1)  
    if (item1.ZiDingYi =="A") then --主手 装备
        --item1.Liliang =0
        --item1.ZhiHui =0
       -- item1.MinJie = 0
        --item1.GongJi =0
        item1.HuJia =0
        item1.YiDongSuDu =0
        --item1.GongJiSuDu =0
        --item1.ShengMingShangXian = 0
        ---item1.ShengMingHuiFu = 0
        --item1.MoFaShangXian = 0
       -- item1.MoFaHuiFu =0
        item1.MoFaKangXing =0
    elseif(item1.ZiDingYi =="B") then--副手装备
        --item1.Liliang =0
        --item1.ZhiHui =0
        --item1.MinJie = 0
        --item1.GongJi =0
        --item1.HuJia =0
        --item1.YiDongSuDu =0
        --item1.GongJiSuDu =0
        --item1.ShengMingShangXian = 0
        ---item1.ShengMingHuiFu = 0
        --item1.MoFaShangXian = 0
        --item1.MoFaHuiFu =0
        item1.MoFaKangXing =0
    elseif(item1.ZiDingYi =="C") then--头盔装备
        --item1.Liliang =0
        --item1.ZhiHui =0
        --item1.MinJie = 0
        item1.GongJi =0
        --item1.HuJia =0
        item1.YiDongSuDu =0
        item1.GongJiSuDu =0
        --item1.ShengMingShangXian = 0
        ---item1.ShengMingHuiFu = 0
        --item1.MoFaShangXian = 0
        --item1.MoFaHuiFu =0
        --item1.MoFaKangXing =0
    elseif(item1.ZiDingYi =="D") then--铠甲装备
        --item1.Liliang =0
        --item1.ZhiHui =0
        --item1.MinJie = 0
        item1.GongJi =0
        --item1.HuJia =0
        item1.YiDongSuDu =0
        --item1.GongJiSuDu =0
        --item1.ShengMingShangXian = 0
        ---item1.ShengMingHuiFu = 0
        --item1.MoFaShangXian = 0
        --item1.MoFaHuiFu =0
        --item1.MoFaKangXing =0
    elseif(item1.ZiDingYi =="E") then--披风装备
        --item1.Liliang =0
        --item1.ZhiHui =0
        --item1.MinJie = 0
        item1.GongJi =0
        item1.HuJia =0
        item1.YiDongSuDu =0
        item1.GongJiSuDu =0
        --item1.ShengMingShangXian = 0
        ---item1.ShengMingHuiFu = 0
        --item1.MoFaShangXian = 0
        --item1.MoFaHuiFu =0
        --item1.MoFaKangXing =0
    elseif(item1.ZiDingYi =="F") then--手套装备
        --item1.Liliang =0
        --item1.ZhiHui =0
        --item1.MinJie = 0
        --item1.GongJi =0
        --item1.HuJia =0
        item1.YiDongSuDu =0
        --item1.GongJiSuDu =0
        --item1.ShengMingShangXian = 0
        item1.ShengMingHuiFu = 0
        --item1.MoFaShangXian = 0
        item1.MoFaHuiFu =0
        item1.MoFaKangXing =0
    elseif(item1.ZiDingYi =="G") then--鞋装备
        --item1.Liliang =0
        --item1.ZhiHui =0
        --item1.MinJie = 0
        item1.GongJi =0
        item1.HuJia =0
        --item1.YiDongSuDu =0
        --item1.GongJiSuDu =0
        item1.ShengMingShangXian = 0
        ---item1.ShengMingHuiFu = 0
        item1.MoFaShangXian = 0
        --item1.MoFaHuiFu =0
        item1.MoFaKangXing =0
    elseif(item1.ZiDingYi =="H") then--面具装备
        --item1.Liliang =0
        --item1.ZhiHui =0
        --item1.MinJie = 0
        item1.GongJi =0
        --item1.HuJia =0
        --item1.YiDongSuDu =0
        --item1.GongJiSuDu =0
        --item1.ShengMingShangXian = 0
        ---item1.ShengMingHuiFu = 0
        --item1.MoFaShangXian = 0
        --item1.MoFaHuiFu =0
        item1.MoFaKangXing =0
    elseif(item1.ZiDingYi =="I") then--项链装备
        --item1.Liliang =0
        --item1.ZhiHui =0
        --item1.MinJie = 0
        item1.GongJi =0
        item1.HuJia =0
        item1.YiDongSuDu =0
        item1.GongJiSuDu =0
        --item1.ShengMingShangXian = 0
        ---item1.ShengMingHuiFu = 0
        --item1.MoFaShangXian = 0
        --item1.MoFaHuiFu =0
        --item1.MoFaKangXing =0
    elseif(item1.ZiDingYi =="J") then--饰品装备
        --item1.Liliang =0
        --item1.ZhiHui =0
        --item1.MinJie = 0
        item1.GongJi =0
        item1.HuJia =0
        item1.YiDongSuDu =0
        item1.GongJiSuDu =0
        --item1.ShengMingShangXian = 0
        ---item1.ShengMingHuiFu = 0
        --item1.MoFaShangXian = 0
        --item1.MoFaHuiFu =0
        item1.MoFaKangXing =0
    elseif(item1.ZiDingYi =="K") then--戒指装备
        --item1.Liliang =0
        --item1.ZhiHui =0
        --item1.MinJie = 0
        item1.GongJi =0
        item1.HuJia =0
        item1.YiDongSuDu =0
        item1.GongJiSuDu =0
        --item1.ShengMingShangXian = 0
        ---item1.ShengMingHuiFu = 0
        --item1.MoFaShangXian = 0
        --item1.MoFaHuiFu =0
        item1.MoFaKangXing =0
    end
end
--创建随机物品
function EquipmentSystem:CreateRandomItem(level)  
    local Rn = math.random(1,1000)
    --local Rn =5

    local x1 = math.random(1,11)
    local x2 = math.random(1,30)
    local item = self:SetItemprototype(self.Equipment_Dota.Items[x1][x2])
    item.ID = self:GetEquipment()
    
    local x = math.random(1,20)
    table.insert(self.Dota,item)

    if( 0 <= Rn and  Rn <= 10 ) then
        item.PinZhi = "神器"
        --1添加后缀
        self:AddItemSuffix(item,self.Equipment_Dota.Prefix[1][x]) 
        --1添加前缀
        self:AddItemPrefix(item,self.Equipment_Dota.Prefix[1][math.random(1,20)])
        --增加属性
        self:AddItemAttribute(item,self.Equipment_Dota.Prefix[1][math.random(1,20)]) 
        --增加属性
        self:AddItemAttribute(item,self.Equipment_Dota.Prefix[1][math.random(1,20)]) 
        --增加属性
        self:AddItemAttribute(item,self.Equipment_Dota.Prefix[1][math.random(1,20)]) 
    elseif(  10 <= Rn and  Rn <= 50  ) then   
        item.PinZhi = "史诗"
        --1添加后缀
        self:AddItemSuffix(item,self.Equipment_Dota.Prefix[1][x]) 
        --1添加前缀
        self:AddItemPrefix(item,self.Equipment_Dota.Prefix[1][math.random(1,20)])
        --增加属性
        self:AddItemAttribute(item,self.Equipment_Dota.Prefix[1][math.random(1,20)]) 
        --增加属性
        self:AddItemAttribute(item,self.Equipment_Dota.Prefix[1][math.random(1,20)]) 
    elseif(  50 <= Rn and  Rn <= 150  ) then   
        item.PinZhi = "精良"
        --1添加后缀
        self:AddItemSuffix(item,self.Equipment_Dota.Prefix[1][x]) 
        --1添加前缀
        self:AddItemPrefix(item,self.Equipment_Dota.Prefix[1][math.random(1,20)])
        --增加属性
        self:AddItemAttribute(item,self.Equipment_Dota.Prefix[1][x])  
    elseif(  150 <= Rn and  Rn <= 300  ) then 
        item.PinZhi = "优秀"
        --1添加后缀
        self:AddItemSuffix(item,self.Equipment_Dota.Prefix[1][x]) 
        --1添加前缀
        self:AddItemPrefix(item,self.Equipment_Dota.Prefix[1][math.random(1,20)])
    else
        item.PinZhi = "普通"
        --1添加后缀
        self:AddItemSuffix(item,self.Equipment_Dota.Prefix[1][x])

    end
    --print("ID为"..item.ID)
    --local x = math.random(1,20)
    --print("houzhui"..x)
    --print("houzhui1"..x1)
    --print("houzhui2"..x2)
    --1添加后缀
    --self:AddItemSuffix(item,self.Equipment_Dota.Prefix[1][x])
    --1添加前缀
    --self:AddItemPrefix(item,self.Equipment_Dota.Prefix[1][math.random(1,20)])
    --print("tubiaoyou"..#self.Equipment_Dota.TuBiao[item.Types])
    local sj = #self.Equipment_Dota.TuBiao[item.Types]
    item.TuBiao = self.Equipment_Dota.TuBiao[item.Types][math.random(1,sj)]
    print("level:"..level)
    print("item.ZHUANGBEIDENGJI:"..item.ZHUANGBEIDENGJI)
    item.ZHUANGBEIDENGJI =level
    print("level:"..level)
    print("item.ZHUANGBEIDENGJI:"..item.ZHUANGBEIDENGJI)
    self:SetItemlevel(item,level)  
    self:ItemAttributeFilter(item) 
    return item
end 

--创建指定物品
function EquipmentSystem:CreateAppointItem(item)  

    local itemc = self:SetItemprototype(item)
    itemc.ID = self:GetEquipment()
    itemc.ZHUANGBEIDENGJI = item.ZHUANGBEIDENGJI
    table.insert(self.Dota,itemc)

    return itemc
end 

--删除指定物品
function EquipmentSystem:RemoveAppointItem(item)  

    --local itemc = self:SetItemprototype(item)
    --itemc.ID = self:GetEquipment()
    --table.insert(self.Dota,itemc)
    self:SetEquipment(item.ID) 
    for i=#self.Dota, 1, -1 do 
        if self.Dota[i].ID == item.ID then 
            table.remove(self.Dota,i) 
        end         
    end 

    --return itemc
end 
----------------
return EquipmentSystem


--使用中装备表
--UseEquipmentList = {}

--未使用中装备表
--NoUseEquipmentList = {}

--s1 = EquipmentSystem:Instance()  
--s1:Int() 
--print(s1.EquipmentList[1]) 
--print(s1.EquipmentList[900]) 
--print(s1:GetStrId(1514287152) )
--print(s1:GetId("ZB00")   )

--local x = s1:CreateItem()
--x.PinZhi = "优秀"
--print(s1:GetExplain(x))
--for i= 1 ,9 do
    --print(s1:GetExplain(s1:CreateItem()))
--end
--local x = "ZB00"
--for i= 0 ,899 do
    
    --print(x )

    --x = s1:GetNextStrId(x) 
    
    --print(s1.Equipment_Dota.Items[1][i].Explain)
--end

--for i= 1 ,9 do
    --print(s1.Equipment_Dota.Prefix[1][i].Name)
    --print(s1.Equipment_Dota.Prefix[1][i].Explain)
--end

--print(s1:GetEquipment()) 
--print(s1:SetEquipment(1514288051))
--print(s1.GetEquipment()) 
--local count = 0
--for i=#s1.EquipmentList, 1, -1 do 
    --if t[i] == 3 then 
        --table.remove(t,i) 
    --end 
    --count = count +1
   -- print(s1.EquipmentList[i])
--end 
