require "Global"
require "UnitDota"
require "Item"
require "Bonus"

Hero = {
    --玩家ID
    PlayerID = 0,
    --单位ID
    UnitType = 0,
    --单位属性
    Unit_Dota = {} ,
    --装备表
    Equipment = {

    }, 
    --技能符文
    FuWenJieMian = "",

    ["技能1符文"] = 0,
    ["技能2符文"] = 0,
    ["技能3符文"] = 0,
    ["技能4符文"] = 0,
    ["技能5符文"] = 0,
    ["技能6符文"] = 0,
    ["技能7符文"] = 0,
}

function Hero:new(o)  
    o = o or {}  
    setmetatable(o,self)  
	self.__index = self 
	----
    --self.Unit_Dota  = {}
    setmetatable(self.Unit_Dota,UnitDota) 

    --创建装备
    s = string.byte("A",1)
    for i= 1 ,11 do
        self.Equipment[i] = {}
        setmetatable(self.Equipment[i],Item) 

        self.Equipment[i].ZiDingYi = string.char(s)
        print(self.Equipment[i].name)
        print(string.char(s))
        s = s+1
    end

	-----
    return o  
end 
Hero.__index=Hero
--穿戴装备
function Hero:SetItemprototype(item1)  
	self:AddAttribute(item1)
	local i = item1.ZiDingYi
	
	local x = self:GetEquipment(i)
	
    x:SetPrototype(item1)
    print(x.name)
    return x
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

--卸下装备
function Hero:RemoveItemprototype(item1)  
	local i = item1.ZiDingYi
	--print(item1.Name)
	local x = self:GetEquipment(i)

    self:RemoveAttribute(x )
    x:ClearPrototype()
    return x
end

--增加属性
function  Hero:AddAttribute(item1)
    local bu = Bonus:Instance()  
    self.Unit_Dota["力量"].value = self.Unit_Dota["力量"].value + item1.Liliang
    bu:UnitAddBonus(self.UnitType, 8, item1.Liliang )
    self.Unit_Dota["敏捷"].value = self.Unit_Dota["敏捷"].value + item1.MinJie
    bu:UnitAddBonus(self.UnitType, 9, item1.MinJie )
    self.Unit_Dota["智力"].value = self.Unit_Dota["智力"].value + item1.ZhiHui
    bu:UnitAddBonus(self.UnitType, 10, item1.ZhiHui )
 
    self.Unit_Dota["攻击力"].value = self.Unit_Dota["攻击力"].value + item1.GongJi
    bu:UnitAddBonus(self.UnitType, 2, item1.GongJi )
    self.Unit_Dota["护甲"].value = self.Unit_Dota["护甲"].value + item1.HuJia
    bu:UnitAddBonus(self.UnitType, 1, item1.HuJia)
    self.Unit_Dota["魔法抗性"].value = self.Unit_Dota["魔法抗性"].value + item1.MoFaKangXing
 
    self.Unit_Dota["生命值"].value = self.Unit_Dota["生命值"].value + item1.ShengMingShangXian
    bu:UnitAddBonus(self.UnitType, 6, item1.ShengMingShangXian )
    self.Unit_Dota["生命回复速度"].value = self.Unit_Dota["生命回复速度"].value + item1.ShengMingHuiFu
    bu:UnitAddBonus(self.UnitType, 4, item1.ShengMingHuiFu )
    self.Unit_Dota["魔法值"].value = self.Unit_Dota["魔法值"].value + item1.MoFaShangXian
    bu:UnitAddBonus(self.UnitType, 7, item1.MoFaShangXian )
    self.Unit_Dota["魔法回复速度"].value = self.Unit_Dota["魔法回复速度"].value + item1.MoFaHuiFu
    bu:UnitAddBonus(self.UnitType, 3, item1.MoFaHuiFu*100 )
 
    self.Unit_Dota["攻击速度"].value = self.Unit_Dota["攻击速度"].value + item1.GongJiSuDu
    bu:UnitAddBonus(self.UnitType, 5, item1.GongJiSuDu*100 )
     
    self.Unit_Dota["移动速度"].value = self.Unit_Dota["移动速度"].value + item1.YiDongSuDu
    bu:UnitSetSeed(self.UnitType,item1.YiDongSuDu)
    
    
    -- if self.Unit_Dota["移动速度"].value >500 then
    --     bu:SetUnitSeed(self.UnitType,500)
    -- else 
    --     bu:SetUnitSeed(self.UnitType,self.Unit_Dota["移动速度"].value)
    -- end
    
    self.Unit_Dota["法术强度"].value = self.Unit_Dota["法术强度"].value + item1.FSQD
 
    self.Unit_Dota["法术暴击强度"].value = self.Unit_Dota["法术暴击强度"].value + item1.FSBJ
    self.Unit_Dota["法术暴击几率"].value = self.Unit_Dota["法术暴击几率"].value + item1.FSBJJL
    self.Unit_Dota["物理暴击强度"].value = self.Unit_Dota["物理暴击强度"].value + item1.WLBJ
    self.Unit_Dota["物理暴击几率"].value = self.Unit_Dota["物理暴击几率"].value + item1.WUBJJL
 
    self.Unit_Dota["物理伤害减免"].value = self.Unit_Dota["物理伤害减免"].value + item1.WLJM
    self.Unit_Dota["法术伤害减免"].value = self.Unit_Dota["法术伤害减免"].value + item1.MFJM
    self.Unit_Dota["伤害减免"].value = self.Unit_Dota["伤害减免"].value + item1.SHJM
 
    self.Unit_Dota["法术吸血"].value = self.Unit_Dota["法术吸血"].value + item1.FSXX
    self.Unit_Dota["物理吸血"].value = self.Unit_Dota["物理吸血"].value + item1.WLXX    
   
end

function  Hero:RemoveAttribute(item1)
	local bu = Bonus:Instance()  
    self.Unit_Dota["力量"].value = self.Unit_Dota["力量"].value - item1.Liliang
    bu:UnitAddBonus(self.UnitType, 8, 0 - item1.Liliang )
    self.Unit_Dota["敏捷"].value = self.Unit_Dota["敏捷"].value - item1.MinJie
    bu:UnitAddBonus(self.UnitType, 9, 0 - item1.MinJie )
    self.Unit_Dota["智力"].value = self.Unit_Dota["智力"].value - item1.ZhiHui
    bu:UnitAddBonus(self.UnitType, 10, 0 - item1.ZhiHui )
 
    self.Unit_Dota["攻击力"].value = self.Unit_Dota["攻击力"].value - item1.GongJi
    bu:UnitAddBonus(self.UnitType, 2, 0 - item1.GongJi )
    self.Unit_Dota["护甲"].value = self.Unit_Dota["护甲"].value - item1.HuJia
    bu:UnitAddBonus(self.UnitType, 1, 0 - item1.HuJia)
    self.Unit_Dota["魔法抗性"].value = self.Unit_Dota["魔法抗性"].value - item1.MoFaKangXing
 
    self.Unit_Dota["生命值"].value = self.Unit_Dota["生命值"].value - item1.ShengMingShangXian
    bu:UnitAddBonus(self.UnitType, 6, 0 - item1.ShengMingShangXian )
    self.Unit_Dota["生命回复速度"].value = self.Unit_Dota["生命回复速度"].value - item1.ShengMingHuiFu
    bu:UnitAddBonus(self.UnitType, 4, 0 - item1.ShengMingHuiFu )
    self.Unit_Dota["魔法值"].value = self.Unit_Dota["魔法值"].value - item1.MoFaShangXian
    bu:UnitAddBonus(self.UnitType, 7, 0 - item1.MoFaShangXian )
    self.Unit_Dota["魔法回复速度"].value = self.Unit_Dota["魔法回复速度"].value - item1.MoFaHuiFu
    bu:UnitAddBonus(self.UnitType, 3, 0 - item1.MoFaHuiFu*100 )
 
    self.Unit_Dota["攻击速度"].value = self.Unit_Dota["攻击速度"].value - item1.GongJiSuDu
    bu:UnitAddBonus(self.UnitType, 5, 0 - item1.GongJiSuDu*100 )
     
    self.Unit_Dota["移动速度"].value = self.Unit_Dota["移动速度"].value - item1.YiDongSuDu
    bu:UnitSetSeed(self.UnitType,0 - item1.YiDongSuDu)
    -- if self.Unit_Dota["移动速度"].value >250 then
    --     bu:SetUnitSeed(self.UnitType,250)
    -- else 
    --     bu:SetUnitSeed(self.UnitType,self.Unit_Dota["移动速度"].value)
    -- end
    
    self.Unit_Dota["法术强度"].value = self.Unit_Dota["法术强度"].value - item1.FSQD
 
    self.Unit_Dota["法术暴击强度"].value = self.Unit_Dota["法术暴击强度"].value - item1.FSBJ
    self.Unit_Dota["法术暴击几率"].value = self.Unit_Dota["法术暴击几率"].value - item1.FSBJJL
    self.Unit_Dota["物理暴击强度"].value = self.Unit_Dota["物理暴击强度"].value - item1.WLBJ
    self.Unit_Dota["物理暴击几率"].value = self.Unit_Dota["物理暴击几率"].value - item1.WUBJJL
 
    self.Unit_Dota["物理伤害减免"].value = self.Unit_Dota["物理伤害减免"].value - item1.WLJM
    self.Unit_Dota["法术伤害减免"].value = self.Unit_Dota["法术伤害减免"].value - item1.MFJM
    self.Unit_Dota["伤害减免"].value = self.Unit_Dota["伤害减免"].value - item1.SHJM
 
    self.Unit_Dota["法术吸血"].value = self.Unit_Dota["法术吸血"].value - item1.FSXX
    self.Unit_Dota["物理吸血"].value = self.Unit_Dota["物理吸血"].value - item1.WLXX   

end
return Hero