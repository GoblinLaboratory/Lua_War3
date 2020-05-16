function CreateDuJun  takes nothing returns nothing
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
    rzzs.unitSound = "Garithos"
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
endfunction