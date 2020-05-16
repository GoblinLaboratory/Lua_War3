#ifndef Hc_GetDamUsed
#define Hc_GetDamUsed
library HcGetDam
<?local Misc_DefenseArmor = tonumber(require('slk').misc.Misc.DefenseArmor)?>
	function XG_GetDam takes real dam,real armor returns real
		local real hurt = dam
		local real r1=0.
		local real HJ = armor //获取护甲
		local real b=0. //护甲减伤百分比
		// arint=抗性因子 一般为0.06
		if HJ >0 then
			set b =HJ*<?=Misc_DefenseArmor?>/(HJ*<?=Misc_DefenseArmor?>+1)//正护甲
			// 1 + 0.06 * 单位护甲
			//hurt / (1-b)     73 *0.06=  4.38 -> 68.62
			set hurt = hurt/(1-b)//修正伤害值
		else
			set b=Pow(1-<?=Misc_DefenseArmor?>, -HJ)
			// 73*-0.71=-51.83 ->  124.83
			set hurt = hurt/(2-b)//修正伤害值
			//2 - 0.94 ^ (-单位护甲)
		endif
		return hurt //原始伤害
	endfunction
endlibrary
#endif
