function CreateShanQiuZhiWang  takes nothing returns nothing
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
	arsq.unitSound = "HeroMountainKing"
	--武器声音
    arsq.weapType1 = "MeralMediumSlice"
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