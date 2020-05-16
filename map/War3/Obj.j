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
//天赋技能
function CreateTFJN  takes nothing returns nothing
	//人族
	<?
	local RZTF = slk.ability.Asth:new ("RZTF")
	RZTF.Name = "人族——天赋"
	RZTF.Tip = "人族——天赋"
	RZTF.Ubertip = "激活防御获得30%的伤害减免。移动速度和攻击速度减少50%。"
	--图标位置
	RZTF.Buttonpos_1 = 1
	RZTF.Buttonpos_2 = 1
	--图标
	RZTF.Art = "ReplaceableTextures\\CommandButtons\\BTNBansheeMaster.blp"
	--需求
	RZTF.Requires = ""
	?>
endfunction
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
//创建马甲
function ChuangjianYX  takes nothing returns nothing
	
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

