//英雄 人族
function CreateRZHero  takes nothing returns nothing
	//
	//创建英雄-人族战士
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
    rzzs.weapType1 = "MeralMediumSlice"
    -- 单位碰撞声音
    rzzs.unitSound = "BloodElfSorceror"
    -- 投射物图像 近战没有
    --rzzs.Missileart = 
    -- 武器类型
    rzzs.weapTp1 = "normal"
	--模型
	rzzs.file = "units\\human\\Footman\\Footman"
	--计分屏图标
	rzzs.ScoreScreenIcon = "ReplaceableTextures\\CommandButtons\\BTNFootman.blp"
	--游戏界面图标
	rzzs.Art = "ReplaceableTextures\\CommandButtons\\BTNFootman.blp"
	rzzs.hideHeroMinimap = 1
	rzzs.dmgplus1 = 0
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
	//戒律骑士
	<?  
	local rzzs = slk.unit.Hart:new 'RzJL'?>
	<?
	rzzs.Name = "戒律骑士"
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
    rzzs.unitSound = "Arthas"
    -- 投射物图像 近战没有
    --rzzs.Missileart = 
    -- 武器类型
    rzzs.weapTp1 = "normal"
	--模型
	rzzs.file = "units\\human\\Arthas\\Arthas"
	--计分屏图标
	rzzs.ScoreScreenIcon = "UI\\Glues\\ScoreScreen\\scorescreen-hero-arthas.blp"
	--游戏界面图标
	rzzs.Art = "ReplaceableTextures\\CommandButtons\\BTNArthas.blp"
	rzzs.hideHeroMinimap = 1
	rzzs.dmgplus1 = 0
	?>
	//审判骑士
	<?  
	local rzzs = slk.unit.Harf:new 'RzSQ'?>
	<?
	rzzs.Name = "审判骑士"
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
    rzzs.unitSound = "Arthas"
    -- 投射物图像 近战没有
    --rzzs.Missileart = 
    -- 武器类型
    rzzs.weapTp1 = "normal"
	--模型
	rzzs.file = "units\\human\\ArthaswithSword\\ArthaswithSword"
	--计分屏图标
	rzzs.ScoreScreenIcon = "UI\\Glues\\ScoreScreen\\scorescreen-hero-arthas.blp"
	--游戏界面图标
	rzzs.Art = "ReplaceableTextures\\CommandButtons\\BTNArthas.blp"
	rzzs.hideHeroMinimap = 1
	rzzs.dmgplus1 = 0
	?>
	//大法师
	<?  
	local rzzs = slk.unit.Hamg:new 'RzDF'?>
	<?
	rzzs.Name = "大法师"
	rzzs.abilList = ""
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
	rzzs.Primary = "INT"
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
    rzzs.unitSound = "Arthas"
    -- 投射物图像 近战没有
	rzzs.Missileart = "Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl"
	-- 攻击距离
	rzzs.rangeN1 = 600
    -- 武器类型
    rzzs.weapTp1 = "missile"
	--模型
	rzzs.file = "units\\human\\HeroArchMage\\HeroArchMage"
	--计分屏图标
	rzzs.ScoreScreenIcon = "UI\\Glues\\ScoreScreen\\scorescreen-hero-archmage.blp"
	--游戏界面图标
	rzzs.Art = "ReplaceableTextures\\CommandButtons\\BTNHeroArchMage.blp"
	rzzs.hideHeroMinimap = 1
	rzzs.dmgplus1 = 0
	?>
	//冰女
	<?  
	local rzzs = slk.unit.Hjai:new 'RzBV'?>
	<?
	rzzs.Name = "冰女"
	rzzs.abilList = ""
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
	rzzs.Primary = "INT"
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
    rzzs.unitSound = "Arthas"
    -- 投射物图像 近战没有
	rzzs.Missileart = "Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl"
	-- 攻击距离
	rzzs.rangeN1 = 600
    -- 武器类型
    rzzs.weapTp1 = "missile"
	--模型
	rzzs.file = "units\\human\\Jaina\\Jaina"
	--计分屏图标
	rzzs.ScoreScreenIcon = "UI\\Glues\\ScoreScreen\\scorescreen-hero-jaina.blp"
	--游戏界面图标
	rzzs.Art = "ReplaceableTextures\\CommandButtons\\BTNJaina.blp"
	rzzs.hideHeroMinimap = 1
	rzzs.dmgplus1 = 0
	?>
	//督军
	<?  
	local rzzs = slk.unit.Hlgr:new 'RzDJ'?>
	<?
	rzzs.Name = "督军"
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
    rzzs.unitSound = "Arthas"
    -- 投射物图像 近战没有
    --rzzs.Missileart = 
    -- 武器类型
    rzzs.weapTp1 = "normal"
	--模型
	rzzs.file = "units\\creeps\\LordGarithos\\LordGarithos"
	--计分屏图标
	rzzs.ScoreScreenIcon = "UI\\Glues\\ScoreScreen\\scorescreen-hero-garithos.blp"
	--游戏界面图标
	rzzs.Art = "ReplaceableTextures\\CommandButtons\\BTNGarithos.blp"
	rzzs.hideHeroMinimap = 1
	rzzs.dmgplus1 = 0
	?>
	//大法师灵魂形态
	<?  
	local rzzs = slk.unit.Hgam:new 'RzDL'?>
	<?
	rzzs.Name = "大法师灵魂形态"
	rzzs.abilList = ""
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
	rzzs.Primary = "INT"
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
    rzzs.unitSound = "Arthas"
    -- 投射物图像 近战没有
	rzzs.Missileart = "units\\other\\HeroArchMageGhost\\HeroArchMageGhost"
	-- 攻击距离
	rzzs.rangeN1 = 600
    -- 武器类型
    rzzs.weapTp1 = "missile"
	--模型
	rzzs.file = "units\\human\\HeroArchMage\\HeroArchMage"
	--计分屏图标
	rzzs.ScoreScreenIcon = "UI\\Glues\\ScoreScreen\\scorescreen-hero-archmage.blp"
	--游戏界面图标
	rzzs.Art = "ReplaceableTextures\\CommandButtons\\BTNGhostMage.blp"
	rzzs.hideHeroMinimap = 1
	rzzs.dmgplus1 = 0
	?>
endfunction
//矮人族英雄
function CreateARZHero  takes nothing returns nothing
	//山丘之王
	<?  
	local rzzs = slk.unit.Hmkg:new 'ARSQ'?>
	<?
	arsq.Name = "山丘之王"
	arsq.abilList = "AInv,ZSfy,ZScf,ZSml,RZSX,RZZS,RZNH,RZTF"
	arsq.heroAbilList = ""
	arsq.hideOnMinimap = 1
	arsq.fused = 0
	--占用人口
	arsq.fused = 0
	--最大库存
    arsq.stockMax = 1
    -- 科技需求
    arsq.Requires1 = ""
    arsq.Requires2 = ""
	--基础伤害
	arsq.dmgplus1 = 0
	--攻击间隔
	arsq.cool1 = 1.7
	--初始属性
	arsq.STR = 5
	arsq.AGI = 5
	arsq.INT = 5
	--每级提升属性
	arsq.STRplus = 2
	arsq.AGIplus = 2
	arsq.INTplus = 2
	--魔法最大值
	arsq.manaN = 0
	--魔法回复
	arsq.regenMana = 0.01
	--初始魔法值
	arsq.mana0 = 100
	--最大生命值
	arsq.HP = 100
	--生命回复
	arsq.regenHP = 0.25
	--主属性
	arsq.Primary = "STR"
	--基础移动速度
	arsq.spd = 270.00
	--转身速度
	arsq.turnRate = 0.6
	--修理时间
	arsq.reptm = 0
	--修理木材消耗
	arsq.lumberRep = 0
	--修理黄金消耗
	arsq.goldRep = 0
	--建造时间
	arsq.bldtm = 0
	--木材消耗
	arsq.lumbercost = 0
	--黄金消耗
    arsq.goldcost = 0
    -- 称谓
	arsq.Propernames = "爱尔丁-破日者,泰尼恩-鹰翼"
	-- 单位声音
	arsq.
	--武器声音
    arsq.weapType1 = "MeralMediumSlice"
    -- 单位碰撞声音
    arsq.unitSound = "BloodElfSorceror"
    -- 投射物图像 近战没有
    --rzzs.Missileart = 
    -- 武器类型
    arsq.weapTp1 = "normal"
	--模型
	arsq.file = "units\\human\\Footman\\Footman"
	--计分屏图标
	arsq.ScoreScreenIcon = "ReplaceableTextures\\CommandButtons\\BTNFootman.blp"
	--游戏界面图标
	arsq.Art = "ReplaceableTextures\\CommandButtons\\BTNFootman.blp"
	arsq.hideHeroMinimap = 1
	arsq.dmgplus1 = 0
    ?> 
endfunction