//人族战士
function CreateRZZS  takes nothing returns nothing
	<?
	--创建技能
	--防御姿态 - 顶盾
	local FY = slk.ability.Adef:new ("ZSfy")
	FY.Name = "防御"
	FY.levels = 4
	FY.item = 0
	--需求
	FY.Requires = ""
	--快捷键
	FY.Hotkey = "D"
	--关闭快捷键
	FY.Unhotkey = "D"
	--文本提示
	FY.Tip1 = "防御姿态(|cffffcc00D|r)"
	FY.Tip2 = "防御姿态-防御壁垒(|cffffcc00D|r)"
	FY.Tip3 = "防御姿态-格挡(|cffffcc00D|r)"
	FY.Tip4 = "防御姿态-剑盾风暴(|cffffcc00D|r)"
	--关闭文本提示
	FY.Untip1 = "停止防御姿态(|cffffcc00D|r)"
	FY.Untip2 = "停止防御姿态(|cffffcc00D|r)"
	FY.Untip3 = "停止防御姿态(|cffffcc00D|r)"
	FY.Untip4 = "停止防御姿态(|cffffcc00D|r)"
	--文本提示扩展
	FY.Ubertip1 = "激活防御获得30%的伤害减免。移动速度和攻击速度减少50%。"
	FY.Ubertip2 = "激活防御获得30%的伤害减免。移动速度和攻击速度减少50%。|n|cffffff00防御壁垒：当战士处于防御姿态时，增加格挡伤害到50%。|r"
	FY.Ubertip3 = "激活防御获得30%的伤害减免。移动速度和攻击速度减少50%。|n|cffffff00格挡：有30%的几率格挡一次伤害。|r"
	FY.Ubertip4 = "激活防御获得30%的伤害减免。移动速度和攻击速度减少50%。|n|cffffff00剑盾风暴：防御将不再减少攻击速度和移动速度。|r"
	--关闭文本提示扩展
	FY.Unubertip1 ="取消防御姿态(|cffffcc00D|r)"
	FY.Unubertip2 ="取消防御姿态(|cffffcc00D|r)"
	FY.Unubertip3 ="取消防御姿态(|cffffcc00D|r)"
	FY.Unubertip4 ="取消防御姿态(|cffffcc00D|r)"
	--反弹几率
	FY.DataF1 = 0
	--攻击速度减少
	FY.DataD1 = 0.5
	FY.DataD2 = 0.5
	FY.DataD3 = 0.5
	FY.DataD4 = 0
	--伤害成倍
	FY.DataB1 = 0
	--所受穿刺伤害
	FY.DataA1 = 0
	--所受魔法伤害
	FY.DataE1 = 0
	--图标位置
	RZTF.Buttonpos_1 = 0
	RZTF.Buttonpos_2 = 2
	--移动速度
	FY.DataC1 = 0.5
	FY.DataC2 = 0.5
	FY.DataC3 = 0.5
	FY.DataC4 = 0
	--允许目标
	FY.targs1 = "air,gruond,structure,debris,neutral,enemy,ward,vuld,invu"
	FY.targs2 = "air,gruond,structure,debris,neutral,enemy,ward,vuld,invu"
	FY.targs3 = "air,gruond,structure,debris,neutral,enemy,ward,vuld,invu"
	FY.targs4 = "air,gruond,structure,debris,neutral,enemy,ward,vuld,invu"
	--种族
	FY.race = "human"
	--需求
	FY.Requires = ""
	--
	?> 
	<?
	--创建技能
	--冲锋
	local CF = slk.ability.AHtb:new ("ZScf")
	CF.Name = "冲锋"
	CF.levels = 4
	CF.item = 0
	CF.hero = 0
	--文本提示
	CF.Tip1 = "冲锋(|cffffcc00F|r)"
	CF.Tip2 = "冲锋-捍卫(|cffffcc00F|r)"
	CF.Tip3 = "冲锋-盾击(|cffffcc00F|r)"
	CF.Tip4 = "冲锋-压制(|cffffcc00F|r)"
	--图标
	CF.Art = "ReplaceableTextures\\CommandButtons\\BTNUnstableConcoction.blp"
	--文本提示扩展
	CF.Ubertip1 = "战士将快速向其冲去，并造成0.1秒的眩晕."
	CF.Ubertip2 = "战士将快速向其冲去，并造成0.1秒的眩晕.|n|cffffff00捍卫：去除战士身上的负面效果，并强制目标攻击战士。|r"
	CF.Ubertip3 = "战士将快速向其冲去，并造成0.1秒的眩晕.|n|cffffff00盾击：对目标造成3秒眩晕。|r"
	CF.Ubertip4 = "战士将快速向其冲去，并造成0.1秒的眩晕.|n|cffffff00压制：战士的下次攻击会造成3倍伤害的致命一击。|r"
	--伤害
	CF.DataA1 = 100
	CF.DataA2 = 100
	CF.DataA3 = 100
	CF.DataA4 = 100
	--魔法施放间隔
	CF.Cool1 = 9
	CF.Cool2 = 9
	CF.Cool3 = 9
	CF.Cool4 = 9
	--允许目标
	CF.targs1 = "air,gruond,debris,enemy,neutral,organic"
	CF.targs2 = "air,gruond,debris,enemy,neutral,organic"
	CF.targs3 = "air,gruond,debris,enemy,neutral,organic"
	CF.targs4 = "air,gruond,debris,enemy,neutral,organic"
	--持续时间 普通
	CF.Dur1 = 0.1
	CF.Dur2 = 0.1
	CF.Dur3 = 3
	CF.Dur4 = 0.1
	--持续时间 英雄
	CF.HeroDur1 = 0.1
	CF.HeroDur2 = 0.1
	CF.HeroDur3 = 3
	CF.HeroDur4 = 0.1
	--施法距离
	CF.Rng1 = 900
	CF.Rng2 = 900
	CF.Rng3 = 900
	CF.Rng4 = 900
	--魔法消耗
	CF.Cost1 = 75
	CF.Cost2 = 75
	CF.Cost3 = 75
	CF.Cost4 = 75
	--图标位置
	CF.Buttonpos_1 = 1
	CF.Buttonpos_2 = 2
	--种族
	CF.race = "human"
	--需求
	CF.Requires = ""
	?>
	//创建魔法效果
	<?local ML1 = slk.buff.BOac:new ("MLG1")?>
	<?local ML3 = slk.buff.BOac:new ("MLG3")?>
	<?local ML4 = slk.buff.BOac:new ("MLG4")?>
	<?
	--创建技能
	--命令光环
	local MLGH = slk.ability.ACac:new ("ZSml")
	MLGH.Name = "命令光环"
	MLGH.levels = 4
	MLGH.item = 0
	MLGH.hero = 0
	--文本提示
	MLGH.Tip1 = "命令光环"
	MLGH.Tip2 = "命令光环-战争统领"
	MLGH.Tip3 = "命令光环-战术专家"
	MLGH.Tip4 = "命令光环-破甲"
	--文本提示扩展
	MLGH.Ubertip1 = "增加附近单位的15%攻击力。"
	MLGH.Ubertip2 = "增加附近单位的15%攻击力。|n|cffffff00战争统领：增加附近单位的30%攻击力。|r"
	MLGH.Ubertip3 = "增加附近单位的15%攻击力。|n|cffffff00战术专家：受光环影响的单位攻击不会被闪避。|r"
	MLGH.Ubertip4 = "增加附近单位的15%攻击力。|n|cffffff00破甲：受光环影响的单位攻击时将无视被攻击单位的护甲。|r"
	--增加攻击
	MLGH.DataA1 = 0.15
	MLGH.DataA2 = 0.3
	MLGH.DataA3 = 0.15
	MLGH.DataA4 = 0.15
	--近战奖励
	MLGH.DataB1 = 1
	MLGH.DataB2 = 1
	MLGH.DataB3 = 1
	MLGH.DataB4 = 1
	--远程奖励
	MLGH.DataC1 = 1
	MLGH.DataC2 = 1
	MLGH.DataC3 = 1
	MLGH.DataC4 = 1
	--允许目标
	MLGH.targs1 = "air,gruond,friend,self,vuln,invu"
	MLGH.targs2 = "air,gruond,friend,self,vuln,invu"
	MLGH.targs3 = "air,gruond,friend,self,vuln,invu"
	MLGH.targs4 = "air,gruond,friend,self,vuln,invu"
	--影响区域
	MLGH.Area1 = 900
	MLGH.Area2 = 900
	MLGH.Area3 = 900
	MLGH.Area4 = 900
	--魔法效果
	MLGH.BuffID1 = "BOAC"
	MLGH.BuffID2 = "BOAC"
	MLGH.BuffID3 = "MLG3"
	MLGH.BuffID4 = "MLG4"
	--图标位置
	MLGH.Buttonpos_1 = 2
	MLGH.Buttonpos_2 = 2
	--种族
	MLGH.race = "human"
	--需求
	MLGH.Requires = ""
	?>
	//嗜血
	<?
	local ZSSX = slk.ability.Asth:new ("RZSX")
	ZSSX.Name = "嗜血"
	ZSSX.levels = 4
	ZSSX.item = 0
	ZSSX.hero = 0
	--图标位置
	ZSSX.Buttonpos_1 = 3
	ZSSX.Buttonpos_2 = 2
	--图标
	ZSSX.Art = "ReplaceableTextures\\CommandButtons\\BTNHire.blp"
	--文本提示
	ZSSX.Tip1 = "嗜血"
	ZSSX.Tip2 = "嗜血-誓约之血"
	ZSSX.Tip3 = "嗜血-狂暴挥砍"
	ZSSX.Tip4 = "嗜血-血腥疯狂"
	--文本提示扩展
	ZSSX.Ubertip1 = "每当战士遭到攻击，都有15%概率激发他的嗜血，使其下一次攻击额外获得50%吸血效果。"
	ZSSX.Ubertip2 = "每当战士遭到攻击，都有25%概率激发他的嗜血，使其下一次攻击额外获得50%吸血效果。|n|cffffff00誓约之血：嗜血有15%的几率触发第二次嗜血。|r"
	ZSSX.Ubertip3 = "每当战士遭到攻击，都有25%概率激发他的嗜血，使其下一次攻击额外获得50%吸血效果。|n|cffffff00狂暴挥砍：狂暴挥砍使你的嗜血几率提高15%，直到嗜血为止，最多叠加6次。|r"
	ZSSX.Ubertip4 = "每当战士遭到攻击，都有25%概率激发他的嗜血，使其下一次攻击额外获得50%吸血效果。|n|cffffff00血腥疯狂：生命值在20%以下时，嗜血额外恢复1%的生命值。|r"
	--需求
	ZSSX.Requires = ""
	--种族
	ZSSX.race = "human"
	?>
	//斩杀
	<?
	local ZSZS = slk.ability.Afod:new ("RZZS")
	ZSZS.Name = "斩杀"
	ZSZS.levels = 4
	ZSZS.item = 0
	ZSZS.hero = 0
	--需求
	ZSZS.Requires = ""
	--图标
	ZSZS.Art = "ReplaceableTextures\\CommandButtons\\BTNBansheeMaster.blp"
	--图标位置
	ZSZS.Buttonpos_1 = 3
	ZSZS.Buttonpos_2 = 1
	--文本提示
	ZSZS.Tip1 = "斩杀"
	ZSZS.Tip2 = "斩杀-势不可挡"
	ZSZS.Tip3 = "斩杀-浴血"
	ZSZS.Tip4 = "斩杀-死亡裁决"
	--文本提示扩展
	ZSZS.Ubertip1 = "直接杀死生命值低于15%的单位。"
	ZSZS.Ubertip2 = "直接杀死生命值低于15%的单位。|n|cffffff00势不可挡：击杀目标会使你获得30%的急速与30%的移动速度，持续15秒。|r"
	ZSZS.Ubertip3 = "直接杀死生命值低于15%的单位。|n|cffffff00浴血：触发斩杀时回复被斩杀单位25%最大生命值的生命。|r"
	ZSZS.Ubertip4 = "直接杀死生命值低于15%的单位。|n|cffffff00死亡裁决：斩杀的有效距离变为1200，施放时会冲向目标。|r"
	--允许目标
	ZSZS.targs1 = "air,gruond,debris,enemy,neutral,organic"
	ZSZS.targs2 = "air,gruond,debris,enemy,neutral,organic"
	ZSZS.targs3 = "air,gruond,debris,enemy,neutral,organic"
	ZSZS.targs4 = "air,gruond,debris,enemy,neutral,organic"
	--效果
	ZSZS.TargeArt= ""
	--施法距离
	ZSZS.Rng1 = 150
	ZSZS.Rng2 = 150
	ZSZS.Rng3 = 150
	ZSZS.Rng4 = 1200
	--施放间隔
	ZSZS.Cool1 = 15
	ZSZS.Cool2 = 15
	ZSZS.Cool3 = 15
	ZSZS.Cool4 = 15
	--伤害
	ZSZS.DataC1 = 0.1
	ZSZS.DataC2 = 0.1
	ZSZS.DataC3 = 0.1
	ZSZS.DataC4 = 0.1
	--持续时间
	ZSZS.DataB1 = 0.1
	ZSZS.DataB2 = 0.1
	ZSZS.DataB3 = 0.1
	ZSZS.DataB4 = 0.1
	--效果延迟
	ZSZS.DataA1 = 0.1
	ZSZS.DataA2 = 0.1
	ZSZS.DataA3 = 0.1
	ZSZS.DataA4 = 0.1
	--种族
	ZSZS.race = "human"
	?>

	//怒吼
	//创建魔法效果
	<?local NHXG = slk.buff.Broa:new ("NHXG")?>
	<?   
	NHXG.Bufftip = "怒吼"
	NHXG.Buffubertip = "该单位具有怒吼技能，因此其攻击力得到了加强。"
	?>
	<?
	local ZSNH = slk.ability.Aroa:new ("RZNH")
	ZSNH.Name = "怒吼"
	ZSNH.levels = 4
	ZSNH.item = 0
	ZSNH.hero = 0
	--需求
	ZSNH.Requires = ""
	--图标
	ZSNH.Art = "ReplaceableTextures\\CommandButtons\\BTNBattleRoar.blp"
	--图标位置
	ZSNH.Buttonpos_1 = 2
	ZSNH.Buttonpos_2 = 1
	--魔法效果
	ZSNH.BuffID1 = "NHXG"
	ZSNH.BuffID2 = "NHXG"
	ZSNH.BuffID3 = "NHXG"
	ZSNH.BuffID4 = "NHXG"
	--文本提示
	ZSNH.Tip1 = "怒吼"
	ZSNH.Tip2 = "怒吼-嘲讽"
	ZSNH.Tip3 = "怒吼-破胆怒吼"
	ZSNH.Tip4 = "怒吼-再度冲锋"
	--文本提示扩展
	ZSNH.Ubertip1 = "增加战士和周围450范围内友军100%的攻击。"
	ZSNH.Ubertip2 = "增加战士和周围450范围内友军100%的攻击。|n|cffffff00嘲讽：强制周围300范围内的敌方单位单位攻击自己。|r"
	ZSNH.Ubertip3 = "增加战士和周围450范围内友军100%的攻击。|n|cffffff00破胆怒吼：使半径450范围内的敌人的近战攻击强度降低55%，持续30 秒。|r"
	ZSNH.Ubertip4 = "增加战士和周围450范围内友军100%的攻击。|n|cffffff00再度冲锋：增加战士和周围450范围内友军25%的攻击速度和移动速度。|r"
	--允许目标
	ZSNH.targs1 = "air,gruond,friend,self"
	ZSNH.targs2 = "air,gruond,friend,self"
	ZSNH.targs3 = "air,gruond,friend,self"
	ZSNH.targs4 = "air,gruond,friend,self"
	--影响区域
	ZSNH.Area1 = 450
	ZSNH.Area2 = 450
	ZSNH.Area3 = 450
	ZSNH.Area4 = 450
	--攻击增强
	ZSNH.DataA1 = 1
	ZSNH.DataA2 = 1
	ZSNH.DataA3 = 1
	ZSNH.DataA4 = 1
	--持续时间 普通
	ZSNH.Dur1 = 45
	ZSNH.Dur2 = 45
	ZSNH.Dur3 = 45
	ZSNH.Dur4 = 45
	--持续时间 英雄
	ZSNH.HeroDur1 = 45
	ZSNH.HeroDur2 = 45
	ZSNH.HeroDur3 = 45
	ZSNH.HeroDur4 = 45
	--魔法消耗
	ZSNH.Cost1 = 50
	ZSNH.Cost2 = 50
	ZSNH.Cost3 = 50
	ZSNH.Cost4 = 50
	--CD
	ZSNH.Cool1 = 15
	ZSNH.Cool2 = 15
	ZSNH.Cool3 = 15
	ZSNH.Cool4 = 15
	--种族
	ZSNH.race = "human"
	?>
	//
	
	//
	//创建英雄
	
	<?  
	local rzzs = slk.unit.Hmkg:new 'RzZh'?>
	<?
	rzzs.Name = "人族战士"
	rzzs.abilList = "AInv,ZSfy,ZScf,ZSml,RZSX,RZZS,RZNH,RZTF"
	rzzs.heroAbilList = ""
	rzzs.hideOnMinimap = 1
	rzzs.fused = 0
	--占用人口
	rzzs.fused = 0
	--最大库存
	rzzs.stockMax = 1
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
	--武器声音
	rzzs.weapType1 = "MeralMediumSlice"
	--模型
	rzzs.file = "units\\human\\Footman\\Footman"
	--计分屏图标
	rzzs.ScoreScreenIcon = "ReplaceableTextures\\CommandButtons\\BTNFootman.blp"
	--游戏界面图标
	rzzs.Art = "ReplaceableTextures\\CommandButtons\\BTNFootman.blp"
	rzzs.hideHeroMinimap = 1
	rzzs.dmgplus1 = 0
	?> 
endfunction