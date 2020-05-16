//TESH.scrollpos=0
//TESH.alwaysfold=0
//第一次运行开启允许，保存后关闭地图
//然后再次打开地图，关闭允许（第一次导入了数据，以后就不需要再次导入了导入了数据)



///魔法书装备栏系统

<?local slk = require 'slk' ?>
//创建装备栏背景
function CreatZb1 takes nothing returns nothing
	//创建主手武器  1
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new ("ZBA"..i)
	?>
	<?
	obj.Name = string.format("主手武器(|cffffcc00Z|r)[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "主手武器"
	obj.Ubertip = "未装备主手武器[点击主手武器类装备能进行装备]"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "phoenixfire"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Requires = "R000"
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNArcaniteMelee.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	//
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new ("ZWA"..i)
	?>
	<?
	obj.Name = string.format("主手武器(卸下)(|cffffcc00Z|r)[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "主手武器"
	obj.Ubertip = "主手武器"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "phoenixfire"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNArcaniteMelee.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	
	//副手装备  2 
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new ("ZBB"..i)
	?>
	<?
	obj.Name = string.format("副手武器[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "副手武器"
	obj.Ubertip = "未装备副手武器[点击副手武器类装备能进行装备]"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "parasite"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Requires = "R000"
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNGrimWard.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new ("ZWB"..i)
	?>
	<?
	obj.Name = string.format("副手武器(卸下)[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "副手武器"
	obj.Ubertip = "副手武器"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "parasite"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNGrimWard.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	
	//头盔   3
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new ("ZBC"..i)
	?>
	<?
	obj.Name = string.format("头部装备[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "头部装备"
	obj.Ubertip = "未装备头部装备[点击头部装备进行装备]"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "parasiteoff"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Requires = "R000"
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNUnholyAura.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new ("ZWC"..i)
	?>
	<?
	obj.Name = string.format("头部装备(卸下)[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "头部装备"
	obj.Ubertip = "头部装备"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "parasiteoff"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNUnholyAura.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	//铠甲   4
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new ("ZBD"..i)
	?>
	<?
	obj.Name = string.format("胸部装备[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "胸部装备"
	obj.Ubertip = "未装备胸部装备[点击胸部装备进行装备]"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "parasiteon"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Requires = "R000"
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNAdvancedMoonArmor.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new ("ZWD"..i)
	?>
	<?
	obj.Name = string.format("胸部装备(卸下)[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "胸部装备"
	obj.Ubertip = "胸部装备"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "parasiteon"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNAdvancedMoonArmor.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	//披风  5
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new ("ZBE"..i)
	?>
	<?
	obj.Name = string.format("腰部装备[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "腰部装备"
	obj.Ubertip = "未装备腰部装备[点击腰部装备能进行装备]"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "polymorph"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Requires = "R000"
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNRunedBracers.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new ("ZWE"..i)
	?>
	<?
	obj.Name = string.format("腰部装备(卸下)[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "腰部装备"
	obj.Ubertip = "腰部装备"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "polymorph"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNRunedBracers.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	//手套 6
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new ("ZBF"..i)
	?>
	<?
	obj.Name = string.format("腿部装备[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "腿部装备"
	obj.Ubertip = "未装备腿部装备[点击腿部装备进行装备]"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "possession"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Requires = "R000"
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNPackBeast.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new ("ZWF"..i)
	?>
	<?
	obj.Name = string.format("腿部装备(卸下)[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "腿部装备"
	obj.Ubertip = "腿部装备"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "possession"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNPackBeast.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	//鞋 7
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new ("ZBG"..i)
	?>
	<?
	obj.Name = string.format("手部装备[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "手部装备"
	obj.Ubertip = "未装备手部装备[点击手部装备进行装备]"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "preservation"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Requires = "R000"
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNGlove.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new ("ZWG"..i)
	?>
	<?
	obj.Name = string.format("手部装备(卸下)[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "手部装备"
	obj.Ubertip = "手部装备"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "preservation"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNGlove.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	
	//面具  8
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new ("ZBH"..i)
	?>
	<?
	obj.Name = string.format("脚部装备[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "脚部装备"
	obj.Ubertip = "未装备脚部装备[点击脚部装备进行装备]"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "purge"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Requires = "R000"
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNBootsOfSpeed.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new ("ZWH"..i)
	?>
	<?
	obj.Name = string.format("脚部装备(卸下)[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "脚部装备"
	obj.Ubertip = "脚部装备"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "purge"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNBootsOfSpeed.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	//项链  9
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new ("ZBI"..i)
	?>
	<?
	obj.Name = string.format("项链[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "项链"
	obj.Ubertip = "未装备项链[点击项链类装备能进行装备]"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "rainofchaos"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Requires = "R000"
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNPendantOfMana.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new ("ZWI"..i)
	?>
	<?
	obj.Name = string.format("项链(卸下)[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "项链"
	obj.Ubertip = "项链"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "rainofchaos"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNPendantOfMana.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	//饰品  10
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new ("ZBJ"..i)
	?>
	<?
	obj.Name = string.format("戒指[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "戒指"
	obj.Ubertip = "未装备戒指[点击戒指进行装备]"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "rainoffire"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Requires = "R000"
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNRingGreen.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new ("ZWJ"..i)
	?>
	<?
	obj.Name = string.format("戒指(卸下)[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "戒指"
	obj.Ubertip = "戒指"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "rainoffire"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNRingGreen.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	//戒指  11
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new ("ZBK"..i)
	?>
	<?
	obj.Name = string.format("披风[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "披风"
	obj.Ubertip = "未装备披风[点击披风进行装备]"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "raisedead"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Requires = "R000"
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNRobeOfTheMagi.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new ("ZWK"..i)
	?>
	<?
	obj.Name = string.format("披风(卸下)[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "披风"
	obj.Ubertip = "披风"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "raisedead"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNRobeOfTheMagi.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
endfunction
//创建工程升级
function CreatGC takes nothing returns nothing
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANeg:new ("ZGA"..i)
	?>
	<?
	obj.Name = string.format("主手武器 工程升级)[%03d]", i)
	obj.DataA1 = 0.00
	obj.levels = 1
	obj.item = 0
	obj.hero = 0
	obj.DataB1 = 0.00
	obj.DataC1 = "ZBA"..i..",".."ZWA"..i
	obj.DataD1 = ""
	obj.DataE1 = ""
	obj.DataF1 = ""
	obj.race = "orc"
	?>   
	<?
	end
	?>
	
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANeg:new ("ZGB"..i)
	?>
	<?
	obj.Name = string.format("副手武器 工程升级)[%03d]", i)
	obj.DataA1 = 0.00
	obj.levels = 1
	obj.item = 0
	obj.hero = 0
	obj.DataB1 = 0.00
	obj.DataC1 = "ZBB"..i..",".."ZWB"..i
	obj.DataD1 = ""
	obj.DataE1 = ""
	obj.DataF1 = ""
	obj.race = "orc"
	?>   
	<?
	end
	?>
	/////头盔
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANeg:new ("ZGC"..i)
	?>
	<?
	obj.Name = string.format("头盔 工程升级)[%03d]", i)
	obj.DataA1 = 0.00
	obj.levels = 1
	obj.item = 0
	obj.hero = 0
	obj.DataB1 = 0.00
	obj.DataC1 = "ZBC"..i..",".."ZWC"..i
	obj.DataD1 = ""
	obj.DataE1 = ""
	obj.DataF1 = ""
	obj.race = "orc"
	?>   
	<?
	end
	?>
	/////铠甲
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANeg:new ("ZGD"..i)
	?>
	<?
	obj.Name = string.format("胸部装备 工程升级)[%03d]", i)
	obj.DataA1 = 0.00
	obj.levels = 1
	obj.item = 0
	obj.hero = 0
	obj.DataB1 = 0.00
	obj.DataC1 = "ZBD"..i..",".."ZWD"..i
	obj.DataD1 = ""
	obj.DataE1 = ""
	obj.DataF1 = ""
	obj.race = "orc"
	?>   
	<?
	end
	?>
	/////披风
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANeg:new ("ZGE"..i)
	?>
	<?
	obj.Name = string.format("腰部装备 工程升级)[%03d]", i)
	obj.DataA1 = 0.00
	obj.levels = 1
	obj.item = 0
	obj.hero = 0
	obj.DataB1 = 0.00
	obj.DataC1 = "ZBE"..i..",".."ZWE"..i
	obj.DataD1 = ""
	obj.DataE1 = ""
	obj.DataF1 = ""
	obj.race = "orc"
	?>   
	<?
	end
	?>
	/////手套
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANeg:new ("ZGF"..i)
	?>
	<?
	obj.Name = string.format("腿部装备 工程升级)[%03d]", i)
	obj.DataA1 = 0.00
	obj.levels = 1
	obj.item = 0
	obj.hero = 0
	obj.DataB1 = 0.00
	obj.DataC1 = "ZBF"..i..",".."ZWF"..i
	obj.DataD1 = ""
	obj.DataE1 = ""
	obj.DataF1 = ""
	obj.race = "orc"
	?>   
	<?
	end
	?>
	/////鞋
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANeg:new ("ZGG"..i)
	?>
	<?
	obj.Name = string.format("手部装备 工程升级)[%03d]", i)
	obj.DataA1 = 0.00
	obj.levels = 1
	obj.item = 0
	obj.hero = 0
	obj.DataB1 = 0.00
	obj.DataC1 = "ZBG"..i..",".."ZWG"..i
	obj.DataD1 = ""
	obj.DataE1 = ""
	obj.DataF1 = ""
	obj.race = "orc"
	?>   
	<?
	end
	?>
	/////面具
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANeg:new ("ZGH"..i)
	?>
	<?
	obj.Name = string.format("脚部装备 工程升级)[%03d]", i)
	obj.DataA1 = 0.00
	obj.levels = 1
	obj.item = 0
	obj.hero = 0
	obj.DataB1 = 0.00
	obj.DataC1 = "ZBH"..i..",".."ZWH"..i
	obj.DataD1 = ""
	obj.DataE1 = ""
	obj.DataF1 = ""
	obj.race = "orc"
	?>   
	<?
	end
	?>
	/////项链
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANeg:new ("ZGI"..i)
	?>
	<?
	obj.Name = string.format("项链 工程升级)[%03d]", i)
	obj.DataA1 = 0.00
	obj.levels = 1
	obj.item = 0
	obj.hero = 0
	obj.DataB1 = 0.00
	obj.DataC1 = "ZBI"..i..",".."ZWI"..i
	obj.DataD1 = ""
	obj.DataE1 = ""
	obj.DataF1 = ""
	obj.race = "orc"
	?>   
	<?
	end
	?>
	/////饰品
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANeg:new ("ZGJ"..i)
	?>
	<?
	obj.Name = string.format("戒指 工程升级)[%03d]", i)
	obj.DataA1 = 0.00
	obj.levels = 1
	obj.item = 0
	obj.hero = 0
	obj.DataB1 = 0.00
	obj.DataC1 = "ZBJ"..i..",".."ZWJ"..i
	obj.DataD1 = ""
	obj.DataE1 = ""
	obj.DataF1 = ""
	obj.race = "orc"
	?>   
	<?
	end
	?>
	/////戒指
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANeg:new ("ZGK"..i)
	?>
	<?
	obj.Name = string.format("披风 工程升级)[%03d]", i)
	obj.DataA1 = 0.00
	obj.levels = 1
	obj.item = 0
	obj.hero = 0
	obj.DataB1 = 0.00
	obj.DataC1 = "ZBK"..i..",".."ZWK"..i
	obj.DataD1 = ""
	obj.DataE1 = ""
	obj.DataF1 = ""
	obj.race = "orc"
	?>   
	<?
	end
	?>
endfunction

//创建装备栏
function Test1 takes nothing returns nothing
	//创建装备栏
	<? 
	for i = 0, 9 do
	local obj = slk.ability.Aspb:new ("ZBL"..i)
	?>
	<?
	obj.Name = string.format("装备栏(|cffffcc00Z|r)[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.DataD1 = 11
	obj.DataC1 = 11
	obj.Tip = "装备栏(|cffffcc00Z|r)"
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNPackBeast.blp"
	obj.DataE1 = "stampede"
	obj.DataA1 = "ZBA"..i..",".."ZBB"..i..",".."ZBC"..i..",".."ZBD"..i..",".."ZBE"..i..",".."ZBF"..i..",".."ZBG"..i..",".."ZBH"..i..",".."ZBI"..i..",".."ZBJ"..i..",".."ZBK"..i
	?>   
	<?
	end
	?>
	//使用装备技能
	<? local obj1 = slk.ability.ANbr:new 'ZSZB' ?>
	// 以'AHtb'(风暴之锤)为模板，创建一个新的技能对象'A233'。不过你在保存后需要重新打开地图才能看到它。
	// 把这个新的对象记下来，等会儿还要用到它
	<?
	obj1.Name = "使用装备"
	obj1.levels = 1
	obj1.DataA1 = 0.00
	obj1.race = "orc"
	obj1.hero = 0
	obj1.Cool1 = 0.01
	obj1.targs1 = "none"
	obj1.Dur1 = 0.001
	obj1.HeroDur1 = 0.001
	obj1.Cost1 = 0
	obj1.Area1 = 0.00
	obj1.item = 1
	?>
endfunction

//创建属性系统
function Shuxing  takes nothing returns nothing
	// BonusMod - Armor护甲
	
	<? local obj = slk.ability.AId1:new 'ZxA0' ?>
	<?
	obj.Name = "护甲+0001"
	obj.levels = 1
	obj.DataA = 1.00
	?>
	<? local obj = slk.ability.AId1:new 'ZxA1' ?>
	<?
	obj.Name = "护甲+0002"
	obj.levels = 1
	obj.DataA = 2.00
	?>
	
	<? local obj = slk.ability.AId1:new 'ZxA2' ?>
	<?
	obj.Name = "护甲+0004"
	obj.levels = 1
	obj.DataA = 4.00
	?>
	
	<? local obj = slk.ability.AId1:new 'ZxA3' ?>
	<?
	obj.Name = "护甲+0008"
	obj.levels = 1
	obj.DataA = 8.00
	?>
	
	<? local obj = slk.ability.AId1:new 'ZxA4' ?>
	<?
	obj.Name = "护甲+0016"
	obj.levels = 1
	obj.DataA = 16.00
	?>
	
	<? local obj = slk.ability.AId1:new 'ZxA5' ?>
	<?
	obj.Name = "护甲+0032"
	obj.levels = 1
	obj.DataA = 32.00
	?>
	
	<? local obj = slk.ability.AId1:new 'ZxA6' ?>
	<?
	obj.Name = "护甲+0064"
	obj.levels = 1
	obj.DataA = 64.00
	?>
	
	<? local obj = slk.ability.AId1:new 'ZxA7' ?>
	<?
	obj.Name = "护甲+0128"
	obj.levels = 1
	obj.DataA = 128.00
	?>
	
	<? local obj = slk.ability.AId1:new 'ZxA8' ?>
	<?
	obj.Name = "护甲+0256"
	obj.levels = 1
	obj.DataA = 256.00
	?>
	
	<? local obj = slk.ability.AId1:new 'ZxA9' ?>
	<?
	obj.Name = "护甲+0512"
	obj.levels = 1
	obj.DataA = 512.00
	?>
	
	<? local obj = slk.ability.AId1:new 'ZxAa' ?>
	<?
	obj.Name = "护甲1024"
	obj.levels = 1
	obj.DataA = 1024.00
	?>
	
	<? local obj = slk.ability.AId1:new 'ZxAb' ?>
	<?
	obj.Name = "护甲+2048"
	obj.levels = 1
	obj.DataA = 2048.00
	?>
	
	<? local obj = slk.ability.AId1:new 'ZxAc' ?>
	<?
	obj.Name = "-4096"
	obj.levels = 1
	obj.DataA = -4096.00
	?>
	//Damage攻击   
	
	<? local obj = slk.ability.AItg:new 'ZxB0' ?>
	<?
	obj.Name = "攻击   +0001"
	obj.levels = 1
	obj.DataA = 1.00
	?>
	<? local obj = slk.ability.AItg:new 'ZxB1' ?>
	<?
	obj.Name = "攻击   +0002"
	obj.levels = 1
	obj.DataA = 2.00
	?>
	<? local obj = slk.ability.AItg:new 'ZxB2' ?>
	<?
	obj.Name = "攻击   +0004"
	obj.levels = 1
	obj.DataA = 4.00
	?>
	<? local obj = slk.ability.AItg:new 'ZxB3' ?>
	<?
	obj.Name = "攻击   +0008"
	obj.levels = 1
	obj.DataA = 8.00
	?>
	<? local obj = slk.ability.AItg:new 'ZxB4' ?>
	<?
	obj.Name = "攻击   +0016"
	obj.levels = 1
	obj.DataA = 16.00
	?>
	<? local obj = slk.ability.AItg:new 'ZxB5' ?>
	<?
	obj.Name = "攻击   +0032"
	obj.levels = 1
	obj.DataA = 32.00
	?>
	<? local obj = slk.ability.AItg:new 'ZxB6' ?>
	<?
	obj.Name = "攻击   +0064"
	obj.levels = 1
	obj.DataA = 64.00
	?>
	<? local obj = slk.ability.AItg:new 'ZxB7' ?>
	<?
	obj.Name = "攻击   +0128"
	obj.levels = 1
	obj.DataA = 128.00
	?>
	<? local obj = slk.ability.AItg:new 'ZxB8' ?>
	<?
	obj.Name = "攻击   +0256"
	obj.levels = 1
	obj.DataA = 256.00
	?>
	<? local obj = slk.ability.AItg:new 'ZxB9' ?>
	<?
	obj.Name = "攻击   +0512"
	obj.levels = 1
	obj.DataA = 512.00
	?>
	<? local obj = slk.ability.AItg:new 'ZxBa' ?>
	<?
	obj.Name = "攻击   +1024"
	obj.levels = 1
	obj.DataA = 1024.00
	?>
	<? local obj = slk.ability.AItg:new 'ZxBb' ?>
	<?
	obj.Name = "攻击   +2048"
	obj.levels = 1
	obj.DataA = 2048.00
	?>
	
	<? local obj = slk.ability.AItg:new 'ZxBc' ?>
	<?
	obj.Name = "攻击   +4096"
	obj.levels = 1
	obj.DataA = 4096.00
	?>
	<? local obj = slk.ability.AItg:new 'ZxBd' ?>
	<?
	obj.Name = "攻击   +8192"
	obj.levels = 1
	obj.DataA = 8192.00
	?>
	<? local obj = slk.ability.AItg:new 'ZxBe' ?>
	<?
	obj.Name = "攻击   +16384"
	obj.levels = 1
	obj.DataA = 16384.00
	?>
	<? local obj = slk.ability.AItg:new 'ZxBf' ?>
	<?
	obj.Name = "攻击   +32768"
	obj.levels = 1
	obj.DataA = 32768.00
	?>
	<? local obj = slk.ability.AItg:new 'ZxBg' ?>
	<?
	obj.Name = "攻击   +65536"
	obj.levels = 1
	obj.DataA = 65536.00
	?>
	<? local obj = slk.ability.AItg:new 'ZxBh' ?>
	<?
	obj.Name = "攻击   +131072"
	obj.levels = 1
	obj.DataA = 131072.00
	?>
	<? local obj = slk.ability.AItg:new 'ZxBi' ?>
	<?
	obj.Name = "攻击   +262144"
	obj.levels = 1
	obj.DataA = 262144.00
	?>
	<? local obj = slk.ability.AItg:new 'ZxBj' ?>
	<?
	obj.Name = "攻击   +524288"
	obj.levels = 1
	obj.DataA = 524288.00
	?>
	<? local obj = slk.ability.AItg:new 'ZxBk' ?>
	<?
	obj.Name = "攻击   +1048576"
	obj.levels = 1
	obj.DataA = 1048576.00
	?>
	<? local obj = slk.ability.AItg:new 'ZxBl' ?>
	<?
	obj.Name = "攻击   +2097152"
	obj.levels = 1
	obj.DataA = 2097152.00
	?>
	<? local obj = slk.ability.AItg:new 'ZxBm' ?>
	<?
	obj.Name = "攻击   +4194304"
	obj.levels = 1
	obj.DataA = 4194304.00
	?>
	<? local obj = slk.ability.AItg:new 'ZxBn' ?>
	<?
	obj.Name = "攻击   -8388608"
	obj.levels = 1
	obj.DataA = -8388608.00
	?>
	
	// BonusMod - Mana Regeneration法力回复
	
	<? local obj = slk.ability.AIrm:new 'ZxD0' ?>
	<?
	obj.Name = "法力回复+0001"
	obj.levels = 1
	obj.DataA = 0.01
	?>
	<? local obj = slk.ability.AIrm:new 'ZxD1' ?>
	<?
	obj.Name = "法力回复+0002"
	obj.levels = 1
	obj.DataA = 0.02
	?>
	<? local obj = slk.ability.AIrm:new 'ZxD2' ?>
	<?
	obj.Name = "法力回复+0004"
	obj.levels = 1
	obj.DataA = 0.04
	?>
	<? local obj = slk.ability.AIrm:new 'ZxD3' ?>
	<?
	obj.Name = "法力回复+0008"
	obj.levels = 1
	obj.DataA = 0.08
	?>
	<? local obj = slk.ability.AIrm:new 'ZxD4' ?>
	<?
	obj.Name = "法力回复+0016"
	obj.levels = 1
	obj.DataA = 0.16
	?>
	<? local obj = slk.ability.AIrm:new 'ZxD5' ?>
	<?
	obj.Name = "法力回复+0032"
	obj.levels = 1
	obj.DataA = 0.32
	?>
	<? local obj = slk.ability.AIrm:new 'ZxD6' ?>
	<?
	obj.Name = "法力回复+0064"
	obj.levels = 1
	obj.DataA = 0.64
	?>
	<? local obj = slk.ability.AIrm:new 'ZxD7' ?>
	<?
	obj.Name = "法力回复+0128"
	obj.levels = 1
	obj.DataA = 1.28
	?>
	<? local obj = slk.ability.AIrm:new 'ZxD8' ?>
	<?
	obj.Name = "法力回复+0256"
	obj.levels = 1
	obj.DataA = 2.56
	?>
	<? local obj = slk.ability.AIrm:new 'ZxD9' ?>
	<?
	obj.Name = "法力回复+0512"
	obj.levels = 1
	obj.DataA = 5.12
	?>
	<? local obj = slk.ability.AIrm:new 'ZxDa' ?>
	<?
	obj.Name = "法力回复+1024"
	obj.levels = 1
	obj.DataA = 10.24
	?>
	<? local obj = slk.ability.AIrm:new 'ZxDb' ?>
	<?
	obj.Name = "法力回复+2048"
	obj.levels = 1
	obj.DataA = 20.48
	?>
	<? local obj = slk.ability.AIrm:new 'ZxDc' ?>
	<?
	obj.Name = "法力回复-4096"
	obj.levels = 1
	obj.DataA = -40.96
	?>
	
	// BonusMod - Life Regenration生命再生
	
	<? local obj = slk.ability.Arel:new 'ZxE0' ?>
	<?
	obj.Name = "生命再生+0001"
	obj.levels = 1
	obj.DataA = 1
	?>
	<? local obj = slk.ability.Arel:new 'ZxE1' ?>
	<?
	obj.Name = "生命再生+0002"
	obj.levels = 1
	obj.DataA = 2
	?>
	<? local obj = slk.ability.Arel:new 'ZxE2' ?>
	<?
	obj.Name = "生命再生+0004"
	obj.levels = 1
	obj.DataA = 4
	?>
	<? local obj = slk.ability.Arel:new 'ZxE3' ?>
	<?
	obj.Name = "生命再生+0008"
	obj.levels = 1
	obj.DataA = 8
	?>
	<? local obj = slk.ability.Arel:new 'ZxE4' ?>
	<?
	obj.Name = "生命再生+0016"
	obj.levels = 1
	obj.DataA = 16
	?>
	<? local obj = slk.ability.Arel:new 'ZxE5' ?>
	<?
	obj.Name = "生命再生+0032"
	obj.levels = 1
	obj.DataA = 32
	?>
	<? local obj = slk.ability.Arel:new 'ZxE6' ?>
	<?
	obj.Name = "生命再生+0064"
	obj.levels = 1
	obj.DataA = 64
	?>
	<? local obj = slk.ability.Arel:new 'ZxE7' ?>
	<?
	obj.Name = "生命再生+0128"
	obj.levels = 1
	obj.DataA = 128
	?>
	<? local obj = slk.ability.Arel:new 'ZxE8' ?>
	<?
	obj.Name = "生命再生+0256"
	obj.levels = 1
	obj.DataA = 256
	?>
	<? local obj = slk.ability.Arel:new 'ZxE9' ?>
	<?
	obj.Name = "生命再生+0512"
	obj.levels = 1
	obj.DataA = 512
	?>
	<? local obj = slk.ability.Arel:new 'ZxEa' ?>
	<?
	obj.Name = "生命再生+1024"
	obj.levels = 1
	obj.DataA = 1024
	?>
	<? local obj = slk.ability.Arel:new 'ZxEb' ?>
	<?
	obj.Name = "生命再生+2048"
	obj.levels = 1
	obj.DataA = 2048
	?>
	<? local obj = slk.ability.Arel:new 'ZxEc' ?>
	<?
	obj.Name = "生命再生-4096"
	obj.levels = 1
	obj.DataA = -4096
	?>
	
	
	//BonusMod - Attack Speed 攻击速度
	
	<? local obj = slk.ability.AIsx:new 'ZxJ0' ?>
	<?
	obj.Name = "攻击速度+0001"
	obj.levels = 1
	obj.DataA = 0.01
	?>
	<? local obj = slk.ability.AIsx:new 'ZxJ1' ?>
	<?
	obj.Name = "攻击速度+0002"
	obj.levels = 1
	obj.DataA = 0.02
	?>
	<? local obj = slk.ability.AIsx:new 'ZxJ2' ?>
	<?
	obj.Name = "攻击速度+0004"
	obj.levels = 1
	obj.DataA = 0.04
	?>
	<? local obj = slk.ability.AIsx:new 'ZxJ3' ?>
	<?
	obj.Name = "攻击速度+0008"
	obj.levels = 1
	obj.DataA = 0.08
	?>
	<? local obj = slk.ability.AIsx:new 'ZxJ4' ?>
	<?
	obj.Name = "攻击速度+0016"
	obj.levels = 1
	obj.DataA = 0.16
	?>
	<? local obj = slk.ability.AIsx:new 'ZxJ5' ?>
	<?
	obj.Name = "攻击速度+0032"
	obj.levels = 1
	obj.DataA = 0.32
	?>
	<? local obj = slk.ability.AIsx:new 'ZxJ6' ?>
	<?
	obj.Name = "攻击速度+0064"
	obj.levels = 1
	obj.DataA = 0.64
	?>
	<? local obj = slk.ability.AIsx:new 'ZxJ7' ?>
	<?
	obj.Name = "攻击速度+0128"
	obj.levels = 1
	obj.DataA = 1.28
	?>
	<? local obj = slk.ability.AIsx:new 'ZxJ8' ?>
	<?
	obj.Name = "攻击速度+0256"
	obj.levels = 1
	obj.DataA = 2.56
	?>
	<? local obj = slk.ability.AIsx:new 'ZxJ9' ?>
	<?
	obj.Name = "攻击速度+0512"
	obj.levels = 1
	obj.DataA = 5.12
	?>
	<? local obj = slk.ability.AIsx:new 'ZxJa' ?>
	<?
	obj.Name = "攻击速度+1024"
	obj.levels = 1
	obj.DataA = 10.24
	?>
	<? local obj = slk.ability.AIsx:new 'ZxJb' ?>
	<?
	obj.Name = "攻击速度+2048"
	obj.levels = 1
	obj.DataA = 20.48
	?>
	<? local obj = slk.ability.AIsx:new 'ZxJc' ?>
	<?
	obj.Name = "攻击速度-4096"
	obj.levels = 1
	obj.DataA = -40.96
	?>
	
	// BonusMod - Life 最大生命
	
	<? local obj = slk.ability.AIl2:new 'ZxL0' ?>
	<?
	obj.Name = "最大生命+0001"
	obj.levels = 1
	obj.DataA = 1
	?>
	<? local obj = slk.ability.AIl2:new 'ZxL1' ?>
	<?
	obj.Name = "最大生命+0002"
	obj.levels = 1
	obj.DataA = 2
	?>
	<? local obj = slk.ability.AIl2:new 'ZxL2' ?>
	<?
	obj.Name = "最大生命+0004"
	obj.levels = 1
	obj.DataA = 4
	?>
	<? local obj = slk.ability.AIl2:new 'ZxL3' ?>
	<?
	obj.Name = "最大生命+0008"
	obj.levels = 1
	obj.DataA = 8
	?>
	<? local obj = slk.ability.AIl2:new 'ZxL4' ?>
	<?
	obj.Name = "最大生命+0016"
	obj.levels = 1
	obj.DataA = 16
	?>
	<? local obj = slk.ability.AIl2:new 'ZxL5' ?>
	<?
	obj.Name = "最大生命+0032"
	obj.levels = 1
	obj.DataA = 32
	?>
	<? local obj = slk.ability.AIl2:new 'ZxL6' ?>
	<?
	obj.Name = "最大生命+0064"
	obj.levels = 1
	obj.DataA = 64
	?>
	<? local obj = slk.ability.AIl2:new 'ZxL7' ?>
	<?
	obj.Name = "最大生命+0128"
	obj.levels = 1
	obj.DataA = 128
	?>
	<? local obj = slk.ability.AIl2:new 'ZxL8' ?>
	<?
	obj.Name = "最大生命+0256"
	obj.levels = 1
	obj.DataA = 256
	?>
	<? local obj = slk.ability.AIl2:new 'ZxL9' ?>
	<?
	obj.Name = "最大生命+0512"
	obj.levels = 1
	obj.DataA = 512
	?>
	<? local obj = slk.ability.AIl2:new 'ZxLa' ?>
	<?
	obj.Name = "最大生命+1024"
	obj.levels = 1
	obj.DataA = 1024
	?>
	<? local obj = slk.ability.AIl2:new 'ZxLb' ?>
	<?
	obj.Name = "最大生命+2048"
	obj.levels = 1
	obj.DataA = 2048
	?>
	<? local obj = slk.ability.AIl2:new 'ZxLc' ?>
	<?
	obj.Name = "最大生命-4096"
	obj.levels = 1
	obj.DataA = -4096
	?>
	
	// BonusMod - Life 最大魔法
	
	<? local obj = slk.ability.AIbm:new 'ZxK0' ?>
	<?
	obj.Name = "最大魔法+0001"
	obj.levels = 1
	obj.DataA = 1
	?>
	<? local obj = slk.ability.AIbm:new 'ZxK1' ?>
	<?
	obj.Name = "最大魔法+0002"
	obj.levels = 1
	obj.DataA = 2
	?>
	<? local obj = slk.ability.AIbm:new 'ZxK2' ?>
	<?
	obj.Name = "最大魔法+0004"
	obj.levels = 1
	obj.DataA = 4
	?>
	<? local obj = slk.ability.AIbm:new 'ZxK3' ?>
	<?
	obj.Name = "最大魔法+0008"
	obj.levels = 1
	obj.DataA = 8
	?>
	<? local obj = slk.ability.AIbm:new 'ZxK4' ?>
	<?
	obj.Name = "最大魔法+0016"
	obj.levels = 1
	obj.DataA = 16
	?>
	<? local obj = slk.ability.AIbm:new 'ZxK5' ?>
	<?
	obj.Name = "最大魔法+0032"
	obj.levels = 1
	obj.DataA = 32
	?>
	<? local obj = slk.ability.AIbm:new 'ZxK6' ?>
	<?
	obj.Name = "最大魔法+0064"
	obj.levels = 1
	obj.DataA = 64
	?>
	<? local obj = slk.ability.AIbm:new 'ZxK7' ?>
	<?
	obj.Name = "最大魔法+0128"
	obj.levels = 1
	obj.DataA = 128
	?>
	<? local obj = slk.ability.AIbm:new 'ZxK8' ?>
	<?
	obj.Name = "最大魔法+0256"
	obj.levels = 1
	obj.DataA = 256
	?>
	<? local obj = slk.ability.AIbm:new 'ZxK9' ?>
	<?
	obj.Name = "最大魔法+0512"
	obj.levels = 1
	obj.DataA = 512
	?>
	<? local obj = slk.ability.AIbm:new 'ZxKa' ?>
	<?
	obj.Name = "最大魔法+1024"
	obj.levels = 1
	obj.DataA = 1024
	?>
	<? local obj = slk.ability.AIbm:new 'ZxKb' ?>
	<?
	obj.Name = "最大魔法+2048"
	obj.levels = 1
	obj.DataA = 2048
	?>
	<? local obj = slk.ability.AIbm:new 'ZxKc' ?>
	<?
	obj.Name = "最大魔法-4096"
	obj.levels = 1
	obj.DataA = -4096
	?>
	
	// BonusMod - 力量  
	
	<? local obj = slk.ability.AIs1:new 'ZxX0' ?>
	<?
	obj.Name = " 力量+0001"
	obj.levels = 1
	obj.DataC1 = 1
	?>
	<? local obj = slk.ability.AIs1:new 'ZxX1' ?>
	<?
	obj.Name = " 力量+0002"
	obj.levels = 1
	obj.DataC1 = 2
	?>
	<? local obj = slk.ability.AIs1:new 'ZxX2' ?>
	<?
	obj.Name = " 力量+0004"
	obj.levels = 1
	obj.DataC1 = 4
	?>
	<? local obj = slk.ability.AIs1:new 'ZxX3' ?>
	<?
	obj.Name = " 力量+0008"
	obj.levels = 1
	obj.DataC1 = 8
	?>
	<? local obj = slk.ability.AIs1:new 'ZxX4' ?>
	<?
	obj.Name = " 力量+0016"
	obj.levels = 1
	obj.DataC1 = 16
	?>
	<? local obj = slk.ability.AIs1:new 'ZxX5' ?>
	<?
	obj.Name = " 力量+0032"
	obj.levels = 1
	obj.DataC1 = 32
	?>
	<? local obj = slk.ability.AIs1:new 'ZxX6' ?>
	<?
	obj.Name = " 力量+0064"
	obj.levels = 1
	obj.DataC1 = 64
	?>
	<? local obj = slk.ability.AIs1:new 'ZxX7' ?>
	<?
	obj.Name = " 力量+0128"
	obj.levels = 1
	obj.DataC1 = 128
	?>
	<? local obj = slk.ability.AIs1:new 'ZxX8' ?>
	<?
	obj.Name = " 力量+0256"
	obj.levels = 1
	obj.DataC1 = 256
	?>
	<? local obj = slk.ability.AIs1:new 'ZxX9' ?>
	<?
	obj.Name = " 力量+0512"
	obj.levels = 1
	obj.DataC1= 512
	?>
	<? local obj = slk.ability.AIs1:new 'ZxXa' ?>
	<?
	obj.Name = " 力量+1024"
	obj.levels = 1
	obj.DataC1= 1024
	?>
	<? local obj = slk.ability.AIs1:new 'ZxXb' ?>
	<?
	obj.Name = " 力量+2048"
	obj.levels = 1
	obj.DataC1 = 2048
	?>
	<? local obj = slk.ability.AIs1:new 'ZxXc' ?>
	<?
	obj.Name = " 力量-4096"
	obj.levels = 1
	obj.DataC1 = -4096
	?>
	
	// BonusMod - 敏捷  
	<? local obj = slk.ability.AIs1:new 'ZxY0' ?>
	<?
	obj.Name = "敏捷+0001"
	obj.levels = 1
	obj.DataA1 = 1
	obj.DataC1= 0
	?>
	<? local obj = slk.ability.AIs1:new 'ZxY1' ?>
	<?
	obj.Name = "敏捷+0002"
	obj.levels = 1
	obj.DataA1 = 2
	obj.DataC1= 0
	?>
	<? local obj = slk.ability.AIs1:new 'ZxY2' ?>
	<?
	obj.Name = "敏捷+0004"
	obj.levels = 1
	obj.DataA1 = 4
	obj.DataC1= 0
	?>
	<? local obj = slk.ability.AIs1:new 'ZxY3' ?>
	<?
	obj.Name = "敏捷+0008"
	obj.levels = 1
	obj.DataA1 = 8
	obj.DataC1= 0
	?>
	<? local obj = slk.ability.AIs1:new 'ZxY4' ?>
	<?
	obj.Name = "敏捷+0016"
	obj.levels = 1
	obj.DataA1 = 16
	obj.DataC1= 0
	?>
	<? local obj = slk.ability.AIs1:new 'ZxY5' ?>
	<?
	obj.Name = "敏捷+0032"
	obj.levels = 1
	obj.DataA1 = 32
	obj.DataC1= 0
	?>
	<? local obj = slk.ability.AIs1:new 'ZxY6' ?>
	<?
	obj.Name = "敏捷+0064"
	obj.levels = 1
	obj.DataA1 = 64
	obj.DataC1= 0
	?>
	<? local obj = slk.ability.AIs1:new 'ZxY7' ?>
	<?
	obj.Name = "敏捷+0128"
	obj.levels = 1
	obj.DataC1= 0
	obj.DataA1 = 128
	?>
	<? local obj = slk.ability.AIs1:new 'ZxY8' ?>
	<?
	obj.Name = "敏捷+0256"
	obj.levels = 1
	obj.DataA1 = 256
	obj.DataC1= 0
	?>
	<? local obj = slk.ability.AIs1:new 'ZxY9' ?>
	<?
	obj.Name = "敏捷+0512"
	obj.levels = 1
	obj.DataA1= 512
	obj.DataC1= 0
	?>
	<? local obj = slk.ability.AIs1:new 'ZxYa' ?>
	<?
	obj.Name = "敏捷+1024"
	obj.levels = 1
	obj.DataA1= 1024
	obj.DataC1= 0
	?>
	<? local obj = slk.ability.AIs1:new 'ZxYb' ?>
	<?
	obj.Name = "敏捷+2048"
	obj.levels = 1
	obj.DataA1 = 2048
	obj.DataC1= 0
	?>
	<? local obj = slk.ability.AIs1:new 'ZxYc' ?>
	<?
	obj.Name = "敏捷-4096"
	obj.levels = 1
	obj.DataA1 = -4096
	obj.DataC1= 0
	?>
	
	// BonusMod - 智力  
	<? local obj = slk.ability.AIs1:new 'ZxZ0' ?>
	<?
	obj.Name = "智力 +0001"
	obj.levels = 1
	obj.DataC1= 0
	obj.DataB1 = 1
	?>
	<? local obj = slk.ability.AIs1:new 'ZxZ1' ?>
	<?
	obj.Name = "智力 +0002"
	obj.levels = 1
	obj.DataB1 = 2
	obj.DataC1= 0
	?>
	<? local obj = slk.ability.AIs1:new 'ZxZ2' ?>
	<?
	obj.Name = "智力 +0004"
	obj.levels = 1
	obj.DataB1 = 4
	obj.DataC1= 0
	?>
	<? local obj = slk.ability.AIs1:new 'ZxZ3' ?>
	<?
	obj.Name = "智力 +0008"
	obj.levels = 1
	obj.DataB1 = 8
	obj.DataC1= 0
	?>
	<? local obj = slk.ability.AIs1:new 'ZxZ4' ?>
	<?
	obj.Name = "智力 +0016"
	obj.levels = 1
	obj.DataB1 = 16
	obj.DataC1= 0
	?>
	<? local obj = slk.ability.AIs1:new 'ZxZ5' ?>
	<?
	obj.Name = "智力 +0032"
	obj.levels = 1
	obj.DataB1 = 32
	obj.DataC1= 0
	?>
	<? local obj = slk.ability.AIs1:new 'ZxZ6' ?>
	<?
	obj.Name = "智力 +0064"
	obj.levels = 1
	obj.DataB1 = 64
	obj.DataC1= 0
	?>
	<? local obj = slk.ability.AIs1:new 'ZxZ7' ?>
	<?
	obj.Name = "智力 +0128"
	obj.levels = 1
	obj.DataB1 = 128
	obj.DataC1= 0
	?>
	<? local obj = slk.ability.AIs1:new 'ZxZ8' ?>
	<?
	obj.Name = "智力 +0256"
	obj.levels = 1
	obj.DataB1 = 256
	obj.DataC1= 0
	?>
	<? local obj = slk.ability.AIs1:new 'ZxZ9' ?>
	<?
	obj.Name = "智力 +0512"
	obj.levels = 1
	obj.DataC1= 0
	obj.DataB1= 512
	?>
	<? local obj = slk.ability.AIs1:new 'ZxZa' ?>
	<?
	obj.Name = "智力 +1024"
	obj.levels = 1
	obj.DataC1= 0
	obj.DataB1= 1024
	?>
	<? local obj = slk.ability.AIs1:new 'ZxZb' ?>
	<?
	obj.Name = "智力 +2048"
	obj.levels = 1
	obj.DataB1 = 2048
	obj.DataC1= 0
	?>
	<? local obj = slk.ability.AIs1:new 'ZxZc' ?>
	<?
	obj.Name = "智力 -4096"
	obj.levels = 1
	obj.DataC1= 0
	obj.DataB1 = -4096
	?>
endfunction

//创建英雄
function ChuangjianYX  takes nothing returns nothing
	<?  local rzzs = slk.unit.Hmkg:new 'RzZh'?>
	<?
	rzzs.Name = "人族战士"
	rzzs.abilList = "Avul"
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
	rzzs.STR = 0
	rzzs.AGI = 0
	rzzs.INT = 0
	--每级提升属性
	rzzs.STRplus = 0
	rzzs.AGIplus = 0
	rzzs.INTplus = 0
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
	rzzs.spd = 0
	rzzs.hideHeroMinimap = 1
	rzzs.dmgplus1 = 0
	?> 
	
	///选英雄单位马甲
	<?  local xzyx = slk.unit.hfoo:new 'hsz1'?>
	<?
	xzyx.Name = "选择英雄"
	xzyx.abilList = "Avul"
	xzyx.hideOnMinimap = 1
	xzyx.fused = 0
	xzyx.file = "buildings\\other\\CircleOfPower\\CircleOfPower.mdl"
	xzyx.Art = "ReplaceableTextures\\CommandButtons\\BTNNightElfCaptureFlag.blp"
	xzyx.spd = 0
	xzyx.hideHeroMinimap = 1
	xzyx.dmgplus1 = 0
	?>   
	///装备栏马甲
	<? 
	local obj2 = slk.unit.hfoo:new 'hsz2'
	?>
	<?
	obj2.Name = "装备马甲"
	obj2.abilList = "Avul"
	obj2.hideOnMinimap = 1
	obj2.fused = 0
	obj2.file = "buildings\\other\\CircleOfPower\\CircleOfPower.mdl"
	obj2.Art = "ReplaceableTextures\\CommandButtons\\BTNNightElfCaptureFlag.blp"
	obj2.spd = 0
	obj2.hideHeroMinimap = 1
	obj2.dmgplus1 = 0
	obj2.sides1 = 0
	obj2.dice1 = 0
	obj2.cool1 = 0
	obj2.targCount1 = 0
	obj2.weapsOn = 0
	?>   
	
	<? 
	local obj3 = slk.unit.hpea:new 'hsz3'
	?>
	<?
	obj3.Name = "天赋界面"
	obj3.abilList = "Avul","A00K"
	obj3.hideOnMinimap = 1
	obj3.fused = 0
	obj3.file = "buildings\\other\\CircleOfPower\\CircleOfPower.mdl"
	obj3.Art = "ReplaceableTextures\\CommandButtons\\BTNNightElfCaptureFlag.blp"
	obj3.spd = 0
	obj3.hideHeroMinimap = 1
	obj3.dmgplus1 = 0
	obj3.sides1 = 0
	obj3.dice1 = 0
	obj3.cool1 = 0
	obj3.targCount1 = 0
	obj3.weapsOn = 0
	obj3.Builds = ""
	?>	
endfunction
//界面
function Chuangjiandanwei  takes nothing returns nothing
	<? 
	for i = 0, 9 do
	local objA = slk.ability.ANcl:new ("FW"..i.."A")
	local objB = slk.ability.ANcl:new ("FW"..i.."B")
	local objC = slk.ability.ANcl:new ("FW"..i.."C")
	local objD = slk.ability.ANcl:new ("FW"..i.."D")
	local objE = slk.ability.ANcl:new ("FW"..i.."E")
	local objF = slk.ability.ANcl:new ("FW"..i.."F")
	local objG = slk.ability.ANcl:new ("FW"..i.."G")
	local objH = slk.ability.ANcl:new ("FW"..i.."H")
	local objI = slk.ability.ANcl:new ("FW"..i.."I")
	local objJ = slk.ability.ANcl:new ("FW"..i.."J")
	local objK = slk.ability.ANcl:new ("FW"..i.."K")
	local objL = slk.ability.ANcl:new ("FW"..i.."L")
	?>
	<?
	objA.Name = string.format("符文A[%03d]", i)
	objA.levels = 1
	objA.item = 0
	objA.Tip = "符文"
	objA.Ubertip = "符文"
	objA.DataD1 = 0.00
	objA.DataB1 = 0
	objA.DataE1 = 0
	objA.DataC1 = 1
	objA.DataA1 = 0.00
	objA.Buttonpos_1 = 0
	objA.Buttonpos_2 = 0
	objA.DataF1 = "wispharvest"
	objA.race = "orc"
	objA.hero = 0
	objA.Rng1 = 0.00
	objA.Art = "ReplaceableTextures\\CommandButtons\\BTNEnchantedGemstone.blp"
	objA.EffectArt = ""
	objA.TargetArt = ""
	objA.CasterArt = ""
	
	objB.Name = string.format("符文B[%03d]", i)
	objB.levels = 1
	objB.item = 0
	objB.Tip = "符文"
	objB.Ubertip = "符文"
	objB.DataD1 = 0.00
	objB.DataB1 = 0
	objB.DataE1 = 0
	objB.DataC1 = 1
	objB.DataA1 = 0.00
	objB.Buttonpos_1 = 1
	objB.Buttonpos_2 = 0
	objB.DataF1 = "windwalk"
	objB.race = "orc"
	objB.hero = 0
	objB.Rng1 = 0.00
	objB.Art = "ReplaceableTextures\\CommandButtons\\BTNEnchantedGemstone.blp"
	objB.EffectArt = ""
	objB.TargetArt = ""
	objB.CasterArt = ""
	
	
	
	objC.Name = string.format("符文C[%03d]", i)
	objC.levels = 1
	objC.item = 0
	objC.Tip = "符文"
	objC.Ubertip = "符文"
	objC.DataD1 = 0.00
	objC.DataB1 = 0
	objC.DataE1 = 0
	objC.DataC1 = 1
	objC.DataA1 = 0.00
	objC.Buttonpos_1 = 2
	objC.Buttonpos_2 = 0
	objC.DataF1 = "whirlwind"
	objC.race = "orc"
	objC.hero = 0
	objC.Rng1 = 0.00
	objC.Art = "ReplaceableTextures\\CommandButtons\\BTNEnchantedGemstone.blp"
	objC.EffectArt = ""
	objC.TargetArt = ""
	objC.CasterArt = ""
	
	
	
	objD.Name = string.format("符文D[%03d]", i)
	objD.levels = 1
	objD.item = 0
	objD.Tip = "符文"
	objD.Ubertip = "符文"
	objD.DataD1 = 0.00
	objD.DataB1 = 0
	objD.DataE1 = 0
	objD.DataC1 = 1
	objD.DataA1 = 0.00
	objD.Buttonpos_1 = 3
	objD.Buttonpos_2 = 0
	objD.DataF1 = "webon"
	objD.race = "orc"
	objD.hero = 0
	objD.Rng1 = 0.00
	objD.Art = "ReplaceableTextures\\CommandButtons\\BTNEnchantedGemstone.blp"
	objD.EffectArt = ""
	objD.TargetArt = ""
	objD.CasterArt = ""
	
	
	
	objE.Name = string.format("符文E[%03d]", i)
	objE.levels = 1
	objE.item = 0
	objE.Tip = "符文"
	objE.Ubertip = "符文"
	objE.DataD1 = 0.00
	objE.DataB1 = 0
	objE.DataE1 = 0
	objE.DataC1 = 1
	objE.DataA1 = 0.00
	objE.Buttonpos_1 = 0
	objE.Buttonpos_2 = 1
	objE.DataF1 = "weboff"
	objE.race = "orc"
	objE.hero = 0
	objE.Rng1 = 0.00
	objE.Art = "ReplaceableTextures\\CommandButtons\\BTNEnchantedGemstone.blp"
	objE.EffectArt = ""
	objE.TargetArt = ""
	objE.CasterArt = ""
	
	
	
	objF.Name = string.format("符文F[%03d]", i)
	objF.levels = 1
	objF.item = 0
	objF.Tip = "符文"
	objF.Ubertip = "符文"
	objF.DataD1 = 0.00
	objF.DataB1 = 0
	objF.DataE1 = 0
	objF.DataC1 = 1
	objF.DataA1 = 0.00
	objF.Buttonpos_1 = 1
	objF.Buttonpos_2 = 1
	objF.DataF1 = "web"
	objF.race = "orc"
	objF.hero = 0
	objF.Rng1 = 0.00
	objF.Art = "ReplaceableTextures\\CommandButtons\\BTNEnchantedGemstone.blp"
	objF.EffectArt = ""
	objF.TargetArt = ""
	objF.CasterArt = ""
	
	
	
	objG.Name = string.format("符文G[%03d]", i)
	objG.levels = 1
	objG.item = 0
	objG.Tip = "符文"
	objG.Ubertip = "符文"
	objG.DataD1 = 0.00
	objG.DataB1 = 0
	objG.DataE1 = 0
	objG.DataC1 = 1
	objG.DataA1 = 0.00
	objG.Buttonpos_1 = 2
	objG.Buttonpos_2 = 1
	objG.DataF1 = "wateryminion"
	objG.race = "orc"
	objG.hero = 0
	objG.Rng1 = 0.00
	objG.Art = "ReplaceableTextures\\CommandButtons\\BTNEnchantedGemstone.blp"
	objG.EffectArt = ""
	objG.TargetArt = ""
	objG.CasterArt = ""
	
	
	
	objH.Name = string.format("符文H[%03d]", i)
	objH.levels = 1
	objH.item = 0
	objH.Tip = "符文"
	objH.Ubertip = "符文"
	objH.DataD1 = 0.00
	objH.DataB1 = 0
	objH.DataE1 = 0
	objH.DataC1 = 1
	objH.DataA1 = 0.00
	objH.Buttonpos_1 = 3
	objH.Buttonpos_2 = 1
	objH.DataF1 = "waterelemental"
	objH.race = "orc"
	objH.hero = 0
	objH.Rng1 = 0.00
	objH.Art = "ReplaceableTextures\\CommandButtons\\BTNEnchantedGemstone.blp"
	objH.EffectArt = ""
	objH.TargetArt = ""
	objH.CasterArt = ""
	
	
	
	objI.Name = string.format("符文I[%03d]", i)
	objI.levels = 1
	objI.item = 0
	objI.Tip = "符文"
	objI.Ubertip = "符文"
	objI.DataD1 = 0.00
	objI.DataB1 = 0
	objI.DataE1 = 0
	objI.DataC1 = 1
	objI.DataA1 = 0.00
	objI.Buttonpos_1 = 0
	objI.Buttonpos_2 = 2
	objI.DataF1 = "ward"
	objI.race = "orc"
	objI.hero = 0
	objI.Rng1 = 0.00
	objI.Art = "ReplaceableTextures\\CommandButtons\\BTNEnchantedGemstone.blp"
	objI.EffectArt = ""
	objI.TargetArt = ""
	objI.CasterArt = ""
	
	
	
	objJ.Name = string.format("符文J[%03d]", i)
	objJ.levels = 1
	objJ.item = 0
	objJ.Tip = "符文"
	objJ.Ubertip = "符文"
	objJ.DataD1 = 0.00
	objJ.DataB1 = 0
	objJ.DataE1 = 0
	objJ.DataC1 = 1
	objJ.DataA1 = 0.00
	objJ.Buttonpos_1 = 1
	objJ.Buttonpos_2 = 2
	objJ.DataF1 = "voodoo"
	objJ.race = "orc"
	objJ.hero = 0
	objJ.Rng1 = 0.00
	objJ.Art = "ReplaceableTextures\\CommandButtons\\BTNEnchantedGemstone.blp"
	objJ.EffectArt = ""
	objJ.TargetArt = ""
	objJ.CasterArt = ""
	
	
	
	objK.Name = string.format("符文K[%03d]", i)
	objK.levels = 1
	objK.item = 0
	objK.Tip = "符文"
	objK.Ubertip = "符文"
	objK.DataD1 = 0.00
	objK.DataB1 = 0
	objK.DataE1 = 0
	objK.DataC1 = 1
	objK.DataA1 = 0.00
	objK.Buttonpos_1 = 2
	objK.Buttonpos_2 = 2
	objK.DataF1 = "volcano"
	objK.race = "orc"
	objK.hero = 0
	objK.Rng1 = 0.00
	objK.Art = "ReplaceableTextures\\CommandButtons\\BTNEnchantedGemstone.blp"
	objK.EffectArt = ""
	objK.TargetArt = ""
	objK.CasterArt = ""
	
	
	
	objL.Name = string.format("符文L[%03d]", i)
	objL.levels = 1
	objL.item = 0
	objL.Tip = "符文"
	objL.Ubertip = "符文"
	objL.DataD1 = 0.00
	objL.DataB1 = 0
	objL.DataE1 = 0
	objL.DataC1 = 1
	objL.DataA1 = 0.00
	objL.Buttonpos_1 = 3
	objL.Buttonpos_2 = 2
	objL.DataF1 = "vengenceon"
	objL.race = "orc"
	objL.hero = 0
	objL.Rng1 = 0.00
	objL.Art = "ReplaceableTextures\\CommandButtons\\BTNEnchantedGemstone.blp"
	objL.EffectArt = ""
	objL.TargetArt = ""
	objL.CasterArt = ""
	
	?>   
	<?
	end
	?>
	
	
endfunction

//物品
function ChuangjianWUPin takes nothing returns nothing
	<? 
function GetNextStrId(id) 
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
				?>
    <? 
				local x = "ZB00"
				for i = 0, 899 do
				local item1 = slk.item.ssil:new(x)
				?>
				<?
				x = GetNextStrId(x) 
				item1.Name = string.format("装备马甲(|cffffcc00Z|r)[%03d]", i)
				item1.abilList = "ZSZB"
				item1.Description = "这是一件可以穿戴的装备."
				item1.HP = 100
				?>
				<?
				end
				?>
endfunction

