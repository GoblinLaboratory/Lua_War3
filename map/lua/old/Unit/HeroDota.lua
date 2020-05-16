

HeroDota = { 
    ["天赋"] = {
        Name = "选择天赋",
        TuBiao = "ReplaceableTextures\\CommandButtons\\CMDBTNfuwen62.blp"
    },
    ["符文"] = {
        Name = "选择技能符文",
        TuBiao = "ReplaceableTextures\\CommandButtons\\CMDBTNfuwen61.blp"
    },
    ["H002"] = {
        Name = "人族战士",
        ["种族"] = "人族",
        ["天赋技能"] = "TF01",
        ["技能1"] = {
            Name = "符文-防御",
            Explain = "防御技能符文",
            ID = "A000",
            TuBiao = "ReplaceableTextures\\CommandButtons\\BTNDefend.blp",
            ["符文1"] ={
                Name =  "符文-防御壁垒",
                Explain = "当战士处于防御姿态时，增加格挡伤害到50%。",
                TuBiao = "ReplaceableTextures\\CommandButtons\\CMDBTNfuwen1.blp"
            },
            ["符文2"] ={
                Name =  "符文-钢铁意志",
                Explain = "受到攻击时每掉600血将移除一次负面效果，如果6秒内没有受到任何伤害重新开始计算。",
                TuBiao = "ReplaceableTextures\\CommandButtons\\CMDBTNfuwen2.blp"
            },
            ["符文3"] ={
                Name =  "符文-捍卫",
                Explain = "坚毅的保护者，使用手中的盾牌为自己和盟友构筑可靠的防御。防御姿态时不在减少移动速度和攻击速度。",
                TuBiao = "ReplaceableTextures\\CommandButtons\\CMDBTNfuwen3.blp"
            },
        },
        ["技能2"] = {
            Name = "符文-怒吼",
            Explain = "怒吼技能符文",
            ID = "A002",
            TuBiao = "ReplaceableTextures\\CommandButtons\\BTNBattleRoar.blp",
            ["符文1"] ={
                Name =  "符文-嘲讽",
                Explain = "施放怒吼时强制周围单位攻击自己。",
                TuBiao = "ReplaceableTextures\\CommandButtons\\CMDBTNfuwen1.blp"
            },
            ["符文2"] ={
                Name =  "符文-浴血奋战",
                Explain = "施放怒吼时增加25点移动速度，30点攻击速度。",
                TuBiao = "ReplaceableTextures\\CommandButtons\\CMDBTNfuwen2.blp"
            },
            ["符文3"] ={
                Name =  "符文-压制",
                Explain = "施放怒吼时减少敌方30%攻击力。",
                TuBiao = "ReplaceableTextures\\CommandButtons\\CMDBTNfuwen3.blp"
            },
        },
        ["技能3"] = {
            Name = "符文-命令光环",
            Explain = "命令光环技能符文",
            ID = "A004",
            TuBiao = "ReplaceableTextures\\PassiveButtons\\PASBTNGnollCommandAura.blp",
            ["符文1"] ={
                Name =  "符文-战争统领",
                Explain = "增加附近单位的30%攻击力。",
                TuBiao = "ReplaceableTextures\\CommandButtons\\CMDBTNfuwen1.blp"
            },
            ["符文2"] ={
                Name =  "符文-力量旗帜",
                Explain = "增加周围单位等级/2的力量。",
                TuBiao = "ReplaceableTextures\\CommandButtons\\CMDBTNfuwen2.blp"
            },
            ["符文3"] ={
                Name =  "符文-鲜血旗帜",
                Explain = "增加周围单位等级*30的生命上限。",
                TuBiao = "ReplaceableTextures\\CommandButtons\\CMDBTNfuwen3.blp"
            },
        },
        ["技能4"] = {
            Name = "符文-斩杀",
            Explain = "斩杀技能符文",
            ID = "A006",
            TuBiao = "ReplaceableTextures\\CommandButtons\\BTNCleavingAttack.blp",
            ["符文1"] ={
                Name =  "符文-势不可挡",
                Explain = "触发斩杀时增加移动速度和攻击。",
                TuBiao = "ReplaceableTextures\\CommandButtons\\CMDBTNfuwen1.blp"
            },
            ["符文2"] ={
                Name =  "符文-无畏",
                Explain = "发动斩杀时将免疫下一次伤害。",
                TuBiao = "ReplaceableTextures\\CommandButtons\\CMDBTNfuwen2.blp"
            },
            ["符文3"] ={
                Name =  "符文-浴血",
                Explain = "触发斩杀时回复被斩杀单位20%最大生命值的生命。",
                TuBiao = "ReplaceableTextures\\CommandButtons\\CMDBTNfuwen3.blp"
            },
        },
        ["技能5"] = {
            Name = "符文-盾击",
            Explain = "盾击技能符文",
            ID = "A001",
            TuBiao = "ReplaceableTextures\\CommandButtons\\BTNHumanArmorUpThree.blp",
            ["符文1"] ={
                Name =  "符文-冲锋",
                Explain = "对目标发动盾击后，战士将快速向其冲去,施放距离800。",
                TuBiao = "ReplaceableTextures\\CommandButtons\\CMDBTNfuwen1.blp"
            },
            ["符文2"] ={
                Name =  "符文-盾反",
                Explain = "300范围内任何对他进行攻击的单位都有可能受到伤害，并晕眩1.2秒。",
                TuBiao = "ReplaceableTextures\\CommandButtons\\CMDBTNfuwen2.blp"
            },
            ["符文3"] ={
                Name =  "符文-缴械",
                Explain = "使目标6秒内无法做出攻击动作。",
                TuBiao = "ReplaceableTextures\\CommandButtons\\CMDBTNfuwen3.blp"
            },
        },
        ["技能6"] = {
            Name = "符文-顺劈斩",
            Explain = "顺劈斩技能符文",
            ID = "A00F",
            TuBiao = "ReplaceableTextures\\CommandButtons\\BTNUnstableConcoction.blp",
            ["符文1"] ={
                Name =  "符文-重伤",
                Explain = "致残敌人（减少30移动速度）。友方单位对该目标进行攻击，能使他们回复所造成伤害一定百分比的生命。",
                TuBiao = "ReplaceableTextures\\CommandButtons\\CMDBTNfuwen1.blp"
            },
            ["符文2"] ={
                Name =  "符文-横扫攻击",
                Explain = "施放顺劈斩时将对附近的敌人造成伤害。",
                TuBiao = "ReplaceableTextures\\CommandButtons\\CMDBTNfuwen2.blp"
            },
            ["符文3"] ={
                Name =  "符文-无畏",
                Explain = "发动斩杀时将免疫下一次伤害。",
                TuBiao = "ReplaceableTextures\\CommandButtons\\CMDBTNfuwen3.blp"
            },
        },
        ["技能7"] = {
            Name = "符文-影舞者",
            Explain = "影舞者技能符文",
            ID = "A008",
            TuBiao = "ReplaceableTextures\\CommandButtons\\BTNMassTeleport.blp",
            ["符文1"] ={
                Name =  "符文-军团再临",
                Explain = "每个部下英魂拥有战士力量值*1.5的攻击力。",
                TuBiao = "ReplaceableTextures\\CommandButtons\\CMDBTNfuwen1.blp"
            },
            ["符文2"] ={
                Name =  "符文-戮力同心",
                Explain = "每个部下英魂拥存在的时间增加为3600秒。",
                TuBiao = "ReplaceableTextures\\CommandButtons\\CMDBTNfuwen2.blp"
            },
            ["符文3"] ={
                Name =  "符文-血源",
                Explain = "每个部下英魂返回战士身边时将会回复战士的生命值。",
                TuBiao = "ReplaceableTextures\\CommandButtons\\CMDBTNfuwen3.blp"
            },
        },
    }
    }

function HeroDota:new(o)  
    o = o or {}  
    setmetatable(o,self)  
	self.__index = self 
	----
    
	-----
    return o  
end 
HeroDota.__index=HeroDota

function HeroDota:Instance()  
    if self.instance == nil then  
        self.instance = self:new()  
    end  
    return self.instance  
end 

return HeroDota
