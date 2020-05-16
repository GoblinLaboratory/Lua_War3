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