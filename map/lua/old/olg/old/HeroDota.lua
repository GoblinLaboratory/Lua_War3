

HeroDota = { 
    BaseGongJi = 0,
    BaseHuJia = 0,
    BaseLiLiang = 0,
    BaseMinJie = 0,
    BaseZhiLi = 0,
    LiLiangUp = 0,
    MinJieUp = 0,
    ZhiLiUp = 0,
    MoFaKangXing = 0,
    ShangHaiJianMian = 0,
    ShanBiJiLv = 0,
    GeDangJiLv = 0,
    --------
    
    GongJiQiangDu = 0,
    FaShuQiangDu = 0,
    WuLiBaoJiJiLv = 0,
    FaShuBaoJiJiLv = 0,
    XiXue = 0,
    FaShuXiXue = 0,
    YunQi = 0,

    --------
    Level = 0,
    ID = 0, 
    FuWen  = {},
    ["H002"] = { }
    }

function HeroDota:new(o)  
    o = o or {}  
    setmetatable(o,self)  
	self.__index = self 
	----
    self.FuWen[1] = "1"
    self.FuWen[2] = "1"
    self.FuWen[3] = "1"
    self.FuWen[4] = "1"
    self.FuWen[5] = "1"
    self.FuWen[6] = "1"
    self.FuWen[7] = "1"
    self.FuWen[8] = "1"
    self.FuWen[9] = "1"
    self.FuWen[10] = "1"
    self.FuWen[11] = "1"
    self.FuWen[12] = "1"
	-----
    return o  
end 
HeroDota.__index=HeroDota


HeroDotaList ={ Heros = {}}

function HeroDotaList:new(o)  
    o = o or {}  
    setmetatable(o,self)  
	self.__index = self 
	----

	-----
    return o  
end 


--定义元表的__index 的元方法  
--对任何找不到的键，都会返回'undefined'  
HeroDotaList.__index=HeroDotaList

function HeroDotaList:Instance()  
    if self.instance == nil then  
        self.instance = self:new()  
    end  
    return self.instance  
end 

function HeroDotaList:Int() 
    self.Heros[1] = HeroDota:new() 
    --setmetatable(self.Heros[1],HeroDotas) 
    --print(self.Heros[1].ID)
    self.Heros[1].ID = ""
    self.Heros[1].FuWen[1] = "反击：反弹伤害。"
    self.Heros[1].FuWen[2] = "盾墙：增加格挡伤害到50%。"
    self.Heros[1].FuWen[3] = "利刃风暴：防御姿态时不在减少移动速度和攻击速度。"

    self.Heros[1].FuWen[4] = "英勇：增加40点护甲。"
    self.Heros[1].FuWen[5] = "渴望战斗：增加25%攻击速度。"
    self.Heros[1].FuWen[6] = "激怒：把450范围内的敌方单位拖拽到战士前方。"

    self.Heros[1].FuWen[7] = "战意怒吼：增加30点生命回复速度和30%攻击速度。"
    self.Heros[1].FuWen[8] = "恐怖嚎叫：减少敌方30%攻击与7点护甲。"
    self.Heros[1].FuWen[9] = "狂暴怒吼：增加25点移动速度，攻击变为分裂攻击。"

    self.Heros[1].FuWen[10] = "处决：触发时增加移动速度和攻击。"
    self.Heros[1].FuWen[11] = "淘汰：触发时回复死亡单位百分比生命。"
    self.Heros[1].FuWen[12] = "破胆：触发时对周围敌军造成眩晕。"

end   

return HeroDotaList
