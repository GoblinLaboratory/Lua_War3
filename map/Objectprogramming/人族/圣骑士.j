//圣骑士
function CreateSQS  takes nothing returns nothing
	//技能
	//神圣之光
	<?
	local SG = slk.ability.ANhw:new ("SQSG")
	SG.Name = "神圣之光"
	SG.levels = 4
	SG.item = 0
	SG.hero = 0
	--需求
	SG.Requires = ""
	--快捷键
	SG.Hotkey = "R"
	--关闭快捷键
	SG.Unhotkey = "R"
	--文本提示
	SG.Tip1 = "神圣之光(|cffffcc00D|r)"
	SG.Tip2 = "神圣之光-急速治疗(|cffffcc00D|r)"
	SG.Tip3 = "神圣之光-抚慰之光(|cffffcc00D|r)"
	SG.Tip4 = "神圣之光-坚定(|cffffcc00D|r)"
	--图标
	SG.Art = "ReplaceableTextures\\CommandButtons\\BTNHolyBolt.blp"
	--文本提示扩展
	SG.Ubertip1 = "神圣之光能治愈友军单位法术强度+最大生命值5%的生命。施法间隔:10秒."
	SG.Ubertip2 = "神圣之光能治愈友军单位法术强度+最大生命值5%的生命。施法间隔:5秒.|n|cffffff00急速治疗：施法间隔降低到:5秒。|r"
	SG.Ubertip3 = "神圣之光能治愈友军单位法术强度+最大生命值5%的生命。施法间隔:10秒.|n|cffffff00抚慰之光：治疗量翻倍。|r"
	SG.Ubertip4 = "神圣之光能治愈友军单位法术强度+最大生命值5%的生命。施法间隔:10秒.|n|cffffff00坚定：在接下来的1.5秒内,为魔法免疫状态。|r"
	--魔法施放间隔
	SG.Cool1 = 10
	SG.Cool2 = 5
	SG.Cool3 = 10
	SG.Cool4 = 10
	--施法距离
	SG.Rng1 = 900
	SG.Rng2 = 900
	SG.Rng3 = 900
	SG.Rng4 = 900
	--魔法消耗
	SG.Cost1 = 75
	SG.Cost2 = 75
	SG.Cost3 = 75
	SG.Cost4 = 75
	--图标位置
	SG.Buttonpos_1 = 0
	SG.Buttonpos_2 = 2
	?>
    //圣骑士
    <?  
	local rzzs = slk.unit.Hpal:new 'RzSQ'?>
	<?
	rzzs.Name = "圣骑士"
	rzzs.abilList = "AInv,ZSfy,ZScf,ZSml,RZSX,RZZS,RZNH,RZTF"
	rzzs.heroAbilList = ""
	rzzs.hideOnMinimap = 1
	rzzs.fused = 0
	--占用人口
	rzzs.fused = 0
	--最大库存
    rzzs.stockMax = 1
    -- 科技需求
    rzzs.Requires1 = ""
    rzzs.Requires2 = ""
	--基础伤害
	rzzs.dmgplus1 = 0
	--攻击间隔
	rzzs.cool1 = 1.7
	--初始属性
	rzzs.STR = 5
	rzzs.AGI = 5
	rzzs.INT = 5
	--每级提升属性
	rzzs.STRplus = 2
	rzzs.AGIplus = 2
	rzzs.INTplus = 2
	--魔法最大值
	rzzs.manaN = 0
	--魔法回复
	rzzs.regenMana = 0.01
	--初始魔法值
	rzzs.mana0 = 100
	--最大生命值
	rzzs.HP = 100
	--生命回复
	rzzs.regenHP = 0.25
	--主属性
	rzzs.Primary = "STR"
	--基础移动速度
	rzzs.spd = 270.00
	--转身速度
	rzzs.turnRate = 0.6
	--修理时间
	rzzs.reptm = 0
	--修理木材消耗
	rzzs.lumberRep = 0
	--修理黄金消耗
	rzzs.goldRep = 0
	--建造时间
	rzzs.bldtm = 0
	--木材消耗
	rzzs.lumbercost = 0
	--黄金消耗
    rzzs.goldcost = 0
    -- 称谓
    rzzs.Propernames = "爱尔丁-破日者,泰尼恩-鹰翼"
	--武器声音
    rzzs.weapType1 = ""
    -- 单位碰撞声音
    rzzs.unitSound = "HeroPaladin"
    -- 投射物图像 近战没有
    --rzzs.Missileart = 
    -- 武器类型
    rzzs.weapTp1 = "normal"
	--模型
	rzzs.file = "units\\human\\HeroPaladin\\HeroPaladin"
	--计分屏图标
	rzzs.ScoreScreenIcon = "UI\\Glues\\ScoreScreen\\scorescreen-hero-paladin.blp"
	--游戏界面图标
	rzzs.Art = "ReplaceableTextures\\CommandButtons\\BTNHeroPaladin.blp"
	rzzs.hideHeroMinimap = 1
	rzzs.dmgplus1 = 0
	?>
endfunction