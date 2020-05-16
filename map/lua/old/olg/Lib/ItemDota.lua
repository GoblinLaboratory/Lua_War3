require "master/Item"

--Global
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
ZiDingYi = 0
Types = "物品"
PinZhi = "普通" 
Name = "名称"
TuBiao = "图标"
Explain = "说明"

ItemDota = {Items={},Prefix={},TuBiao = {}}  

function ItemDota:new(o)  
    o = o or {}  
    setmetatable(o,self)  
    self.__index = self  
    
    self:Int() 

    return o  
end  
--单例模式
function ItemDota:Instance()  
    if self.instance == nil then  
        self.instance = self:new()  
    end  
    return self.instance  
end 

function ItemDota:Int() 
    --物品前缀
    self.Prefix[1] = {}
    for i= 1 ,26 do
        self.Prefix[1][i]  = {}
        setmetatable(self.Prefix[1][i],Item) 
    end
    self.Prefix[1][1]:SetValue(Liliang, ZhiHui, MinJie,3,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu,MoFaKangXing, 1, 
    Types,"普通", "凶残","tb", Explain)

    self.Prefix[1][2]:SetValue(3, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu,MoFaKangXing, 1, 
    Types,"普通", "力量","tb", Explain)

    self.Prefix[1][3]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,20,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu,MoFaKangXing, 1, 
    Types,"普通", "疾风","tb", Explain)

    self.Prefix[1][4]:SetValue(Liliang,3, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.2,MoFaKangXing, 1, 
    Types,"普通", "智慧","tb", Explain)

    self.Prefix[1][5]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,3,MoFaShangXian,MoFaHuiFu,MoFaKangXing, 1, 
    Types,"普通","不屈","tb", Explain)

    self.Prefix[1][6]:SetValue(Liliang, ZhiHui, 3,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu,MoFaKangXing, 1, 
    Types,"普通", "敏捷","tb", Explain)

    self.Prefix[1][7]:SetValue(Liliang, 3, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,1, 
    Types,"普通", "智力","tb", Explain)

    self.Prefix[1][8]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu,50,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu,MoFaKangXing,1, 
    Types,"普通", "生命","tb", Explain)

    self.Prefix[1][9]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,MoFaHuiFu, MoFaKangXing,1, 
    Types,"普通", "魔力","tb", Explain)

    self.Prefix[1][10]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, 50,1,MoFaShangXian,MoFaHuiFu, MoFaKangXing,1, 
    Types,"普通", "坚韧","tb", Explain)

    self.Prefix[1][11]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,1,MoFaShangXian,MoFaHuiFu,MoFaKangXing, 1, 
    Types,"普通", "石匠","tb", Explain)

    self.Prefix[1][12]:SetValue(3, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu,MoFaKangXing, 1, 
    Types,"普通", "厚重","tb", Explain)

    self.Prefix[1][13]:SetValue(Liliang, ZhiHui, MinJie,6,HuJia,YiDongSuDu,0.2, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu,MoFaKangXing, 1, 
    Types,"普通",  "钟骨","tb", Explain)

    self.Prefix[1][14]:SetValue(Liliang, ZhiHui, MinJie,7,2,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,1, 
    Types,"普通", "暴君","tb", Explain)

    self.Prefix[1][15]:SetValue(Liliang, ZhiHui, MinJie,4,HuJia,20,0.2, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu,MoFaKangXing, 1, 
    Types,"普通", "闪光","tb", Explain)

    self.Prefix[1][16]:SetValue(Liliang, ZhiHui, MinJie,4,HuJia,20,0.2, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,1,  
    Types,"普通", "追风","tb", Explain)

    self.Prefix[1][17]:SetValue(6, ZhiHui, MinJie,5,HuJia,YiDongSuDu,0.2, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu,MoFaKangXing, 1, 
    Types,"普通", "逐日","tb", Explain)

    self.Prefix[1][18]:SetValue(2, ZhiHui, 4,3,HuJia,YiDongSuDu,0.2, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,1, 
    Types,"普通", "鲜血","tb", Explain)

    self.Prefix[1][19]:SetValue(4, ZhiHui, MinJie,3,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,1, 
    Types,"普通", "锯牙","tb", Explain)

    self.Prefix[1][20]:SetValue(Liliang, ZhiHui, MinJie,9,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu,MoFaKangXing, 1, 
    Types,"普通", "獠牙","tb", Explain)

    --主手 装备
    self.Items[1] = {}
    
    for i= 1 ,30 do
        self.Items[1][i] = {}
        setmetatable(self.Items[1][i],Item) 
    end
    self.Items[1][1]:SetValue(Liliang, ZhiHui, MinJie,4,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu,MoFaKangXing, "A", 
    "剑","普通","长剑","ReplaceableTextures\\CommandButtons\\BTNSteelMelee.blp","|cffff8080战士经典的武器选择，这把长剑杀起敌来既坚韧又牢靠。|r ")

    self.Items[1][2]:SetValue(Liliang, ZhiHui, MinJie,8,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu,MoFaKangXing, "A", 
    "剑","普通","大剑","ReplaceableTextures\\CommandButtons\\BTNArcaniteMelee.blp","|cffff8080一把能劈透盔甲的剑，通常是是蓄势待发的剑士的首选武器。|r ")

    self.Items[1][3]:SetValue(Liliang, ZhiHui, MinJie,8,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"A", 
    "剑","普通","重剑","ReplaceableTextures\\CommandButtons\\BTNArcaniteRanged.blp","|cffff8080一把能劈透盔甲的剑，通常是是蓄势待发的剑士的首选武器。|r ")

    self.Items[1][4]:SetValue(Liliang, ZhiHui, MinJie,6,HuJia,YiDongSuDu,0.1, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu,MoFaKangXing, "A", 
    "匕首","普通","之爪","ReplaceableTextures\\CommandButtons\\BTNShamanMaster.blp", "|cffff8080不要低估这里面藏着的小刀刃的伤害。 |r ")

    self.Items[1][5]:SetValue(Liliang, ZhiHui, MinJie,8,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu,MoFaKangXing, "A", 
    "斧","普通","掠夺","ReplaceableTextures\\CommandButtons\\BTNVorpalBlades.blp","|cffff8080这把巨斧能够劈开一整条山脉。  |r ")

    self.Items[1][6]:SetValue(Liliang, ZhiHui, 3,5,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu,MoFaKangXing, "A", 
    "剑","普通","之锋","ReplaceableTextures\\CommandButtons\\BTNNagaWeaponUp1.blp","|cffff8080强大的恶魔死后力量凝聚而成的产物，没有人能逃脱它的诅咒。|r ")

    self.Items[1][7]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu,MoFaKangXing,"A", 
    "匕首","普通","匕首","ReplaceableTextures\\CommandButtons\\BTNThoriumRanged.blp","|cffff8080传说中这块大陆上来去如风的刺客的首选武器。|r ")

    self.Items[1][8]:SetValue(Liliang, ZhiHui, 2,5,HuJia,YiDongSuDu,0.1, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"A", 
    "剑","普通","刀锋","ReplaceableTextures\\CommandButtons\\BTNNagaWeaponUp3.blp","|cffff8080恶魔军团的堕落首领所使用的武器，充满了邪恶的力量。|r ")

    self.Items[1][9]:SetValue(Liliang, ZhiHui,MinJie,6,HuJia,YiDongSuDu,0.1, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"A", 
    "剑","普通","切割","ReplaceableTextures\\CommandButtons\\BTNVorpalBlades.blp","|cffff8080元素位面的元素守卫使用的武器。|r ")
    
    self.Items[1][10]:SetValue(3, ZhiHui, MinJie,6,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"A", 
    "斧","普通","之斧","ReplaceableTextures\\CommandButtons\\BTNOrcMeleeUpOne.blp","|cffff8080兽人武士常使用的武器。|r ")

    self.Items[1][11]:SetValue(2, ZhiHui, MinJie,8,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu,MoFaKangXing, "A", 
    "斧","普通","战斧","ReplaceableTextures\\CommandButtons\\BTNSpiritWalkerMasterTraining.blp", "|cffff8080兽人武士常使用的武器。|r ")

    self.Items[1][12]:SetValue(2, ZhiHui,1,9,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu,MoFaKangXing, "A", 
    "剑","普通","之刃","ReplaceableTextures\\CommandButtons\\BTNThoriumMelee.blp",  "|cffff8080兽人武士常使用的武器。|r ")

    self.Items[1][13]:SetValue(Liliang, 1, 3,10,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"A", 
    "剑","普通","之链","ReplaceableTextures\\CommandButtons\\BTNPriestMaster.blp",  "|cffff8080这把名为钟骨之链的鞭剑是吸血鬼王族尤金Eugene最为钟爱的武器，它的刃下亡魂不记其数。|r ")

    self.Items[1][14]:SetValue(Liliang, ZhiHui, MinJie,10,HuJia,YiDongSuDu,0.15, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"A", 
    "剑","普通","狂暴者","ReplaceableTextures\\CommandButtons\\BTNOrcMeleeUpThree.blp","|cffff8080这把名为钟骨之链的鞭剑是吸血鬼王族尤金Eugene最为钟爱的武器，它的刃下亡魂不记其数。|r ")

    self.Items[1][15]:SetValue(4, ZhiHui, 1,5,HuJia,YiDongSuDu,0.1, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu,MoFaKangXing, "A", 
    "剑","普通", "碎石者","ReplaceableTextures\\CommandButtons\\BTNOrcMeleeUpThree.blp","|cffff8080这把长柄锤贯穿了两名敌军的身体和他们身后的坚固城门。|r ")

    self.Items[1][16]:SetValue(4, ZhiHui, MinJie,7,HuJia,15,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu,MoFaKangXing, "A", 
    "锤","普通","战锤","ReplaceableTextures\\CommandButtons\\BTNOrcMeleeUpThree.blp","|cffff8080出身土匪头子的铁壁Monolic莫诺里克喜欢和自己的挚友同在Monleston曼雷斯顿的土匪洗劫者Voulger沃吉尔不时聚在一起喝酒聊天。然而当曼雷斯顿第二次独立战争在即，莫诺里克却在一次喝酒的时候听到沃吉尔说自己要让曼雷斯顿的土匪势力投靠王军。莫诺里克顿时怒气上涌，愤怒地起身拿起手边的重锤，当着沃吉尔的毫不留情面地一锤砸烂了面前的下酒菜：“你把老子的兄弟当成什么了？你他妈的给老子滚！”|r ")

    self.Items[1][17]:SetValue(Liliang, ZhiHui, 4,7,HuJia,YiDongSuDu,0.15, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"A", 
    "弓","普通","之弓","tb","|cffff8080跟随老猎人几十年的武器。|r ")

    self.Items[1][18]:SetValue(Liliang, 2, 4,7,HuJia,YiDongSuDu,0.15, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"A", 
    "弓","普通","流星之弓","tb","|cffff8080阿切尔使用的大型长弓，弓身质地坚硬，非常难用。|r ")

    self.Items[1][19]:SetValue(Liliang, ZhiHui, 4,11,HuJia,YiDongSuDu,0.15, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"A", 
    "弓","普通", "弩","tb", "|cffff8080跟随老猎人几十年的武器。|r ")

    self.Items[1][20]:SetValue(Liliang, 7, MinJie,4,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,100,0.3, MoFaKangXing,"A", 
    "法杖","普通","法杖","ReplaceableTextures\\CommandButtons\\BTNOrcMeleeUpThree.blp","|cffff8080看上去就像一根树枝。|r ")

    self.Items[1][21]:SetValue(Liliang, 5, MinJie,5,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,150,0.25, MoFaKangXing,"A", 
    "法杖","普通", "魔杖","tb", "|cffff8080看上去就像一根树枝。|r ")

    self.Items[1][22]:SetValue(Liliang, 5, MinJie,3,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,100,0.2,MoFaKangXing, "A", 
    "法杖","普通", "短杖","tb",  "|cffff8080看上去就像一根树枝。|r ")

    self.Items[1][23]:SetValue(Liliang, 5, MinJie,7,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,150,0.2, MoFaKangXing,"A", 
    "法杖","普通", "头骨权杖","tb", "|cffff8080权杖包裹着逼人的寒气，据说，Ted泰德收服克拉伦斯后，将它的力量封印在这个权杖里。|r ")

    self.Items[1][24]:SetValue(Liliang, ZhiHui, 5,7,HuJia,YiDongSuDu,0.2, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"A", 
    "匕首","普通", "剃刀","tb","|cffff8080这是一把破旧的积满了胡渣的剃须刀……|r ")

    self.Items[1][25]:SetValue(Liliang, ZhiHui, 9,3,HuJia,YiDongSuDu,0.25, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"A", 
    "匕首","普通",  "窃魂匕首","ReplaceableTextures\\CommandButtons\\BTNDaggerOfEscape.blp", "|cffff8080密西欧斯Micious的圣教培养了一批杀人不眨眼的暗杀者，来进行一些特别的任务，尤里便是其中的一员，窃魂匕首也是暗杀者必备的武器。|r ")

    self.Items[1][26]:SetValue(Liliang, 7, MinJie,3,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,120,0.3,MoFaKangXing, "A", 
    "法杖","普通", "炼金术士之杖","tb", "|cffff8080炼金术士制作的一把的法杖，被誉为魔法与科学的完美结合。|r ")

    self.Items[1][27]:SetValue(Liliang, 7, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,100,0.2, MoFaKangXing, "A", 
    "法杖","普通", "冰息法杖","tb", "|cffff8080寒冰的力量。|r ")

    self.Items[1][28]:SetValue(Liliang, 7, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,100,0.2, MoFaKangXing, "A",  
    "法杖","普通", "恶魔树之株","tb", "|cffff8080恶魔树的树枝。|r ")

    self.Items[1][29]:SetValue(Liliang, ZhiHui, 4,7,HuJia,YiDongSuDu,0.2, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing, "A", 
    "弓","普通", "破风的圆舞曲","tb", "|cffff8080这是一把传奇的弓，却被巧妙的工匠墨菲格林改造成了一把风琴，但仍然不失原有的力量。|r ")

    self.Items[1][30]:SetValue(Liliang, ZhiHui, 4,7,HuJia,YiDongSuDu,0.2, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing, "A", 
    "弓","普通", "闪光","tb", "|cffff8080魔剑士伊萨诺克Ezranoak是Micious魔剑士团的团长，也是唯一可以与亚历克斯Alex抗衡的魔剑士。伊萨诺克喜欢使用造型奇特的弓，优雅而华丽地击败对手。|r ")

    --副手装备
    self.Items[2] = {}
    
    for i= 1 ,30 do
        self.Items[2][i] = {}
        setmetatable(self.Items[2][i],Item) 
    end
    self.Items[2][1]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu,MoFaKangXing, "B", 
    "盾","普通",  "圆盾","tb", "|cffff8080一个人的酒桶底盖，在另一个人手里就成了圆盾。|r ")

    self.Items[2][2]:SetValue(Liliang, 8, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.5,MoFaKangXing,  "B", 
    "书","普通", "暗黑法典","tb", "|cffff8080梅林Mehlin在书的封面这样写道：毫无疑问这是我在魔法学院地下书库里能看到的最为恶毒而致命的书。|r ")

    self.Items[2][3]:SetValue(4, ZhiHui, MinJie,GongJi,6,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing, "B", 
    "盾","普通", "介质护盾","tb", "|cffff8080Micious新兵亚历克斯Alex入伍不就就凭借着超人的体能和对魔法的掌握晋升为魔剑士团团员，并在年终对抗赛中凭借法术介质护盾和闪光大剑击败了众多候补生，但是由于某些原因一直没有继续晋升。|r ")

    self.Items[2][4]:SetValue(Liliang, 8, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,200,0.3, MoFaKangXing, "B", 
    "头骨","普通", "死而复生的暴君斯洛特Sloughter之颅","tb", "|cffff8080Micious“你看见了什么，快告诉我，”“……”“快说！”“一个……恶魔！”|r ")

    self.Items[2][5]:SetValue(4, 4,4,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,6,MoFaShangXian,0.2, MoFaKangXing, "B", 
    "书","普通", "英勇赞美诗","tb","|cffff8080Micious“死灵术士泰德Ted算是祈福之地的最强大的死灵术士，更是最强大的魔法师。他来到了FrostValley，率领他的死灵军团击败并俘虏了盘踞在此地的恶魔克拉伦斯Clarence，建立了自己的堡垒。泰德是个有闲情逸致的家伙，在建造堡垒的闲暇，完成了这本诗集。|r ")

    self.Items[2][6]:SetValue(9, ZhiHui, MinJie,9,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu,MoFaKangXing,  "B", 
    "头骨","普通", "米勒森的指骨","tb", "|cffff8080Micious米勒森，传说中的大力士，他的指骨被现在的某些格斗士们作为护符使用，但是他们却不知道它有着不可思议的力量。|r")

    self.Items[2][7]:SetValue(Liliang, ZhiHui, 15,25,HuJia,YiDongSuDu,0.5,150,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu,MoFaKangXing,  "B", 
    "匕首","普通", "屠龙匕首","tb", "|cffff8080所谓屠龙匕首，只是因为传闻这是一位勇士屠杀红龙使用的。但实际上这是吸血鬼利用龙卵和人血合成的祭祀道具。外表普通的匕首，却有着侵蚀使用者生命的功能。|r ")

    self.Items[2][8]:SetValue(5, 5, MinJie,18,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu,MoFaKangXing,  "B", 
    "骨头","普通", "克罗沙的复仇之眼","tb", "|cffff8080Micious伟大的刺客克罗沙临死前在自己的左眼上铸上了复仇的印记，后人挖掘出这只附魔的眼球来作为法力来源。|r ")

    self.Items[2][9]:SetValue(Liliang, ZhiHui, MinJie,25,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu,MoFaKangXing,  "B", 
    "匕首","普通","火焰使者","tb",  "|cffff8080Micious伟大的刺客克罗沙临死前在自己的左眼上铸上了复仇的印记，后人挖掘出这只附魔的眼球来作为法力来源。|r ")

    self.Items[2][10]:SetValue(Liliang, ZhiHui, 9,20,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing, "B", 
    "匕首","普通", "月蚀之刃","ReplaceableTextures\\CommandButtons\\BTNOrcMeleeUpThree.blp", "|cffff8080Micious经过月亮之泉的净水净化过的酸蚀匕首，现在，德鲁伊们常常用它来当做刻刀。|r ")

    self.Items[2][11]:SetValue(Liliang, ZhiHui,5,5,6,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing, "B", 
    "盾","普通", "神圣壁障","tb", "|cffff8080基于一面受损的天使之盾而制。这面天使盾牌刚刚出土不久，经鉴定，其历史可追溯至创世之初。|r ")

    self.Items[2][12]:SetValue(10, ZhiHui, MinJie,15,6,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing, "B", 
    "盾","普通",  "沃托亚的刺盾","tb", "|cffff8080恶魔铁匠沃托亚设计的这面盾牌能对攻击者造成巨大伤害。沿着盾牌表面竖起的黄铜尖刺让人不寒而栗，能让持盾者进行致命的反击。|r ")

    self.Items[2][13]:SetValue(3, 3, 3,5,7,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing, "B", 
    "盾","普通", "象牙塔","tb", "|cffff8080盾牌中回荡着天堂之歌。|r ")

    self.Items[2][14]:SetValue(6, ZhiHui, 9,GongJi,7,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing, "B", 
    "盾","普通", "不破之钢","tb", "|cffff8080名副其实的铜墙铁壁，阻挡任何想要伤害你的敌人。|r ")

    self.Items[2][15]:SetValue(4, 5, 3,8,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.6, MoFaKangXing, "B", 
    "骨头","普通", "祖尼玛萨的头骨串","tb", "|cffff8080身处险境时，她便会召来万灵，释放其中深藏的怒火。|r ")

    self.Items[2][16]:SetValue(3, 6, MinJie,9,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.4, MoFaKangXing, "B", 
    "骨头","普通", "深渊魔物","tb", "|cffff8080诞生于原始深渊的恐怖生物。只要看它一眼就足以让人陷入疯狂。|r")

    self.Items[2][17]:SetValue(2, 4, MinJie,8,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.2, MoFaKangXing, "B", 
    "骨头","普通", "恶念","tb", "|cffff8080敌人的命就在你的手里。|r ")

    self.Items[2][18]:SetValue(Liliang, ZhiHui, 5,15,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing, "B", 
    "匕首","普通",  "尤卡班毒蛇","tb", "|cffff8080尤卡班蛇的毒液能削弱这个世界与万灵之地的迷障阻隔。|r ")

    self.Items[2][19]:SetValue(Liliang, 9, MinJie,6,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.6, MoFaKangXing, "B", 
    "宝石","普通", "迦陀朵的原力之球","tb",  "|cffff8080只有秘法大师才能驾驭这颗法球的力量。|r ")

    self.Items[2][20]:SetValue(Liliang, 6, MinJie,3,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.5, MoFaKangXing, "B", 
    "宝石","普通", "黑暗之心","tb", "|cffff8080庇护之地的每一个人，心中都存有纯粹邪恶的一面，这也是人类拥有恶魔血统的铁证。我想应该有什么方法能够剥离出这股邪性并压制它。|r ")

    self.Items[2][21]:SetValue(Liliang, 6, MinJie,13,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.3, MoFaKangXing, "B", 
    "宝石","普通", "恩赐之光","tb", "|cffff8080在这个雕饰精美的仙塞火盆中，燃烧着冰冷而幽暗的火光。|r ")

    self.Items[2][22]:SetValue(Liliang, ZhiHui, 10,5,HuJia,YiDongSuDu,0.25, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing, "B", 
    "箭袋","普通",  "猎人的箭匣","tb", "|cffff8080这个盒状的箭匣装满了数十只箭矢，长度与样式十分奇特。箭头都是用野兽的利齿做成，大多数都可以辨认，但有少数箭头一看就来历不凡。|r ")

    self.Items[2][23]:SetValue(Liliang, ZhiHui,10,15,HuJia,YiDongSuDu,0.2, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing, "B", 
    "箭袋","普通", "造箭师的骄傲","tb", "|cffff8080这些箭矢的品质极高。即便是制箭名师贾森德也必须全力以赴才能造出这样的箭。|r ")

    self.Items[2][24]:SetValue(Liliang, ZhiHui, 10,15,HuJia,YiDongSuDu,0.2, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing, "B", 
    "箭袋","普通", "沸怒脊刺","tb", "|cffff8080目睹敌人血肉横飞，只会让猎魔人胸中的复仇怒火更加澎湃沸腾。|r ")

    self.Items[2][25]:SetValue(Liliang, 5, MinJie,13,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.2, MoFaKangXing, "B", 
    "骨头","普通", "死者遗物","tb", "|cffff8080在数不清的敌人面前，马特克斯没有逃走。他知道自己的死期就在眼前。他站在原地，射出一支又一支利箭，直到敌人渐渐地将他淹没。—《废土传说》|r ")

    self.Items[2][26]:SetValue(Liliang, ZhiHui, 10,15,HuJia,YiDongSuDu,0.2, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing, "B", 
    "箭袋","普通", "觅罪者","tb", "|cffff8080从这只箭袋中抽出的箭矢会本能地寻觅恶魔之血。|r ")

    self.Items[2][27]:SetValue(Liliang, 6, 2,13,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.3, MoFaKangXing, "B", 
    "骨头","普通", "马纳祖玛的血祭","tb", "|cffff8080马纳祖玛向这只死鸡里注入了许多魔法力量—这么做的动机，只有他知道。|r ")

    self.Items[2][28]:SetValue(Liliang, 6, MinJie,3,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.2, MoFaKangXing, "B", 
    "骨头","普通", "先知之手","tb", "|cffff8080Micious经过月亮之泉的净水净化过的酸蚀匕首，现在，德鲁伊们常常用它来当做刻刀。|r ")

    self.Items[2][29]:SetValue(3, 3, 1,5,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.3, MoFaKangXing, "B", 
    "骨头","普通", "骷髅钥匙","tb", "|cffff8080这把刀工复杂、齿牙横列的钥匙几乎什么锁都能打开。|r ")

    self.Items[2][30]:SetValue(3, 3, 1,5,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.3, MoFaKangXing, "B", 
    "骨头","普通", "骷髅钥匙","tb", "|cffff8080这把刀工复杂、齿牙横列的钥匙几乎什么锁都能打开。|r")

    --铠甲装备
    self.Items[3] = {}
    
    for i= 1 ,30 do
        self.Items[3][i] = {}
        setmetatable(self.Items[3][i],Item) 
    end
    self.Items[3][1]:SetValue(Liliang, ZhiHui, MinJie,GongJi,5,YiDongSuDu,GongJiSuDu, 50,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"D", 
    "铠甲","普通", "锁子甲","tb", "|cffff8080金属锁链编织成的锁链甲 |r ")

    self.Items[3][2]:SetValue(5, ZhiHui, MinJie,GongJi,5,YiDongSuDu,GongJiSuDu, ShengMingShangXian,6,MoFaShangXian,MoFaHuiFu,MoFaKangXing, "D", 
    "铠甲","普通",  "治愈装甲","tb", "|cffff8080强大的治愈能力。|r ")

    self.Items[3][3]:SetValue(7, ZhiHui, MinJie,GongJi,6,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"D", 
    "铠甲","普通",  "重力装甲","tb", "|cffff8080非常重的装甲|r ")

    self.Items[3][4]:SetValue(Liliang, 4, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,100,0.3, 20,"D", 
    "铠甲","普通", "魔牙外衣","tb", "|cffff8080巨大的力量在恶魔头骨中来回激荡。将它们穿戴上，摆放在靠近你心脏的位置，感受它们的黑暗魔法在你体内震动。|r ")

    self.Items[3][5]:SetValue(Liliang, ZhiHui, 4,GongJi,5,20,0.2, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"D", 
    "铠甲","普通", "阿什戴尔囊皮甲","tb", "|cffff8080脆弱的Rule的弓箭手们的专用护甲，可以有效保护她们免受致命伤的威胁。|r ")

    self.Items[3][6]:SetValue(2, ZhiHui, MinJie,GongJi,4,YiDongSuDu,GongJiSuDu, 50,4,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"D", 
    "铠甲","普通", "大地之灵","tb", "|cffff8080大地的魂灵是最强大的力量，任何东西都无法承受它。|r ")

    self.Items[3][7]:SetValue(3, 2, 3,GongJi,4,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"D", 
    "铠甲","普通", "不朽之王","tb", "|cffff8080不朽之王在其最后一战中所穿的铠甲。|r ")

    self.Items[3][8]:SetValue(Liliang, ZhiHui, MinJie,GongJi,4,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"D", 
    "铠甲","普通", "气场","tb", "|cffff8080御法者’是一种介于现实世界不同位面的存在，并创造了著名的黑色尖塔用以聚集御法者的力量。据说他甚至把这种可怕的力量融入到了自己设计的护甲之中。|r ")

    self.Items[3][9]:SetValue(Liliang, ZhiHui, MinJie,GongJi,4,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"D", 
    "铠甲","普通", "影劫","tb", "|cffff8080恐惧之地流传着关于猎魔人库奈的传说，据说此人能与暗影合而为一、神鬼莫测。|r ")

    self.Items[3][10]:SetValue(Liliang, ZhiHui, MinJie,GongJi,4,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"D", 
    "铠甲","普通", "尹娜的寰宇胸襟","tb",  "|cffff8080脆弱的Rule的弓箭手们的专用护甲，可以有效保护她们免受致命伤的威胁。|r ")

    self.Items[3][11]:SetValue(2, ZhiHui, 2,GongJi,4,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.3, MoFaKangXing,"D", 
    "铠甲","普通","霜魂","tb", "|cffff8080参照著名勇士博恩的胸甲而设计。他总是孤身杀入为数众多的敌军之中，从不顾忌自身的安危。|r ")

    self.Items[3][12]:SetValue(2, ZhiHui, 2,GongJi,4,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.3, MoFaKangXing,"D", 
    "铠甲","普通", "罗兰之胸","tb", "|cffff8080我的导师认为任何人都值得拯救。我曾经就是一名待拯救的灵魂，所以他拯救了我。这就是为什么我自豪地继承他的名号。一个伟人的名号。|r ")

    self.Items[3][13]:SetValue(2, ZhiHui, 2,GongJi,4,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.3, MoFaKangXing,"D", 
    "铠甲","普通", "阿克汉的胸甲","tb", "|cffff8080愿圣教军之心能得到具有惊世之力的胸甲保护，因为只有强大的内心才能激励他们在残酷的战场上一往无前。|r ")

    self.Items[3][14]:SetValue(2, ZhiHui, 2,GongJi,4,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.3, MoFaKangXing,"D", 
    "铠甲","普通", "亚拉基尔的甲壳","tb",  "|cffff8080亚拉基尔经常被描绘成一只蜘蛛，但关于他究竟有多少条腿，则一直争论不休。|r ")

    self.Items[3][15]:SetValue(2, ZhiHui, 2,GongJi,4,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.3, MoFaKangXing,"D",  
    "铠甲","普通", "荒原胸甲","tb","|cffff8080两个部落在荒原中爆发了一场大战，巨熊部落的纳萨尔走进了硝烟散去的战场。地上的尸体中并没有他熟悉的面孔，但他注意到，许多丧生者都磨尖了牙齿。在战场的死人堆里，他找到了这件胸甲。|r ")

    self.Items[3][16]:SetValue(2, ZhiHui, 2,GongJi,4,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.3, MoFaKangXing,"D", 
    "铠甲","普通", "奥吉德的统领","tb", "|cffff8080制作这件铠甲的初衷是为了能够同时彰显出奥吉德的狂野和高贵。|r ")

    self.Items[3][17]:SetValue(2, ZhiHui, 2,GongJi,4,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.3, MoFaKangXing,"D",  
    "铠甲","普通", "乌莲娜的心境","tb", "|cffff8080究其根本，她并未将自己被逐出教会一事视为惩罚，因为她坚信武僧真正的使命在于启迪众生，而非置身事外。|r ")

    self.Items[3][18]:SetValue(2, ZhiHui, 2,GongJi,4,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.3, MoFaKangXing,"D", 
    "铠甲","普通", "圣光之心","tb", "|cffff8080圣教军安娜金知道，对圣光的追寻将是她一生中最大的考验。她热切地拥抱了自己命运的安排。|r ")

    self.Items[3][19]:SetValue(2, ZhiHui, 2,GongJi,4,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.3, MoFaKangXing,"D", 
    "铠甲","普通", "真理甲胄","tb", "|cffff8080即便是赞美他的高超魔法技艺，也只会使他变得更加怒不可遏。|r ")

    self.Items[3][20]:SetValue(2, ZhiHui, 2,GongJi,4,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.3, MoFaKangXing,"D",  
    "铠甲","普通", "黑棘的战袍","tb","|cffff8080国王的军队在威斯特玛败北后，黑棘男爵及其麾下骑士们截断了他们的退路。他们被迫要在投降与就地战死之间做出抉择。|r ")

    self.Items[3][21]:SetValue(2, ZhiHui, 2,GongJi,4,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.3, MoFaKangXing,"D", 
    "铠甲","普通", "不死鸟","tb", "|cffff8080它们的魔法结构非常先进，可看上去却又相当的古老。|r ")

    self.Items[3][22]:SetValue(2, ZhiHui, 2,GongJi,4,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.3, MoFaKangXing,"D", 
    "铠甲","普通", "掠夺者的甲壳","tb", "|cffff8080我们可以身披恶魔的躯壳，超越人类，化身为连恶魔也要惧怕的梦魇，在它们之间散布混乱与死亡。|r ")

    self.Items[3][23]:SetValue(2, ZhiHui, 2,GongJi,4,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.3, MoFaKangXing,"D",  
    "铠甲","普通", "黄金之肤","tb", "|cffff8080金色的光芒冲散了邪恶之地的黑暗。|r ")

    self.Items[3][24]:SetValue(2, ZhiHui, 2,GongJi,4,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.3, MoFaKangXing,"D", 
    "铠甲","普通", "怒涛之心","tb", "|cffff8080心如止水万念消，冷面无色藏怒涛。|r ")

    self.Items[3][25]:SetValue(2, ZhiHui, 2,GongJi,4,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.3, MoFaKangXing,"D", 
    "铠甲","普通", "燃火外套","tb", "|cffff8080穿此甲者，狱火不侵。|r ")

    self.Items[3][26]:SetValue(2, ZhiHui, 2,GongJi,4,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.3, MoFaKangXing,"D",  
    "铠甲","普通", "摄政仁君之铠","tb", "|cffff8080尤伊自称摄政仁君，因为他真的认为自己仁慈爱民。当然，他已经疯得不轻了。|r ")

    self.Items[3][27]:SetValue(2, ZhiHui, 2,GongJi,4,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.3, MoFaKangXing,"D", 
    "铠甲","普通", "钢铁之心","tb","|cffff8080奥蕾娜的祝福之铠最终传给了她的徒弟，后者也自豪地随时将其穿戴在身。尽管她继承了师父的名号，但她后来还是以另外一个完全不同的称号闻名于世。|r ")

    self.Items[3][28]:SetValue(2, ZhiHui, 2,GongJi,4,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.3, MoFaKangXing,"D", 
    "铠甲","普通", "莱德瑞姆之氅","tb", "|cffff8080莱德瑞姆是一个鲜为人知的法师组织，一直致力于研究最为高深莫测的魔法，但其成员后来全都神秘惨死。|r ")

    self.Items[3][29]:SetValue(2, ZhiHui, 2,GongJi,4,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.3, MoFaKangXing,"D", 
    "铠甲","普通", "祭礼束衣","tb", "|cffff8080光明磊落者无所畏惧。|r ")

    self.Items[3][30]:SetValue(2, ZhiHui, 2,GongJi,4,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,0.3, MoFaKangXing,"D",  
    "铠甲","普通", "胜利盔甲","tb","|cffff8080作为混沌灾星的配偶，她迅速、残酷、狡猾的屠虐生命。除了香气，走过不留一丝痕迹。以此，来庆祝那大屠杀。|r ")

    --头盔装备
    self.Items[4] = {}
    
    for i= 1 ,30 do
        self.Items[4][i] = {}
        setmetatable(self.Items[4][i],Item) 
    end
    self.Items[4][1]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通", "头盔","tb", "|cffff8080钢铁头盔 |r ")

    self.Items[4][2]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通","支配者之冠","tb", "|cffff8080斯维克的猎人们发明了一种可以和野兽沟通的预言，听起来似乎很神秘，不过，的确它的发音很难学。|r ")

    self.Items[4][3]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通", "麻痹头盔","tb", "|cffff8080一个画着奇怪符号的头盔，戴上之后，让人难以感受到肉体的疼痛。|r ")

    self.Items[4][4]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通","振奋头盔","tb", "|cffff8080“我的狂怒，你们招架不住！”洗劫者沃吉尔Voulger。|r ")

    self.Items[4][5]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通", "魔牙头盔","tb", "|cffff8080当杰拉姆的家人惨遭卡兹拉屠戮之后，他制作了这副可怕的面具准备复仇。那些经过被毁的卡兹拉村庄的人，只要看见有吃的只剩半个脑袋、中毒肿胀或被火烧焦的尸体，就知道这一定是杰拉姆的杰作。|r ")

    self.Items[4][6]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通", "圣光之冠","tb", "|cffff8080有些圣教军是在对抗黑暗，而圣教军安娜金则在追寻光明。|r ")

    self.Items[4][7]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通", "盲眼颅盔","tb",  "|cffff8080维尔的妄想最终严重到无所不有的程度。在其统治被暴动终结之前，他要求制造一件防具，用以抵挡敌人对他进行连续的物理攻击。|r ")

    self.Items[4][8]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通", "天谴仪容","tb","|cffff8080猎人的所思所想必须与恶魔的意志完全同步。只有那样，你才能在最有力的时机直取敌人的命门。稍有松懈，就意味着死亡。|r ")

    self.Items[4][9]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通", "玉魂师的智慧","tb","|cffff8080每一个昂巴鲁人都知道图卡姆，也就是著名的玉魂师。这位巫医之所以声名远播，是因为他穿戴了一身亲手雕琢的碧玉护甲，他相信碧玉能使他的心智更加透彻，与灵魂之间的联结更加紧密。|r ")

    self.Items[4][10]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通","普莱姆斯之冠","tb", "|cffff8080和平守卫者拉达乌曾是一个非凡的存在，他掌控着时间的力量。不幸的是，这常常让他陷入迷惑的状态，最终导致自己死在了邪教徒维斯手上，珍贵的普莱姆斯之冠也被后者据为己有。|r ")

    self.Items[4][11]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通", "风暴乌鸦","tb", "|cffff8080海天分离时，风暴乌鸦从雷云中出，赐予人类驾驭火焰的能力。|r ")

    self.Items[4][12]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通", "执法官","tb", "|cffff8080最强大的魔法师们都明白，潜心习法对自己的提升有多重要。这顶帽子正适合那些既想展示自身力量又注重着装格调的人。|r ")

    self.Items[4][13]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通", "丝绒羽冠","tb", "|cffff8080这副华丽夺目的头饰是多年以前由一位独具匠心的哈拉卡斯法师制作的，用来在和平峰会上代表她的部族与萨兰德什一族表示友好。这副头饰优异的导电效果在战斗中深具实效，其实只是一个美好的意外；不过当谈判破裂双方大打出手时，它的超强能力让对方吃尽了苦头。|r ")

    self.Items[4][14]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通", "法尊","tb", "|cffff8080戴上它的人将得到强大的力量，同时也会显得更加时尚前卫。|r ")

    self.Items[4][15]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通", "大法师的回响","tb","|cffff8080哈！我差点死在敌人手上的次数多了去了，那只不过第一次罢了。|r ")

    self.Items[4][16]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通", "黑法师的遮阳帽","tb", "|cffff8080撒瑞圣所的卷轴语焉不详地记录了黑法师加雷什的邪恶行径。这顶帽子上的符文能证明这就是他的遗物吗？|r ")

    self.Items[4][17]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通", "狮首皮盔","tb", "|cffff8080若看清弱点，一击便足够。|r ")

    self.Items[4][18]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通", "灵主之环","tb", "|cffff8080神的愤怒是一回事，但你应该害怕神无法预测的幽默感。|r ")

    self.Items[4][19]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通", "领主战冠","tb", "|cffff8080正义之人追求美德就像幼崽追求赞美。|r ")

    self.Items[4][20]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通", "梦魇战盔","tb", "|cffff8080天意命定如羽翅让人行动更加电掣风驰。|r ")

    self.Items[4][21]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通", "灵能之笼","tb","|cffff8080她的眼神冷酷，热血为之冻结、傲骨为之崩解。|r ")

    self.Items[4][22]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通", "箴言战冠","tb", "|cffff8080所有的规则都有例外。|r ")

    self.Items[4][23]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通", "艾兹麦坚盔","tb", "|cffff8080除去所有的敌人之后，还剩下什麽会让你感到恐惧？|r ")

    self.Items[4][24]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通", "绣领之盔","tb", "|cffff8080雷姆诺看似迷茫，冷若寒霜，实则复仇心切，炽热生光。|r ")

    self.Items[4][25]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通", "熊首皮盔","tb", "|cffff8080不怕鼠辈的小卒把死者头盔塞满老鼠当老鼠啃光此人颅骨原本项上人头之处空虚恶臭，鼠辈满住！   |r ")

    self.Items[4][26]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通", "操灵者之冠","tb", "|cffff8080「君临四海从未一蹴可及，统治万民亦须恩威并济。- 切特斯大帝|r ")

    self.Items[4][27]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通", "藤蔓之冠","tb", "|cffff8080让他将你刺穿，让血液流出。让你的灵魂有更多生长的空间。|r ")

    self.Items[4][28]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通", "月影之冠","tb", "|cffff8080躯体伤疤，难以忘怀，心灵创痕，不成罣碍。|r ")

    self.Items[4][29]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通", "破城之盔","tb", "|cffff8080笼罩在他的红色光辉之下，我们的肌肤化成了灰烬。此物品能够透过索伏的祝福改造。  |r ")

    self.Items[4][30]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"C", 
    "头盔","普通", "清视护盔","tb", "|cffff8080随处漫步使我们疲乏困顿，周游各地让我们增广见闻。|r ")

    --面具装备
    self.Items[5] = {}
    for i= 1 ,30 do
        self.Items[5][i] = {}
        setmetatable(self.Items[5][i],Item) 
    end

    self.Items[5][1]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, 50,2,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"H", 
    "面具","普通", "阴森森的凶暴假面","tb", "|cffff8080一个看上去造型诡异的小丑面具，看上去令人有种背部发凉的感觉。据说是在一个旧仓库的地下室找到的。|r ")

    self.Items[5][2]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, 50,2,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"H", 
    "面具","普通", "面具","tb", "|cffff8080钢铁面具 |r ")

    self.Items[5][3]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, 50,2,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"H", 
    "面具","普通", "先知面具","tb","先知的面具")

    self.Items[5][4]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.2, MoFaKangXing,"H", 
    "面具","普通", "幽魂面纱","tb", "|cffff8080学会隐蔽自己是刺客的基本中的基本……”死刑幻境被任命为Micious的刺客与特务机关的负责人之一。 |r ")

    self.Items[5][5]:SetValue(Liliang, 3, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.2, MoFaKangXing,"H", 
    "面具","普通", "祖尼玛萨之视","tb", "|cffff8080祖尼玛萨的长者灵魂会向这副面具的佩戴者揭示，这个世界从万灵之地诞生的过程。|r ")

    self.Items[5][6]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.2, MoFaKangXing,"H", 
    "面具","普通", "杰拉姆的面具","tb", "|cffff8080很久以前，一位法力高强的的巫医名叫杰拉姆。由于其家人惨遭卡兹拉毒手，他向卡兹拉部族发起了一个人的战争。为了实现他的复仇，杰拉姆制作了这副可怕的面具，能召唤各种野兽和行尸助其作战。那些经过被毁的卡兹拉村庄的人，只要看见有吃的只剩半个脑袋、中毒肿胀或被火烧焦的尸体，就知道这一定是杰拉姆的杰作。|r ")

    self.Items[5][7]:SetValue(Liliang, ZhiHui, 4,GongJi,HuJia,YiDongSuDu,GongJiSuDu, 50,2,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"H", 
    "面具","普通", "狞笑死神","tb", "|cffff8080死神有许多种表情。|r ")

    self.Items[5][8]:SetValue(Liliang, ZhiHui, 3,GongJi,HuJia,YiDongSuDu,GongJiSuDu, 50,2,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"H", 
    "面具","普通", "羽蛇神面","tb", "|cffff8080奥克萨兹部落会将所有被蛇咬的孩子送到丛林中去，接受伟大的羽蛇神的裁决。能活着回来的孩子才有资格接受圣法的训练。 |r ")

    self.Items[5][9]:SetValue(Liliang, ZhiHui, 3,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"H", 
    "面具","普通",  "开叉獠牙","tb", "|cffff8080能召唤特刚泽长牙巨兽的力量。|r ")

    self.Items[5][10]:SetValue(Liliang, 3, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"H", 
    "面具","普通", "姬月之面","tb", "|cffff8080万灵之地的守护者—永恒的姬月会赐福给真正的勇士，将她的子民们赐予给他。|r ")

    self.Items[5][11]:SetValue(Liliang, 3, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.2, MoFaKangXing,"H", 
    "面具","普通", "邪毒狂欢","tb", "|cffff8080在托拉然丛林的边上座落着伊米尔森湖。昂巴鲁人吹箭上的毒液就是取自那里的毒棕榈。这副精美的面具正是由这种棕榈雕刻而成，一滴滴毒性猛烈的树汁从中渗出，为穿戴这副面具的巫医提供了既新鲜又浓烈的毒液来源。|r ")

    self.Items[5][12]:SetValue(2, ZhiHui, 2,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"H", 
    "面具","普通", "提克兰凶相","tb", "|cffff8080埃诺巴克哈的凶恶面相，他是偏远小村提克兰的灵魂之父。|r ")

    self.Items[5][13]:SetValue(3, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"H", 
    "面具","普通", "灼天之面","tb", "|cffff8080这副面具有着一张令人生畏的面孔，据说其空洞的双眼能显示出敌人的命运。不过，这启示没什么用处，因为绝大多数的对手都活不了那么久。|r ")

    self.Items[5][14]:SetValue(3, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, 50,2,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"H", 
    "面具","普通", "守护者的凝视","tb", "|cffff8080仿照一位臭名昭著的守护者的头盔所制。守护者就是用它来防止其心智被敌人操控。|r ")

    self.Items[5][15]:SetValue(Liliang, 2, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.2, MoFaKangXing,"H", 
    "面具","普通", "凯恩的洞察","tb", "|cffff8080这顶桂冠代表着学者迪卡德·凯恩的博学与智慧。|r ")

    self.Items[5][16]:SetValue(Liliang, 2,2,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"H", 
    "面具","普通", "雾隐面具","tb","|cffff8080德尔西尼曾说这副面具是自己的旷世杰作，结果竟被他自己拆了，哭着说要全盘重做。不久之后，他的杰作消失了，德尔西尼也没了踪影。 |r ")

    self.Items[5][17]:SetValue(2, ZhiHui, 2,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"H", 
    "面具","普通", "掠夺者的仪容","tb", "|cffff8080我们将自己的杀意、恶魔的怒火、野兽的愤怒转化为力量。我们也就成为了毁灭的化身。|r ")

    self.Items[5][18]:SetValue(Liliang, 4, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"H", 
    "面具","普通","佩什科夫之眼","tb", "|cffff8080凡眼若闭，心眼自开。|r ")

    self.Items[5][19]:SetValue(Liliang, 4, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"H", 
    "面具","普通", "至善之眼","tb", "|cffff8080至善之人，邪魔不侵。|r ")

    self.Items[5][20]:SetValue(Liliang, ZhiHui, 4,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"H", 
    "面具","普通", "死神面罩","tb", "|cffff8080我认为天使并非阿努真正的继承者，人类才是。在祖神摒弃自我实体中的黑暗面时，真正的邪恶与痛苦应运而生。我们不该像阿努那样抛弃自己的黑暗面，相反要拥抱我们内在的魔性……从而变得更加强大。|r ")

    self.Items[5][21]:SetValue(4, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"H", 
    "面具","普通", "暮光面甲","tb", "|cffff8080最后一位坚守荣誉的战士的头盔。很久以前，他曾巡行于遥远的东方，终身奉行他的荣誉准则。|r ")

    self.Items[5][22]:SetValue(Liliang, 2, 1,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"H", 
    "面具","普通", "罗兰之面","tb", "|cffff8080时光虽然逝去，但导师的音容笑貌以及他为我做的一切，这些回忆永远不会消褪，相反会愈加鲜明。我发誓，他的名号绝不会被人忘记。|r ")

    self.Items[5][23]:SetValue(Liliang, 5, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"H", 
    "面具","普通", "盲信面甲","tb", "|cffff8080不要轻信双眼，它们会欺骗你。|r ")

    self.Items[5][24]:SetValue(5, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"H", 
    "面具","普通","弑君之面","tb", "|cffff8080无光之界，无声之域，一双无视线的眼睛，啃食着你的痛楚。|r ")

    self.Items[5][25]:SetValue(Liliang, 2, 2,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.2, MoFaKangXing,"H", 
    "面具","普通", "祸鸦之面","tb","|cffff8080「遨翔的海鸥导引着先祖之途，让那残缺、无用的躯体回归尘土。即使人生本是虚无，却也不应陷於迷雾。」- 冈姆军师拉维安加|r ")

    self.Items[5][26]:SetValue(3, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"H", 
    "面具","普通", "黄金之面","tb", "|cffff8080冰霜严寒，他的赤足伤痕布满，雷霆万钧，他的心念无法动弹，恶火猛烈，情人容颜化为飞灰，此时他才终於奋起复仇，猛攻不退。- 萨恩的维多里奥着作「猎龙记」|r ")

    self.Items[5][27]:SetValue(Liliang, 3, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"H", 
    "面具","普通", "节庆之面","tb", "|cffff8080结群聚众必然生成暴力之源。|r ")

    self.Items[5][28]:SetValue(3, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"H", 
    "面具","普通", "铁锻之面","tb", "|cffff8080玛拉凯的魂魄碎片，唤醒第一位永恒守卫。 |r ")

    self.Items[5][29]:SetValue(Liliang,4, 2,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"H", 
    "面具","普通",  "古内斯之面","tb", "|cffff8080猎魔人古内斯从不愿提及这顶面具的来历。有人说它藏有遭受他复仇折磨的恶魔精华。还有人说这顶面具就是导致他败亡的真凶。|r ")

    self.Items[5][30]:SetValue(Liliang, ZhiHui, 2,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.2, MoFaKangXing,"H", 
    "面具","普通", "背叛者的仪容","tb", "|cffff8080感受这……被囚禁了一万年的愤怒！ |r ")

    --项链装备
    self.Items[6] = {}
    for i= 1 ,30 do
        self.Items[6][i] = {}
        setmetatable(self.Items[6][i],Item) 
    end

    self.Items[6][1]:SetValue(2, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, 50,2,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"I", 
    "项链","普通", "亚历克斯Alex呐喊者","tb", "|cffff8080这是亚历克斯送给苏菲亚的一款防护项链，用于保护她免受伤害，使用咒语很简单，跟我一起念****。 |r ")

    self.Items[6][2]:SetValue(Liliang, ZhiHui, 2,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.2, MoFaKangXing,"I", 
    "项链","普通", "鹰眼吊坠","tb", "|cffff8080视野之外，是眼之内……”Sylvia西维亚。|r ")

    self.Items[6][3]:SetValue(Liliang, 3, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, 50,2,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"I", 
    "项链","普通", "达莲娜的护身符","tb", "|cffff8080康那理惟士Cornelius是Rockta近卫骑士团副团长。这个作战经验丰富的老光棍，被新一任的国王威廉William任命为Monleston战区首席指挥官。临行前夜女仆达莲娜送给了他一个精致的护身符，为他祈求平安。|r ")

    self.Items[6][4]:SetValue(2, ZhiHui, 2,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"I", 
    "项链","普通", "黎明护符","tb", "|cffff8080太阳神遗失的纽扣 |r ")

    self.Items[6][5]:SetValue(3, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, 50,2,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"I", 
    "项链","普通", "黑棘的敦克雷十字章","tb", "|cffff8080敦克雷十字章只颁发给那些率领麾下骑士护国有功的贵族。|r ")

    self.Items[6][6]:SetValue(2, 2, 2,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"I", 
    "项链","普通", "旅者之誓","tb", "|cffff8080冒险的精神永不会磨灭。|r ")

    self.Items[6][7]:SetValue(5, 5, 5,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"I", 
    "项链","普通","地狱火护符","tb", "|cffff8080用地狱火护符表彰那些不惜付出高昂代价，誓死将恶魔天灾逐出庇护之地的勇士们。|r ")

    self.Items[6][8]:SetValue(Liliang, ZhiHui, 4,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"I", 
    "项链","普通", "兵要护符","tb", "|cffff8080活用以退为进、诱敌深入之法乃此护符精髓。先以哀兵示弱，诱敌乘胜追击。当其中计欲逃时，用此护符即可悉数围歼。|r ")

    self.Items[6][9]:SetValue(Liliang, 4, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.2, MoFaKangXing,"I", 
    "项链","普通", "月光护符","tb", "|cffff8080月光簇拥着与万灵同行的勇士。|r ")

    self.Items[6][10]:SetValue(Liliang, 2, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"I", 
    "项链","普通", "玛拉的万花筒","tb", "|cffff8080撒瑞圣所的殿堂内一直有关于它的传闻在暗中流传，这只万花筒乃是世间最令人垂涎的魔法物品之一。|r ")

    self.Items[6][11]:SetValue(2, 2, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"I", 
    "项链","普通", "隆达尔的坠匣","tb","|cffff8080致隆达尔—此物好比思君心，只愿与君永相随。永远爱你的，玛塔。|r ")

    self.Items[6][12]:SetValue(Liliang, 2, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.2, MoFaKangXing,"I", 
    "项链","普通", "阿兹卡兰之星","tb", "|cffff8080注入了阿兹卡兰临死前的强大能量。 |r ")

    self.Items[6][13]:SetValue(3, 3, 3,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"I", 
    "项链","普通", "埃拉诺克护身符","tb", "|cffff8080万物皆无法承受埃拉诺克的痛苦之沙。|r ")

    self.Items[6][14]:SetValue(Liliang, 3, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, 50,2,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"I", 
    "项链","普通", "赛飞利安护符","tb", "|cffff8080有人说，赛飞利安只是一个神话，一个从不曾存在过的幻想之地。这枚护符的力量表明了这种见解的荒谬。|r ")

    self.Items[6][15]:SetValue(Liliang, 4, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.2, MoFaKangXing,"I", 
    "项链","普通", "妄念","tb", "|cffff8080形形色色的欲念在这枚蛇形坠饰的表面若隐若现。|r ")

    self.Items[6][16]:SetValue(Liliang, 5, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.2, MoFaKangXing,"I", 
    "项链","普通", "瓦索的阴魂","tb", "|cffff8080凯基斯坦的大巫师瓦索其实并没有在法师派系战争中丧命。事实上，他和其他神智错乱的法师们被囚禁在同一个地方，也就是卡尔蒂姆撒瑞圣所底下的痛苦深渊。据说瓦索的著名护符被从那里偷了出来，但这是不可能的。因为一旦进了那地方，没有人能再出来。 |r ")

    self.Items[6][17]:SetValue(2, 2, 2,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"I", 
    "项链","普通", "茱莉雅女爵的雕饰项链","tb", "|cffff8080茱莉雅女爵为了得到加斯迪安三世的赏识，想让自己的贴身侍卫去镇压卡托鲁斯叛乱事件。这次行动可以说是一败涂地，侍卫惨死，叛乱却愈演愈烈。女爵自己也是靠着具有魔法力量的护符才在这场闹剧中躲过一劫。然而，这护符还是没能保住她的性命，加斯迪安王对她的愚蠢之举异常恼怒，下令对她施以酷刑，然后再将其处决示众。|r ")

    self.Items[6][18]:SetValue(Liliang, 4, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, 50,2,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"I", 
    "项链","普通", "先人之佑","tb", "|cffff8080这枚奇特的护符原本是在一名死掉的死灵法师身上找到的，后来献给了教宗—卡里姆。在教宗正式为它命名之后，所有大主教及其众贤者最终为其赋予圣力。我经常在想，为什么卡里姆在身受重伤且快被他那腐化的最高议会五马分尸时，不用这枚护符保命呢。 |r ")

    self.Items[6][19]:SetValue(4, 2, 1,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"I", 
    "项链","普通", "斯奎特的项链","tb","|cffff8080一块普通的石头，细看之下才能发现上面镌刻的符文。古老的盗贼之神的名讳—坎特维特就刻在它的背面。|r ")

    self.Items[6][20]:SetValue(Liliang, 3, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.2, MoFaKangXing,"I", 
    "项链","普通", "时光流韵","tb", "|cffff8080一枚精雕细琢的护符，曾经被一只特别高大的顽魔佩戴。它让时间变得无足轻重。|r ")

    self.Items[6][21]:SetValue(Liliang, ZhiHui, 5,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"I", 
    "项链","普通", "明眼护符","tb", "|cffff8080它似乎能看见你所看不见的东西……|r ")

    self.Items[6][22]:SetValue(Liliang, ZhiHui, 4,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"I", 
    "项链","普通", "鱼人坠匣","tb", "|cffff8080从楚湖的泥泞滩里捞出来的护符，靠在耳边时能听到它发出的诡异声响。|r ")

    self.Items[6][23]:SetValue(5, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"I", 
    "项链","普通", "海玉护身符","tb", "|cffff8080愚人未躬不敬，立於疑惑。始终他立於疑惑。|r ")

    self.Items[6][24]:SetValue(Liliang, 3, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"I", 
    "项链","普通", "琥珀护身符","tb", "|cffff8080我们是他的血肉。透过我们，他散播炙热的启示。 |r ")

    self.Items[6][25]:SetValue(Liliang, 3, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"I", 
    "项链","普通", "黑曜护身符","tb", "|cffff8080梦境搅动、世界颤抖。|r ")

    self.Items[6][26]:SetValue(3, ZhiHui, 3,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"I", 
    "项链","普通", "血色护身符","tb", "|cffff8080让我为你献上一份永恒的誓言将你的心与我的心紧紧相依；这份死亡都无法抹灭的牵连你是否会与我相守相怜？- 德瑞索，致爱人|r ")

    self.Items[6][27]:SetValue(Liliang, 3, 3,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"I", 
    "项链","普通", "海灵护身符","tb","|cffff8080世界宛若张羊皮纸。空白对称，毫无参差；标记左善右恶，上黑下白，惟神圣真理亦善亦恶，亦黑亦白。-雅台，瓦尔参谋|r ")

    self.Items[6][28]:SetValue(2, 2, 2,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"I", 
    "项链","普通", "黄晶护身符","tb", "|cffff8080「你挥剑的手似乎不够长吧？那你很快就人头落地了。」- 无畏者德瑞索|r ")

    self.Items[6][29]:SetValue(Liliang, 3, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"I", 
    "项链","普通", "杰特护身符","tb", "|cffff8080捕抓那关键一瞥，是获胜所需唯一。|r ")

    self.Items[6][30]:SetValue(Liliang, 4, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"I", 
    "项链","普通", "珊瑚护身符","tb", "|cffff8080传说亡灵使者摄魂之际，配此护符使你隐身欺敌。|r ")

    --手套装备
    self.Items[7] = {}
    for i= 1 ,30 do
        self.Items[7][i] = {}
        setmetatable(self.Items[7][i],Item) 
    end

    self.Items[7][1]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通", "雷霆之手","tb", "|cffff8080这个符印是魔剑士伊萨诺克Ezranoak右臂的符印，奥菲利亚Ophelia代皇帝在梅林Mehlin魔法学院30周年校庆的时候颁发给伊萨诺克，做为他带领魔剑士团四处征战的奖赏。 |r ")

    self.Items[7][2]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通", "征服者护手","tb", "|cffff8080这个符印是魔剑士伊萨诺克Ezranoak右臂的符印，奥菲利亚Ophelia代皇帝在梅林Mehlin魔法学院30周年校庆的时候颁发给伊萨诺克，做为他带领魔剑士团四处征战的奖赏。 |r ")

    self.Items[7][3]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通", "礼赞手套","tb", "|cffff8080这副鳞甲手套是用从欺诈者身上剥下来的皮缝制而成，专门奖励给巫师会中最得宠的凡人仆从。|r ")

    self.Items[7][4]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通", "法师之拳","tb", "|cffff8080双掌之间握有真正的魔法之力。 |r ")

    self.Items[7][5]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通", "岩石护手","tb", "|cffff8080很重、很硬、打人很痛。|r ")

    self.Items[7][6]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通", "角斗士的手套","tb",  "|cffff8080沃特大帝竞技场斗士所戴手套。 |r ")

    self.Items[7][7]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通", "潘德之手","tb", "|cffff8080只有最睿智的冒险者才能戴上这副强大的手套。|r ")

    self.Items[7][8]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通", "霜燃","tb", "|cffff8080这副手套会吸收任何所碰触之物的热量。|r ")

    self.Items[7][9]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通", "塔斯克与西奥","tb", "|cffff8080这位主人和他的猎犬在他们那个时代曾是最著名的一对猎手。他在战斗中如愿以偿地死在了爱犬的身边。他最忠实的伙伴不久之后也随他去了。|r ")

    self.Items[7][10]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通",  "雷光拳套","tb","|cffff8080拳若正中要害，劲力将增强为一股电能冲击，连魂魄亦会为之震颤。|r ")

    self.Items[7][11]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通", "掠夺者的手套","tb", "|cffff8080总有一天，你的箭矢会用尽，你的陷阱会失灵，你的敌人会步步逼近。你唯一的机会就在紧紧握住刀柄的手上。千万不要忘记这一点。 |r ")

    self.Items[7][12]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通", "蕾蔻的裹手","tb", "|cffff8080这副牛皮手套是为了纪念蕾蔻荣升为战斗大师而特别定制的。|r ")

    self.Items[7][13]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通", "瓦尔护手","tb", "|cffff8080「心脏是最佳传令官，让我知道何时该出击迎战。」- 瓦尔女王阿兹里|r ")

    self.Items[7][14]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通", "巨人护手","tb", "|cffff8080他抱着无止尽的决心首先摧毁了大门，接着摧毁了门后守护着坟墓的建筑。|r")

    self.Items[7][15]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通", "龙鳞手套","tb", "|cffff8080汝之谎言，余之力量。汝之威吓，余之欢笑。汝之憎恨，余之无尽。火焰窜升！ |r ")

    self.Items[7][16]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通", "暗杀者护手","tb", "|cffff8080天庭狂嚎震怒神罚永不饶恕人心恐惧无助 。|r ")

    self.Items[7][17]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通", "圣战手套","tb",  "|cffff8080「我不奢望世人谅解，唯求上苍赦免我身罪孽；我即将犯下残酷谬行让此地枷锁染血。」- 禁灵之狱内无名刻字。|r ")

    self.Items[7][18]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通", "秘术手套","tb", "|cffff8080死亡不会使你逃离我们的魔爪。死亡只会使你更加接近。|r ")

    self.Items[7][19]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通", "刺杀者护手","tb","|cffff8080「当巨蛇不再多虑，牠变得无所畏惧。愤恨难平，迅速杀敌：展现气血狂怒的战技！」- 赤血丝克玛迪虚瑞特 。|r ")

    self.Items[7][20]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通", "军团手套","tb", "|cffff8080「神乃至高无上之主，而吾则为其下之首。汝，将永不受吾怜悯。」- 圣宗领导人神主。|r ")

    self.Items[7][21]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通", "咒者手套","tb", "|cffff8080绝对的腐败带来绝对的力量。|r ")

    self.Items[7][22]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通", "巨灵护手","tb", "|cffff8080「寡人处处提防，就算封臣也得距离一剑之遥，岂料仇敌宛若剑柄，早已潜伏身旁。」- 切特斯大帝|r ")

    self.Items[7][23]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通",  "战士手套","tb", "|cffff8080南行千里，徒见凛冽冰原疆域，下掘三尺，唯有迷途旅者遗躯。|r ")

    self.Items[7][24]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通", "蝮鳞手套","tb", "|cffff8080那些目睹过让人颤栗的冰霜巨龙只能永远活在恐惧的阴影下然后，幸运的是他们的余生也只剩下几秒钟而已。 |r ")

    self.Items[7][25]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通", "远古护手","tb", "|cffff8080伊泽洛缓缓的发现背叛在他心中慢慢茁壮并无力抵挡；将船驶向礁石的船长。|r ")

    self.Items[7][26]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通", "钢影护手","tb", "|cffff8080千金万贯，得来不易。 |r ")

    self.Items[7][27]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通", "冷钢护手","tb", "|cffff8080引领荣耀跨上战鞍，击败仇人，使其落入黑暗，立下战果光辉灿烂。|r ")

    self.Items[7][28]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通", "环带护手","tb", "|cffff8080随风散播的燎原之火与死亡阴影，带来的唯有恐惧。|r ")

    self.Items[7][29]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通", "丝绸手套","tb", "|cffff8080唯有冷静沉着，方能杀敌不惑。 |r ")

    self.Items[7][30]:SetValue(Liliang, ZhiHui, MinJie,GongJi,3,YiDongSuDu,0.3, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"F", 
    "手套","普通", "羊皮手套","tb", "|cffff8080巨人之血无法被训服，像森林大火般狂野。|r ")

    --鞋装备
    self.Items[8] = {}
    for i= 1 ,30 do
        self.Items[8][i] = {}
        setmetatable(self.Items[8][i],Item) 
    end

    self.Items[8][1]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "风暴之履","tb","|cffff8080裁决骑士的亡魂很快就会过来帮助我们的，西维亚也会问讯赶过来，我将我挚爱的女儿托付给你，请协助她稳定内部的局势……”霍萨克Hosac留给赤佐Chisel最后一封手信后，就消失不见了。 |r ")

    self.Items[8][2]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "安德烈Andre马蹄铁","tb","|cffff8080在世纪广场到Micious皇城一条废弃的路上，矗立着一座常年遭受雷雨的古堡，传说驻扎着一位随闪电而降临的骑士，他在雷鸣之时现身，杀戮来往的商人旅者，雷鸣之后，一切重归寂静。 |r ")

    self.Items[8][3]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "哨兵的永恒庇护所","tb","|cffff8080她的灵魂被束缚在这双便鞋的皮革中，让她停留在这个世界。 |r")

    self.Items[8][4]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "诺甘农的预见","tb","|cffff8080魔法应当受到调节，管理和控制。但同时也应当受到理解和珍视，而不是束之高阁。你必须彻底理解这种矛盾。 |r")

    self.Items[8][5]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "亡者始祖","tb","|cffff8080死亡终将降临于我们所有人…… |r")

    self.Items[8][6]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "毁灭之靴","tb","|cffff8080见证吞没无数世界的烈焰吧。万物都将在燃烧军团的火焰中化为灰烬！ |r")

    self.Items[8][7]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "暗影萨特之步","tb","|cffff8080虽然暗影萨特真正的起源还未确认，但他们是家喻户晓的精神生物，不仅存在于翡翠梦魇，也存在于艾泽拉斯的许多地方。 |r")

    self.Items[8][8]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "萨茜的迷惑之靴","tb","|cffff8080萨茜总是把自己伪装成酒仙武僧，以欺骗她的敌人。 |r")

    self.Items[8][9]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "暮行者的薄靴","tb","|cffff8080如果你被凯瓦娜这样的军情七处密探发现，你最好赶快逃跑，跑得远远的。 |r")

    self.Items[8][10]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "卡特索之蚀","tb","|cffff8080尔德对他的兄弟卡特索说过：“通过训练，你的反应会变得更快，拳头会更有力量，让敌人应接不暇。” |r")

    self.Items[8][11]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "月光滑翔靴","tb","|cffff8080埃拉玛斯·炽光总是强调它们有多么舒服。 |r")

    self.Items[8][12]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "火石行者","tb","|cffff8080亚当兄弟和戴维兄弟都是杰出的数学家及武僧，总是说着算盘和抛物线之类的话。 |r")

    self.Items[8][13]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "灌魔精华","tb","|cffff8080感受自然在你的血管中流淌的滋味。 |r")

    self.Items[8][14]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "斯凯塞克的坚守","tb","|cffff8080在海加尔山之战中，诺达希尔的守护者斯凯塞克抵挡住了无穷无尽的天灾及燃烧军团。最终，他在保卫上古世界之树的战斗中光荣地献出了生命。 |r")

    self.Items[8][15]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "猎豹之步","tb","|cffff8080据说，玛尔·虫棘的疯狂强化了这些靴子。 |r")

    self.Items[8][16]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "月神的应许","tb","|cffff8080赐予他人生命与活力者，亦将从我处获得生命与活力。 |r")

    self.Items[8][17]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "比迪斯的牺牲","tb","|cffff8080拉瑟莱克被封印石匕困在污染者洛拉姆斯体内以后，只留下了这双靴子。 |r")

    self.Items[8][18]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "灵魂之旅","tb","|cffff8080要想控制狼，你必须把自己也变成狼。 |r")

    self.Items[8][19]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "战争指令","tb","|cffff8080杀了这个家伙，我们就赢了。 |r")

    self.Items[8][20]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "元素再平衡器","tb","|cffff8080原本是强大的末日守卫用来毁天灭地的工具，现在却被用于平衡他们先前所造成的破坏。 |r")

    self.Items[8][21]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "欺诈者的血契","tb","|cffff8080影月氏族的萨满长老耐奥祖为了拯救他的人民，终于获得了他渴望的力量和尊重。可惜，他被骗了…… |r")

    self.Items[8][22]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "奈辛瓦里的诱饵长靴","tb","|cffff8080某种有着巨大牙齿的动物曾想要从这些靴子上咬一块下来。 |r")

    self.Items[8][23]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "乌尔的羽绒雪地靴","tb","|cffff8080它们让这位女猎手感觉轻若无物——如同暴风雨中的宁静。 |r")

    self.Items[8][24]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "阿格拉玛的步伐","tb","|cffff8080时间与空间是统一的。对于一位宇宙的观察者而言，距离几乎毫无意义。 |r")

    self.Items[8][25]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "迷踪短靴","tb","|cffff8080未闻乐音的平凡人, 当然会认为起舞的人理智太过放任。」 - 瓦尔女王阿兹里 |r")

    self.Items[8][26]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通","虚空行者","tb","|cffff8080踏入无尽虚空， 感受真实自由。 |r")

    self.Items[8][27]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "暗影者长靴","tb","|cffff8080即使亡魂也为黑暗所统治。 |r")

    self.Items[8][28]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "冈姆的稳重之靴","tb","|cffff8080切莫畏缩迟疑，以免错失良机。 |r")

    self.Items[8][29]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "术士长靴","tb","|cffff8080迅速之人死得早，聪明之人容易疯 ,而强大之士独自在废土中自立自强 |r")

    self.Items[8][30]:SetValue(Liliang, ZhiHui, MinJie,GongJi,2,50,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"G", 
    "鞋","普通", "圣战长靴","tb","|cffff8080延长你的寿命 ,一并延长伴随着的疫病。 |r")

    --戒指装备
    self.Items[9] = {}
    for i= 1 ,30 do
        self.Items[9][i] = {}
        setmetatable(self.Items[9][i],Item) 
    end

    self.Items[9][1]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,M50,0.5, MoFaKangXing,"K", 
    "戒指","普通", "勘探者之戒","tb","|cffff8080德安德烈富藏铁矿，这里的铁矿冶炼产业一度十分发达。 |r ")

    self.Items[9][2]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, 50,2,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"K", 
    "戒指","普通", "大军之印","tb","|cffff8080与我们一同坠入深渊吧。  |r")

    self.Items[9][3]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, 50,2,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"K", 
    "戒指","普通", "战争领主之魂","tb","|cffff8080瓦拉加尔生活在苍穹要塞。他们是奥丁选中的强大勇士，保护世界远离一切威胁。  |r")

    self.Items[9][4]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.5, MoFaKangXing,"K", 
    "戒指","普通", "虚空领主之魂","tb","|cffff8080黑暗收割议会坐落于恐痕裂隙。他们是灵魂的收割者、恶魔的号令者和黑暗艺术的大师。  |r")

    self.Items[9][5]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, 50,2,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"K", 
    "戒指","普通", "先知之魂","tb","|cffff8080大地之环隐居在艾泽拉斯之心。他们掌握着元素的力量，同时也维持着元素的平衡。他们是真正的元素大师。  |r")

    self.Items[9][6]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.5, MoFaKangXing,"K", 
    "戒指","普通", "大祭司之魂","tb","|cffff8080教团的大本营位于虚空之光神殿。他们是圣光的大师和虚空的拥抱者——因为光明与黑暗是相辅相成的。  |r")

    self.Items[9][7]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.5, MoFaKangXing,"K", 
    "戒指","普通", "大宗师之魂","tb","|cffff8080残寺派生活在五晨寺中。他们是黯淡未来的希望使者。  |r")

    self.Items[9][8]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.5, MoFaKangXing,"K", 
    "戒指","普通", "大法师之魂","tb","|cffff8080提瑞斯秘法会位于守护者圣殿。他们是达拉然的精锐法师卫士，曾经受到提瑞斯法议会的召唤，代替空缺的守护者战斗。  |r")

    self.Items[9][9]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, 50,2,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"K", 
    "戒指","普通", "死亡领主之魂","tb","|cffff8080黑锋骑士团的大本营位于阿彻鲁斯：黑锋要塞。他们曾是天灾军团的勇士。现在，他们掌握了诅咒的力量。  |r")

    self.Items[9][10]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.5, MoFaKangXing,"K", 
    "戒指","普通", "屠魔者之魂","tb","|cffff8080伊利达雷驾驶着邪能之槌号。他们屠杀恶魔并驾驭它们的禁忌力量，不惜一切代价与混沌的大军作斗争。  |r")

    self.Items[9][11]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.5, MoFaKangXing,"K", 
    "戒指","普通", "大德鲁伊之魂","tb","|cffff8080塞纳里奥议会生活在梦境林地。他们是自然的守护者，平衡的维系者，所有生命的保护者。  |r")

    self.Items[9][12]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, 50,2,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"K", 
    "戒指","普通", "暗影之刃之魂","tb","|cffff8080无冕者藏身于暗影大厅。他们拥有弑君灭国之能，他们用无人知晓的利刃书写着这个世界的真正历史。  |r")

    self.Items[9][13]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, 50,2,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"K", 
    "戒指","普通", "背叛者的牢笼碎片","tb","|cffff8080我被囚禁了一万年，又被逐出了自己的故乡。现在，你们竟敢闯入我的领地？真是自寻死路……  |r")

    self.Items[9][14]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, 50,2,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"K", 
    "戒指","普通", "顶级捕食者的爪子","tb","|cffff8080蔑冬部族的狩猎大师沃顿著名的伙伴，兽王拜科的爪子。  |r")

    self.Items[9][15]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.5, MoFaKangXing,"K", 
    "戒指","普通", "承诺指环","tb","|cffff8080对我来说这些都是徒劳。  |r")

    self.Items[9][16]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.5, MoFaKangXing,"K", 
    "戒指","普通", "死灵狂想家的印记","tb","|cffff8080来自虚空的黑暗低语表明这个印戒是纳斯雷兹姆在第三次大战前铸造的，并被赐予了天灾军团最强大的副官之一。  |r")

    self.Items[9][17]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, 50,2,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"K", 
    "戒指","普通", "瑟雷姆的饥渴","tb","|cffff8080 它的力量来自牺牲在厄运之槌的猎人们。 |r")

    self.Items[9][18]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.5, MoFaKangXing,"K", 
    "戒指","普通", "倾塌之墙","tb","|cffff8080 在第三次大战中，由卡利姆多的守护者组成的人墙纷纷倒下，但战争古树沙卡却仍然屹立不倒。 |r")

    self.Items[9][19]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, 50,2,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"K", 
    "戒指","普通", "磐石之心","tb","|cffff8080在瓦哈拉斯的竞技场中，无情的阿亚拉击倒了一个又一个敌人，铸就了他的传奇。当对手被削弱时，他会变得更加致命。对于观众而言，他真的非常可怕。  |r")

    self.Items[9][20]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.5, MoFaKangXing,"K", 
    "戒指","普通", "约纳特长老的聚焦器","tb","|cffff8080  在约纳特·汉的训练下，掠龙氏族的新晋萨满都掌握了治疗单体和群体的水之道。|r")

    self.Items[9][21]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, 50,2,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"K", 
    "戒指","普通", "扭曲虚空之眼","tb","|cffff8080 虽然世界的元素在虚空中被扭曲得面目全非，但它们的力量无与伦比。 |r")

    self.Items[9][22]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, 50,2,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"K", 
    "戒指","普通", "拉文霍德玺戒","tb","|cffff8080 这种徽记只授予展现过高超暗影技巧，并曾为拉文霍德出生入死的人士。 |r")

    self.Items[9][23]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.5, MoFaKangXing,"K", 
    "戒指","普通", "不羁之怒","tb","|cffff8080那个被我们称为王子的男人背叛了我们。我以血骑士的佩剑起誓，击败基尔加丹，恢复银月城昔日的辉煌。我们会和您并肩战斗，阿达尔。  |r")

    self.Items[9][24]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.5, MoFaKangXing,"K", 
    "戒指","普通", "希斯克利夫的永生","tb","|cffff8080据说，号称永生者的希斯克利夫永远不会受到重创。有人质疑这个血骑士的顽强已经超越了这个世界的自然法则。  |r")

    self.Items[9][25]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, 50,2,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"K", 
    "戒指","普通", "银月之珠","tb","|cffff8080银月城由熠熠生辉的白石建造而成，并以深红色织锦作为装饰。但是，这座城市并非仅以美丽而著称。银月城是魔法研究中心，也是许多强大施法者的故乡。  |r")

    self.Items[9][26]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.5, MoFaKangXing,"K", 
    "戒指","普通", "失落修道院的珠宝","tb","|cffff8080原本是法师维利萨斯的赠礼。据说这件饰品是在一次武僧与精灵的冲突之后从失落修道院里偷出来的。  |r")

    self.Items[9][27]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu,50,2,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"K", 
    "戒指","普通", "弗里兹的指套","tb","|cffff8080只要涂上一点点黄油，就容易脱下来了！  |r")

    self.Items[9][28]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.5, MoFaKangXing,"K", 
    "戒指","普通", "无瑕的邪能精华","tb","|cffff8080 翡翠议会的德鲁伊通过操纵这块石头所蕴含的邪能，来提高他们与荒野的协调性。 |r")

    self.Items[9][29]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.5, MoFaKangXing,"K", 
    "戒指","普通", "全见者","tb","|cffff8080大法师卡德加制造的三大狂野指环之一。  |r")

    self.Items[9][30]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,50,0.5, MoFaKangXing,"K", 
    "戒指","普通", "永恒之赐","tb","|cffff8080在银色锦标赛期间的一个重要日子里被落在了家里。  |r")

    --披风装备
    self.Items[10] = {}
    for i= 1 ,30 do
        self.Items[10][i] = {}
        setmetatable(self.Items[10][i],Item) 
    end

    self.Items[10][1]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 30,"E", 
    "披风","普通", "魔术幕帘","tb","|cffff8080切，又让梅林Merlin跑掉了！”艾里克Erech愤怒地骂道，“主教大人，抱歉……   |r")

    self.Items[10][2]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu,30,"E", 
    "披风","普通", "漆黑斗篷","tb","|cffff8080 被洛丹伦的人类守卫误认为不死族法师的斗篷，其实只不过是精灵们的浴衣罢了。 |r")

    self.Items[10][3]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 30,"E", 
    "披风","普通", "娜塔亚的拥抱","tb","|cffff8080 娜塔亚知道该如何使用黑暗作为武器。 |r")

    self.Items[10][4]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 30,"E", 
    "披风","普通", "困魔笼甲","tb","|cffff8080当恶魔窥进你的内心深处时，它会找到什么？死亡。至于是他死还是你亡，那就取决于你自己了。  |r")

    self.Items[10][5]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 30,"E", 
    "披风","普通", "幻影斗篷","tb","|cffff8080这件光彩熠熠的披风是用星辉蝴蝶的蛹丝编织而成，流光溢彩、令人眩目，如同沙漠中升起的蜃楼一般。 |r")

    self.Items[10][6]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 30,"E", 
    "披风","普通", "黑羽","tb","|cffff8080 这件披风与脍炙人口的童话故事《约基与巨人》中的英雄主角所穿戴的那件披风完全相像。 |r")

    self.Items[10][7]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 30,"E", 
    "披风","普通", "远行的召唤","tb","|cffff8080贝金赛尔在黑夜传说中弑魔时所穿的风衣。  |r")

    self.Items[10][8]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 30,"E", 
    "披风","普通", "加沃夫的披风","tb","|cffff8080 与狼共舞者的披风。 |r")

    self.Items[10][9]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 30,"E", 
    "披风","普通", "暗夜斗篷","tb","|cffff8080 行凶作恶之人常为胆小迷信之辈。 |r")

    self.Items[10][10]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 30,"E", 
    "披风","普通", "拉基斯守护披风","tb","|cffff8080 拉基斯守护披风 |r")

    self.Items[10][11]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 30,"E", 
    "披风","普通", "升灵披风","tb","|cffff8080 升灵披风 |r")

    self.Items[10][12]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 30,"E", 
    "披风","普通", "恐惧披风","tb","|cffff8080 恐惧披风 |r")

    self.Items[10][13]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 30,"E", 
    "披风","普通", "红衣主教外袍","tb","|cffff8080 红衣主教外袍 |r")

    self.Items[10][14]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 30,"E", 
    "披风","普通", "潜伏者罩袍","tb","|cffff8080 潜伏者罩袍 |r")

    self.Items[10][15]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 30,"E", 
    "披风","普通", "猎手披风","tb","|cffff8080 猎手披风 |r")

    self.Items[10][16]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 30,"E", 
    "披风","普通", "月海碧魔斗篷","tb","|cffff8080 月海碧魔斗篷 |r")

    self.Items[10][17]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 30,"E", 
    "披风","普通", "寂魂祈日斗篷","tb","|cffff8080 寂魂祈日斗篷 |r")

    self.Items[10][18]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 30,"E", 
    "披风","普通", "迷月玄羽斗篷","tb","|cffff8080 迷月玄羽斗篷 |r")

    self.Items[10][1]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 30,"E", 
    "披风","普通", "星纹斗篷","tb","|cffff8080 星纹斗篷 |r")

    self.Items[10][20]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 30,"E", 
    "披风","普通", "远古旋魔斗篷","tb","|cffff8080 远古旋魔斗篷 |r")

    self.Items[10][21]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 30,"E", 
    "披风","普通", "瞑想者斗篷","tb","|cffff8080 瞑想者斗篷 |r")

    self.Items[10][22]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 30,"E", 
    "披风","普通", "自然亲和斗篷","tb","|cffff8080 自然亲和斗篷 |r")

    self.Items[10][23]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 30,"E", 
    "披风","普通", "精灵祝福斗篷","tb","|cffff8080 精灵祝福斗篷 |r")

    self.Items[10][24]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 30,"E", 
    "披风","普通", "炎麻护肩","tb","|cffff8080 炎麻护肩 |r")

    self.Items[10][25]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu,30,"E", 
    "披风","普通", "印纹护肩","tb","|cffff8080 印纹护肩 |r")

    self.Items[10][26]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 30,"E", 
    "披风","普通", "暖阳护肩","tb","|cffff8080 暖阳护肩 |r")

    self.Items[10][27]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 30,"E", 
    "披风","普通", "苍穹之主护肩","tb","|cffff8080 苍穹之主护肩 |r")

    self.Items[10][28]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 30,"E", 
    "披风","普通", "梦魇缚灵护肩","tb","|cffff8080 梦魇缚灵护肩 |r")

    self.Items[10][29]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 30,"E", 
    "披风","普通", "巴兰的战斗护肩","tb","|cffff8080 巴兰的战斗护肩 |r")

    self.Items[10][30]:SetValue(Liliang, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 30,"E", 
    "披风","普通", "七星护肩","tb","|cffff8080 七星护肩 |r")

    --饰品装备
    self.Items[11] = {}
    for i= 1 ,30 do
        self.Items[11][i] = {}
        setmetatable(self.Items[11][i],Item) 
    end
    self.Items[11][1]:SetValue(1, 1, 1,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"J", 
    "饰品","普通", "联盟臂章","tb","|cffff8080 克莱伦萨Colerlunsa十六国联盟建立之初，任命了三十二位殿前骑士，称为“联盟之盾”，联盟首席克莱伦萨国王布兰诺斯Branous一世华德Ward为他们颁发了联盟臂章。“华德是个野心家，很期待我和二世的命运之役。”威廉William格雷尔Grall呷了口咖啡，合上史书，对着身旁的科什娜Koshna将军感叹到。 |r")

    self.Items[11][2]:SetValue(2, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 10,"J", 
    "饰品","普通", "狂战士护符","tb","|cffff8080 谁会知道臭名昭著的洗劫者沃吉尔Voulger竟然会和联盟军勾搭在一起进攻Monleston。这中间的故事究竟有多少，还是个未知数。 |r")

    self.Items[11][3]:SetValue(Liliang, 2, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"J", 
    "饰品","普通", "勘探者宝石","tb","|cffff8080 恶魔猎人在追逐恶魔时常用的道具，它可以快速的判断一个大片区域内是否存在恶魔。 |r")

    self.Items[11][4]:SetValue(Liliang, ZhiHui, 2,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"J", 
    "饰品","普通", "新月会的介绍书","tb","|cffff8080 如果你手上有一张新月会的介绍书，大可不必太过在意。这东西多的就像街头小广告一样，在Micious和Rockta国内，新月会被认定为邪教组织。Colerlunsa地区管理松散，也是新月会的重要盘踞地点。纷争不断的Monleston地区貌似也有大量新月会教徒的踪迹。 |r")

    self.Items[11][5]:SetValue(Liliang, 2, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"J", 
    "饰品","普通", "树妖之泪","tb","|cffff8080 树妖Lindsay林赛爱上了一个帅气的人类男子，可惜男子已经有了心仪的对象，沉沦在恋爱狂热的莎柏林娜丧心病狂的杀死了她的情敌，并将女人的头送给了男子。男子决心找莎柏林娜算账，莎柏林娜见此情景伤心欲绝，敲碎了男子的头骨植入了一颗可以操纵尸体的种子。 |r")

    self.Items[11][6]:SetValue(2, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 10,"J", 
    "饰品","普通", "天使吐息","tb","|cffff8080 据称Colerlunsa克莱伦萨圣教的圣殿内供养着一只天使，它可以为遭受苦难的人们进行洗礼仪式。 |r")

    self.Items[11][7]:SetValue(Liliang, 2, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"J", 
    "饰品","普通", "远古记忆","tb","|cffff8080 据说，暴君Sloghter斯洛特用一种神奇的方法获得了常人无法达到的体能。 |r")

    self.Items[11][8]:SetValue(Liliang, ZhiHui, 2,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"J", 
    "饰品","普通", "邪恶的远古祭祀","tb","|cffff8080 这是一种恶毒的远古巫术，在新月会中仍有流传。 |r")

    self.Items[11][9]:SetValue(Liliang, 2, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"J", 
    "饰品","普通", "冻结核心","tb","|cffff8080  极寒恶魔克拉伦斯Clarence沦为俘虏后，它的心脏就不再属于自己了。|r")

    self.Items[11][10]:SetValue(2, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 10,"J", 
    "饰品","普通", "冻结核心","tb","|cffff8080 极寒恶魔克拉伦斯Clarence沦为俘虏后，它的心脏就不再属于自己了。 |r")

    self.Items[11][11]:SetValue(Liliang,2, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"J", 
    "饰品","普通", "勇气勋章","tb","|cffff8080 密西欧斯Micious国教的军医开发出来的勋章，散发着令人神清气爽的清香。 |r")

    self.Items[11][12]:SetValue(Liliang, ZhiHui,2,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"J", 
    "饰品","普通", "阿里艾丽Aliery的悸动","tb","|cffff8080 亚历克斯Alex，你是我除了赫蒂Hedy以外第一个也是唯一一个朋友了. |r")

    self.Items[11][13]:SetValue(Liliang, 2, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 10,"J", 
    "饰品","普通", "圣教堂庇护","tb","|cffff8080 女神不允许出现弱者被欺凌的局面。 |r")

    self.Items[11][14]:SetValue(2, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"J", 
    "饰品","普通", "恶魔赦令","tb","|cffff8080 恶魔的暴行终究会得到惩罚。 |r")

    self.Items[11][15]:SetValue(Liliang, 2, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"J", 
    "饰品","普通", "孙武空的戏法","tb","|cffff8080 孙武空能随意改变自己的形体，甚至还能用一根毛发变出自己的分身。但无论他幻化出多少个分身，这枚护身符都会戴在猴王的真身身上。 |r")

    self.Items[11][16]:SetValue(Liliang, ZhiHui, 2,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 10,"J", 
    "饰品","普通", "黑棘的敦克雷十字章","tb","|cffff8080 敦克雷十字章只颁发给那些率领麾下骑士护国有功的贵族。 |r")

    self.Items[11][17]:SetValue(Liliang, 2, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"J", 
    "饰品","普通", "旅者的誓言","tb","|cffff8080 冒险的精神永不会磨灭。 |r")

    self.Items[11][18]:SetValue(2, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"J", 
    "饰品","普通", "地狱火护符","tb","|cffff8080 用地狱火护符表彰那些不惜付出高昂代价，誓死将恶魔天灾逐出庇护之地的勇士们。 |r")

    self.Items[11][19]:SetValue(Liliang, 2, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"J", 
    "饰品","普通", "赫西恩之飞升","tb","|cffff8080 举起武器，举起你的武器……然后就结束了。 |r")

    self.Items[11][20]:SetValue(Liliang, ZhiHui, 2,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"J", 
    "饰品","普通", "拉科夫的吸魂镜","tb","|cffff8080 在做出这件能从手下败将身上抽取生命力的法器之前，拉科夫只是一名勤于研习武僧功夫与道法的俗家抄经人。 |r")

    self.Items[11][21]:SetValue(Liliang, 2, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"J", 
    "饰品","普通", "多弗的法能陷阱","tb","|cffff8080 不明世界实相者，其心必累。 |r")

    self.Items[11][22]:SetValue(2, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"J", 
    "饰品","普通", "妄念","tb","|cffff8080 形形色色的欲念在这枚蛇形坠饰的表面若隐若现。 |r")

    self.Items[11][23]:SetValue(Liliang,2, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"J", 
    "饰品","普通", "兵要护符","tb","|cffff8080 活用以退为进、诱敌深入之法乃此护符精髓。先以哀兵示弱，诱敌乘胜追击。当其中计欲逃时，用此护符即可悉数围歼。 |r")

    self.Items[11][24]:SetValue(Liliang, ZhiHui, 2,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, 10,"J", 
    "饰品","普通", "先人之佑","tb","|cffff8080 这枚奇特的护符原本是在一名死掉的死灵法师身上找到的，后来献给了教宗，卡里姆。在教宗正式为它命名之后，所有大主教及其众贤者最终为其赋予圣力。我经常在想，为什么卡里姆在身受重伤且快被他那腐化的最高议会五马分尸时，不用这枚护符保命呢。 |r")

    self.Items[11][25]:SetValue(Liliang, 2, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"J", 
    "饰品","普通", "瓦克索的阴魂","tb","|cffff8080 凯基斯坦的大巫师瓦克索其实并没有在法师派系战争中丧命。事实上，他和其他神智错乱的法师们被囚禁在同一个地方，也就是卡尔蒂姆撒瑞圣所底下的痛苦深渊。据说瓦克索的著名护符被从那里偷了出来，但这是不可能的。因为一旦进了那地方，没有人能再出来。 |r")

    self.Items[11][26]:SetValue(2, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"J", 
    "饰品","普通", "玛拉的万花筒","tb","|cffff8080 撒瑞圣所的殿堂内一直有关于它的传闻在暗中流传，这只万花筒乃是世间最令人垂涎的魔法物品之一。 |r")

    self.Items[11][27]:SetValue(Liliang, 2, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"J", 
    "饰品","普通", "艾利奇之眼","tb","|cffff8080 这枚眼球取自于亚瑞特山中一具冻僵的尸体，十二名巫师的魔法力量在其中翻腾。 |r")

    self.Items[11][28]:SetValue(Liliang, ZhiHui, 2,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"J", 
    "饰品","普通", "圣灯","tb","|cffff8080 远离邪恶。不要让污秽的黑暗吞没你心中的光明。 |r")

    self.Items[11][29]:SetValue(Liliang, 2, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"J", 
    "饰品","普通", "隆达尔的坠匣","tb","|cffff8080 致隆达尔——此物好比思君心，只愿与君永相随。永远爱你的，玛塔。 |r")

    self.Items[11][30]:SetValue(2, ZhiHui, MinJie,GongJi,HuJia,YiDongSuDu,GongJiSuDu, ShengMingShangXian,ShengMingHuiFu,MoFaShangXian,MoFaHuiFu, MoFaKangXing,"J", 
    "饰品","普通", "轮回之蛇","tb","|cffff8080 万千能量皆流转于永恒之源，亦终将汇流于永恒之源。 |r")

    ------------------------
    --图标
    self.TuBiao["宝石"] = {}
    for i= 1 ,61 do
        self.TuBiao["宝石"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNbaoshi"..tostring(i)..".blp"
    end
    
    self.TuBiao["匕首"] = {}
    for i= 1 ,28 do
        self.TuBiao["匕首"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNbishou"..tostring(i)..".blp"
    end

    self.TuBiao["锤"] = {}
    for i= 1 ,79 do
        self.TuBiao["锤"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNchui"..tostring(i)..".blp"
    end

    self.TuBiao["盾"] = {}
    for i= 1 ,47 do
        self.TuBiao["盾"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNdun"..tostring(i)..".blp"
    end

    self.TuBiao["法杖"] = {}
    for i= 1 ,70 do
        self.TuBiao["法杖"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNfazhan"..tostring(i)..".blp"
    end

    self.TuBiao["符文"] = {}
    for i= 1 ,65 do
        self.TuBiao["符文"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNfuwen"..tostring(i)..".blp"
    end

    self.TuBiao["斧子"] = {}
    for i= 1 ,87 do
        self.TuBiao["斧子"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNfuzi"..tostring(i)..".blp"
    end

    self.TuBiao["弓"] = {}
    for i= 1 ,32 do
        self.TuBiao["弓"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNgong"..tostring(i)..".blp"
    end

    self.TuBiao["骨头"] = {}
    for i= 1 ,20 do
        self.TuBiao["骨头"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNgutou"..tostring(i)..".blp"
    end

    self.TuBiao["火枪"] = {}
    for i= 1 ,12 do
        self.TuBiao["火枪"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNhuoqiang"..tostring(i)..".blp"
    end

    self.TuBiao["剑"] = {}
    for i= 1 ,209 do
        self.TuBiao["剑"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNjian"..tostring(i)..".blp"
    end

    self.TuBiao["箭袋"] = {}
    for i= 1 ,10 do
        self.TuBiao["箭袋"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNjiandai"..tostring(i)..".blp"
    end

    self.TuBiao["戒指"] = {}
    for i= 1 ,70 do
        self.TuBiao["戒指"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNjiezhi"..tostring(i)..".blp"
    end

    self.TuBiao["铠甲"] = {}
    for i= 1 ,113 do
        self.TuBiao["铠甲"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNkaijia"..tostring(i)..".blp"
    end
    
    self.TuBiao["面具"] = {}
    for i= 1 ,30 do
        self.TuBiao["面具"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNmianju"..tostring(i)..".blp"
    end

    self.TuBiao["披风"] = {}
    for i= 1 ,25 do
        self.TuBiao["披风"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNpifeng"..tostring(i)..".blp"
    end

    self.TuBiao["饰品"] = {}
    for i= 1 ,51 do
        self.TuBiao["饰品"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNshipin"..tostring(i)..".blp"
    end

    self.TuBiao["书"] = {}
    for i= 1 ,16 do
        self.TuBiao["书"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNshu"..tostring(i)..".blp"
    end

    self.TuBiao["头盔"] = {}
    for i= 1 ,118 do
        self.TuBiao["头盔"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNtoukui"..tostring(i)..".blp"
    end

    self.TuBiao["项链"] = {}
    for i= 1 ,44 do
        self.TuBiao["项链"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNxianglian"..tostring(i)..".blp"
    end

    self.TuBiao["鞋"] = {}
    for i= 1 ,62 do
        self.TuBiao["鞋"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNxie"..tostring(i)..".blp"
    end

    self.TuBiao["药"] = {}
    for i= 1 ,70 do
        self.TuBiao["药"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNyao"..tostring(i)..".blp"
    end

    self.TuBiao["手套"] = {}
    for i= 1 ,47 do
        self.TuBiao["手套"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNzhua"..tostring(i)..".blp"
    end

end 

return ItemDota


--测试
-- 创建对象
--m = ItemDota:Instance()  


--print(m.Prefix[1][4].Name)