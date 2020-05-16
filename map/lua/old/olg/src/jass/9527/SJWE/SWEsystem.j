#ifndef SWEsystemIncluded
#define SWEsystemIncluded
#include "YDWETriggerEvent.j"
#include "9527/SJWE/HatredSystem.j"
#include "9527/SJWE/UnitAlive.j"

library_once SWEsystem requires YDWETriggerEvent,HatredSystem,UnitAlive

globals
    private hashtable         DSHT = InitHashtable()
    private hashtable         DSITHT = InitHashtable()

    private group             DamagedGroup = CreateGroup()
    private boolean           DisplayDamageBool = false
    private boolean           DamageBool = false
    private boolean           AOEBool = false
    private string            str1 = ""
    private trigger           DisplayTriggerA = CreateTrigger()
    private trigger           DisplayTriggerB = CreateTrigger()
    private trigger           DisplayTriggerC = CreateTrigger()
    
    private real              RANDOM_Factor = 0.0
    private real              MinRange = 10.0
    private integer           ITEM_SLOT_UNIT_TYPE = 'h000'
    private integer           ImmuneDamageSkillID = 0
    private integer           MaxPlayerNumber = 0
    private integer           MIMETIC_SKILL_0 = 0
    private integer           MIMETIC_SKILL_1 = 0
    private integer           MIMETIC_BUFF_1 = 0

    private real array        size
    private real array        rgb_A
    private integer array     rgb_R
    private integer array     rgb_G
    private integer array     rgb_B

    private integer           MagicListEnd = 0
    private integer           MeleeListEnd = 0
    private integer           M_MeleeListEnd = 0
    private integer           M_MagicListEnd = 0
    private integer           HealingListEnd = 0
    private integer           RMDListEnd = 0
    private integer           ItemLevelListEnd = 0
    private integer           S_KillListEnd = 0
    private integer           ASD_ListEnd = 0    
    private integer           M_Null_ListEnd = 0
    private integer           IPUL_ListEnd = 0
    private integer           IPDL_ListEnd = 0
    
    private integer array     MagicLastIndex
    private integer array     MagicNextIndex
    private integer array     MeleeLastIndex
    private integer array     MeleeNextIndex
    private integer array     M_MeleeLastIndex
    private integer array     M_MeleeNextIndex
    private integer array     M_MagicLastIndex
    private integer array     M_MagicNextIndex
    private integer array     HealingLastIndex
    private integer array     HealingNextIndex
    private integer array     RMDLastIndex
    private integer array     RMDNextIndex
    private integer array     ItemLevelLastIndex
    private integer array     ItemLevelNextIndex
    private integer array     S_KillLastIndex
    private integer array     S_KillNextIndex
    private integer array     ASD_LastIndex
    private integer array     ASD_NextIndex
    private integer array     M_Null_LastIndex
    private integer array     M_Null_NextIndex
    private integer array     IPUL_LastIndex
    private integer array     IPUL_NextIndex
    private integer array     IPDL_LastIndex
    private integer array     IPDL_NextIndex
        
    private trigger array     MagicTriggerList
    private trigger array     MeleeTriggerList
    private trigger array     M_MeleeTriggerList
    private trigger array     M_MagicTriggerList
    private trigger array     HealingTriggerList
    private trigger array     RMDTriggerList
    private trigger array     ItemLevelTriggerList
    private trigger array     S_KillTriggerList
    private trigger array     ASD_TriggerList
    private trigger array     M_Null_TriggerList
    private trigger array     IPUL_TriggerList
    private trigger array     IPDL_TriggerList
    
    private real              EXP_A = 1.0
    private real              EXP_B = 5.0
    private real              EXP_C = 5.0
    private real              EXP_A_Hero = 1.0
    private real              EXP_B_Hero = 5.0
    private real              EXP_C_Hero = 100.0
    private real              EXP_D = 0.5
    private real              Range = 1200.0
    private integer array     EXP
    private integer array     EXP_Hero
    private integer           EXP_c = 25
    private integer           EXP_c_Hero = 100
    private boolean           BUDILINGKILL = false

    private boolean           HealingThumpBool = true
    private boolean           DisplayHealingBool = false

    private integer                   zxwjs = 0
    private integer array             zxwjid
    private multiboard array          lb
    private multiboard array          lb1
    private multiboard array          lb2
    private multiboard array          lb3    
    private integer array             Switch
    private boolean                   DisplayItemLevelBool = true
    private timer                     RT

    private real              a1 = 1.0
    private real              b1 = 0.0
    private real              a2 = 1.0
    private real              b2 = 0.0
    private real              radius = 512.0
    private unit              AppointUnit = null
    private timer             TIMER
    private real              TIMEROUT = 0.0
    private boolean           Count = false
endglobals

//============================================================================================================================================================
//=============================伤害系统基础函数与杂项处理主函数块=============================================================================================
//============================================================================================================================================================
  
function SetDisplayDamageColor takes integer index, real a, integer r, integer g, integer b returns nothing
    set rgb_A[index] = a
    set rgb_R[index] = r
    set rgb_G[index] = g
    set rgb_B[index] = b
endfunction

function SetDisplayDamageSize takes integer index, real s returns nothing
	set size[index] = s
endfunction

function EXPSet takes nothing returns nothing
    local integer i = 0
    local integer n = 0
    set EXP[1] = EXP_c
    set i = 2
    loop
        exitwhen i > 1000
        set EXP[i] = EXP[i-1] * R2I(EXP_A) + R2I(EXP_B) * i + R2I(EXP_C)
        set i = i + 1
    endloop
    set EXP_Hero[1] = EXP_c_Hero
    set n = 2
    loop
        exitwhen n > 1000
        set EXP_Hero[n] = EXP_Hero[n-1] * R2I(EXP_A_Hero) + R2I(EXP_B_Hero) * n + R2I(EXP_C_Hero)
        set n = n + 1
    endloop
endfunction

function EXPCoefficient takes real A, real B, real C, integer c, real Ah, real Bh, real Ch, integer ch, real D, real R, boolean b returns nothing
    set EXP_A = A
    set EXP_B = B
    set EXP_C = C
    set EXP_A_Hero = Ah
    set EXP_B_Hero = Bh
    set EXP_C_Hero = Ch
    set EXP_D = D
    set EXP_c = c
    set EXP_c_Hero = ch
    set Range = R
    set BUDILINGKILL = b
endfunction

function HeroGetEXP takes unit DeadUnit,unit Attacker returns nothing
    local group group1
    local group group2
    local unit unit1
    local unit unit2
    local integer i = 0
    set group1 = CreateGroup()
    set group2 = CreateGroup()
    call GroupEnumUnitsInRange(group1, GetUnitX(DeadUnit), GetUnitY(DeadUnit), Range, null)
    loop
        set unit1 = FirstOfGroup(group1)
        exitwhen unit1 == null
        call GroupRemoveUnit(group1, unit1)
        call GroupAddUnit(group2,unit1)
        if (((IsUnitType(unit1, UNIT_TYPE_HERO) == true)) and ((IsUnitAlly(unit1, GetOwningPlayer(Attacker)) == true) or (IsUnitOwnedByPlayer(unit1, GetOwningPlayer(Attacker)) == true)) and (GetOwningPlayer(unit1) != Player(PLAYER_NEUTRAL_AGGRESSIVE)) and (GetOwningPlayer(unit1) != Player(bj_PLAYER_NEUTRAL_VICTIM)) and (GetOwningPlayer(unit1) != Player(bj_PLAYER_NEUTRAL_EXTRA)) and (GetOwningPlayer(unit1) != Player(PLAYER_NEUTRAL_PASSIVE))) then
            set i = ( i + 1 )
        endif
    endloop
    call DestroyGroup(group1)
    set group1 = null
    set unit1 = null
    if (i <= 1) then
        set i = 1
    endif
    loop
        set unit2 = FirstOfGroup(group2)
        exitwhen unit2 == null
        call GroupRemoveUnit(group2, unit2)
        if (((IsUnitType(unit2, UNIT_TYPE_HERO) == true)) and ((IsUnitAlly(unit2, GetOwningPlayer(Attacker)) == true) or (IsUnitOwnedByPlayer(unit2, GetOwningPlayer(Attacker)) == true)) and (GetOwningPlayer(unit2) != Player(PLAYER_NEUTRAL_AGGRESSIVE)) and (GetOwningPlayer(unit2) != Player(bj_PLAYER_NEUTRAL_VICTIM)) and (GetOwningPlayer(unit2) != Player(bj_PLAYER_NEUTRAL_EXTRA)) and (GetOwningPlayer(unit2) != Player(PLAYER_NEUTRAL_PASSIVE))) then
            if (((IsUnitType(Attacker, UNIT_TYPE_STRUCTURE) == false) or (BUDILINGKILL == true))) then
                if ((IsUnitType(DeadUnit, UNIT_TYPE_HERO) == true)) then
                    call AddHeroXP( unit2, ( EXP_Hero[GetUnitLevel(DeadUnit)] / i ), true )
                else
                    if ((IsUnitType(DeadUnit, UNIT_TYPE_SUMMONED) == true)) then
                        call AddHeroXP( unit2, ( R2I(EXP_D) * EXP[GetUnitLevel(DeadUnit)] / i ), true )
                    else
                        call AddHeroXP( unit2, ( EXP[GetUnitLevel(DeadUnit)] / i ), true )
                    endif
                endif
            endif
        endif
    endloop
    call DestroyGroup(group2)
    set group2 = null
    set unit2 = null
endfunction

function UnitTypeConditions_A takes unit u returns boolean
    return ((IsUnitType(u, UNIT_TYPE_STRUCTURE) == true) or (IsUnitType(u, UNIT_TYPE_MECHANICAL) == true))
endfunction

function PackageMimeticdSkillDispose takes nothing returns nothing
    local integer i = 0
    loop
        exitwhen( i > 15 )
        call SetPlayerAbilityAvailable( Player(i), MIMETIC_SKILL_0, false )
        set i = i + 1
    endloop
endfunction

function DisplayDamageSystem takes unit DamagedUnit, real ActualDamage, real Size, integer a, integer b returns nothing
    if ((IsUnitType(DamagedUnit, UNIT_TYPE_HERO) == true)) then
        if (DisplayDamageBool == true) then
            call DisplayDamage(DamagedUnit,I2S(R2I(ActualDamage)),20.0,Size,rgb_R[a],rgb_G[a],rgb_B[a],rgb_A[a])
        endif
    elseif ((IsUnitType(DamagedUnit, UNIT_TYPE_HERO) == false)) then
        if (DisplayDamageBool == true) then
            call DisplayDamage(DamagedUnit,I2S(R2I(ActualDamage)),20.0,Size,rgb_R[b],rgb_G[b],rgb_B[b],rgb_A[b])
        endif
    endif
endfunction

//============================================================================================================================================================
//=======================================伤害系统类型定义主函数块=============================================================================================
//============================================================================================================================================================

function SetTypeName takes integer typeid, string typename returns nothing
    call SaveStr(DSHT, typeid, StringHash("TypeName"), typename)
    call SaveInteger(DSHT, StringHash(typename), StringHash("TypeID"), typeid)
endfunction

function GetTypeId takes string typename returns integer
    return LoadInteger(DSHT, StringHash(typename), StringHash("TypeID"))
endfunction

function TypeId2S takes integer typeid returns string
    return LoadStr(DSHT, typeid, StringHash("TypeName"))
endfunction

function SetType_System takes nothing returns nothing

//=====================================================主要属性类型============================================= 
	
    call SetTypeName(1,"物理伤害类型")                      //整数类型（建议取值范围 100-199）
    call SetTypeName(2,"物理攻击")                          //实数数值类型（系统内强制修正值范围 大于等于0）
    call SetTypeName(3,"物理防御类型")                      //整数类型（建议取值范围 200-299）
    call SetTypeName(4,"物理防御")                          //实数数值类型
    call SetTypeName(5,"物理暴击率")                        //实数百分比类型（系统内强制修正值范围 大于等于0小于等于1）
    call SetTypeName(6,"物理暴击抵抗")                      //实数百分比类型（系统内强制修正值范围 大于等于-1小于等于1）
    call SetTypeName(7,"物理暴击加成")                      //实数百分比类型（系统内强制修正值范围 大于等于1）（系统内部计算自动加1，如输入0.5为1.5倍）
    call SetTypeName(8,"物理暴伤减免")                      //实数百分比类型（系统内强制修正值范围 大于等于0小于等于1）
    call SetTypeName(9,"物理闪避")                          //实数百分比类型（系统内强制修正值范围 大于等于0小于等于1）
    call SetTypeName(10,"物理命中")                         //实数百分比类型（系统内强制修正值范围 大于等于-1小于等于1）
    call SetTypeName(11,"物理格挡")                         //实数百分比类型（系统内强制修正值范围 大于等于0小于等于1）
    call SetTypeName(12,"物理格挡减伤")                     //实数百分比类型（系统内强制修正值范围 大于等于0小于等于1）
    call SetTypeName(13,"物理破甲")                         //实数数值类型（系统内强制修正值范围 大于等于0）
    call SetTypeName(14,"物理吸血")                         //实数百分比类型（系统内强制修正值范围 大于等于0小于等于1）
    call SetTypeName(15,"物理反伤")                         //实数百分比类型（系统内强制修正值范围 大于等于0小于等于1）
    call SetTypeName(16,"物理伤害吸收")                     //实数数值类型（系统内强制修正值范围 大于等于0）（不可设置类型数据）
    call SetTypeName(17,"物理攻击增加（百分比）")           //实数百分比类型（系统内强制修正值范围 大于等于1）（系统内部计算自动加1，如输入0.5为1.5倍）（计算在计算任何其他防御属性之前）（不可设置类型数据）
    call SetTypeName(18,"物理攻击减少（百分比）")           //实数百分比类型（系统内强制修正值范围 大于等于0小于等于1）（计算在计算任何其他防御属性之前）（不可设置类型数据）
    call SetTypeName(19,"物理攻击修改（数值）")             //实数数值类型（计算在计算任何其他防御属性之前）（不可设置类型数据）
    call SetTypeName(20,"法术伤害类型")                     //整数类型（建议取值范围 300-399）
    call SetTypeName(21,"法术攻击")                         //实数数值类型（系统内强制修正值范围 大于等于0）
    call SetTypeName(22,"法术防御类型")                     //整数类型（建议取值范围 400-499）
    call SetTypeName(23,"法术防御")                         //实数数值类型           
    call SetTypeName(24,"法术暴击率")                       //实数百分比类型（系统内强制修正值范围 大于等于0小于等于1）
    call SetTypeName(25,"法术暴击抵抗")                     //实数百分比类型（系统内强制修正值范围 大于等于-1小于等于1）
    call SetTypeName(26,"法术暴击加成")                     //实数百分比类型（系统内强制修正值范围 大于等于1）（系统内部计算自动加1，如输入0.5为1.5倍）
    call SetTypeName(27,"法术暴伤减免")                     //实数百分比类型（系统内强制修正值范围 大于等于0小于等于1）
    call SetTypeName(28,"法术闪避")                         //实数百分比类型（系统内强制修正值范围 大于等于0小于等于1）
    call SetTypeName(29,"法术命中")                         //实数百分比类型（系统内强制修正值范围 大于等于-1小于等于1）
    call SetTypeName(30,"法术格挡")                         //实数百分比类型（系统内强制修正值范围 大于等于0小于等于1）
    call SetTypeName(31,"法术格挡减伤")                     //实数百分比类型（系统内强制修正值范围 大于等于0小于等于1）
    call SetTypeName(32,"法术破甲")                         //实数数值类型（系统内强制修正值范围 大于等于0）
    call SetTypeName(33,"法术吸血")                         //实数百分比类型（系统内强制修正值范围 大于等于0小于等于1）
    call SetTypeName(34,"法术反伤")                         //实数百分比类型（系统内强制修正值范围 大于等于0小于等于1）
    call SetTypeName(35,"法术伤害吸收")                     //实数数值类型（系统内强制修正值范围 大于等于0）（不可设置类型数据）
    call SetTypeName(36,"法术攻击增加（百分比）")           //实数百分比类型（系统内强制修正值范围 大于等于1）（系统内部计算自动加1，如输入0.5为1.5倍）（计算在计算任何其他防御属性之前）（不可设置类型数据）
    call SetTypeName(37,"法术攻击减少（百分比）")           //实数百分比类型（系统内强制修正值范围 大于等于0小于等于1）（计算在计算任何其他防御属性之前）（不可设置类型数据）
    call SetTypeName(38,"法术攻击修改（数值）")             //实数数值类型（计算在计算任何其他防御属性之前）（不可设置类型数据）
    call SetTypeName(39,"治疗能力")                         //实数数值类型（系统内强制修正值范围 大于等于0）
    call SetTypeName(40,"治疗暴击")                         //实数百分比类型（系统内强制修正值范围 大于等于0小于等于1）
    call SetTypeName(41,"治疗暴击加成")                     //实数百分比类型（系统内强制修正值范围 大于等于1）（系统内部计算自动加1，如输入0.5为1.5倍）
    call SetTypeName(42,"治疗加成")                         //实数百分比类型（系统内强制修正值范围 大于等于1）（系统内部计算自动加1，如输入0.5为1.5倍）
    call SetTypeName(43,"治疗衰减")                         //实数百分比类型（系统内强制修正值范围 大于等于0小于等于1）

//==========================================功能型类型（不可设置类型数据）======================================  

    call SetTypeName(44,"全伤害吸收")                       //实数数值类型（系统内强制修正值范围 大于等于0）
    call SetTypeName(45,"全伤害增伤（百分比）")             //实数百分比类型（系统内强制修正值范围 大于等于1）（系统内部计算自动加1，如输入0.5为1.5倍）
    call SetTypeName(46,"全伤害减伤（百分比）")             //实数百分比类型（系统内强制修正值范围 大于等于0小于等于1）
    call SetTypeName(47,"全伤害修改（数值）")               //实数数值类型
    call SetTypeName(48,"是否暴击")                         //布尔值类型
    call SetTypeName(49,"是否闪避")                         //布尔值类型
    call SetTypeName(50,"是否格挡")                         //布尔值类型
    call SetTypeName(51,"是否暴击治疗")                     //布尔值类型
    call SetTypeName(52,"伤害随机因子")                     //实数数值类型（大于等于0）
    call SetTypeName(53,"伤害前的伤害")                     //实数数值类型（大于等于0）
    call SetTypeName(54,"是否免疫伤害")                     //布尔值类型
    call SetTypeName(55,"反弹的伤害")                       //实数数值类型（大于等于0）
    call SetTypeName(56,"溅射伤害范围")                     //实数数值类型（系统内强制修正值范围 大于等于0）
    call SetTypeName(57,"溅射伤害系数")                     //实数数值类型（系统内强制修正值范围 大于等于0）
    call SetTypeName(58,"受到的实际伤害数值")               //废弃
    call SetTypeName(59,"受到的实际治疗数值")               //废弃

//===================================================其他类型=================================================== 

    call SetTypeName(60,"物品类型父类")                     //字符串类型
    call SetTypeName(61,"物品父类最大持有数")               //整数类型（大于等于1）
    call SetTypeName(62,"物品等级")                         //整数类型（大于等于0）（系统内部计算自动加1，如输入0为1）
    call SetTypeName(63,"物品最大等级")                     //整数类型（大于等于0）（系统内部计算自动加1，如输入0为1）
    call SetTypeName(64,"物品当前经验")                     //整数类型（大于等于0）
    call SetTypeName(65,"物品升级所需经验")                 //整数类型（大于等于0）（系统内部计算自动加1，如输入0为1）
    call SetTypeName(66,"物品强化等级")                     //整数类型（大于等于1）
    call SetTypeName(67,"物品最大强化等级")                 //整数类型（大于等于1）
    call SetTypeName(68,"普攻伤害类型")                     //布尔值类型
    call SetTypeName(69,"技能伤害类型")                     //布尔值类型
    call SetTypeName(70,"物理伤害增伤（百分比）")           //实数百分比类型（系统内强制修正值范围 大于等于1）（系统内部计算自动加1，如输入0.5为1.5倍）
    call SetTypeName(71,"物理伤害减伤（百分比）")           //实数百分比类型（系统内强制修正值范围 大于等于0小于等于1）
    call SetTypeName(72,"物理伤害修改（数值）")             //实数数值类型
    call SetTypeName(73,"法术伤害增伤（百分比）")           //实数百分比类型（系统内强制修正值范围 大于等于1）（系统内部计算自动加1，如输入0.5为1.5倍）
    call SetTypeName(74,"法术伤害减伤（百分比）")           //实数百分比类型（系统内强制修正值范围 大于等于0小于等于1）
    call SetTypeName(75,"法术伤害修改（数值）")             //实数数值类型
    call SetTypeName(76,"技能类型的伤害类型")               //整数类型（大于等于0）
endfunction

function SetTypeNamePreinstall takes nothing returns nothing
    call SetTypeName(100,"真实伤害")
    call SetTypeName(101,"普通伤害")
    call SetTypeName(102,"穿刺伤害")
    call SetTypeName(103,"攻城伤害")
    call SetTypeName(104,"强化伤害")
    call SetTypeName(105,"混乱伤害")
    call SetTypeName(106,"英雄伤害")
    
    call SetTypeName(200,"没有护甲")
    call SetTypeName(201,"小型护甲")
    call SetTypeName(202,"中型护甲")
    call SetTypeName(203,"大型护甲")
    call SetTypeName(204,"建筑护甲")
    call SetTypeName(205,"普通护甲")
    call SetTypeName(206,"英雄护甲")
    call SetTypeName(207,"神圣护甲")
    
    call SetTypeName(300,"混沌伤害")
    call SetTypeName(301,"通用伤害")
    call SetTypeName(302,"普通伤害")
    call SetTypeName(303,"强化伤害")
    call SetTypeName(304,"火焰伤害")
    call SetTypeName(305,"冰冻伤害")
    call SetTypeName(306,"闪电伤害")
    call SetTypeName(307,"暴风伤害")
    call SetTypeName(308,"毒药伤害")
    call SetTypeName(309,"神圣伤害")
    call SetTypeName(310,"暗魔伤害")
    
    call SetTypeName(400,"混沌伤害防御")
    call SetTypeName(401,"通用伤害防御")
    call SetTypeName(402,"普通伤害防御")
    call SetTypeName(403,"强化伤害防御")
    call SetTypeName(404,"火焰伤害防御")
    call SetTypeName(405,"冰冻伤害防御")
    call SetTypeName(406,"闪电伤害防御")
    call SetTypeName(407,"暴风伤害防御")
    call SetTypeName(408,"毒药伤害防御")
    call SetTypeName(409,"神圣伤害防御")
    call SetTypeName(410,"暗魔伤害防御")
endfunction

//============================================================================================================================================================
//===================================伤害系统附属数据储存主函数块=============================================================================================
//============================================================================================================================================================

function AttackDefensePreinstallDATA takes nothing returns nothing
    local integer i = 0
    local integer n = 0
    call SaveReal(DSHT, 100, 200, 1.00)
    call SaveReal(DSHT, 100, 201, 1.00)
    call SaveReal(DSHT, 100, 202, 1.00)
    call SaveReal(DSHT, 100, 203, 1.00)
    call SaveReal(DSHT, 100, 204, 1.00)
    call SaveReal(DSHT, 100, 205, 1.00)
    call SaveReal(DSHT, 100, 206, 0.70)
    call SaveReal(DSHT, 100, 207, 0.05)
    call SaveReal(DSHT, 101, 200, 1.00)
    call SaveReal(DSHT, 101, 201, 1.00)
    call SaveReal(DSHT, 101, 202, 1.50)
    call SaveReal(DSHT, 101, 203, 1.00)
    call SaveReal(DSHT, 101, 204, 0.70)
    call SaveReal(DSHT, 101, 205, 1.00)
    call SaveReal(DSHT, 101, 206, 1.00)
    call SaveReal(DSHT, 101, 207, 0.05)
    call SaveReal(DSHT, 102, 200, 1.50)
    call SaveReal(DSHT, 102, 201, 2.00)
    call SaveReal(DSHT, 102, 202, 0.75)
    call SaveReal(DSHT, 102, 203, 1.00)
    call SaveReal(DSHT, 102, 204, 0.35)
    call SaveReal(DSHT, 102, 205, 1.00)
    call SaveReal(DSHT, 102, 206, 0.50)
    call SaveReal(DSHT, 102, 207, 0.05)
    call SaveReal(DSHT, 103, 200, 1.50)
    call SaveReal(DSHT, 103, 201, 1.00)
    call SaveReal(DSHT, 103, 202, 0.50)
    call SaveReal(DSHT, 103, 203, 1.00)
    call SaveReal(DSHT, 103, 204, 1.50)
    call SaveReal(DSHT, 103, 205, 1.00)
    call SaveReal(DSHT, 103, 206, 0.50)
    call SaveReal(DSHT, 103, 207, 0.05)
    call SaveReal(DSHT, 104, 200, 1.00)
    call SaveReal(DSHT, 104, 201, 1.25)
    call SaveReal(DSHT, 104, 202, 0.75)
    call SaveReal(DSHT, 104, 203, 2.00)
    call SaveReal(DSHT, 104, 204, 0.35)
    call SaveReal(DSHT, 104, 205, 1.00)
    call SaveReal(DSHT, 104, 206, 1.00)
    call SaveReal(DSHT, 104, 207, 0.05)
    call SaveReal(DSHT, 105, 200, 1.00)
    call SaveReal(DSHT, 105, 201, 1.00)
    call SaveReal(DSHT, 105, 202, 1.00)
    call SaveReal(DSHT, 105, 203, 1.00)
    call SaveReal(DSHT, 105, 204, 1.00)
    call SaveReal(DSHT, 105, 205, 1.00)
    call SaveReal(DSHT, 105, 206, 1.00)
    call SaveReal(DSHT, 105, 207, 1.00)
    call SaveReal(DSHT, 106, 200, 1.00)
    call SaveReal(DSHT, 106, 201, 1.00)
    call SaveReal(DSHT, 106, 202, 1.00)
    call SaveReal(DSHT, 106, 203, 1.00)
    call SaveReal(DSHT, 106, 204, 0.50)
    call SaveReal(DSHT, 106, 205, 1.00)
    call SaveReal(DSHT, 106, 206, 1.00)
    call SaveReal(DSHT, 106, 207, 0.05)
    set i = 0
    loop
        exitwhen ( i > 10 )
        call SaveReal(DSHT, 300, ( 400 + i ), 1.00)
        set i = i + 1
    endloop
    call SaveReal(DSHT, 301, 401, 1.00)
    call SaveReal(DSHT, 301, 402, 1.25)
    call SaveReal(DSHT, 301, 403, 0.75)
    call SaveReal(DSHT, 301, 404, 1.00)
    call SaveReal(DSHT, 301, 405, 1.00)
    call SaveReal(DSHT, 301, 406, 1.00)
    call SaveReal(DSHT, 301, 407, 1.00)
    call SaveReal(DSHT, 301, 408, 1.00)
    call SaveReal(DSHT, 301, 409, 0.25)
    call SaveReal(DSHT, 301, 410, 1.25)
    call SaveReal(DSHT, 302, 401, 0.90)
    call SaveReal(DSHT, 302, 402, 1.00)
    call SaveReal(DSHT, 302, 403, 0.50)
    call SaveReal(DSHT, 302, 404, 1.00)
    call SaveReal(DSHT, 302, 405, 1.00)
    call SaveReal(DSHT, 302, 406, 1.00)
    call SaveReal(DSHT, 302, 407, 1.00)
    call SaveReal(DSHT, 302, 408, 1.00)
    call SaveReal(DSHT, 302, 409, 0.05)
    call SaveReal(DSHT, 302, 410, 1.00)
    call SaveReal(DSHT, 303, 401, 1.25)
    call SaveReal(DSHT, 303, 402, 1.50)
    call SaveReal(DSHT, 303, 403, 1.00)
    call SaveReal(DSHT, 303, 404, 1.00)
    call SaveReal(DSHT, 303, 405, 2.00)
    call SaveReal(DSHT, 303, 406, 0.50)
    call SaveReal(DSHT, 303, 407, 0.05)
    call SaveReal(DSHT, 303, 408, 1.00)
    call SaveReal(DSHT, 303, 409, 0.05)
    call SaveReal(DSHT, 303, 410, 1.00)
    call SaveReal(DSHT, 304, 401, 1.25)
    call SaveReal(DSHT, 304, 402, 2.00)
    call SaveReal(DSHT, 304, 403, 0.50)
    call SaveReal(DSHT, 304, 404, 1.00)
    call SaveReal(DSHT, 304, 405, 0.05)
    call SaveReal(DSHT, 304, 406, 2.00)
    call SaveReal(DSHT, 304, 407, 0.50)
    call SaveReal(DSHT, 304, 408, 1.00)
    call SaveReal(DSHT, 304, 409, 0.05)
    call SaveReal(DSHT, 304, 410, 0.75)
    call SaveReal(DSHT, 305, 401, 1.25)
    call SaveReal(DSHT, 305, 402, 1.50)
    call SaveReal(DSHT, 305, 403, 0.05)
    call SaveReal(DSHT, 305, 404, 2.00)
    call SaveReal(DSHT, 305, 405, 1.00)
    call SaveReal(DSHT, 305, 406, 0.50)
    call SaveReal(DSHT, 305, 407, 0.50)
    call SaveReal(DSHT, 305, 408, 1.00)
    call SaveReal(DSHT, 305, 409, 0.05)
    call SaveReal(DSHT, 305, 410, 1.00)
    call SaveReal(DSHT, 306, 401, 1.25)
    call SaveReal(DSHT, 306, 402, 2.00)
    call SaveReal(DSHT, 306, 403, 0.50)
    call SaveReal(DSHT, 306, 404, 1.00)
    call SaveReal(DSHT, 306, 405, 0.50)
    call SaveReal(DSHT, 306, 406, 1.00)
    call SaveReal(DSHT, 306, 407, 2.00)
    call SaveReal(DSHT, 306, 408, 1.00)
    call SaveReal(DSHT, 306, 409, 0.05)
    call SaveReal(DSHT, 306, 410, 1.25)
    call SaveReal(DSHT, 307, 401, 1.25)
    call SaveReal(DSHT, 307, 402, 1.25)
    call SaveReal(DSHT, 307, 403, 1.00)
    call SaveReal(DSHT, 307, 404, 0.05)
    call SaveReal(DSHT, 307, 405, 1.00)
    call SaveReal(DSHT, 307, 406, 0.05)
    call SaveReal(DSHT, 307, 407, 1.00)
    call SaveReal(DSHT, 307, 408, 1.00)
    call SaveReal(DSHT, 307, 409, 0.05)
    call SaveReal(DSHT, 307, 410, 1.00)
    call SaveReal(DSHT, 308, 401, 1.25)
    call SaveReal(DSHT, 308, 402, 1.50)
    call SaveReal(DSHT, 308, 403, 1.00)
    call SaveReal(DSHT, 308, 404, 1.00)
    call SaveReal(DSHT, 308, 405, 1.00)
    call SaveReal(DSHT, 308, 406, 1.00)
    call SaveReal(DSHT, 308, 407, 1.00)
    call SaveReal(DSHT, 308, 408, 0.05)
    call SaveReal(DSHT, 308, 409, 0.05)
    call SaveReal(DSHT, 308, 410, 0.25)
    call SaveReal(DSHT, 309, 401, 1.25)
    call SaveReal(DSHT, 309, 402, 2.00)
    call SaveReal(DSHT, 309, 403, 1.00)
    call SaveReal(DSHT, 309, 404, 1.00)
    call SaveReal(DSHT, 309, 405, 1.00)
    call SaveReal(DSHT, 309, 406, 1.00)
    call SaveReal(DSHT, 309, 407, 1.00)
    call SaveReal(DSHT, 309, 408, 1.50)
    call SaveReal(DSHT, 309, 409, 1.00)
    call SaveReal(DSHT, 309, 410, 2.00)
    call SaveReal(DSHT, 310, 401, 1.50)
    call SaveReal(DSHT, 310, 402, 2.00)
    call SaveReal(DSHT, 310, 403, 1.00)
    call SaveReal(DSHT, 310, 404, 1.50)
    call SaveReal(DSHT, 310, 405, 1.00)
    call SaveReal(DSHT, 310, 406, 1.00)
    call SaveReal(DSHT, 310, 407, 1.00)
    call SaveReal(DSHT, 310, 408, 0.75)
    call SaveReal(DSHT, 310, 409, 2.00)
    call SaveReal(DSHT, 310, 410, 1.00)
    set n = 1
    loop
        exitwhen ( n > 10 )
        call SaveReal(DSHT, ( 300 + n ), 400, 1.00)
        set n = n + 1
    endloop
endfunction

//============================================================================================================================================================
//=============================伤害系统附属数据与函数处理主函数块=============================================================================================
//============================================================================================================================================================

function SetType takes integer whichid, integer typeid, integer value returns nothing
    call SaveInteger(DSHT, whichid, typeid, value)
endfunction

function GetType takes integer whichid, integer typeid returns integer
    return LoadInteger(DSHT, whichid, typeid)
endfunction

function SetTypeData takes integer whichid, integer typeid, real value returns nothing
    call SaveReal(DSHT, whichid, typeid, value)
endfunction

function GetTypeData takes integer whichid, integer typeid returns real
    return LoadReal(DSHT, whichid, typeid)
endfunction

function SetTypeBoolean takes integer whichid, integer typeid, boolean value returns nothing
    call SaveBoolean(DSHT, whichid, typeid, value)
endfunction

function GetTypeBoolean takes integer whichid, integer typeid returns boolean
    return LoadBoolean(DSHT, whichid, typeid)
endfunction

//! textmacro SetDataTypeA takes Name,Index
function SetUnit$Name$Type takes unit whichunit,integer typeid,boolean b returns nothing
    local integer id = StringHash(I2S(GetHandleId(whichunit))+I2S($Index$))
    call SaveBoolean(DSHT,id,typeid,b)
endfunction

function Unit$Name$Conditions takes unit whichunit,integer typeid returns boolean
    local integer id = StringHash(I2S(GetHandleId(whichunit))+I2S($Index$))
    return LoadBoolean(DSHT,id,typeid)
endfunction

function SetUnit$Name$Damage takes unit whichunit,boolean b returns nothing
    local integer i = 100
    loop
        exitwhen i > 107
        call SetUnit$Name$Type(whichunit,i,b)
        set i = i + 1
    endloop
endfunction    
//! endtextmacro

//! runtextmacro SetDataTypeA ("Hemophagia","14")
//! runtextmacro SetDataTypeA ("Rebound","15")

//! textmacro SetDataTypeB takes Name,Index
function SetUnit$Name$Type takes unit whichunit,integer typeid,boolean b returns nothing
    local integer id = StringHash(I2S(GetHandleId(whichunit))+I2S($Index$))
    call SaveBoolean(DSHT,id,typeid,b)
endfunction

function Unit$Name$Conditions takes unit whichunit,integer typeid returns boolean
    local integer id = StringHash(I2S(GetHandleId(whichunit))+I2S($Index$))
    return LoadBoolean(DSHT,id,typeid)
endfunction

function SetUnit$Name$Damage takes unit whichunit,boolean b returns nothing
    local integer n = 300
    loop
        exitwhen n > 311
        call SetUnit$Name$Type(whichunit,n,b)
        set n = n + 1
    endloop
endfunction
//! endtextmacro

//! runtextmacro SetDataTypeB ("MagicHemophagia","33")
//! runtextmacro SetDataTypeB ("MagicRebound","34")

//! textmacro SetDataTypeC takes Name,Index
function SetUnit$Name$Type takes unit whichunit,integer typeid,boolean b returns nothing
    local integer id = StringHash(I2S(GetHandleId(whichunit))+I2S($Index$))
    call SaveBoolean(DSHT,id,typeid,b)
endfunction

function Unit$Name$Conditions takes unit whichunit,integer typeid returns boolean
    local integer id = StringHash(I2S(GetHandleId(whichunit))+I2S($Index$))
    return LoadBoolean(DSHT,id,typeid)
endfunction

function SetUnit$Name$Damage takes unit whichunit,boolean b returns nothing
    local integer i = 100
    local integer n = 300
    loop
        exitwhen i > 107
        call SetUnit$Name$Type(whichunit,i,b)
        set i = i + 1
    endloop
    loop
        exitwhen n > 311
        call SetUnit$Name$Type(whichunit,n,b)
        set n = n + 1
    endloop
endfunction
//! endtextmacro

//! runtextmacro SetDataTypeC ("Immune","54")

function GetTotalUnitItemAttributeID takes unit whichunit, integer TypeID returns integer
    return StringHash(I2S(GetHandleId(whichunit)) + I2S(TypeID) + I2S(10))
endfunction

function ProbabilityRange takes real a returns real
	local real i = a
    if i >= 1.0 then
        set i = 1.0
    elseif i <= 0.0 then
        set i = 0.0
    endif
    return i
endfunction

function AbsoluteRange takes real a returns real
	local real i = a
    if i >= 1.0 then
        set i = 1.0
    elseif i <= -1.0 then
        set i = -1.0
    endif
    return i
endfunction

function GreaterThanOneRange takes real a returns real
	local real i = a
    if i <= 1.0 then
        set i = 1.0
    endif
    return i
endfunction

function PositiveRange takes real a returns real
	local real i = a
    if i <= 0.0 then
        set i = 0.0
    endif
    return i
endfunction

function ParryDamageReductionRange takes real a returns real
	local real i = a
    if i <= 0.1 then
        set i = 0.1
    elseif i >= 0.6 then
        set i = 0.6
    endif
    return i
endfunction

function DamageDispose takes unit DamagedUnit, real damage returns real
    local real I = 0.0
    local real R1 = 0.0
    local real R2 = 0.0
    local real Damage = 0.0
    set I = 1.0 + GetTypeData(GetHandleId(DamagedUnit),45) + GetTypeData(GetTotalUnitItemAttributeID(DamagedUnit,45),45)
    set R1 = GetTypeData(GetHandleId(DamagedUnit),46) + GetTypeData(GetTotalUnitItemAttributeID(DamagedUnit,46),46)
    set R2 = GetTypeData(GetHandleId(DamagedUnit),47) + GetTypeData(GetTotalUnitItemAttributeID(DamagedUnit,47),47)
    set I = PositiveRange(I)
    set R1 = ProbabilityRange(R1)
    set Damage = damage * I * ( 1.0 - R1 ) + R2
    set Damage = PositiveRange(Damage)
    return Damage
endfunction

function MeleeDamageDispose takes unit DamagedUnit, real damage returns real
    local real I = 0.0
    local real R1 = 0.0
    local real R2 = 0.0
    local real Damage = 0.0
    set I = 1.0 + GetTypeData(GetHandleId(DamagedUnit),70) + GetTypeData(GetTotalUnitItemAttributeID(DamagedUnit,70),70)
    set R1 = GetTypeData(GetHandleId(DamagedUnit),71) + GetTypeData(GetTotalUnitItemAttributeID(DamagedUnit,71),71)
    set R2 = GetTypeData(GetHandleId(DamagedUnit),72) + GetTypeData(GetTotalUnitItemAttributeID(DamagedUnit,72),72)
    set I = PositiveRange(I)
    set R1 = ProbabilityRange(R1)
    set Damage = damage * I * ( 1.0 - R1 ) + R2
    set Damage = PositiveRange(Damage)
    return Damage
endfunction

function MagicDamageDispose takes unit DamagedUnit, real damage returns real
    local real I = 0.0
    local real R1 = 0.0
    local real R2 = 0.0
    local real Damage = 0.0
    set I = 1.0 + GetTypeData(GetHandleId(DamagedUnit),73) + GetTypeData(GetTotalUnitItemAttributeID(DamagedUnit,73),73)
    set R1 = GetTypeData(GetHandleId(DamagedUnit),74) + GetTypeData(GetTotalUnitItemAttributeID(DamagedUnit,74),74)
    set R2 = GetTypeData(GetHandleId(DamagedUnit),75) + GetTypeData(GetTotalUnitItemAttributeID(DamagedUnit,75),75)
    set I = PositiveRange(I)
    set R1 = ProbabilityRange(R1)
    set Damage = damage * I * ( 1.0 - R1 ) + R2
    set Damage = PositiveRange(Damage)
    return Damage
endfunction

//============================================================================================================================================================
//=======================================伤害事件和治疗事件及参数取得主函数块=================================================================================
//============================================================================================================================================================

function GetUnitKilledEventKilledUnit takes nothing returns unit
    return LoadUnitHandle(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("KilledUnit"))
endfunction

function GetUnitKilledEventKillingUnit takes nothing returns unit
    return LoadUnitHandle(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("KillingUnit"))
endfunction

function TriggerRegisterAnyUnitKilledEvent takes trigger t returns nothing
    set S_KillListEnd = S_KillListEnd + 1
    set S_KillNextIndex[S_KillListEnd - 1] = S_KillListEnd
    set S_KillLastIndex[S_KillListEnd] = S_KillListEnd - 1
    set S_KillTriggerList[S_KillListEnd] = t
endfunction

function UnitKilledEventTriggerListExecute takes unit KillingUnit, unit KilledUnit returns nothing
    local integer index = 0
    set index = S_KillNextIndex[0]
    loop
        exitwhen (index == 0)
        exitwhen (index > S_KillListEnd)
        if (IsTriggerEnabled(S_KillTriggerList[index])) and (TriggerEvaluate(S_KillTriggerList[index])) then
            call SaveUnitHandle(DATA,GetHandleId(S_KillTriggerList[index]),StringHash("KilledUnit"),KilledUnit)
            call SaveUnitHandle(DATA,GetHandleId(S_KillTriggerList[index]),StringHash("KillingUnit"),KillingUnit)
            call TriggerExecute(S_KillTriggerList[index])
        endif
        set index = S_KillNextIndex[index]
    endloop
endfunction

function DestroyAnyUnitKilledEvent takes trigger t returns nothing
    local integer index = 0
    set index = S_KillNextIndex[0]
    loop
        exitwhen (index == 0)
        exitwhen (S_KillTriggerList[index] == t)
        set index = S_KillNextIndex[index]
    endloop
    call FlushChildHashtable(DATA,GetHandleId(t))
    if (index > 0) then
        set S_KillNextIndex[S_KillLastIndex[index]] = S_KillNextIndex[index]
        set S_KillLastIndex[S_KillNextIndex[index]] = S_KillLastIndex[index]
    endif
endfunction

function TriggerRegisterAnyUnitDamagedEvent takes trigger t,integer tp returns nothing
    if (tp == 0) then //Melee Damage
        set MeleeListEnd = MeleeListEnd + 1
        set MeleeNextIndex[MeleeListEnd - 1] = MeleeListEnd
        set MeleeLastIndex[MeleeListEnd] = MeleeListEnd - 1
        set MeleeTriggerList[MeleeListEnd] = t
    elseif (tp == 1) then // Magic Damage
        set MagicListEnd = MagicListEnd + 1
        set MagicNextIndex[MagicListEnd - 1] = MagicListEnd
        set MagicLastIndex[MagicListEnd] = MagicListEnd - 1
        set MagicTriggerList[MagicListEnd] = t
    elseif (tp == 2) then // Mimeticd Melee Damage
        set M_MeleeListEnd = M_MeleeListEnd + 1
        set M_MeleeNextIndex[M_MeleeListEnd - 1] = M_MeleeListEnd
        set M_MeleeLastIndex[M_MeleeListEnd] = M_MeleeListEnd - 1
        set M_MeleeTriggerList[M_MeleeListEnd] = t
    elseif (tp == 3) then // Mimeticd Magic Damage
        set M_MagicListEnd = M_MagicListEnd + 1
        set M_MagicNextIndex[M_MagicListEnd - 1] = M_MagicListEnd
        set M_MagicLastIndex[M_MagicListEnd] = M_MagicListEnd - 1
        set M_MagicTriggerList[M_MagicListEnd] = t
    elseif (tp == 4) then // Mimeticd Any Damage
        set ASD_ListEnd = ASD_ListEnd + 1
        set ASD_NextIndex[ASD_ListEnd - 1] = ASD_ListEnd
        set ASD_LastIndex[ASD_ListEnd] = ASD_ListEnd - 1
        set ASD_TriggerList[ASD_ListEnd] = t
    elseif (tp == 5) then // Mimeticd Null Damage
        set M_Null_ListEnd = M_Null_ListEnd + 1
        set M_Null_NextIndex[M_Null_ListEnd - 1] = M_Null_ListEnd
        set M_Null_LastIndex[M_Null_ListEnd] = M_Null_ListEnd - 1
        set M_Null_TriggerList[M_Null_ListEnd] = t
    endif
endfunction

function DestroyAnyUnitDamagedEvent takes trigger t,integer tp returns nothing
    local integer index = 0
    if (tp == 0) then
        set index = MeleeNextIndex[0]
        loop
            exitwhen (index == 0)
            exitwhen (MeleeTriggerList[index] == t)
            set index = MeleeNextIndex[index]
        endloop
        if (index > 0) then
            set MeleeNextIndex[MeleeLastIndex[index]] = MeleeNextIndex[index]
            set MeleeLastIndex[MeleeNextIndex[index]] = MeleeLastIndex[index]
        endif
    elseif (tp == 1) then
        set index = MagicNextIndex[0]
        loop
            exitwhen (index == 0)
            exitwhen (MagicTriggerList[index] == t)
            set index = MagicNextIndex[index]
        endloop
        if (index > 0) then
            set MagicNextIndex[MagicLastIndex[index]] = MagicNextIndex[index]
            set MagicLastIndex[MagicNextIndex[index]] = MagicLastIndex[index]
        endif
    elseif (tp == 2) then
        set index = M_MeleeNextIndex[0]
        loop
            exitwhen (index == 0)
            exitwhen (M_MeleeTriggerList[index] == t)
            set index = M_MeleeNextIndex[index]
        endloop
        call FlushChildHashtable(DATA,GetHandleId(t))
        if (index > 0) then
            set M_MeleeNextIndex[M_MeleeLastIndex[index]] = M_MeleeNextIndex[index]
            set M_MeleeLastIndex[M_MeleeNextIndex[index]] = M_MeleeLastIndex[index]
        endif
    elseif (tp == 3) then
        set index = M_MagicNextIndex[0]
        loop
            exitwhen (index == 0)
            exitwhen (M_MagicTriggerList[index] == t)
            set index = M_MagicNextIndex[index]
        endloop
        call FlushChildHashtable(DATA,GetHandleId(t))
        if (index > 0) then
            set M_MagicNextIndex[M_MagicLastIndex[index]] = M_MagicNextIndex[index]
            set M_MagicLastIndex[M_MagicNextIndex[index]] = M_MagicLastIndex[index]
        endif
    elseif (tp == 4) then
        set index = ASD_NextIndex[0]
        loop
            exitwhen (index == 0)
            exitwhen (ASD_TriggerList[index] == t)
            set index = ASD_NextIndex[index]
        endloop
        call FlushChildHashtable(DATA,GetHandleId(t))
        if (index > 0) then
            set ASD_NextIndex[ASD_LastIndex[index]] = ASD_NextIndex[index]
            set ASD_LastIndex[ASD_NextIndex[index]] = ASD_LastIndex[index]
        endif
    elseif (tp == 5) then
        set index = M_Null_NextIndex[0]
        loop
            exitwhen (index == 0)
            exitwhen (M_Null_TriggerList[index] == t)
            set index = M_Null_NextIndex[index]
        endloop
        call FlushChildHashtable(DATA,GetHandleId(t))
        if (index > 0) then
            set M_Null_NextIndex[M_Null_LastIndex[index]] = M_Null_NextIndex[index]
            set M_Null_LastIndex[M_Null_NextIndex[index]] = M_Null_LastIndex[index]
        endif
    endif
endfunction

function GetMeleeEventDamageSource takes nothing returns unit
    return LoadUnitHandle(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("MeleeDamageSource"))
endfunction

function GetMeleeEventDamagedUnit takes nothing returns unit
    return LoadUnitHandle(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("MeleeDamagedUnit"))
endfunction

function GetMeleeEventDamage takes nothing returns real
    return LoadReal(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("MeleeDamage"))
endfunction

function MeleeEventTriggerListExecute takes unit DamageSource, unit DamagedUnit, real Damage returns nothing
    local integer index = 0
    set index = MeleeNextIndex[0]
    loop
        exitwhen (index == 0)
        exitwhen (index > MeleeListEnd)
        if (IsTriggerEnabled(MeleeTriggerList[index])) and (TriggerEvaluate(MeleeTriggerList[index])) then
            call SaveUnitHandle(DATA,GetHandleId(MeleeTriggerList[index]),StringHash("MeleeDamageSource"),DamageSource)
            call SaveUnitHandle(DATA,GetHandleId(MeleeTriggerList[index]),StringHash("MeleeDamagedUnit"),DamagedUnit)
            call SaveReal(DATA,GetHandleId(MeleeTriggerList[index]),StringHash("MeleeDamage"),Damage)
            call TriggerExecute(MeleeTriggerList[index])
        endif
        set index = MeleeNextIndex[index]
    endloop
endfunction

function GetMagicEventDamageSource takes nothing returns unit
    return LoadUnitHandle(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("MagicDamageSource"))
endfunction

function GetMagicEventDamagedUnit takes nothing returns unit
    return LoadUnitHandle(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("MagicDamagedUnit"))
endfunction

function GetMagicEventDamage takes nothing returns real
    return LoadReal(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("MagicDamage"))
endfunction

function MagicEventTriggerListExecute takes unit DamageSource, unit DamagedUnit, real Damage returns nothing
    local integer index = 0
    set index = MagicNextIndex[0]
    loop
        exitwhen (index == 0)
        exitwhen (index > MagicListEnd)
        if (IsTriggerEnabled(MagicTriggerList[index])) and (TriggerEvaluate(MagicTriggerList[index])) then
            call SaveUnitHandle(DATA,GetHandleId(MagicTriggerList[index]),StringHash("MagicDamageSource"),DamageSource)
            call SaveUnitHandle(DATA,GetHandleId(MagicTriggerList[index]),StringHash("MagicDamagedUnit"),DamagedUnit)
            call SaveReal(DATA,GetHandleId(MagicTriggerList[index]),StringHash("MagicDamage"),Damage)
            call TriggerExecute(MagicTriggerList[index])
        endif
        set index = MagicNextIndex[index]
    endloop
endfunction

function GetMimeticdMeleeEventDamageSource takes nothing returns unit
    return LoadUnitHandle(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("M_MeleeDamageSource"))
endfunction

function GetMimeticdMeleeEventDamagedUnit takes nothing returns unit
    return LoadUnitHandle(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("M_MeleeDamagedUnit"))
endfunction

function GetMimeticdMeleeEventDamage takes nothing returns real
    return LoadReal(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("M_MeleeDamage"))
endfunction

function MimeticdMeleeEventTriggerListExecute takes unit DamageSource, unit DamagedUnit, real Damage returns nothing
    local integer index = 0
    set index = M_MeleeNextIndex[0]
    loop
        exitwhen (index == 0)
        exitwhen (index > M_MeleeListEnd)
        if (IsTriggerEnabled(M_MeleeTriggerList[index])) and (TriggerEvaluate(M_MeleeTriggerList[index])) then
            call SaveUnitHandle(DATA,GetHandleId(M_MeleeTriggerList[index]),StringHash("M_MeleeDamageSource"),DamageSource)
            call SaveUnitHandle(DATA,GetHandleId(M_MeleeTriggerList[index]),StringHash("M_MeleeDamagedUnit"),DamagedUnit)
            call SaveReal(DATA,GetHandleId(M_MeleeTriggerList[index]),StringHash("M_MeleeDamage"),Damage)
            call TriggerExecute(M_MeleeTriggerList[index])
        endif
        set index = M_MeleeNextIndex[index]
    endloop
endfunction

function GetMimeticdMagicEventDamageSource takes nothing returns unit
    return LoadUnitHandle(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("M_MagicDamageSource"))
endfunction

function GetMimeticdMagicEventDamagedUnit takes nothing returns unit
    return LoadUnitHandle(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("M_MagicDamagedUnit"))
endfunction

function GetMimeticdMagicEventDamage takes nothing returns real
    return LoadReal(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("M_MagicDamage"))
endfunction

function MimeticdMagicEventTriggerListExecute takes unit DamageSource, unit DamagedUnit, real Damage returns nothing
    local integer index = 0
    set index = M_MagicNextIndex[0]
    loop
        exitwhen (index == 0)
        exitwhen (index > M_MagicListEnd)
        if (IsTriggerEnabled(M_MagicTriggerList[index])) and (TriggerEvaluate(M_MagicTriggerList[index])) then
            call SaveUnitHandle(DATA,GetHandleId(M_MagicTriggerList[index]),StringHash("M_MagicDamageSource"),DamageSource)
            call SaveUnitHandle(DATA,GetHandleId(M_MagicTriggerList[index]),StringHash("M_MagicDamagedUnit"),DamagedUnit)
            call SaveReal(DATA,GetHandleId(M_MagicTriggerList[index]),StringHash("M_MagicDamage"),Damage)
            call TriggerExecute(M_MagicTriggerList[index])
        endif
        set index = M_MagicNextIndex[index]
    endloop
endfunction

function GetASDEventDamageSource takes nothing returns unit
    return LoadUnitHandle(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("ASD_DamageSource"))
endfunction

function GetASDEventDamagedUnit takes nothing returns unit
    return LoadUnitHandle(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("ASD_DamagedUnit"))
endfunction

function GetASDEventDamage takes nothing returns real
    return LoadReal(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("ASD_Damage"))
endfunction

function ASDEventTriggerListExecute takes unit DamageSource, unit DamagedUnit, real Damage returns nothing
    local integer index = 0
    set index = ASD_NextIndex[0]
    loop
        exitwhen (index == 0)
        exitwhen (index > ASD_ListEnd)
        if (IsTriggerEnabled(ASD_TriggerList[index])) and (TriggerEvaluate(ASD_TriggerList[index])) then
            call SaveUnitHandle(DATA,GetHandleId(ASD_TriggerList[index]),StringHash("ASD_DamageSource"),DamageSource)
            call SaveUnitHandle(DATA,GetHandleId(ASD_TriggerList[index]),StringHash("ASD_DamagedUnit"),DamagedUnit)
            call SaveReal(DATA,GetHandleId(ASD_TriggerList[index]),StringHash("ASD_Damage"),Damage)
            call TriggerExecute(ASD_TriggerList[index])
        endif
        set index = ASD_NextIndex[index]
    endloop
endfunction

function GetNTDEventDamageSource takes nothing returns unit
    return LoadUnitHandle(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("M_Null_DamageSource"))
endfunction

function GetNTDEventDamagedUnit takes nothing returns unit
    return LoadUnitHandle(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("M_Null_DamagedUnit"))
endfunction

function GetNTDEventDamage takes nothing returns real
    return LoadReal(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("M_Null_Damage"))
endfunction

function NTDEventTriggerListExecute takes unit DamageSource, unit DamagedUnit, real Damage returns nothing
    local integer index = 0
    set index = M_Null_NextIndex[0]
    loop
        exitwhen (index == 0)
        exitwhen (index > M_Null_ListEnd)
        if (IsTriggerEnabled(M_Null_TriggerList[index])) and (TriggerEvaluate(M_Null_TriggerList[index])) then
            call SaveUnitHandle(DATA,GetHandleId(M_Null_TriggerList[index]),StringHash("M_Null_DamageSource"),DamageSource)
            call SaveUnitHandle(DATA,GetHandleId(M_Null_TriggerList[index]),StringHash("M_Null_DamagedUnit"),DamagedUnit)
            call SaveReal(DATA,GetHandleId(M_Null_TriggerList[index]),StringHash("M_Null_Damage"),Damage)
            call TriggerExecute(M_Null_TriggerList[index])
        endif
        set index = M_Null_NextIndex[index]
    endloop
endfunction

function GetReboundDamageEventDamageSource takes nothing returns unit
    return LoadUnitHandle(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("RMDSource"))
endfunction

function GetReboundDamageEventDamagedUnit takes nothing returns unit
    return LoadUnitHandle(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("RMDUnit"))
endfunction

function GetReboundDamageEventDamage takes nothing returns real
    return LoadReal(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("RMDamage"))
endfunction

function TriggerRegisterAnyUnitReboundDamageEvent takes trigger t returns nothing
    set RMDListEnd = RMDListEnd + 1
    set RMDNextIndex[RMDListEnd - 1] = RMDListEnd
    set RMDLastIndex[RMDListEnd] = RMDListEnd - 1
    set RMDTriggerList[RMDListEnd] = t
endfunction

function ReboundDamageEventTriggerListExecute takes unit RMDSource, unit RMDUnit, real Damage returns nothing
    local integer index = 0
    set index =  RMDNextIndex[0]
    loop
        exitwhen (index == 0)
        exitwhen (index > RMDListEnd)
        if (IsTriggerEnabled(RMDTriggerList[index])) and (TriggerEvaluate(RMDTriggerList[index])) then
            call SaveUnitHandle(DATA,GetHandleId(RMDTriggerList[index]),StringHash("RMDSource"),RMDSource)
            call SaveUnitHandle(DATA,GetHandleId(RMDTriggerList[index]),StringHash("RMDUnit"),RMDUnit)
            call SaveReal(DATA,GetHandleId(RMDTriggerList[index]),StringHash("RMDamage"),Damage)
             call TriggerExecute(RMDTriggerList[index])
        endif
        set index = RMDNextIndex[index]
    endloop
endfunction

function DestroyAnyUnitReboundDamageEvent takes trigger t returns nothing
    local integer index = 0
    set index = RMDNextIndex[0]
    loop
        exitwhen (index == 0)
        exitwhen (RMDTriggerList[index] == t)
        set index = RMDNextIndex[index]
    endloop
    call FlushChildHashtable(DATA,GetHandleId(t))
    if (index > 0) then
        set RMDNextIndex[RMDLastIndex[index]] = RMDNextIndex[index]
        set RMDLastIndex[RMDNextIndex[index]] = RMDLastIndex[index]
    endif
endfunction

function GetHealingEventHealingSource takes nothing returns unit
    return LoadUnitHandle(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("HealingSource"))
endfunction

function GetHealingEventTreatedUnit takes nothing returns unit
    return LoadUnitHandle(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("TreatedUnit"))
endfunction

function GetHealingEventHealing takes nothing returns real
    return LoadReal(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("Treatmentvalue"))
endfunction

function TriggerRegisterAnyUnitHealingEvent takes trigger t returns nothing
        set HealingListEnd = HealingListEnd + 1
        set HealingNextIndex[HealingListEnd - 1] = HealingListEnd
        set HealingLastIndex[HealingListEnd] = HealingListEnd - 1
        set HealingTriggerList[HealingListEnd] = t
endfunction

function HealingEventTriggerListExecute takes unit HealingSource, unit TreatedUnit, real Treatmentvalue returns nothing
    local integer index = 0
    set index = HealingNextIndex[0]
    loop
        exitwhen (index == 0)
        exitwhen (index > HealingListEnd)
        if (IsTriggerEnabled(HealingTriggerList[index])) and (TriggerEvaluate(HealingTriggerList[index])) then
            call SaveUnitHandle(DATA,GetHandleId(HealingTriggerList[index]),StringHash("HealingSource"),HealingSource)
            call SaveUnitHandle(DATA,GetHandleId(HealingTriggerList[index]),StringHash("TreatedUnit"),TreatedUnit)
            call SaveReal(DATA,GetHandleId(HealingTriggerList[index]),StringHash("Treatmentvalue"),Treatmentvalue)
            call TriggerExecute(HealingTriggerList[index])
        endif
        set index = HealingNextIndex[index]
    endloop
endfunction

function DestroyAnyUnitHealingEvent takes trigger t returns nothing
    local integer index = 0
    set index = HealingNextIndex[0]
    loop
        exitwhen (index == 0)
        exitwhen (HealingTriggerList[index] == t)
        set index = HealingNextIndex[index]
    endloop
    call FlushChildHashtable(DATA,GetHandleId(t))
    if (index > 0) then
        set HealingNextIndex[HealingLastIndex[index]] = HealingNextIndex[index]
        set HealingLastIndex[HealingNextIndex[index]] = HealingLastIndex[index]
    endif
endfunction

//============================================================================================================================================================
//=======================================单位携带物品属性计算处理=============================================================================================
//============================================================================================================================================================

function TypeKey takes integer typeid returns integer
    return StringHash(I2S(typeid) + "升级附加")
endfunction

function TypeKey0 takes integer typeid returns integer
    return StringHash(I2S(typeid) + "面板属性")
endfunction

function SetItemTypeData takes integer whichid, integer typeid, real value returns nothing
    call SaveReal(DSITHT, whichid, typeid, value)
endfunction

function GetItemTypeData takes integer whichid, integer typeid returns real
    return LoadReal(DSITHT, whichid, typeid)
endfunction

function SetItemTypeIntegerData takes integer whichid, integer typeid, integer value returns nothing
    call SaveInteger(DSITHT, whichid, typeid, value)
endfunction

function GetItemTypeIntegerData takes integer whichid, integer typeid returns integer
    return LoadInteger(DSITHT, whichid, typeid)
endfunction

function SetItemData takes item whichitem, integer TypeID, real Value returns nothing
    call SaveReal(DSITHT,GetHandleId(whichitem),TypeID,Value)
endfunction

function GetItemData takes item whichitem, integer TypeID returns real
    return LoadReal(DSITHT,GetHandleId(whichitem),TypeID)
endfunction

function SetItemIntegerData takes item whichitem, integer TypeID, integer Value returns nothing
    call SaveInteger(DSITHT,GetHandleId(whichitem),TypeID,Value)
endfunction

function GetItemIntegerData takes item whichitem, integer TypeID returns integer
    return LoadInteger(DSITHT,GetHandleId(whichitem),TypeID)
endfunction

function GetUnitItemBuyIndex takes unit whichunit, integer index returns item
    return LoadItemHandle(DSITHT, LoadInteger(DSITHT, GetHandleId(whichunit), index),0x100001)
endfunction

function GetUnitItemMaxNumber takes unit whichunit returns integer
    return GetMaxIndex(StringHash(I2S(10)+I2S(GetHandleId(whichunit))+I2S(1)))
endfunction

function UnitItemPredicable takes unit whichunit returns nothing
    local integer I = 0
    local integer i = 0
    local integer x = 0
    local integer ItemID = 0
    local item TempItem = null
    local integer UnitHandleId = StringHash(I2S(10)+I2S(GetHandleId(whichunit))+I2S(1))
    local real array a
    local real array b
    local real array c
    set I = 1
    loop
        exitwhen ( I > GetMaxIndex(UnitHandleId) )
        set TempItem = LoadItemHandle(DSITHT, LoadInteger(DSITHT, GetHandleId(whichunit), I),0x100001)
        set ItemID = GetItemTypeId(TempItem)
        set a[0] = a[0] + GetItemTypeData(ItemID,2) + GetItemData(TempItem,2)
        set x = 4
        loop
            exitwhen x > 15
            set a[x-3] = a[x-3] + GetItemTypeData(ItemID,x) + GetItemData(TempItem,x)
            set x = x + 1
        endloop
        set a[13] = a[13] + GetItemTypeData(ItemID,17) + GetItemData(TempItem,17)
        set a[14] = a[14] + GetItemTypeData(ItemID,18) + GetItemData(TempItem,18)
        set a[15] = a[15] + GetItemTypeData(ItemID,19) + GetItemData(TempItem,19)

        set b[0] = b[0] + GetItemTypeData(ItemID,21) + GetItemData(TempItem,21)
        set x = 23
        loop
            exitwhen x > 34
            set b[x-22] = b[x-22] + GetItemTypeData(ItemID,x) + GetItemData(TempItem,x)
            set x = x + 1
        endloop
        set b[13] = b[13] + GetItemTypeData(ItemID,36) + GetItemData(TempItem,36)
        set b[14] = b[14] + GetItemTypeData(ItemID,37) + GetItemData(TempItem,37)
        set b[15] = b[15] + GetItemTypeData(ItemID,38) + GetItemData(TempItem,38)
        
        set c[0] = c[0] + GetItemTypeData(ItemID,39) + GetItemData(TempItem,39)
        set c[1] = c[1] + GetItemTypeData(ItemID,40) + GetItemData(TempItem,40)
        set c[2] = c[2] + GetItemTypeData(ItemID,41) + GetItemData(TempItem,41)
        set c[3] = c[3] + GetItemTypeData(ItemID,42) + GetItemData(TempItem,42)
        set c[4] = c[4] + GetItemTypeData(ItemID,43) + GetItemData(TempItem,43)
        set c[5] = c[5] + GetItemTypeData(ItemID,45) + GetItemData(TempItem,45)
        set c[6] = c[6] + GetItemTypeData(ItemID,46) + GetItemData(TempItem,46)
        set c[7] = c[7] + GetItemTypeData(ItemID,47) + GetItemData(TempItem,47)
        set x = 70
        loop
            exitwhen x > 75
            set c[x-62] = c[x-62] + GetItemTypeData(ItemID,x) + GetItemData(TempItem,x)
            set x = x + 1
        endloop
        
        set I = I + 1
    endloop
    set TempItem = null    
    call SetTypeData(GetTotalUnitItemAttributeID(whichunit,2),2,a[0])
    call SetTypeData(GetTotalUnitItemAttributeID(whichunit,17),17,a[13])
    call SetTypeData(GetTotalUnitItemAttributeID(whichunit,18),18,a[14])
    call SetTypeData(GetTotalUnitItemAttributeID(whichunit,19),19,a[15])
    set i = 1
    loop
        exitwhen i > 12
        call SetTypeData(GetTotalUnitItemAttributeID(whichunit,(i+3)),(i+3),a[i])
        set i = i + 1
    endloop
    call SetTypeData(GetTotalUnitItemAttributeID(whichunit,21),21,b[0])   
    call SetTypeData(GetTotalUnitItemAttributeID(whichunit,36),36,b[13])
    call SetTypeData(GetTotalUnitItemAttributeID(whichunit,37),37,b[14])
    call SetTypeData(GetTotalUnitItemAttributeID(whichunit,38),38,b[15])
    set i = 1
    loop
        exitwhen i > 12
        call SetTypeData(GetTotalUnitItemAttributeID(whichunit,(i+22)),(i+22),b[i])
        set i = i + 1
    endloop  
    set i = 0
    loop
        exitwhen i > 4
        call SetTypeData(GetTotalUnitItemAttributeID(whichunit,(i+39)),(i+39),c[i])
        set i = i + 1
    endloop
    call SetTypeData(GetTotalUnitItemAttributeID(whichunit,(45)),(45),c[5])
    call SetTypeData(GetTotalUnitItemAttributeID(whichunit,(46)),(46),c[6])
    call SetTypeData(GetTotalUnitItemAttributeID(whichunit,(47)),(47),c[7])
    set i = 8
    loop
        exitwhen i > 13
        call SetTypeData(GetTotalUnitItemAttributeID(whichunit,(i+62)),(i+62),c[i])
        set i = i + 1
    endloop
endfunction

//============================================================================================================================================================
//===============================================单位属性计算处理=============================================================================================
//============================================================================================================================================================

function UnitPredicable takes unit whichunit returns nothing
    local real array a
    local real array b
    local real array c
    local real array d
    local integer unitid = GetHandleId(whichunit)
    local integer unittypeid = GetUnitTypeId(whichunit)
    call UnitItemPredicable(whichunit)
    set a[0] = GetTypeData(unittypeid,2) + GetTypeData(unitid,2) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,2),2) + GetTypeData(unitid,TypeKey(2))
    set a[1] = GetTypeData(unittypeid,4) + GetTypeData(unitid,4) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,4),4) + GetTypeData(unitid,TypeKey(4))
    set a[2] = GetTypeData(unittypeid,5) + GetTypeData(unitid,5) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,5),5) + GetTypeData(unitid,TypeKey(5))
    set a[3] = GetTypeData(unittypeid,6) + GetTypeData(unitid,6) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,6),6) + GetTypeData(unitid,TypeKey(6))
    set a[4] = GetTypeData(unittypeid,7) + GetTypeData(unitid,7) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,7),7) + GetTypeData(unitid,TypeKey(7)) + 1.0
    set a[5] = GetTypeData(unittypeid,8) + GetTypeData(unitid,8) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,8),8) + GetTypeData(unitid,TypeKey(8))
    set a[6] = GetTypeData(unittypeid,9) + GetTypeData(unitid,9) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,9),9) + GetTypeData(unitid,TypeKey(9))
    set a[7] = GetTypeData(unittypeid,10) + GetTypeData(unitid,10) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,10),10) + GetTypeData(unitid,TypeKey(10))
    set a[8] = GetTypeData(unittypeid,11) + GetTypeData(unitid,11) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,11),11) + GetTypeData(unitid,TypeKey(11))
    set a[9] = GetTypeData(unittypeid,12) + GetTypeData(unitid,12) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,12),12) + GetTypeData(unitid,TypeKey(12))
    set a[10] = GetTypeData(unittypeid,13) + GetTypeData(unitid,13) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,13),13)
    set a[11] = GetTypeData(unitid,14) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,14),14)
    set a[12] = GetTypeData(unitid,15) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,15),15)
    set a[13] = GetTypeData(unitid,17) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,17),17) + 1.0
    set a[14] = GetTypeData(unitid,18) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,18),18)
    set a[15] = GetTypeData(unitid,19) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,19),19)
    
    set b[0] = GetTypeData(unittypeid,21) + GetTypeData(unitid,21) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,21),21) + GetTypeData(unitid,TypeKey(21))
    set b[1] = GetTypeData(unittypeid,23) + GetTypeData(unitid,23) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,23),23) + GetTypeData(unitid,TypeKey(23))
    set b[2] = GetTypeData(unittypeid,24) + GetTypeData(unitid,24) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,24),24) + GetTypeData(unitid,TypeKey(24))
    set b[3] = GetTypeData(unittypeid,25) + GetTypeData(unitid,25) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,25),25) + GetTypeData(unitid,TypeKey(25))
    set b[4] = GetTypeData(unittypeid,26) + GetTypeData(unitid,26) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,26),26) + GetTypeData(unitid,TypeKey(26)) + 1.0
    set b[5] = GetTypeData(unittypeid,27) + GetTypeData(unitid,27) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,27),27) + GetTypeData(unitid,TypeKey(27))
    set b[6] = GetTypeData(unittypeid,28) + GetTypeData(unitid,28) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,28),28) + GetTypeData(unitid,TypeKey(28))
    set b[7] = GetTypeData(unittypeid,29) + GetTypeData(unitid,29) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,29),29) + GetTypeData(unitid,TypeKey(29))
    set b[8] = GetTypeData(unittypeid,30) + GetTypeData(unitid,30) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,30),30) + GetTypeData(unitid,TypeKey(30))
    set b[9] = GetTypeData(unittypeid,31) + GetTypeData(unitid,31) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,31),31) + GetTypeData(unitid,TypeKey(31))
    set b[10] = GetTypeData(unittypeid,32) + GetTypeData(unitid,32) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,32),32)
    set b[11] = GetTypeData(unitid,33) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,33),33)
    set b[12] = GetTypeData(unitid,34) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,34),34)
    set b[13] = GetTypeData(unitid,36) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,36),36) + 1.0
    set b[14] = GetTypeData(unitid,37) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,37),37)
    set b[15] = GetTypeData(unitid,38) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,38),38)
    
    set c[0] = GetTypeData(unittypeid,39) + GetTypeData(unitid,39) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,39),39)
    set c[1] = GetTypeData(unittypeid,40) + GetTypeData(unitid,40) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,40),40)
    set c[2] = GetTypeData(unittypeid,41) + GetTypeData(unitid,41) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,41),41) + 1.0
    set c[3] = GetTypeData(unitid,42) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,42),42) + 1.0
    set c[4] = GetTypeData(unitid,43) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,43),43)

    set d[0] = GetTypeData(unitid,45) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,45),45) + 1.0
    set d[1] = GetTypeData(unitid,46) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,46),46)
    set d[2] = GetTypeData(unitid,47) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,47),47)

    set d[3] = GetTypeData(unitid,70) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,70),70) + 1.0
    set d[4] = GetTypeData(unitid,71) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,71),71)
    set d[5] = GetTypeData(unitid,72) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,72),42)

    set d[6] = GetTypeData(unitid,73) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,73),73) + 1.0
    set d[7] = GetTypeData(unitid,74) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,74),74)
    set d[8] = GetTypeData(unitid,75) + GetTypeData(GetTotalUnitItemAttributeID(whichunit,75),75)

    set a[0] = PositiveRange(a[0])
    call SetTypeData(unitid,TypeKey0(2),a[0])
    call SetTypeData(unitid,TypeKey0(4),a[1])
    set a[2] = ProbabilityRange(a[2])
    call SetTypeData(unitid,TypeKey0(5),a[2])
    set a[3] = AbsoluteRange(a[3])
    call SetTypeData(unitid,TypeKey0(6),a[3])
    set a[4] = GreaterThanOneRange(a[4])
    call SetTypeData(unitid,TypeKey0(7),a[4]-1.0)
    set a[5] = PositiveRange(a[5])
    call SetTypeData(unitid,TypeKey0(8),a[5])
    set a[6] = ProbabilityRange(a[6])
    call SetTypeData(unitid,TypeKey0(9),a[6])
    set a[7] = AbsoluteRange(a[7])
    call SetTypeData(unitid,TypeKey0(10),a[7])
    set a[8] = ProbabilityRange(a[8])
    call SetTypeData(unitid,TypeKey0(11),a[8])
    set a[9] = ParryDamageReductionRange(a[9])
    call SetTypeData(unitid,TypeKey0(12),a[9])
    set a[10] = PositiveRange(a[10])
    call SetTypeData(unitid,TypeKey0(13),a[10])
    set a[11] = PositiveRange(a[11])
    call SetTypeData(unitid,TypeKey0(14),a[11])
    set a[12] = PositiveRange(a[12])
    call SetTypeData(unitid,TypeKey0(15),a[12])
    set a[13] = PositiveRange(a[13])
    call SetTypeData(unitid,TypeKey0(17),a[13]-1.0)
    set a[14] = ProbabilityRange(a[14])
    call SetTypeData(unitid,TypeKey0(18),a[14])
    call SetTypeData(unitid,TypeKey0(19),a[15])

    set b[0] = PositiveRange(b[0])
    call SetTypeData(unitid,TypeKey0(21),b[0])
    call SetTypeData(unitid,TypeKey0(23),b[1])
    set b[2] = ProbabilityRange(b[2])
    call SetTypeData(unitid,TypeKey0(24),b[2])
    set b[3] = AbsoluteRange(b[3])
    call SetTypeData(unitid,TypeKey0(25),b[3])
    set b[4] = GreaterThanOneRange(b[4])
    call SetTypeData(unitid,TypeKey0(26),b[4]-1.0)
    set b[5] = PositiveRange(b[5])
    call SetTypeData(unitid,TypeKey0(27),b[5])
    set b[6] = ProbabilityRange(b[6])
    call SetTypeData(unitid,TypeKey0(28),b[6])
    set b[7] = AbsoluteRange(b[7])
    call SetTypeData(unitid,TypeKey0(29),b[7])
    set b[8] = ProbabilityRange(b[8])
    call SetTypeData(unitid,TypeKey0(30),b[8])
    set b[9] = ParryDamageReductionRange(b[9])
    call SetTypeData(unitid,TypeKey0(31),b[9])
    set b[10] = PositiveRange(b[10])
    call SetTypeData(unitid,TypeKey0(32),b[10])
    set b[11] = PositiveRange(b[11])
    call SetTypeData(unitid,TypeKey0(33),b[11])
    set b[12] = PositiveRange(b[12])
    call SetTypeData(unitid,TypeKey0(34),b[12])
    set b[13] = PositiveRange(b[13])
    call SetTypeData(unitid,TypeKey0(36),b[13]-1.0)
    set b[14] = ProbabilityRange(b[14])
    call SetTypeData(unitid,TypeKey0(37),b[14])
    call SetTypeData(unitid,TypeKey0(38),b[15])
    
    set c[0] = PositiveRange(c[0])
    call SetTypeData(unitid,TypeKey0(39),c[0])
    set c[1] = ProbabilityRange(c[1])
    call SetTypeData(unitid,TypeKey0(40),c[1])
    set c[2] = GreaterThanOneRange(c[2])
    call SetTypeData(unitid,TypeKey0(41),c[2]-1.0)
    set c[3] = GreaterThanOneRange(c[3])
    call SetTypeData(unitid,TypeKey0(42),c[3]-1.0)
    set c[4] = ProbabilityRange(c[4])
    call SetTypeData(unitid,TypeKey0(43),c[4])

    set d[0] = PositiveRange(d[0])
    call SetTypeData(unitid,TypeKey0(45),d[0]-1.0)
    set d[1] = ProbabilityRange(d[1])
    call SetTypeData(unitid,TypeKey0(46),d[1])
    call SetTypeData(unitid,TypeKey0(47),d[2])

    set d[3] = PositiveRange(d[3])
    call SetTypeData(unitid,TypeKey0(70),d[3]-1.0)
    set d[4] = ProbabilityRange(d[4])
    call SetTypeData(unitid,TypeKey0(71),d[4])
    call SetTypeData(unitid,TypeKey0(72),d[5])
    
    set d[6] = PositiveRange(d[6])
    call SetTypeData(unitid,TypeKey0(73),d[6]-1.0)
    set d[7] = ProbabilityRange(d[7])
    call SetTypeData(unitid,TypeKey0(74),d[7])
    call SetTypeData(unitid,TypeKey0(75),d[8])    
endfunction

//============================================================================================================================================================
//=======================================伤害值计算和模拟主函数块=============================================================================================
//============================================================================================================================================================

function MimeticdDamageSystem takes unit DamageSource, unit DamagedUnit, real damage returns real
    local real UnitState = GetUnitState(DamagedUnit, UNIT_STATE_LIFE)
    local real RealDamage = 0.0
    local real Damage = 0.0
    if (UnitAlive(DamagedUnit) == true) then
	    set Damage = DamageDispose(DamagedUnit,damage)
	    if ( (UnitState - Damage) > 0.405 ) then
	        set RealDamage = Damage
	        call SetUnitState( DamagedUnit, UNIT_STATE_LIFE, (UnitState - Damage) )
	    elseif ( (UnitState - Damage) <= 0.405 ) then
	        call KillUnit(DamagedUnit)
	        call UnitKilledEventTriggerListExecute(DamageSource,DamagedUnit)
	        call HeroGetEXP(DamagedUnit,DamageSource)
	        set RealDamage = UnitState
	    endif
	    call ASDEventTriggerListExecute(DamageSource,DamagedUnit,RealDamage)
    endif
    return RealDamage
endfunction

function MimeticdDamage takes unit DamageSource, unit DamagedUnit, real damage returns nothing
    call MimeticdDamageSystem(DamageSource,DamagedUnit,damage)
endfunction

function CountMeleeDamageMain takes integer AttackTypeID, integer SkillID, unit DamageSource, unit DamagedUnit, real damage returns real	 
    local integer DefenseType = 0
    local real AttackValue = 0.0
    local real DefenseValue = 0.0
    local real penetrate = 0.0
    local real DefensePercentage = 0.0
    local real Coefficient = 0.0
    local real Thump = 0.0
    local real ThumpMultiple = 0.0
    local real parry = 0.0
    local real parryDamageReduction = 0.0
    local real Dodge = 0.0
    local integer SkillAttackType = 0
    local real SkillAttackValue = 0.0
    local real Skillpenetrate = 0.0
    local real SkillThump = 0.0
    local real SkillThumpMultiple = 0.0
    local real Skillhit = 0.0
    local real Damage = 0.0
    local real ReturnDamage = 0.0
    local boolean a = false
    local boolean b = false
    local boolean c = false
    call UnitPredicable(DamageSource)
    call UnitPredicable(DamagedUnit)    
    set DefenseType = GetType(GetHandleId(DamagedUnit),3)
    if (SkillID == 0) then
	    set SkillAttackType = 100
	    set SkillAttackValue = 0.0
	    set Skillpenetrate = 0.0
	    set SkillThump = 0.0
	    set SkillThumpMultiple = 0.0
	    set Skillhit = 0.0
	else
	    set SkillAttackType = GetType(SkillID,1)
	    if (SkillAttackType == 0) then
		    set SkillAttackType = 100
	    endif
	    set SkillAttackValue = GetTypeData(SkillID,2)
	    set Skillpenetrate = GetTypeData(SkillID,13)
	    set SkillThump = GetTypeData(SkillID,5)
	    set SkillThumpMultiple = GetTypeData(SkillID,7)
	    set Skillhit = GetTypeData(SkillID,10)
    endif
    set AttackValue = damage + GetTypeData(GetHandleId(DamageSource),TypeKey0(2)) + ( RANDOM_Factor * GetRandomReal(0.01,GetTypeData(GetHandleId(DamageSource),52)) ) + SkillAttackValue
    set AttackValue = PositiveRange(AttackValue)
//======范围修正======= 
    set AttackValue = (1.0 + PositiveRange(GetTypeData(GetHandleId(DamageSource),TypeKey0(17)))) * (1.0 - ProbabilityRange(GetTypeData(GetHandleId(DamageSource),TypeKey0(18)))) * AttackValue + GetTypeData(GetHandleId(DamageSource),TypeKey0(19))
//======物理伤害加深修正 =======================================     
    set penetrate = GetTypeData(GetHandleId(DamageSource),TypeKey0(13)) + Skillpenetrate
//======破甲 ===== 
    set penetrate = PositiveRange(penetrate)
//======范围修正=======     
    set DefenseValue = GetTypeData(GetHandleId(DamagedUnit),TypeKey0(4)) - penetrate
//======防御修正=======
    if ( DefenseValue >= 0 ) then
        set DefensePercentage = ( DefenseValue * 0.06 ) / ( 1.0 + ( DefenseValue * 0.06 ) )
    elseif ( DefenseValue < 0 ) then
        set DefensePercentage = 2.0 - Pow(0.94,DefenseValue)
    endif
//======防御减伤百分比=============================================================================================================================
    if (SkillID == 0) then
        set Coefficient = GetTypeData(AttackTypeID,DefenseType)
    else
        set Coefficient = GetTypeData(SkillAttackType,DefenseType)
    endif
//======攻防关系系数======
    set Damage = Coefficient * ( AttackValue * ( 1.0 - DefensePercentage ) )
    set Thump = GetTypeData(GetHandleId(DamageSource),TypeKey0(5)) + SkillThump - GetTypeData(GetHandleId(DamagedUnit),TypeKey0(6))
//======暴击率 ===========
    set Thump = ProbabilityRange(Thump)
//======范围修正=======
    set ThumpMultiple = 1.0 + GetTypeData(GetHandleId(DamageSource),TypeKey0(7)) + SkillThumpMultiple - GetTypeData(GetHandleId(DamagedUnit),TypeKey0(8))
//======暴击加成 ======
    set ThumpMultiple = GreaterThanOneRange(ThumpMultiple)
//======范围修正=======  
    set Dodge = GetTypeData(GetHandleId(DamagedUnit),TypeKey0(9)) - (GetTypeData(GetHandleId(DamageSource),TypeKey0(10)) + Skillhit)
//======闪避修正=======
    set Dodge = ProbabilityRange(Dodge)
//======范围修正=======     
    set parry = GetTypeData(GetHandleId(DamagedUnit),TypeKey0(11))
//======格挡===========        
    set parry = ProbabilityRange(parry)
//======范围修正=======     
    set parryDamageReduction = GetTypeData(GetHandleId(DamagedUnit),TypeKey0(12))
//======格挡减伤=======
    set parryDamageReduction = ParryDamageReductionRange(parryDamageReduction)
//======范围修正=======     
    set a = Probability(parry*100.0)
    set b = Probability(Thump*100.0)
    set c = Probability(Dodge*100.0)
    if ( a == false ) then
        if ( b == false ) then
	        if ( c == false ) then
		        set ReturnDamage = Damage
                call SetTypeBoolean(GetHandleId(DamagedUnit),48,false)           //是否暴击
                call SetTypeBoolean(GetHandleId(DamagedUnit),49,false)           //是否闪避
                call SetTypeBoolean(GetHandleId(DamagedUnit),50,false)           //是否格挡
	        elseif ( c == true ) then
	            set ReturnDamage = 0.0
                call SetTypeBoolean(GetHandleId(DamagedUnit),48,false)
                call SetTypeBoolean(GetHandleId(DamagedUnit),49,true)
                call SetTypeBoolean(GetHandleId(DamagedUnit),50,false)
            endif
	    elseif ( b == true ) then
	        set ReturnDamage = ThumpMultiple * Damage
            call SetTypeBoolean(GetHandleId(DamagedUnit),48,true)
            call SetTypeBoolean(GetHandleId(DamagedUnit),49,false)
            call SetTypeBoolean(GetHandleId(DamagedUnit),50,false)
        endif
    elseif ( a == true ) then
        set ReturnDamage = parryDamageReduction * Damage
        call SetTypeBoolean(GetHandleId(DamagedUnit),48,false)
        call SetTypeBoolean(GetHandleId(DamagedUnit),49,false)
        call SetTypeBoolean(GetHandleId(DamagedUnit),50,true)   
    endif
    call SetTypeData(GetHandleId(DamagedUnit),53,ReturnDamage)
    return ReturnDamage
endfunction

function MeleeDamageMain takes integer AttackTypeID, integer SkillID, unit DamageSource, unit DamagedUnit, real damage returns nothing
    local real Damage = 0.0
    local real ActualDamage = 0.0
    local real Hemophagia = 0.0
    local real SkillHemophagia = 0.0
    local real ReboundDamage = 0.0
    local real AbsorbDamage = 0.0
    local real AbsorbDamageAll = 0.0
    local real ReboundDamageTemp = 0.0
    if (SkillID == 0) then
	    set SkillHemophagia = 0.0
	else
	    set SkillHemophagia = GetTypeData(SkillID,14)
    endif
    set Damage = MeleeDamageDispose(DamagedUnit,CountMeleeDamageMain(AttackTypeID,SkillID,DamageSource,DamagedUnit,damage))
    set Hemophagia = GetTypeData(GetHandleId(DamageSource),TypeKey0(14)) + SkillHemophagia
//======吸血率======
    set Hemophagia = PositiveRange(Hemophagia)
//======范围修正=======      
    set ReboundDamage = GetTypeData(GetHandleId(DamagedUnit),TypeKey0(15))
//======反伤率======
    set ReboundDamage = PositiveRange(ReboundDamage)
//======范围修正=======      
    set AbsorbDamage = GetTypeData(GetHandleId(DamagedUnit),16)
//======物理伤害吸收======
    set AbsorbDamage = PositiveRange(AbsorbDamage)
//======范围修正=======      
    set AbsorbDamageAll = GetTypeData(GetHandleId(DamagedUnit),44)
//======全伤害吸收======
    set AbsorbDamageAll = PositiveRange(AbsorbDamageAll)
//======范围修正======= 
    if (UnitImmuneConditions(DamagedUnit,AttackTypeID) == false) then                                                                                  //是否免疫某类型物理伤害
        if (AbsorbDamageAll > 0.0) then
	        if (AbsorbDamageAll >= Damage) and (AbsorbDamageAll > 0.0) and (Damage >= 0.0) then
		        set ActualDamage = 0.0
		        if (DisplayDamageBool == true) and (Damage != 0.0) then
			        call DisplayDamage(DamagedUnit,"吸收",20.0,size[8],rgb_R[8],rgb_G[8],rgb_B[8],rgb_A[8])
		        endif
	            call SetTypeData(GetHandleId(DamagedUnit),44,(AbsorbDamageAll - Damage))
	        elseif (AbsorbDamageAll < Damage) and (AbsorbDamageAll >= 0.0) and (Damage > 0.0) then
	            set ActualDamage = Damage - AbsorbDamageAll
	            call MimeticdMeleeEventTriggerListExecute(DamageSource,DamagedUnit,MimeticdDamageSystem(DamageSource,DamagedUnit,ActualDamage))         //造成伤害                                    
                call SetTypeData(GetHandleId(DamagedUnit),44,0.0)    
            endif
        elseif (AbsorbDamageAll == 0.0) then
            if (AbsorbDamage >= 0.0) then
	            if (AbsorbDamage >= Damage) and (AbsorbDamage > 0.0) and (Damage >= 0.0) then
		            set ActualDamage = 0.0
			        if (DisplayDamageBool == true) and (Damage != 0.0) then
				        call DisplayDamage(DamagedUnit,"吸收",20.0,size[8],rgb_R[8],rgb_G[8],rgb_B[8],rgb_A[8])
			        endif
	                call SetTypeData(GetHandleId(DamagedUnit),16,(AbsorbDamage - Damage))
	            elseif (AbsorbDamage < Damage) and (AbsorbDamage >= 0.0) and (Damage > 0.0) then
	                set ActualDamage = Damage - AbsorbDamage
                    call MimeticdMeleeEventTriggerListExecute(DamageSource,DamagedUnit,MimeticdDamageSystem(DamageSource,DamagedUnit,ActualDamage))         //造成伤害     
                    call SetTypeData(GetHandleId(DamagedUnit),16,0.0)
                endif    
            endif
        endif      
        if (Hemophagia != 0.0) and (UnitHemophagiaConditions(DamageSource,AttackTypeID) == true) and ( UnitTypeConditions_A(DamagedUnit) == false ) then   //某类型物理伤害是否吸血，建筑，机械单位不能被吸血
            call SetUnitState( DamageSource, UNIT_STATE_LIFE, (GetUnitState(DamageSource, UNIT_STATE_LIFE) + Hemophagia * ActualDamage) )
            if (DisplayDamageBool == true) then
                call DisplayDamage(DamageSource,I2S(R2I(Hemophagia * ActualDamage)),20.0,size[5],rgb_R[5],rgb_G[5],rgb_B[5],rgb_A[5])
            endif            
        endif
        if (ReboundDamage != 0.0) and (UnitReboundConditions(DamagedUnit,AttackTypeID) == true) and (UnitAlive(DamageSource) == true) then                   //是否反弹某类型物理伤害
            set ReboundDamageTemp = MimeticdDamageSystem(DamagedUnit,DamageSource,ReboundDamage * ActualDamage)                                              //造成伤害
            call ReboundDamageEventTriggerListExecute(DamagedUnit,DamageSource,ReboundDamageTemp)                                            //触发受到反弹伤害事件
            if (DisplayDamageBool == true) then
                call DisplayDamage(DamageSource,I2S(R2I(ReboundDamageTemp)),20.0,size[6],rgb_R[6],rgb_G[6],rgb_B[6],rgb_A[6])
            endif
        endif
    else
        if (DisplayDamageBool == true) then
	        call DisplayDamage(DamagedUnit,"免疫",20.0,size[9],rgb_R[9],rgb_G[9],rgb_B[9],rgb_A[9])
        endif    
    endif
endfunction

function CountMagicDamageMain takes integer MagicAttackTypeID, integer SkillID, unit DamageSource, unit DamagedUnit, real damage returns real	
    local integer MagicDefenseType = 0
    local real MagicAttackValue = 0.0
    local real MagicDefenseValue = 0.0
    local real Magicpenetrate = 0.0
    local real MagicDefensePercentage = 0.0
    local real Coefficient = 0.0
    local real MagicThump = 0.0
    local real MagicThumpMultiple = 0.0
    local real Magicparry = 0.0
    local real MagicparryDamageReduction = 0.0
    local real MagicDodge = 0.0
    local integer SkillMagicAttackType = 0
    local real SkillMagicAttackValue = 0.0
    local real SkillMagicpenetrate = 0.0
    local real SkillMagicThump = 0.0
    local real SkillMagicThumpMultiple = 0.0
    local real SkillMagichit = 0.0
    local real Damage = 0.0
    local real ReturnDamage = 0.0
    local boolean a = false
    local boolean b = false
    local boolean c = false
    call UnitPredicable(DamageSource)
    call UnitPredicable(DamagedUnit)    
    set MagicDefenseType = GetType(GetHandleId(DamagedUnit),22)
    if (SkillID == 0) then
	    set SkillMagicAttackType = 300
	    set SkillMagicAttackValue = 0.0
	    set SkillMagicpenetrate = 0.0
	    set SkillMagicThump = 0.0
	    set SkillMagicThumpMultiple = 0.0
	    set SkillMagichit = 0.0
	else
	    set SkillMagicAttackType = GetType(SkillID,20)
	    if (SkillMagicAttackType == 0) then
		    set SkillMagicAttackType = 300
	    endif
	    set SkillMagicAttackValue = GetTypeData(SkillID,21)
	    set SkillMagicpenetrate = GetTypeData(SkillID,32)
	    set SkillMagicThump = GetTypeData(SkillID,24)
	    set SkillMagicThumpMultiple = GetTypeData(SkillID,26)
	    set SkillMagichit = GetTypeData(SkillID,29)
    endif
    set MagicAttackValue = damage + GetTypeData(GetHandleId(DamageSource),TypeKey0(21)) + SkillMagicAttackValue
    set MagicAttackValue = PositiveRange(MagicAttackValue)
//======范围修正======= 
    set MagicAttackValue = (1.0 + PositiveRange(GetTypeData(GetHandleId(DamageSource),TypeKey0(36)))) * (1.0 - ProbabilityRange(GetTypeData(GetHandleId(DamageSource),TypeKey0(37)))) * MagicAttackValue + GetTypeData(GetHandleId(DamageSource),TypeKey0(38))
//======法术伤害加深修正 =======================================      
    set Magicpenetrate = GetTypeData(GetHandleId(DamageSource),TypeKey0(32)) + SkillMagicpenetrate
//======魔法破甲 ========== 
    set Magicpenetrate = PositiveRange(Magicpenetrate)
//======范围修正=======     
    set MagicDefenseValue = GetTypeData(GetHandleId(DamagedUnit),TypeKey0(23)) - Magicpenetrate
//======魔法防御修正======
    if ( MagicDefenseValue >= 0 ) then
        set MagicDefensePercentage = ( MagicDefenseValue * 0.06 ) / ( 1.0 + ( MagicDefenseValue * 0.06 ) )
    elseif ( MagicDefenseValue < 0 ) then
        set MagicDefensePercentage = 2.0 - Pow(0.94,MagicDefenseValue)
    endif
//======魔法防御减伤百分比===========================================================================================================
    if (SkillID == 0) then
        set Coefficient = GetTypeData(MagicAttackTypeID,MagicDefenseType)
    else
        set Coefficient = GetTypeData(SkillMagicAttackType,MagicDefenseType)
    endif
//======攻防关系系数======
    set Damage = Coefficient * ( MagicAttackValue * ( 1.0 - MagicDefensePercentage ) )
    set MagicThump = GetTypeData(GetHandleId(DamageSource),TypeKey0(24)) + SkillMagicThump - GetTypeData(GetHandleId(DamagedUnit),TypeKey0(25))
//======魔法暴击率 =======
    set MagicThump = ProbabilityRange(MagicThump)
//======范围修正=======
    set MagicThumpMultiple = 1.0 + GetTypeData(GetHandleId(DamageSource),TypeKey0(26)) + SkillMagicThumpMultiple - GetTypeData(GetHandleId(DamagedUnit),TypeKey0(27))
//======魔法暴击加成 ========
    set MagicThumpMultiple = GreaterThanOneRange(MagicThumpMultiple)
//======范围修正=======  
    set MagicDodge = GetTypeData(GetHandleId(DamagedUnit),TypeKey0(28)) - (GetTypeData(GetHandleId(DamageSource),TypeKey0(29)) + SkillMagichit)
//======魔法闪避修正======
    set MagicDodge = ProbabilityRange(MagicDodge)
//======范围修正=======     
    set Magicparry = GetTypeData(GetHandleId(DamagedUnit),TypeKey0(30))
//======魔法格挡======
    set Magicparry = ProbabilityRange(Magicparry)
//======范围修正=======     
    set MagicparryDamageReduction = GetTypeData(GetHandleId(DamagedUnit),TypeKey0(31))
//======魔法格挡减伤======
    set MagicparryDamageReduction = ParryDamageReductionRange(MagicparryDamageReduction)
//======范围修正=======     
    set a = Probability(Magicparry*100.0)
    set b = Probability(MagicThump*100.0)
    set c = Probability(MagicDodge*100.0)
    if ( a == false ) then
        if ( b == false ) then
	        if ( c == false ) then
		        set ReturnDamage = Damage
                call SetTypeBoolean(GetHandleId(DamagedUnit),48,false)           //是否暴击
                call SetTypeBoolean(GetHandleId(DamagedUnit),49,false)           //是否闪避
                call SetTypeBoolean(GetHandleId(DamagedUnit),50,false)           //是否格挡
	        elseif ( c == true ) then
	            set ReturnDamage = 0.0
                call SetTypeBoolean(GetHandleId(DamagedUnit),48,false)
                call SetTypeBoolean(GetHandleId(DamagedUnit),49,true)
                call SetTypeBoolean(GetHandleId(DamagedUnit),50,false)	            
            endif
	    elseif ( b == true ) then
	        set ReturnDamage = MagicThumpMultiple * Damage
            call SetTypeBoolean(GetHandleId(DamagedUnit),48,true)
            call SetTypeBoolean(GetHandleId(DamagedUnit),49,false)
            call SetTypeBoolean(GetHandleId(DamagedUnit),50,false)	        
        endif
    elseif ( a == true ) then
        set ReturnDamage = MagicparryDamageReduction * Damage
        call SetTypeBoolean(GetHandleId(DamagedUnit),48,false)
        call SetTypeBoolean(GetHandleId(DamagedUnit),49,false)
        call SetTypeBoolean(GetHandleId(DamagedUnit),50,true)        
    endif
    call SetTypeData(GetHandleId(DamagedUnit),53,ReturnDamage)                             //伤害前的伤害，且在造成吸血，反伤，吸收伤害之前，没有计算伤害加成。
    return ReturnDamage
endfunction

function MagicDamageMain takes integer MagicAttackTypeID, integer SkillID, unit DamageSource, unit DamagedUnit, real damage returns nothing
    local real Damage = 0.0
    local real ActualDamage = 0.0
    local real MagicHemophagia = 0.0
    local real SkillMagicHemophagia = 0.0
    local real MagicReboundDamage = 0.0
    local real MagicAbsorbDamage = 0.0
    local real MagicAbsorbDamageAll = 0.0
    local real MagicReboundDamageTemp = 0.0
    if (SkillID == 0) then
	    set SkillMagicHemophagia = 0.0
	else
	    set SkillMagicHemophagia = GetTypeData(SkillID,33)
    endif    
    set Damage = MagicDamageDispose(DamagedUnit,CountMagicDamageMain(MagicAttackTypeID,SkillID,DamageSource,DamagedUnit,damage))
    set MagicHemophagia = GetTypeData(GetHandleId(DamageSource),TypeKey0(33)) + SkillMagicHemophagia
//======魔法吸血率======
    set MagicHemophagia = PositiveRange(MagicHemophagia)
//======范围修正=======      
    set MagicReboundDamage = GetTypeData(GetHandleId(DamagedUnit),TypeKey0(34))
//======魔法反伤率======
    set MagicReboundDamage = PositiveRange(MagicReboundDamage)
//======范围修正=======      
    set MagicAbsorbDamage = GetTypeData(GetHandleId(DamagedUnit),35)
//======魔法伤害吸收======
    set MagicAbsorbDamage = PositiveRange(MagicAbsorbDamage)
//======范围修正=======
    set MagicAbsorbDamageAll = GetTypeData(GetHandleId(DamagedUnit),44)
//======全伤害吸收=======                    
    set MagicAbsorbDamageAll = PositiveRange(MagicAbsorbDamageAll)
//======范围修正=======       
    if (UnitImmuneConditions(DamagedUnit,MagicAttackTypeID) == false) then                                                                              //是否免疫某类型魔法伤害
        if (MagicAbsorbDamageAll > 0.0) then
	        if (MagicAbsorbDamageAll >= Damage) and (MagicAbsorbDamageAll > 0.0) and (Damage >= 0.0) then
		        set ActualDamage = 0.0
		        if (DisplayDamageBool == true) and (Damage != 0.0) then
			        call DisplayDamage(DamagedUnit,"吸收",20.0,size[8],rgb_R[8],rgb_G[8],rgb_B[8],rgb_A[8])
		        endif
	            call SetTypeData(GetHandleId(DamagedUnit),44,(MagicAbsorbDamageAll - Damage))
	        elseif (MagicAbsorbDamageAll < Damage) and (MagicAbsorbDamageAll >= 0.0) and (Damage > 0.0)then
	            set ActualDamage = Damage - MagicAbsorbDamageAll
	            call MimeticdMagicEventTriggerListExecute(DamageSource,DamagedUnit,MimeticdDamageSystem(DamageSource,DamagedUnit,ActualDamage))         //造成伤害         
                call SetTypeData(GetHandleId(DamagedUnit),44,0.0)    
            endif
        elseif (MagicAbsorbDamageAll == 0.0) then
            if (MagicAbsorbDamage >= 0.0) then
	            if (MagicAbsorbDamage >= Damage) and (MagicAbsorbDamage > 0.0) and (Damage >= 0.0) then
		            set ActualDamage = 0.0
			        if (DisplayDamageBool == true) and (Damage != 0.0) then
				        call DisplayDamage(DamagedUnit,"吸收",20.0,size[8],rgb_R[8],rgb_G[8],rgb_B[8],rgb_A[8])
			        endif
	                call SetTypeData(GetHandleId(DamagedUnit),35,(MagicAbsorbDamage - Damage))
	            elseif (MagicAbsorbDamage < Damage) and (MagicAbsorbDamage >= 0.0) and (Damage > 0.0) then
	                set ActualDamage = Damage - MagicAbsorbDamage
	                call MimeticdMagicEventTriggerListExecute(DamageSource,DamagedUnit,MimeticdDamageSystem(DamageSource,DamagedUnit,ActualDamage))         //造成伤害         
                    call SetTypeData(GetHandleId(DamagedUnit),35,0.0)
                endif    
            endif
        endif    
        if (MagicHemophagia != 0.0) and (UnitMagicHemophagiaConditions(DamageSource,MagicAttackTypeID) == true) and ( UnitTypeConditions_A(DamagedUnit) == false ) then   //某类型法术伤害是否吸血，建筑，机械单位不能被吸血
            call SetUnitState( DamageSource, UNIT_STATE_LIFE, (GetUnitState(DamageSource, UNIT_STATE_LIFE) + MagicHemophagia * ActualDamage) )
            if (DisplayDamageBool == true) then
                call DisplayDamage(DamageSource,I2S(R2I(MagicHemophagia * ActualDamage)),20.0,size[5],rgb_R[5],rgb_G[5],rgb_B[5],rgb_A[5])
            endif            
        endif
        if (MagicReboundDamage != 0.0) and (UnitMagicReboundConditions(DamagedUnit,MagicAttackTypeID) == true) and (UnitAlive(DamageSource) == true) then                  //是否反弹某类型魔法伤害
            set MagicReboundDamageTemp = MimeticdDamageSystem(DamagedUnit,DamageSource,MagicReboundDamage * ActualDamage)                                                  //造成伤害        
            call ReboundDamageEventTriggerListExecute(DamagedUnit,DamageSource,MagicReboundDamageTemp)                                       //触发受到反弹伤害事件
            if (DisplayDamageBool == true) then
                call DisplayDamage(DamageSource,I2S(R2I(MagicReboundDamageTemp)),20.0,size[6],rgb_R[6],rgb_G[6],rgb_B[6],rgb_A[6])
            endif
        endif
    else
        if (DisplayDamageBool == true) then
	        call DisplayDamage(DamagedUnit,"免疫",20.0,size[9],rgb_R[9],rgb_G[9],rgb_B[9],rgb_A[9])
        endif    
    endif     
endfunction

function MimeticdMeleeDamage takes integer AttackTypeID, integer SkillID, unit DamageSource, unit DamagedUnit, real damage returns nothing
    if (UnitAlive(DamagedUnit) == true) then
		call MeleeDamageMain(AttackTypeID,SkillID,DamageSource,DamagedUnit,damage)
    endif
endfunction	

function MimeticdMagicDamage takes integer MagicAttackTypeID, integer SkillID, unit DamageSource, unit DamagedUnit, real damage returns nothing
    if (UnitAlive(DamagedUnit) == true) then
	    call MagicDamageMain(MagicAttackTypeID,SkillID,DamageSource,DamagedUnit,damage)
    endif
endfunction	

function AOECondition takes unit unitA, unit unitB returns boolean
	local boolean b = false
	if (AOEBool == false) then
		set b = IsUnitEnemy(unitA, GetOwningPlayer(unitB))
	elseif (AOEBool == true) then
	    set b = true
	endif
	return b
endfunction

function MimeticdMeleeAOEDamage takes integer AttackTypeID, integer SkillID, unit DamageSource, real x, real y, real Range, real damage returns nothing
    local group Tempgroup
    local unit Tempunit
    set Tempgroup = CreateGroup()
    call GroupEnumUnitsInRange(Tempgroup, x, y, Range, null)
    loop
        set Tempunit = FirstOfGroup(Tempgroup)
        exitwhen Tempunit == null
        call GroupRemoveUnit(Tempgroup, Tempunit)
        if ((AOECondition(Tempunit,DamageSource) == true)) then
            call MimeticdMeleeDamage(AttackTypeID,SkillID,DamageSource,Tempunit,damage)
        endif
    endloop
    call DestroyGroup(Tempgroup)
    set Tempgroup = null
    set Tempunit = null
endfunction

function MimeticdMagicAOEDamage takes integer AttackTypeID, integer SkillID, unit DamageSource, real x, real y, real Range, real damage returns nothing
    local group Tempgroup
    local unit Tempunit
    set Tempgroup = CreateGroup()
    call GroupEnumUnitsInRange(Tempgroup, x, y, Range, null)
    loop
        set Tempunit = FirstOfGroup(Tempgroup)
        exitwhen Tempunit == null
        call GroupRemoveUnit(Tempgroup, Tempunit)
        if ((AOECondition(Tempunit,DamageSource) == true)) then
            call MimeticdMagicDamage(AttackTypeID,SkillID,DamageSource,Tempunit,damage)
        endif
    endloop
    call DestroyGroup(Tempgroup)
    set Tempgroup = null
    set Tempunit = null
endfunction

function MimeticdMeleeAOEDamageSystem takes integer AttackTypeID, integer SkillID, unit DamageSource, unit DamagedUnit, real Range, real damage returns nothing
    local group Tempgroup
    local unit Tempunit
    local real coefficient = GetTypeData(GetHandleId(DamageSource),57)
    if (coefficient >= 1.0) then
	    set coefficient = 1.0
	elseif (coefficient <= 0.1) then
	    set coefficient = 0.1
    endif
    set Tempgroup = CreateGroup()
    call GroupEnumUnitsInRange(Tempgroup, GetUnitX(DamagedUnit), GetUnitY(DamagedUnit), Range, null)
    loop
        set Tempunit = FirstOfGroup(Tempgroup)
        exitwhen Tempunit == null
        call GroupRemoveUnit(Tempgroup, Tempunit)
        if ((AOECondition(Tempunit,DamageSource) == true)) then
	        if (Tempunit != DamagedUnit) then
                call MimeticdMeleeDamage(AttackTypeID,SkillID,DamageSource,Tempunit,damage * coefficient)
		    elseif (Tempunit == DamagedUnit) then
                call MimeticdMeleeDamage(AttackTypeID,SkillID,DamageSource,Tempunit,damage)
	        endif
        endif
    endloop
    call DestroyGroup(Tempgroup)
    set Tempgroup = null
    set Tempunit = null
endfunction

function MimeticdMagicAOEDamageSystem takes integer AttackTypeID, integer SkillID, unit DamageSource, unit DamagedUnit, real Range, real damage returns nothing
    local group Tempgroup
    local unit Tempunit
    local real coefficient = GetTypeData(GetHandleId(DamageSource),57)
    if (coefficient >= 1.0) then
	    set coefficient = 1.0
	elseif (coefficient <= 0.1) then
	    set coefficient = 0.1
    endif
    set Tempgroup = CreateGroup()
    call GroupEnumUnitsInRange(Tempgroup, GetUnitX(DamagedUnit), GetUnitY(DamagedUnit), Range, null)
    loop
        set Tempunit = FirstOfGroup(Tempgroup)
        exitwhen Tempunit == null
        call GroupRemoveUnit(Tempgroup, Tempunit)
        if ((AOECondition(Tempunit,DamageSource) == true)) then
	        if (Tempunit != DamagedUnit) then
                call MimeticdMagicDamage(AttackTypeID,SkillID,DamageSource,Tempunit,damage * coefficient)
		    elseif (Tempunit == DamagedUnit) then
                call MimeticdMagicDamage(AttackTypeID,SkillID,DamageSource,Tempunit,damage)
	        endif
        endif
    endloop
    call DestroyGroup(Tempgroup)
    set Tempgroup = null
    set Tempunit = null
endfunction

function MimeticdMeleeDamageDefault takes unit DamageSource, unit DamagedUnit, real damage returns nothing
	local integer SpellAbilityID = LoadInteger(DSHT,GetHandleId(DamageSource),StringHash("SpellAbility"))
    if (GetTypeData(GetUnitTypeId(DamageSource),56) <= MinRange) and (GetTypeData(GetHandleId(DamageSource),56) <= MinRange) then
        call MimeticdMeleeDamage(GetType(GetHandleId(DamageSource),1),SpellAbilityID,DamageSource,DamagedUnit,damage)
    elseif (GetTypeData(GetUnitTypeId(DamageSource),56) >= MinRange) and (GetTypeData(GetUnitTypeId(DamageSource),56) >= GetTypeData(GetHandleId(DamageSource),56)) then
        call MimeticdMeleeAOEDamageSystem(GetType(GetHandleId(DamageSource),1),SpellAbilityID,DamageSource,DamagedUnit,GetTypeData(GetUnitTypeId(DamageSource),56),damage)
	elseif (GetTypeData(GetHandleId(DamageSource),56) >= MinRange) and (GetTypeData(GetUnitTypeId(DamageSource),56) < GetTypeData(GetHandleId(DamageSource),56)) then
        call MimeticdMeleeAOEDamageSystem(GetType(GetHandleId(DamageSource),1),SpellAbilityID,DamageSource,DamagedUnit,GetTypeData(GetHandleId(DamageSource),56),damage)
    endif
endfunction	

function MimeticdMagicDamageDefault takes unit DamageSource, unit DamagedUnit, real damage returns nothing
	local integer SpellAbilityID = LoadInteger(DSHT,GetHandleId(DamageSource),StringHash("SpellAbility"))
    if (GetTypeData(GetUnitTypeId(DamageSource),56) <= MinRange) and (GetTypeData(GetHandleId(DamageSource),56) <= MinRange) then
        call MimeticdMagicDamage(GetType(GetHandleId(DamageSource),20),SpellAbilityID,DamageSource,DamagedUnit,damage)
    elseif (GetTypeData(GetUnitTypeId(DamageSource),56) >= MinRange) and (GetTypeData(GetUnitTypeId(DamageSource),56) >= GetTypeData(GetHandleId(DamageSource),56)) then
        call MimeticdMagicAOEDamageSystem(GetType(GetHandleId(DamageSource),20),SpellAbilityID,DamageSource,DamagedUnit,GetTypeData(GetUnitTypeId(DamageSource),56),damage)
	elseif (GetTypeData(GetHandleId(DamageSource),56) >= MinRange) and (GetTypeData(GetUnitTypeId(DamageSource),56) < GetTypeData(GetHandleId(DamageSource),56)) then
        call MimeticdMagicAOEDamageSystem(GetType(GetHandleId(DamageSource),20),SpellAbilityID,DamageSource,DamagedUnit,GetTypeData(GetHandleId(DamageSource),56),damage)
    endif
endfunction

function MimeticdMeleeDamage_over_time_Func takes nothing returns nothing
	local integer key = GetHandleId(GetExpiredTimer())
	local real intervaltime = LoadReal(DATA,key,StringHash("intervaltime"))
	local real timeout = LoadReal(DATA,key,StringHash("timeout"))
    local real time = 0.0
    local integer AttackTypeID = LoadInteger(DATA,key,StringHash("AttackTypeID"))
    local integer SkillID = LoadInteger(DATA,key,StringHash("SkillID"))
    local real damage = LoadReal(DATA,key,StringHash("damage"))
	call SaveReal(DATA,key,StringHash("time"),LoadReal(DATA,key,StringHash("time")) + 1.0 * (intervaltime))
	set timeout = LoadReal(DATA,key,StringHash("timeout"))
	set time = LoadReal(DATA,key,StringHash("time"))
	if ((time - timeout) < 0.0) then
		call MimeticdMeleeDamage(AttackTypeID,SkillID,LoadUnitHandle(DATA,key,StringHash("DamageSource")),LoadUnitHandle(DATA,key,StringHash("DamagedUnit")),damage)
    elseif ((time - timeout) >= 0.0) then
        call PauseTimer(GetExpiredTimer())
        call FlushChildHashtable(DATA,key)
        call DestroyTimer(GetExpiredTimer())
	endif
endfunction

function MimeticdMeleeDamage_over_time_system takes timer tm, real intervaltime, real timeout, integer AttackTypeID, integer SkillID, unit DamageSource, unit DamagedUnit, real damage returns nothing
    call SaveReal(DATA,GetHandleId(tm),StringHash("intervaltime"),intervaltime)
    call SaveReal(DATA,GetHandleId(tm),StringHash("timeout"),timeout+0.01)
	call SaveInteger(DATA,GetHandleId(tm),StringHash("AttackTypeID"),AttackTypeID)
    call SaveInteger(DATA,GetHandleId(tm),StringHash("SkillID"),SkillID)
    call SaveUnitHandle(DATA,GetHandleId(tm),StringHash("DamageSource"),DamageSource)
    call SaveUnitHandle(DATA,GetHandleId(tm),StringHash("DamagedUnit"),DamagedUnit)
    call SaveReal(DATA,GetHandleId(tm),StringHash("damage"),damage)
    call SaveReal(DATA,GetHandleId(tm),StringHash("time"),0.0)
	call TimerStart(tm,intervaltime,true, function MimeticdMeleeDamage_over_time_Func)
endfunction

function MimeticdMeleeDamage_over_time takes real intervaltime, real timeout, integer AttackTypeID, integer SkillID, unit DamageSource, unit DamagedUnit, real damage returns nothing
	local timer tm = CreateTimer()
    call MimeticdMeleeDamage_over_time_system(tm,intervaltime,timeout,AttackTypeID,SkillID,DamageSource,DamagedUnit,damage)
	set tm = null
endfunction

function MimeticdMagicDamage_over_time_Func takes nothing returns nothing
	local integer key = GetHandleId(GetExpiredTimer())
	local real intervaltime = LoadReal(DATA,key,StringHash("intervaltime"))
	local real timeout = LoadReal(DATA,key,StringHash("timeout"))
    local real time = 0.0
    local integer AttackTypeID = LoadInteger(DATA,key,StringHash("AttackTypeID"))
    local integer SkillID = LoadInteger(DATA,key,StringHash("SkillID"))
    local real damage = LoadReal(DATA,key,StringHash("damage"))
	call SaveReal(DATA,key,StringHash("time"),LoadReal(DATA,key,StringHash("time")) + 1.0 * (intervaltime))
	set timeout = LoadReal(DATA,key,StringHash("timeout"))
	set time = LoadReal(DATA,key,StringHash("time"))
	if ((time - timeout) < 0.0) then
		call MimeticdMagicDamage(AttackTypeID,SkillID,LoadUnitHandle(DATA,key,StringHash("DamageSource")),LoadUnitHandle(DATA,key,StringHash("DamagedUnit")),damage)
    elseif ((time - timeout) >= 0.0) then
        call PauseTimer(GetExpiredTimer())
        call FlushChildHashtable(DATA,key)
        call DestroyTimer(GetExpiredTimer())
	endif
endfunction

function MimeticdMagicDamage_over_time_system takes timer tm, real intervaltime, real timeout, integer AttackTypeID, integer SkillID, unit DamageSource, unit DamagedUnit, real damage returns nothing
    call SaveReal(DATA,GetHandleId(tm),StringHash("intervaltime"),intervaltime)
    call SaveReal(DATA,GetHandleId(tm),StringHash("timeout"),timeout+0.01)
	call SaveInteger(DATA,GetHandleId(tm),StringHash("AttackTypeID"),AttackTypeID)
    call SaveInteger(DATA,GetHandleId(tm),StringHash("SkillID"),SkillID)
    call SaveUnitHandle(DATA,GetHandleId(tm),StringHash("DamageSource"),DamageSource)
    call SaveUnitHandle(DATA,GetHandleId(tm),StringHash("DamagedUnit"),DamagedUnit)
    call SaveReal(DATA,GetHandleId(tm),StringHash("damage"),damage)
    call SaveReal(DATA,GetHandleId(tm),StringHash("time"),0.0)
	call TimerStart(tm,intervaltime,true, function MimeticdMagicDamage_over_time_Func)
endfunction

function MimeticdMagicDamage_over_time takes real intervaltime, real timeout, integer AttackTypeID, integer SkillID, unit DamageSource, unit DamagedUnit, real damage returns nothing
	local timer tm = CreateTimer()
    call MimeticdMagicDamage_over_time_system(tm,intervaltime,timeout,AttackTypeID,SkillID,DamageSource,DamagedUnit,damage)
	set tm = null
endfunction

function MimeticdMeleeAOEDamage_over_time_Func takes nothing returns nothing
	local integer key = GetHandleId(GetExpiredTimer())
	local real intervaltime = LoadReal(DATA,key,StringHash("intervaltime"))
	local real timeout = LoadReal(DATA,key,StringHash("timeout"))
    local real time = 0.0
    local integer AttackTypeID = LoadInteger(DATA,key,StringHash("AttackTypeID"))
    local integer SkillID = LoadInteger(DATA,key,StringHash("SkillID"))
    local real Range = LoadReal(DATA,key,StringHash("Range"))
    local real damage = LoadReal(DATA,key,StringHash("damage"))
    local real x = LoadReal(DATA,key,StringHash("X"))
    local real y = LoadReal(DATA,key,StringHash("Y"))
	call SaveReal(DATA,key,StringHash("time"),LoadReal(DATA,key,StringHash("time")) + 1.0 * (intervaltime))
	set timeout = LoadReal(DATA,key,StringHash("timeout"))
	set time = LoadReal(DATA,key,StringHash("time"))
	if ((time - timeout) < 0.0) then
		call MimeticdMeleeAOEDamage(AttackTypeID,SkillID,LoadUnitHandle(DATA,key,StringHash("DamageSource")),x,y,Range,damage)
    elseif ((time - timeout) >= 0.0) then
        call PauseTimer(GetExpiredTimer())
        call FlushChildHashtable(DATA,key)
        call DestroyTimer(GetExpiredTimer())
	endif
endfunction

function MimeticdMeleeAOEDamage_over_time_system takes timer tm, real intervaltime, real timeout, integer AttackTypeID, integer SkillID, unit DamageSource, real x, real y, real Range, real damage returns nothing
    call SaveReal(DATA,GetHandleId(tm),StringHash("intervaltime"),intervaltime)
    call SaveReal(DATA,GetHandleId(tm),StringHash("timeout"),timeout+0.01)
	call SaveInteger(DATA,GetHandleId(tm),StringHash("AttackTypeID"),AttackTypeID)
    call SaveInteger(DATA,GetHandleId(tm),StringHash("SkillID"),SkillID)
    call SaveUnitHandle(DATA,GetHandleId(tm),StringHash("DamageSource"),DamageSource)
    call SaveReal(DATA,GetHandleId(tm),StringHash("X"),x)
    call SaveReal(DATA,GetHandleId(tm),StringHash("Y"),y)
    call SaveReal(DATA,GetHandleId(tm),StringHash("Range"),Range)
    call SaveReal(DATA,GetHandleId(tm),StringHash("damage"),damage)
    call SaveReal(DATA,GetHandleId(tm),StringHash("time"),0.0)
	call TimerStart(tm,intervaltime,true, function MimeticdMeleeAOEDamage_over_time_Func)
endfunction

function MimeticdMeleeAOEDamage_over_time takes real intervaltime, real timeout, integer AttackTypeID, integer SkillID, unit DamageSource, real x, real y, real Range, real damage returns nothing
	local timer tm = CreateTimer()
    call MimeticdMeleeAOEDamage_over_time_system(tm,intervaltime,timeout,AttackTypeID,SkillID,DamageSource,x,y,Range,damage)
	set tm = null
endfunction

function MimeticdMagicAOEDamage_over_time_Func takes nothing returns nothing
	local integer key = GetHandleId(GetExpiredTimer())
	local real intervaltime = LoadReal(DATA,key,StringHash("intervaltime"))
	local real timeout = LoadReal(DATA,key,StringHash("timeout"))
    local real time = 0.0
    local integer AttackTypeID = LoadInteger(DATA,key,StringHash("AttackTypeID"))
    local integer SkillID = LoadInteger(DATA,key,StringHash("SkillID"))
    local real Range = LoadReal(DATA,key,StringHash("Range"))
    local real damage = LoadReal(DATA,key,StringHash("damage"))
    local real x = LoadReal(DATA,key,StringHash("X"))
    local real y = LoadReal(DATA,key,StringHash("Y"))
	call SaveReal(DATA,key,StringHash("time"),LoadReal(DATA,key,StringHash("time")) + 1.0 * (intervaltime))
	set timeout = LoadReal(DATA,key,StringHash("timeout"))
	set time = LoadReal(DATA,key,StringHash("time"))
	if ((time - timeout) < 0.0) then
		call MimeticdMagicAOEDamage(AttackTypeID,SkillID,LoadUnitHandle(DATA,key,StringHash("DamageSource")),x,y,Range,damage)
    elseif ((time - timeout) > 0.0) then
        call PauseTimer(GetExpiredTimer())
        call FlushChildHashtable(DATA,key)
        call DestroyTimer(GetExpiredTimer())
	endif
endfunction

function MimeticdMagicAOEDamage_over_time_system takes timer tm, real intervaltime, real timeout, integer AttackTypeID, integer SkillID, unit DamageSource, real x, real y, real Range, real damage returns nothing
    call SaveReal(DATA,GetHandleId(tm),StringHash("intervaltime"),intervaltime)
    call SaveReal(DATA,GetHandleId(tm),StringHash("timeout"),timeout+0.01)
	call SaveInteger(DATA,GetHandleId(tm),StringHash("AttackTypeID"),AttackTypeID)
    call SaveInteger(DATA,GetHandleId(tm),StringHash("SkillID"),SkillID)
    call SaveUnitHandle(DATA,GetHandleId(tm),StringHash("DamageSource"),DamageSource)
    call SaveReal(DATA,GetHandleId(tm),StringHash("X"),x)
    call SaveReal(DATA,GetHandleId(tm),StringHash("Y"),y)
    call SaveReal(DATA,GetHandleId(tm),StringHash("Range"),Range)
    call SaveReal(DATA,GetHandleId(tm),StringHash("damage"),damage)
    call SaveReal(DATA,GetHandleId(tm),StringHash("time"),0.0)
	call TimerStart(tm,intervaltime,true, function MimeticdMagicAOEDamage_over_time_Func)
endfunction

function MimeticdMagicAOEDamage_over_time takes real intervaltime, real timeout, integer AttackTypeID, integer SkillID, unit DamageSource, real x, real y, real Range, real damage returns nothing
	local timer tm = CreateTimer()
    call MimeticdMagicAOEDamage_over_time_system(tm,intervaltime,timeout,AttackTypeID,SkillID,DamageSource,x,y,Range,damage)
	set tm = null
endfunction

function MimeticdNTDDamage takes integer AttackTypeID, unit DamageSource, unit DamagedUnit, real damage returns nothing
	if (AttackTypeID == 1) and (UnitAlive(DamagedUnit) == true) then
	    call MimeticdMeleeEventTriggerListExecute(DamageSource,DamagedUnit,MimeticdDamageSystem(DamageSource,DamagedUnit,damage))
	elseif (AttackTypeID == 2) and (UnitAlive(DamagedUnit) == true)then
	    call MimeticdMagicEventTriggerListExecute(DamageSource,DamagedUnit,MimeticdDamageSystem(DamageSource,DamagedUnit,damage))
	elseif (AttackTypeID == 0) and (UnitAlive(DamagedUnit) == true)then
	    call NTDEventTriggerListExecute(DamageSource,DamagedUnit,MimeticdDamageSystem(DamageSource,DamagedUnit,damage))
	endif
endfunction

function MimeticdAOEDamage takes integer AttackTypeID, unit DamageSource, real x, real y, real Range, real damage returns nothing
    local group Tempgroup
    local unit Tempunit
    local real tempdamage = 0.0
    set Tempgroup = CreateGroup()
    call GroupEnumUnitsInRange(Tempgroup, x, y, Range, null)
    loop
        set Tempunit = FirstOfGroup(Tempgroup)
        exitwhen Tempunit == null
        call GroupRemoveUnit(Tempgroup, Tempunit)
        if ((IsUnitEnemy(Tempunit, GetOwningPlayer(DamageSource)) == true)) then
	        call MimeticdNTDDamage(AttackTypeID,DamageSource,Tempunit,damage)
        endif
    endloop
    call DestroyGroup(Tempgroup)
    set Tempgroup = null
    set Tempunit = null
endfunction

function MimeticdDamage_over_time_Func takes nothing returns nothing
	local integer key = GetHandleId(GetExpiredTimer())
	local real intervaltime = LoadReal(DATA,key,StringHash("intervaltime"))
	local real timeout = LoadReal(DATA,key,StringHash("timeout"))
    local real time = 0.0
    local integer AttackTypeID = LoadInteger(DATA,key,StringHash("AttackTypeID"))
    local integer SkillID = LoadInteger(DATA,key,StringHash("SkillID"))
    local real damage = LoadReal(DATA,key,StringHash("damage"))
    local real tempdamage = 0.0
	call SaveReal(DATA,key,StringHash("time"),LoadReal(DATA,key,StringHash("time")) + 1.0 * (intervaltime))
	set timeout = LoadReal(DATA,key,StringHash("timeout"))
	set time = LoadReal(DATA,key,StringHash("time"))
	if ((time - timeout) < 0.0) then
		call MimeticdNTDDamage(AttackTypeID,LoadUnitHandle(DATA,key,StringHash("DamageSource")),LoadUnitHandle(DATA,key,StringHash("DamagedUnit")),damage)
    elseif ((time - timeout) >= 0.0) then
        call PauseTimer(GetExpiredTimer())
        call FlushChildHashtable(DATA,key)
        call DestroyTimer(GetExpiredTimer())
	endif
endfunction

function MimeticdDamage_over_time_system takes timer tm, real intervaltime, real timeout, integer AttackTypeID, unit DamageSource, unit DamagedUnit, real damage returns nothing
    call SaveReal(DATA,GetHandleId(tm),StringHash("intervaltime"),intervaltime)
    call SaveReal(DATA,GetHandleId(tm),StringHash("timeout"),timeout+0.01)
	call SaveInteger(DATA,GetHandleId(tm),StringHash("AttackTypeID"),AttackTypeID)
    call SaveUnitHandle(DATA,GetHandleId(tm),StringHash("DamageSource"),DamageSource)
    call SaveUnitHandle(DATA,GetHandleId(tm),StringHash("DamagedUnit"),DamagedUnit)
    call SaveReal(DATA,GetHandleId(tm),StringHash("damage"),damage)
    call SaveReal(DATA,GetHandleId(tm),StringHash("time"),0.0)
	call TimerStart(tm,intervaltime,true, function MimeticdDamage_over_time_Func)
endfunction

function MimeticdDamage_over_time takes real intervaltime, real timeout, integer AttackTypeID, unit DamageSource, unit DamagedUnit, real damage returns nothing
	local timer tm = CreateTimer()
    call MimeticdDamage_over_time_system(tm,intervaltime,timeout,AttackTypeID,DamageSource,DamagedUnit,damage)
	set tm = null
endfunction

function MimeticdAOEDamage_over_time_Func takes nothing returns nothing
	local integer key = GetHandleId(GetExpiredTimer())
	local real intervaltime = LoadReal(DATA,key,StringHash("intervaltime"))
	local real timeout = LoadReal(DATA,key,StringHash("timeout"))
    local real time = 0.0
    local integer AttackTypeID = LoadInteger(DATA,key,StringHash("AttackTypeID"))
    local real Range = LoadReal(DATA,key,StringHash("Range"))
    local real damage = LoadReal(DATA,key,StringHash("damage"))
    local real x = LoadReal(DATA,key,StringHash("X"))
    local real y = LoadReal(DATA,key,StringHash("Y"))
	call SaveReal(DATA,key,StringHash("time"),LoadReal(DATA,key,StringHash("time")) + 1.0 * (intervaltime))
	set timeout = LoadReal(DATA,key,StringHash("timeout"))
	set time = LoadReal(DATA,key,StringHash("time"))
	if ((time - timeout) < 0.0) then
		call MimeticdAOEDamage(AttackTypeID,LoadUnitHandle(DATA,key,StringHash("DamageSource")),x,y,Range,damage)
    elseif ((time - timeout) >= 0.0) then
        call PauseTimer(GetExpiredTimer())
        call FlushChildHashtable(DATA,key)
        call DestroyTimer(GetExpiredTimer())
	endif
endfunction

function MimeticdAOEDamage_over_time_system takes timer tm, real intervaltime, real timeout, integer AttackTypeID, unit DamageSource, real x, real y, real Range, real damage returns nothing
    call SaveReal(DATA,GetHandleId(tm),StringHash("intervaltime"),intervaltime)
    call SaveReal(DATA,GetHandleId(tm),StringHash("timeout"),timeout+0.01)
	call SaveInteger(DATA,GetHandleId(tm),StringHash("AttackTypeID"),AttackTypeID)
    call SaveUnitHandle(DATA,GetHandleId(tm),StringHash("DamageSource"),DamageSource)
    call SaveReal(DATA,GetHandleId(tm),StringHash("X"),x)
    call SaveReal(DATA,GetHandleId(tm),StringHash("Y"),y)
    call SaveReal(DATA,GetHandleId(tm),StringHash("Range"),Range)
    call SaveReal(DATA,GetHandleId(tm),StringHash("damage"),damage)
    call SaveReal(DATA,GetHandleId(tm),StringHash("time"),0.0)
	call TimerStart(tm,intervaltime,true, function MimeticdAOEDamage_over_time_Func)
endfunction

function MimeticdAOEDamage_over_time takes real intervaltime, real timeout, integer AttackTypeID, unit DamageSource, real x, real y, real Range, real damage returns nothing
	local timer tm = CreateTimer()
    call MimeticdAOEDamage_over_time_system(tm,intervaltime,timeout,AttackTypeID,DamageSource,x,y,Range,damage)
	set tm = null
endfunction

//============================================================================================================================================================
//=======================================模拟治疗主函数块=====================================================================================================
//============================================================================================================================================================

function MimeticdHealingSystem takes unit HealingUnit, unit HealedUnit, real HealingAbility returns real
    local real UnitState = GetUnitState(HealedUnit, UNIT_STATE_LIFE)
    local real UnitMaxLife = GetUnitState(HealedUnit, UNIT_STATE_MAX_LIFE)
    local real RealHealingAbility = 0.0
    if ( HealingAbility != 0.0 ) and (UnitAlive(HealedUnit) == true) then
        if ( (UnitMaxLife - UnitState) > HealingAbility ) then
	        set RealHealingAbility = HealingAbility         
            call SetUnitState( HealedUnit, UNIT_STATE_LIFE, (UnitState + HealingAbility) )
        elseif ( (UnitMaxLife - UnitState) <= HealingAbility ) then
            set RealHealingAbility = UnitMaxLife - UnitState
            call SetUnitState( HealedUnit, UNIT_STATE_LIFE, UnitMaxLife )            
        endif
        call HealingEventTriggerListExecute(HealingUnit,HealedUnit,RealHealingAbility)
    elseif ( HealingAbility == 0.0 ) then
        set RealHealingAbility = 0.0
    endif
    return RealHealingAbility
endfunction

function MimeticdHealing takes unit HealingUnit, unit HealedUnit, real HealingAbility returns nothing
    call MimeticdHealingSystem(HealingUnit,HealedUnit,HealingAbility)
endfunction

function Healing takes integer SkillID, unit HealingUnit, unit HealedUnit, real HealingAbility returns nothing
    local integer HealingUnitID = 0
    local real HealingValue = 0.0
    local real HealingThump = 0.0
    local real HealingThumpMultiple = 0.0
    local real HealingAddition = 0.0
    local real HealingDamping = 0.0
    local real SkillHealingAddition = 0.0
    local real SkillHealingDamping = 0.0    
    local real SkillHealingValue = 0.0
    local real SkillHealingThump = 0.0
    local real SkillHealingThumpMultiple = 0.0
    local real Value = 0.0
    local boolean a = false
    set HealingUnitID = GetUnitTypeId(HealingUnit) 
    if (SkillID == 0) then
	    set SkillHealingAddition = 0.0
	    set SkillHealingDamping = 0.0
        set SkillHealingValue = 0.0
        set SkillHealingThump = 0.0
        set SkillHealingThumpMultiple = 0.0
	else
	    set SkillHealingAddition = GetTypeData(SkillID,42)
	    set SkillHealingDamping = GetTypeData(SkillID,43)
        set SkillHealingValue = GetTypeData(SkillID,39)
        set SkillHealingThump = GetTypeData(SkillID,40)
        set SkillHealingThumpMultiple = GetTypeData(SkillID,41)
    endif    
    set HealingValue = HealingAbility + GetTypeData(HealingUnitID,39) + GetTypeData(GetHandleId(HealingUnit),39) + GetTypeData(GetTotalUnitItemAttributeID(HealingUnit,39),39) + SkillHealingValue
    set HealingValue = PositiveRange(HealingValue)
    set HealingThump = GetTypeData(HealingUnitID,40) + GetTypeData(GetHandleId(HealingUnit),40) + GetTypeData(GetTotalUnitItemAttributeID(HealingUnit,40),40) + SkillHealingThump
    set HealingThump = ProbabilityRange(HealingThump)
    set HealingThumpMultiple = 1.0 + GetTypeData(HealingUnitID,41) + GetTypeData(GetHandleId(HealingUnit),41) + GetTypeData(GetTotalUnitItemAttributeID(HealingUnit,41),41) + SkillHealingThumpMultiple
    set HealingThumpMultiple = GreaterThanOneRange(HealingThumpMultiple)   
    set HealingAddition = 1.0 + GetTypeData(GetHandleId(HealingUnit),42) + GetTypeData(GetTotalUnitItemAttributeID(HealedUnit,42),42) + SkillHealingAddition
    set HealingAddition = GreaterThanOneRange(HealingAddition)   
    set HealingDamping = GetTypeData(GetHandleId(HealingUnit),43) + GetTypeData(GetTotalUnitItemAttributeID(HealedUnit,43),43) + SkillHealingDamping 
    set HealingDamping = ProbabilityRange(HealingDamping)
    if ((IsUnitEnemy(HealedUnit, GetOwningPlayer(HealingUnit)) == false) and (IsUnitType(HealedUnit, UNIT_TYPE_STRUCTURE) == false) and (IsUnitType(HealedUnit, UNIT_TYPE_MECHANICAL) == false) and (GetUnitState(HealedUnit, UNIT_STATE_LIFE) > 0.405)) then
	    if (HealingThumpBool == false) then
		    call SetTypeBoolean(GetHandleId(HealedUnit),51,false)
		    set Value = HealingValue * HealingAddition * HealingDamping
		    call MimeticdHealing(HealingUnit,HealedUnit,Value)
		elseif (HealingThumpBool == true) then
		    set a = Probability(HealingThump*100.0)
	        if ( a == false ) then
		        call SetTypeBoolean(GetHandleId(HealedUnit),51,false)
		        set Value = HealingValue * HealingAddition * (1.0 - HealingDamping)
		        call MimeticdHealing(HealingUnit,HealedUnit,Value)
		    elseif ( a == true ) then
		        call SetTypeBoolean(GetHandleId(HealedUnit),51,true)
		        set Value = HealingValue * HealingThumpMultiple * HealingAddition * (1.0 - HealingDamping)
		        call MimeticdHealing(HealingUnit,HealedUnit,Value)
	        endif
	    endif
    endif
endfunction

function AOEHealing takes integer SkillID, unit HealingUnit, real x, real y, real Range, real HealingAbility returns nothing
    local group Tempgroup
    local unit Tempunit
    set Tempgroup = CreateGroup()
    call GroupEnumUnitsInRange(Tempgroup, x, y, Range, null)
    loop
        set Tempunit = FirstOfGroup(Tempgroup)
        exitwhen Tempunit == null
        call GroupRemoveUnit(Tempgroup, Tempunit)
        if ((IsUnitEnemy(Tempunit, GetOwningPlayer(HealingUnit)) == false) and (IsUnitType(Tempunit, UNIT_TYPE_STRUCTURE) == false) and (IsUnitType(Tempunit, UNIT_TYPE_MECHANICAL) == false) and (GetUnitState(Tempunit, UNIT_STATE_LIFE) > 0.405)) then
            call Healing(SkillID,HealingUnit,Tempunit,HealingAbility)
        endif
    endloop
    call DestroyGroup(Tempgroup)
    set Tempgroup = null
    set Tempunit = null
endfunction

function Healing_over_time_Func takes nothing returns nothing
	local integer key = GetHandleId(GetExpiredTimer())
	local real intervaltime = LoadReal(DATA,key,StringHash("intervaltime"))
	local real timeout = LoadReal(DATA,key,StringHash("timeout"))
    local real time = 0.0
    local integer SkillID = LoadInteger(DATA,key,StringHash("SkillID"))
    local real HealingAbility = LoadReal(DATA,key,StringHash("HealingAbility"))
	call SaveReal(DATA,key,StringHash("time"),LoadReal(DATA,key,StringHash("time")) + 1.0 * (intervaltime))
	set timeout = LoadReal(DATA,key,StringHash("timeout"))
	set time = LoadReal(DATA,key,StringHash("time"))
	if ((time - timeout) < 0.0) then
		call Healing(SkillID,LoadUnitHandle(DATA,key,StringHash("HealingUnit")),LoadUnitHandle(DATA,key,StringHash("HealedUnit")),HealingAbility)
    elseif ((time - timeout) > 0.0) then
        call PauseTimer(GetExpiredTimer())
        call FlushChildHashtable(DATA,key)
        call DestroyTimer(GetExpiredTimer())
	endif
endfunction

function Healing_over_time_system takes timer tm, real intervaltime, real timeout, integer SkillID, unit HealingUnit, unit HealedUnit, real HealingAbility returns nothing
    call SaveReal(DATA,GetHandleId(tm),StringHash("intervaltime"),intervaltime)
    call SaveReal(DATA,GetHandleId(tm),StringHash("timeout"),timeout+0.01)
    call SaveInteger(DATA,GetHandleId(tm),StringHash("SkillID"),SkillID)
    call SaveUnitHandle(DATA,GetHandleId(tm),StringHash("HealingUnit"),HealingUnit)
    call SaveUnitHandle(DATA,GetHandleId(tm),StringHash("HealedUnit"),HealedUnit)
    call SaveReal(DATA,GetHandleId(tm),StringHash("HealingAbility"),HealingAbility)
    call SaveReal(DATA,GetHandleId(tm),StringHash("time"),0.0)
	call TimerStart(tm,intervaltime,true, function Healing_over_time_Func)
endfunction

function Healing_over_time takes real intervaltime, real timeout, integer SkillID, unit HealingUnit, unit HealedUnit, real HealingAbility returns nothing
	local timer tm = CreateTimer()
    call Healing_over_time_system(tm,intervaltime,timeout,SkillID,HealingUnit,HealedUnit,HealingAbility)
	set tm = null
endfunction

function AOEHealing_over_time_Func takes nothing returns nothing
	local integer key = GetHandleId(GetExpiredTimer())
	local real intervaltime = LoadReal(DATA,key,StringHash("intervaltime"))
	local real timeout = LoadReal(DATA,key,StringHash("timeout"))
    local real time = 0.0
    local integer SkillID = LoadInteger(DATA,key,StringHash("SkillID"))
    local real Range = LoadReal(DATA,key,StringHash("Range"))
    local real HealingAbility = LoadReal(DATA,key,StringHash("HealingAbility"))
    local real x = LoadReal(DATA,key,StringHash("X"))
    local real y = LoadReal(DATA,key,StringHash("Y"))
	call SaveReal(DATA,key,StringHash("time"),LoadReal(DATA,key,StringHash("time")) + 1.0 * (intervaltime))
	set timeout = LoadReal(DATA,key,StringHash("timeout"))
	set time = LoadReal(DATA,key,StringHash("time"))
	if ((time - timeout) < 0.0) then
		call AOEHealing(SkillID,LoadUnitHandle(DATA,key,StringHash("HealingUnit")),x,y,Range,HealingAbility)
    elseif ((time - timeout) > 0.0) then
        call PauseTimer(GetExpiredTimer())
        call FlushChildHashtable(DATA,key)
        call DestroyTimer(GetExpiredTimer())
	endif
endfunction

function AOEHealing_over_time_system takes timer tm, real intervaltime, real timeout, integer SkillID, unit HealingUnit, real x, real y, real Range, real HealingAbility returns nothing
    call SaveReal(DATA,GetHandleId(tm),StringHash("intervaltime"),intervaltime)
    call SaveReal(DATA,GetHandleId(tm),StringHash("timeout"),timeout+0.01)
    call SaveInteger(DATA,GetHandleId(tm),StringHash("SkillID"),SkillID)
    call SaveUnitHandle(DATA,GetHandleId(tm),StringHash("HealingUnit"),HealingUnit)
    call SaveReal(DATA,GetHandleId(tm),StringHash("X"),x)
    call SaveReal(DATA,GetHandleId(tm),StringHash("Y"),y)
    call SaveReal(DATA,GetHandleId(tm),StringHash("Range"),Range)
    call SaveReal(DATA,GetHandleId(tm),StringHash("HealingAbility"),HealingAbility)
    call SaveReal(DATA,GetHandleId(tm),StringHash("time"),0.0)
	call TimerStart(tm,intervaltime,true, function AOEHealing_over_time_Func)
endfunction

function AOEHealing_over_time takes real intervaltime, real timeout, integer SkillID, unit HealingUnit, real x, real y, real Range, real HealingAbility returns nothing
	local timer tm = CreateTimer()
    call AOEHealing_over_time_system(tm,intervaltime,timeout,SkillID,HealingUnit,x,y,Range,HealingAbility)
	set tm = null
endfunction

//============================================================================================================================================================

function SetContinuousTimer_Time takes timer tm, real r returns nothing
	call SaveReal(DATA,GetHandleId(tm),StringHash("time"),r)
endfunction

function SetContinuousTimer_Timeout takes timer tm, real r returns nothing
	call SaveReal(DATA,GetHandleId(tm),StringHash("timeout"),r)
endfunction

function SetContinuousDamage takes timer tm, real r returns nothing
	call SaveReal(DATA,GetHandleId(tm),StringHash("damage"),r)
endfunction

function SetContinuousHealingAbility takes timer tm, real r returns nothing
	call SaveReal(DATA,GetHandleId(tm),StringHash("HealingAbility"),r)
endfunction

function GetContinuousTimer_Time takes timer tm returns real
	return LoadReal(DATA,GetHandleId(tm),StringHash("time"))
endfunction

function GetContinuousTimer_Timeout takes timer tm returns real
	return LoadReal(DATA,GetHandleId(tm),StringHash("timeout"))
endfunction

//============================================================================================================================================================
//===========================判断与触发重建魔兽物攻和法攻主函数块=============================================================================================
//============================================================================================================================================================

function AnySingleDamagedEvent takes nothing returns nothing
    local unit caster = GetEventDamageSource()
    local unit target = GetTriggerUnit()
    local integer index = 0
    if (UnitAlive(target) == true) then
	    if ((GetUnitAbilityLevel(target,MIMETIC_BUFF_1) > 0)) then
	        call UnitRemoveAbility(target,MIMETIC_BUFF_1)
	        set index = MeleeNextIndex[0]
	        loop
	            exitwhen (index == 0)
	            exitwhen (index > MeleeListEnd)
	            if (IsTriggerEnabled(MeleeTriggerList[index])) and (TriggerEvaluate(MeleeTriggerList[index])) then
	                call TriggerExecute(MeleeTriggerList[index])
	            endif
	            set index = MeleeNextIndex[index]
	        endloop
	    else
	        set index = MagicNextIndex[0]
	            loop
	            exitwhen (index == 0)
	            exitwhen (index > MagicListEnd)
	            if (IsTriggerEnabled(MagicTriggerList[index])) and (TriggerEvaluate(MagicTriggerList[index])) then
	                call TriggerExecute(MagicTriggerList[index])
	            endif
	            set index = MagicNextIndex[index]
	        endloop
	    endif
    endif
    set caster = null
    set target = null
endfunction

function AnyUnitDamagedEventFunc takes nothing returns nothing
    local unit caster = GetEventDamageSource()
    local unit target = GetTriggerUnit()
    if (GetTriggerEventId() == EVENT_UNIT_DAMAGED) then
        if (GetEventDamage() > 0) then
            if ((GetUnitAbilityLevel(caster,MIMETIC_SKILL_1) > 0)) then
                call AnySingleDamagedEvent()
            endif
        endif
    elseif (GetTriggerEventId() == EVENT_UNIT_DEATH) then
        if (IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == false) then
            call GroupRemoveUnit(DamagedGroup,GetTriggerUnit())
            call DestroyTrigger(GetTriggeringTrigger())
        endif
    endif
    set caster = null
    set target = null
endfunction

function AnyUnitDamagedEventRegister takes unit u returns nothing
    local trigger t = CreateTrigger()
    call GroupAddUnit(DamagedGroup,u)
    call TriggerRegisterUnitEvent(t,u,EVENT_UNIT_DAMAGED)
    call TriggerRegisterUnitEvent(t,u,EVENT_UNIT_DEATH)
    call TriggerAddAction(t,function AnyUnitDamagedEventFunc)
    set t = null
endfunction

function UnitEnterRegionAddData takes unit whichunit returns nothing
    local integer unitid = GetUnitTypeId(whichunit)
    local real a = 0.0
    local real array b
    local real c = 0.0
    local real array d
    local integer i = 0
    local integer n = 0
	if  ((GetUnitAbilityLevel(whichunit,MIMETIC_SKILL_0) == 0)) then
	    call UnitAddAbility(whichunit,MIMETIC_SKILL_0)
	endif
    call InitIndex(StringHash(I2S(10)+I2S(GetHandleId(whichunit))+I2S(1)))
    call SetTypeData(GetHandleId(whichunit),57,GetTypeData(GetUnitTypeId(whichunit),57))
    call SetTypeBoolean(GetHandleId(whichunit),68,GetTypeBoolean(GetUnitTypeId(whichunit),68))
    call SetTypeBoolean(GetHandleId(whichunit),69,GetTypeBoolean(GetUnitTypeId(whichunit),69))
    if (GetType(GetUnitTypeId(whichunit),1) == 0) then
        call SetType(GetUnitTypeId(whichunit),1,100)
    endif
    call SetType(GetHandleId(whichunit),1,GetType(GetUnitTypeId(whichunit),1))
    if (GetType(GetUnitTypeId(whichunit),3) == 0) then
        call SetType(GetUnitTypeId(whichunit),3,200)
    endif
    call SetType(GetHandleId(whichunit),3,GetType(GetUnitTypeId(whichunit),3))
    if (GetType(GetUnitTypeId(whichunit),20) == 0) then
        call SetType(GetUnitTypeId(whichunit),20,300)
    endif
    call SetType(GetHandleId(whichunit),20,GetType(GetUnitTypeId(whichunit),20))
    if (GetType(GetUnitTypeId(whichunit),22) == 0) then
        call SetType(GetUnitTypeId(whichunit),22,400)
    endif
    call SetType(GetHandleId(whichunit),22,GetType(GetUnitTypeId(whichunit),22))
    if (GetTypeData(GetUnitTypeId(whichunit),52) == 0.0) then
        call SetTypeData(GetUnitTypeId(whichunit),52,1.0)
    endif
    call SetTypeData(GetHandleId(whichunit),52,GetTypeData(GetUnitTypeId(whichunit),52))

    if (IsUnitType(whichunit, UNIT_TYPE_HERO) == true) then
	    set a = GetTypeData(unitid,TypeKey(2))
	    call SetTypeData(GetHandleId(whichunit),TypeKey(2),a*(GetHeroLevel(whichunit)-1))
	    set i = 4
	    loop
	        exitwhen i > 12
	        set b[i-4] = GetTypeData(unitid,TypeKey(i))
	        call SetTypeData(GetHandleId(whichunit),TypeKey(i),b[i-4]*(GetHeroLevel(whichunit)-1))
	        set i = i + 1
	    endloop
	    set c = GetTypeData(unitid,TypeKey(21))
	    call SetTypeData(GetHandleId(whichunit),TypeKey(21),c*(GetHeroLevel(whichunit)-1))
	    set n = 23
	    loop
	        exitwhen n > 31
	        set d[n-23] = GetTypeData(unitid,TypeKey(n))
	        call SetTypeData(GetHandleId(whichunit),TypeKey(n),d[n-23]*(GetHeroLevel(whichunit)-1))
	        set n = n + 1
	    endloop
    endif
    call UnitPredicable(whichunit)
endfunction

function AnyUnitEnterRegionAddDataAction takes nothing returns nothing
	call UnitEnterRegionAddData(GetEnterUnit())
    if (IsUnitInGroup(GetEnterUnit(),DamagedGroup) == false) and (IsUnitType(GetEnterUnit(),UNIT_TYPE_SAPPER) == false) then
        call AnyUnitDamagedEventRegister(GetEnterUnit())
    endif
endfunction

function AnyUnitEnterRegionAddData takes nothing returns nothing
    local trigger tr = CreateTrigger()
    call TriggerRegisterAnyUnitEnterEvent(tr)
    call TriggerAddAction(tr,function AnyUnitEnterRegionAddDataAction)
    set tr = null
endfunction

function OrdinaryAttackTimerFunc takes nothing returns nothing
	local boolean b = GetTypeBoolean(GetHandleId(LoadUnitHandle(DATA,GetHandleId(GetExpiredTimer()),StringHash("DamageSource"))),68)
    call UnitRemoveAbility( LoadUnitHandle(DATA,GetHandleId(GetExpiredTimer()),StringHash("DamagedUnit")), ImmuneDamageSkillID )
    if (b == false) then
        call MimeticdMeleeDamageDefault(LoadUnitHandle(DATA,GetHandleId(GetExpiredTimer()),StringHash("DamageSource")),LoadUnitHandle(DATA,GetHandleId(GetExpiredTimer()),StringHash("DamagedUnit")),LoadReal(DATA,GetHandleId(GetExpiredTimer()),StringHash("Damage")))
    elseif (b == true) then
        call MimeticdMagicDamageDefault(LoadUnitHandle(DATA,GetHandleId(GetExpiredTimer()),StringHash("DamageSource")),LoadUnitHandle(DATA,GetHandleId(GetExpiredTimer()),StringHash("DamagedUnit")),LoadReal(DATA,GetHandleId(GetExpiredTimer()),StringHash("Damage")))
    endif
    call FlushChildHashtable(DATA,GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction

function OrdinaryAttack takes unit DamageSource, unit DamagedUnit, real Damage returns nothing
    local timer tm = CreateTimer()
    call UnitAddAbility( DamagedUnit, ImmuneDamageSkillID )
    call SaveUnitHandle(DATA,GetHandleId(tm),StringHash("DamageSource"),DamageSource)
    call SaveUnitHandle(DATA,GetHandleId(tm),StringHash("DamagedUnit"),DamagedUnit)
    call SaveReal(DATA,GetHandleId(tm),StringHash("Damage"),Damage)
    call TimerStart(tm, 0.0, false, function OrdinaryAttackTimerFunc)
    set tm = null
endfunction

function SkillAttackTimerFunc takes nothing returns nothing
	local boolean b = GetTypeBoolean(GetHandleId(LoadUnitHandle(DATA,GetHandleId(GetExpiredTimer()),StringHash("DamageSource"))),69)
	local integer SpellAbilityID = LoadInteger(DSHT,GetHandleId(LoadUnitHandle(DATA,GetHandleId(GetExpiredTimer()),StringHash("DamageSource"))),StringHash("SpellAbility"))
	local integer SkillDamageType = GetType(SpellAbilityID,76)
//	call BJDebugMsg(I2S(SkillDamageType))
    call UnitRemoveAbility( LoadUnitHandle(DATA,GetHandleId(GetExpiredTimer()),StringHash("DamagedUnit")), ImmuneDamageSkillID )
    if ((b == true) and (SkillDamageType == 0)) or (SkillDamageType == 1) then
	    call MimeticdMeleeDamage(GetType(GetUnitTypeId(LoadUnitHandle(DATA,GetHandleId(GetExpiredTimer()),StringHash("DamageSource"))),1),SpellAbilityID,LoadUnitHandle(DATA,GetHandleId(GetExpiredTimer()),StringHash("DamageSource")),LoadUnitHandle(DATA,GetHandleId(GetExpiredTimer()),StringHash("DamagedUnit")),LoadReal(DATA,GetHandleId(GetExpiredTimer()),StringHash("Damage")))
    elseif ((b == false) and (SkillDamageType == 0)) or (SkillDamageType == 2) then
        call MimeticdMagicDamage(GetType(GetUnitTypeId(LoadUnitHandle(DATA,GetHandleId(GetExpiredTimer()),StringHash("DamageSource"))),20),SpellAbilityID,LoadUnitHandle(DATA,GetHandleId(GetExpiredTimer()),StringHash("DamageSource")),LoadUnitHandle(DATA,GetHandleId(GetExpiredTimer()),StringHash("DamagedUnit")),LoadReal(DATA,GetHandleId(GetExpiredTimer()),StringHash("Damage")))
    endif
    call FlushChildHashtable(DATA,GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction

function SkillAttack takes unit DamageSource, unit DamagedUnit, real Damage returns nothing
    local timer tm = CreateTimer()
    call UnitAddAbility( DamagedUnit, ImmuneDamageSkillID )
    call SaveUnitHandle(DATA,GetHandleId(tm),StringHash("DamageSource"),DamageSource)
    call SaveUnitHandle(DATA,GetHandleId(tm),StringHash("DamagedUnit"),DamagedUnit)
    call SaveReal(DATA,GetHandleId(tm),StringHash("Damage"),Damage)
    call TimerStart(tm, 0.0, false, function SkillAttackTimerFunc)
    set tm = null
endfunction

function Melee_Damage_Event_Actions takes nothing returns nothing
	if (DamageBool == false) then
        call OrdinaryAttack(GetEventDamageSource(),GetTriggerUnit(),GetEventDamage())
    elseif (DamageBool == true) then
        call OrdinaryAttack(GetEventDamageSource(),GetTriggerUnit(),0.0)
    endif
endfunction

function Melee_Damage_Event takes nothing returns nothing
    local trigger Melee_Damage = CreateTrigger()
    call TriggerRegisterAnyUnitDamagedEvent(Melee_Damage,0)//第2参数为0表示注册单位受普通攻击伤害事件
    call TriggerAddAction(Melee_Damage, function Melee_Damage_Event_Actions)
    set Melee_Damage = null
endfunction

function Magic_Damage_Event_Actions takes nothing returns nothing
	if (DamageBool == false) then
        call SkillAttack(GetEventDamageSource(),GetTriggerUnit(),GetEventDamage())
    elseif (DamageBool == true) then
        call SkillAttack(GetEventDamageSource(),GetTriggerUnit(),0.0)
    endif
endfunction

function Magic_Damage_Event takes nothing returns nothing
    local trigger Magic_Damage = CreateTrigger()
    call TriggerRegisterAnyUnitDamagedEvent(Magic_Damage,1)//第2参数为1表示注册单位受技能攻击伤害事件
    call TriggerAddAction(Magic_Damage, function Magic_Damage_Event_Actions)
    set Magic_Damage = null
endfunction

//============================================================================================================================================================
//=============================================伤害显示触发函数===============================================================================================
//============================================================================================================================================================

function DisplaySystem_MeleeActions takes nothing returns nothing
	local boolean a = GetTypeBoolean(GetHandleId(GetMimeticdMeleeEventDamagedUnit()),48)
	local boolean b = GetTypeBoolean(GetHandleId(GetMimeticdMeleeEventDamagedUnit()),49)
	local boolean c = GetTypeBoolean(GetHandleId(GetMimeticdMeleeEventDamagedUnit()),50)
    if (a == false) and (b == false) and (c == false) and (GetMimeticdMeleeEventDamage() !=0) then
        call DisplayDamageSystem(GetMimeticdMeleeEventDamagedUnit(),GetMimeticdMeleeEventDamage(),11.0,1,2)
    elseif (a == false) and (b == true) and (c == false) then
        call DisplayDamage(GetMimeticdMeleeEventDamagedUnit(),"Miss",20.0,size[7],rgb_R[7],rgb_G[7],rgb_B[7],rgb_A[7])
    elseif (a == true) and (b == false) and (c == false) and (GetMimeticdMeleeEventDamage() !=0) then
		if ((IsUnitType(GetMimeticdMeleeEventDamagedUnit(), UNIT_TYPE_HERO) == true)) then
		    if (DisplayDamageBool == true) then
		        call DisplayDamage(GetMimeticdMeleeEventDamagedUnit(),I2S(R2I(GetMimeticdMeleeEventDamage()))+"!",20.0,size[1],rgb_R[1],rgb_G[1],rgb_B[1],rgb_A[1])
		    endif
		elseif ((IsUnitType(GetMimeticdMeleeEventDamagedUnit(), UNIT_TYPE_HERO) == false)) then
		    if (DisplayDamageBool == true) then
		        call DisplayDamage(GetMimeticdMeleeEventDamagedUnit(),I2S(R2I(GetMimeticdMeleeEventDamage()))+"!",20.0,size[2],rgb_R[2],rgb_G[2],rgb_B[2],rgb_A[2])
		    endif
		endif
    elseif (a == false) and (b == false) and (c == true) and (GetMimeticdMeleeEventDamage() !=0) then
        call DisplayDamageSystem(GetMimeticdMeleeEventDamagedUnit(),GetMimeticdMeleeEventDamage(),8.0,1,2)
    endif
endfunction

function InitDisplaySystem_Melee takes nothing returns nothing
    call TriggerRegisterAnyUnitDamagedEvent( DisplayTriggerA, 2 )
    call TriggerAddAction(DisplayTriggerA, function DisplaySystem_MeleeActions)
endfunction

function DisplaySystem_MagicActions takes nothing returns nothing
	local boolean a = GetTypeBoolean(GetHandleId(GetMimeticdMagicEventDamagedUnit()),48)
	local boolean b = GetTypeBoolean(GetHandleId(GetMimeticdMagicEventDamagedUnit()),49)
	local boolean c = GetTypeBoolean(GetHandleId(GetMimeticdMagicEventDamagedUnit()),50)
    if (a == false) and (b == false) and (c == false) and (GetMimeticdMagicEventDamage() !=0) then
        call DisplayDamageSystem(GetMimeticdMagicEventDamagedUnit(),GetMimeticdMagicEventDamage(),11.0,3,4)
    elseif (a == false) and (b == true) and (c == false) then
        call DisplayDamage(GetMimeticdMagicEventDamagedUnit(),"Miss",20.0,size[7],rgb_R[7],rgb_G[7],rgb_B[7],rgb_A[7])
    elseif (a == true) and (b == false) and (c == false) and (GetMimeticdMagicEventDamage() !=0) then
		if ((IsUnitType(GetMimeticdMagicEventDamagedUnit(), UNIT_TYPE_HERO) == true)) then
		    if (DisplayDamageBool == true) then
		        call DisplayDamage(GetMimeticdMagicEventDamagedUnit(),I2S(R2I(GetMimeticdMagicEventDamage()))+"!",20.0,size[3],rgb_R[3],rgb_G[3],rgb_B[3],rgb_A[3])
		    endif
		elseif ((IsUnitType(GetMimeticdMagicEventDamagedUnit(), UNIT_TYPE_HERO) == false)) then
		    if (DisplayDamageBool == true) then
		        call DisplayDamage(GetMimeticdMagicEventDamagedUnit(),I2S(R2I(GetMimeticdMagicEventDamage()))+"!",20.0,size[4],rgb_R[4],rgb_G[4],rgb_B[4],rgb_A[4])
		    endif
		endif
    elseif (a == false) and (b == false) and (c == true) and (GetMimeticdMagicEventDamage() !=0) then
        call DisplayDamageSystem(GetMimeticdMagicEventDamagedUnit(),GetMimeticdMagicEventDamage(),8.0,3,4)
    endif
endfunction

function InitDisplaySystem_Magic takes nothing returns nothing
    call TriggerRegisterAnyUnitDamagedEvent( DisplayTriggerB, 3 )
    call TriggerAddAction(DisplayTriggerB, function DisplaySystem_MagicActions)
endfunction

function DisplaySystem_HealingActions takes nothing returns nothing
	local boolean a = GetTypeBoolean(GetHandleId(GetHealingEventTreatedUnit()),51)
    if (a == false) and (GetHealingEventHealing() != 0.0) then
        call DisplayDamage(GetHealingEventTreatedUnit(),I2S(R2I(GetHealingEventHealing())),20.0,size[10],rgb_R[10],rgb_G[10],rgb_B[10],rgb_A[10])
    elseif (a == true) and (GetHealingEventHealing() != 0.0) then
        call DisplayDamage(GetHealingEventTreatedUnit(),I2S(R2I(GetHealingEventHealing()))+"!",20.0,size[1],rgb_R[10],rgb_G[10],rgb_B[10],rgb_A[10])
    endif
endfunction

function InitDisplaySystem_Healing takes nothing returns nothing
    call TriggerRegisterAnyUnitHealingEvent( DisplayTriggerC )
    call TriggerAddAction(DisplayTriggerC, function DisplaySystem_HealingActions)
endfunction

//============================================================================================================================================================
//=============================================仇恨系统数据处理===============================================================================================
//============================================================================================================================================================

function SetAppointUnit takes unit u returns nothing
	set AppointUnit = u
endfunction

function SaveTotalDamage takes unit DamageSource, real Damage returns nothing
	call SaveReal(DSHT,GetHandleId(DamageSource)+StringHash("TotalDamage"),StringHash("TotalDamage"),Damage)
endfunction

function GetTotalDamage takes unit DamageSource returns real
	return LoadReal(DSHT,GetHandleId(DamageSource)+StringHash("TotalDamage"),StringHash("TotalDamage"))
endfunction

function SaveAUTotalDamage takes unit DamageSource, unit DamagedUnit, real Damage returns nothing
    call SaveReal(DSHT,GetHandleId(DamagedUnit),StringHash("AUTotalDamage")+GetHandleId(DamageSource),Damage)
endfunction

function GetAUTotalDamage takes unit DamageSource, unit DamagedUnit returns real
    return LoadReal(DSHT,GetHandleId(DamagedUnit),StringHash("AUTotalDamage")+GetHandleId(DamageSource))
endfunction

function SaveTotalHealing takes unit HealingSource, real healing returns nothing
	call SaveReal(DSHT,GetHandleId(HealingSource)+StringHash("TotalHealing"),StringHash("TotalHealing"),healing)
endfunction

function GetTotalHealing takes unit HealingSource returns real
	return LoadReal(DSHT,GetHandleId(HealingSource)+StringHash("TotalHealing"),StringHash("TotalHealing"))
endfunction

function SaveDamagedDamage takes real Damage returns nothing
	call SaveReal(DSHT,GetHandleId(AppointUnit),StringHash("DamagedDamage"),Damage)
endfunction

function GetDamagedDamage takes nothing returns real
	return LoadReal(DSHT,GetHandleId(AppointUnit),StringHash("DamagedDamage"))
endfunction

function GetAUTotalDPS takes unit whichunit returns real
    return LoadReal(DSHT,GetHandleId(whichunit),StringHash("AUTotalDPS"))
endfunction

function ResetAllTotalData takes nothing returns nothing
	local integer i
	set i = 1
	loop
		exitwhen i > zxwjs
	    call SaveReal(DSHT,GetHandleId(PlayerUnit[zxwjid[i]])+StringHash("TotalDamage"),StringHash("TotalDamage"),0.0)
	    call SaveReal(DSHT,GetHandleId(PlayerUnit[zxwjid[i]])+StringHash("TotalHealing"),StringHash("TotalHealing"),0.0)
	    call MultiboardSetItemValue(MultiboardGetItem(lb2[i],i,1),R2S(GetTotalDamage(PlayerUnit[zxwjid[i]])))
	    call MultiboardSetItemValue(MultiboardGetItem(lb2[i],i,2),R2S(GetTotalHealing(PlayerUnit[zxwjid[i]])))
	    call MultiboardSetItemValue(MultiboardGetItem(lb2[i],i,3),R2S(GetAUTotalDamage(PlayerUnit[zxwjid[i]],AppointUnit)))
	    call MultiboardSetItemValue(MultiboardGetItem(lb2[i],i,4),R2S(GetAUTotalDPS(PlayerUnit[zxwjid[i]])))
	    call MultiboardSetItemValue(MultiboardGetItem(lb2[i],i,5),R2S(GetUnitHatred(AppointUnit,PlayerUnit[zxwjid[i]])))
	    set i = i + 1
	endloop
endfunction

function SetUnitHatredMain takes real damage, unit damageunit, unit damagesource, real a, real b returns nothing
    call SaveUnitHatred( damageunit, damagesource, ( GetUnitHatred(damageunit, damagesource) + damage * a + b ) )
    if ((GetUnitHatred(damageunit, damagesource) <= 0.00)) then
        call SaveUnitHatred( damageunit, damagesource, 0.0 )
    endif
endfunction

function SetUnitHatred takes real damage, unit damageunit, unit damagesource returns nothing
    call DamageunitdataStockpile(damageunit,damagesource)
    if ((IsUnitType(damagesource, UNIT_TYPE_SUMMONED) == false)) then
        call SetUnitHatredMain( damage,damageunit,damagesource,a1,b1 )
    else
        call SetUnitHatredMain( damage,damageunit,damagesource,a2,b2 )
    endif
endfunction

function DPSTrig_Unit_Death_Actions takes nothing returns nothing
    if (GetTriggerUnit() == AppointUnit) then
	    call PauseTimer(TIMER)
	    set TIMEROUT = 0.0
    endif
endfunction

function DPSTrig_Unit_Death takes nothing returns nothing
	local trigger tr
    set tr = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( tr, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddAction(tr, function DPSTrig_Unit_Death_Actions)
    set tr = null
endfunction

function SetUnitHatredMultiboardItem takes nothing returns nothing
	local integer m
	local integer n
	set m = 1
	loop
		exitwhen m > zxwjs
		    set n = 0
		    loop
			    exitwhen n > zxwjs
	            call MultiboardSetItemValue(MultiboardGetItem(lb2[n],m,1),R2S(GetTotalDamage(PlayerUnit[zxwjid[m]])))
	            call MultiboardSetItemValue(MultiboardGetItem(lb2[n],m,3),R2S(GetAUTotalDamage(PlayerUnit[zxwjid[m]],AppointUnit)))
	            call MultiboardSetItemValue(MultiboardGetItem(lb2[n],m,5),R2S(GetUnitHatred(AppointUnit,PlayerUnit[zxwjid[m]])))
	            set n = n+ 1
	        endloop
		set m = m + 1
    endloop
endfunction

function SetUnitHealingMultiboardItem takes nothing returns nothing
	local integer m
	local integer n
	set m = 1
	loop
		exitwhen m > zxwjs
		    set n = 0
		    loop
			    exitwhen n > zxwjs
	            call MultiboardSetItemValue(MultiboardGetItem(lb2[n],m,2),R2S(GetTotalHealing(PlayerUnit[zxwjid[m]])))
	            set n = n+ 1
	        endloop
		set m = m + 1
	endloop
endfunction

function SetUnitDPSMultiboardItem takes nothing returns nothing
	local integer m
	local integer n
	set m = 1
	loop
		exitwhen m > zxwjs
		    set n = 0
		    loop
			    exitwhen n > zxwjs
	            call MultiboardSetItemValue(MultiboardGetItem(lb2[n],m,4),R2S(GetAUTotalDPS(PlayerUnit[zxwjid[m]])))
	            set n = n+ 1
	        endloop
		set m = m + 1
	endloop
endfunction

function ActionsA takes nothing returns nothing
	if ((IsUnitInForce(GetASDEventDamagedUnit(), GetComputerForce()) == true)) then
	    if (GetUnitState(GetASDEventDamagedUnit(), UNIT_STATE_LIFE) > 0.405) then
	        call DamageunitdataStockpile(GetASDEventDamagedUnit(),GetASDEventDamageSource())
	        call SetUnitHatred(GetASDEventDamage(),GetASDEventDamagedUnit(),GetASDEventDamageSource())
        endif
        if (Count == true) then
            call SaveTotalDamage(GetASDEventDamageSource(), GetTotalDamage(GetASDEventDamageSource()) + GetASDEventDamage())
        endif
        if (GetASDEventDamagedUnit() == AppointUnit) then
	        call SaveAUTotalDamage(GetASDEventDamageSource(),AppointUnit,GetAUTotalDamage(GetASDEventDamageSource(),AppointUnit) + GetASDEventDamage())
	        call SaveDamagedDamage(GetDamagedDamage() + GetASDEventDamage())
        endif
    endif
    call SetUnitHatredMultiboardItem()
endfunction

function ActionsB takes nothing returns nothing
    local group tempgroup = null
    local unit tempunit = null
    set tempgroup = CreateGroup()
    call GroupEnumUnitsInRange(tempgroup, GetUnitX(GetHealingEventHealingSource()), GetUnitY(GetHealingEventHealingSource()), radius, null)
    loop
        set tempunit = FirstOfGroup(tempgroup)
        exitwhen tempunit == null
        call GroupRemoveUnit(tempgroup, tempunit)
        if ((IsUnitInForce(tempunit, GetComputerForce()) == true)) then
            call DamageunitdataStockpile(tempunit,GetHealingEventHealingSource())
            call SetUnitHatred(GetHealingEventHealing(),tempunit,GetHealingEventHealingSource())
        endif
    endloop
    call DestroyGroup(tempgroup)
    set tempgroup = null
    set tempunit = null
	if ((IsUnitInForce(GetHealingEventTreatedUnit(), GetPlayerForce()) == true)) then
		if (Count == true) then
            call SaveTotalHealing(GetHealingEventHealingSource(),GetTotalHealing(GetHealingEventHealingSource()) + GetHealingEventHealing())
        endif
        call SetUnitHealingMultiboardItem()
    endif
endfunction

function TimerRun_Func002 takes nothing returns nothing
	local integer i
    set TIMEROUT = TIMEROUT + 1.0
    set i = 1
    loop
	    exitwhen i > zxwjs
        call SaveReal(DSHT,GetHandleId(PlayerUnit[zxwjid[i]]),StringHash("AUTotalDPS"),GetAUTotalDamage(PlayerUnit[zxwjid[i]],AppointUnit) / TIMEROUT)
        call SetUnitDPSMultiboardItem()
	    set i = i + 1
    endloop
endfunction

function Refurbish takes unit u returns nothing
    call TimerStart(TIMER,1.0,true,function TimerRun_Func002)
    call SetAppointUnit(u)
endfunction

function SetUnitHatredTrigger takes nothing returns nothing
	local trigger tr1 = CreateTrigger()
	local trigger tr2 = CreateTrigger()
	call DPSTrig_Unit_Death()
    call TriggerRegisterAnyUnitDamagedEvent( tr1, 4 )
    call TriggerRegisterAnyUnitHealingEvent( tr2 )
    call TriggerAddAction(tr1, function ActionsA)
    call TriggerAddAction(tr2, function ActionsB)
    set tr1 = null
    set tr1 = null
    set TIMER = CreateTimer()
endfunction

//============================================================================================================================================================
//=============================================单位死亡数据处理===============================================================================================
//============================================================================================================================================================

function Unit_Death_Run takes nothing returns nothing
    call FlushChildHashtable(DSHT,GetHandleId(LoadUnitHandle(DSHT,GetHandleId(GetExpiredTimer()),StringHash("TimeSaveUnit"))))
    call FlushChildHashtable(DSHT,GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction

function Unit_Death_Event_Actions takes nothing returns nothing
    local timer tm
    call EliminateHatredUnit(GetTriggerUnit())
    if (IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == false) then
	    set tm = CreateTimer()
		call SaveUnitHandle(DSHT,GetHandleId(tm),StringHash("TimeSaveUnit"),GetTriggerUnit())
		call TimerStart(tm,0.1,false,function Unit_Death_Run)
    endif
    set tm = null
endfunction

function Unit_Death_Event takes nothing returns nothing
    local trigger Unit_Death = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(Unit_Death, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddAction(Unit_Death, function Unit_Death_Event_Actions)
    set Unit_Death = null
endfunction

//============================================================================================================================================================
//=============================================多面板数据显示处理=============================================================================================
//============================================================================================================================================================

function ItemPredicableMultiboardData takes item whichitem, integer TypeID returns string
    local integer ItemID = GetItemTypeId(whichitem)	
    local string s = ""
    if (TypeID == 2) or (TypeID == 4) or (TypeID == 13) or (TypeID == 19) or (TypeID == 21) or (TypeID == 23) or (TypeID == 32) or (TypeID == 38) then
        if (GetItemData(whichitem,TypeID) == 0.0) then
	        set s = R2S(GetItemTypeData(ItemID,TypeID))
	    elseif (GetItemData(whichitem,TypeID) > 0.0) then
	        set s = R2S(GetItemTypeData(ItemID,TypeID)) + "|c000EEE00 + " + R2S(GetItemData(whichitem,TypeID)) + "|r"
	    elseif (GetItemData(whichitem,TypeID) < 0.0) then
	        set s = R2S(GetItemTypeData(ItemID,TypeID)) + "|cFFF00000 - " + R2S( - GetItemData(whichitem,TypeID)) + "|r"
        endif
    elseif (TypeID == 62) then
	    set s = I2S(GetItemIntegerData(whichitem,62)+1)
    elseif (TypeID == 63) then
        if ((GetItemTypeIntegerData(ItemID,63) >=0) and (GetItemIntegerData(whichitem,63) == 0)) then
	        set s = I2S((GetItemTypeIntegerData(ItemID,63) + GetItemIntegerData(whichitem,63))+1)
	    elseif ((GetItemTypeIntegerData(ItemID,63) >=0) and (GetItemIntegerData(whichitem,63) > 0)) then
	        set s = I2S(GetItemTypeIntegerData(ItemID,63)+1) + "|c000EEE00 + " + I2S(GetItemIntegerData(whichitem,63)) + "|r"
	    elseif ((GetItemTypeIntegerData(ItemID,63) >=0) and (GetItemIntegerData(whichitem,63) < 0)) then
	        set s = I2S(GetItemTypeIntegerData(ItemID,63)+1) + "|cFFF00000 - " + I2S( - GetItemIntegerData(whichitem,63)) + "|r"
        endif
    elseif (TypeID == 67) then
        if ((GetItemTypeIntegerData(ItemID,67) >=0) and (GetItemIntegerData(whichitem,67) == 0)) then
	        set s = I2S(GetItemTypeIntegerData(ItemID,67) + GetItemIntegerData(whichitem,67) + 1)
	    elseif ((GetItemTypeIntegerData(ItemID,67) >=0) and (GetItemIntegerData(whichitem,67) > 0)) then
	        set s = I2S(GetItemTypeIntegerData(ItemID,67) + 1) + "|c000EEE00 + " + I2S(GetItemIntegerData(whichitem,67)) + "|r"
	    elseif ((GetItemTypeIntegerData(ItemID,67) >=0) and (GetItemIntegerData(whichitem,67) < 0)) then
	        set s = I2S(GetItemTypeIntegerData(ItemID,67) + 1) + "|cFFF00000 - " + I2S( - GetItemIntegerData(whichitem,67)) + "|r"
        endif    
    elseif (TypeID == 64) then
        set s = I2S(GetItemIntegerData(whichitem,TypeID))
    elseif (TypeID == 66) then
	    set s = I2S(GetItemIntegerData(whichitem,TypeID) + 1)
	elseif (TypeID == 65) then
	    set s = I2S(GetItemTypeIntegerData(ItemID,65) + GetItemIntegerData(whichitem,65) + 1)
	else    
        if (GetItemData(whichitem,TypeID) == 0.0) then
	        set s = R2S(GetItemTypeData(ItemID,TypeID)*100.0) + "%"
	    elseif (GetItemData(whichitem,TypeID) > 0.0) then
	        set s = R2S(GetItemTypeData(ItemID,TypeID)*100.0) + "|c000EEE00 + " + R2S(GetItemData(whichitem,TypeID)*100.0) + "|r" + "%"
	    elseif (GetItemData(whichitem,TypeID) < 0.0) then
	        set s = R2S(GetItemTypeData(ItemID,TypeID)*100.0) + "|cFFF00000 - " + R2S( - GetItemData(whichitem,TypeID)*100.0) + "|r" + "%"
        endif
    endif
	return s
endfunction

function InitItemLevelMultiboard takes nothing returns nothing
	local integer i
	local integer n
	local integer m
	local integer h
	set i = 0
	loop
		exitwhen i > zxwjs
		set lb3[i] = CreateMultiboard()
        call MultiboardSetRowCount(lb3[i], 8)
        call MultiboardSetColumnCount(lb3[i], 7)
        call MultiboardSetItemStyle(MultiboardGetItem(lb3[i],0,0), true, false)
        set n = 1
        loop
        	exitwhen n > 6
        	call MultiboardSetItemStyle(MultiboardGetItem(lb3[i],0,n), true, false)
        	set n = n + 1
        endloop
        set m = 1
        loop
        	exitwhen m > 7
        	call MultiboardSetItemStyle(MultiboardGetItem(lb3[i],m,0), true, false)
        	set m = m + 1
        endloop
        set n = 1
        loop
        	exitwhen n > 6
        	set m = 1
        	loop
        		exitwhen m > 7
        		call MultiboardSetItemStyle(MultiboardGetItem(lb3[i],m,n), true, false)
        		set m = m + 1
        	endloop
        	set n = n + 1
        endloop
        call MultiboardSetTitleText(lb3[i],"物品等级属性面板")
		call MultiboardSetItemValue(MultiboardGetItem(lb3[i],0,0),"项目（按物品栏顺序）")
		call MultiboardSetItemValue(MultiboardGetItem(lb3[i],0,1),"物品一属性")
		call MultiboardSetItemValue(MultiboardGetItem(lb3[i],0,2),"物品二属性")
		call MultiboardSetItemValue(MultiboardGetItem(lb3[i],0,3),"物品三属性")
		call MultiboardSetItemValue(MultiboardGetItem(lb3[i],0,4),"物品四属性")
		call MultiboardSetItemValue(MultiboardGetItem(lb3[i],0,5),"物品五属性")
		call MultiboardSetItemValue(MultiboardGetItem(lb3[i],0,6),"物品六属性")
		call MultiboardSetItemValue(MultiboardGetItem(lb3[i],1,0),"物品名称")
		call MultiboardSetItemValue(MultiboardGetItem(lb3[i],2,0),TypeId2S(62))
		call MultiboardSetItemValue(MultiboardGetItem(lb3[i],3,0),TypeId2S(63))
		call MultiboardSetItemValue(MultiboardGetItem(lb3[i],4,0),TypeId2S(64))
		call MultiboardSetItemValue(MultiboardGetItem(lb3[i],5,0),TypeId2S(65))
		call MultiboardSetItemValue(MultiboardGetItem(lb3[i],6,0),TypeId2S(66))
		call MultiboardSetItemValue(MultiboardGetItem(lb3[i],7,0),TypeId2S(67))
		set h = 0
		loop
			exitwhen h > 7
			call MultiboardSetItemWidth(MultiboardGetItem(lb3[i],h,0),0.06)
			set h = h + 1
		endloop
		set n = 1
		loop
			exitwhen n > 6
			set m = 0
			loop
				exitwhen m > 7
				call MultiboardSetItemWidth(MultiboardGetItem(lb3[i],m,n),0.04)
				set m = m + 1
			endloop
			set n = n + 1
		endloop
		set i = i + 1
	endloop	
endfunction

function DisplayItemLevelPredicableMultiboard takes integer i ,boolean b returns nothing
    call DisplayMultibosrdToPlayer(Player(i),lb3[i],b)
endfunction

function InitHatredAndDPSMultiboard takes nothing returns nothing
	local integer m
	local integer n
	local integer h
	local integer i
	set i = 0
	loop
	    exitwhen i > zxwjs
	    set lb2[i] = CreateMultiboard()
	    call MultiboardSetRowCount(lb2[i], zxwjs + 1)
	    call MultiboardSetColumnCount(lb2[i], 6)
	    call MultiboardSetItemStyle(MultiboardGetItem(lb2[i],0,0), true, false)
	    set n = 1
	    loop
	        exitwhen n > 5
	        call MultiboardSetItemStyle(MultiboardGetItem(lb2[i],0,n), true, false)
	        set n = n + 1
	    endloop
	    set m = 1
	    loop
	        exitwhen m > zxwjs
	        call MultiboardSetItemStyle(MultiboardGetItem(lb2[i],m,0), true, false)
	        set m = m + 1
	    endloop
	    set n = 1
	    loop
	        exitwhen n > 5
	        set m = 1
	        loop
	        	exitwhen m > zxwjs
	        	call MultiboardSetItemStyle(MultiboardGetItem(lb2[i],m,n), true, false)
	        	set m = m + 1
	        endloop
	        set n = n + 1
	    endloop
		call MultiboardSetTitleText(lb2[i],"仇恨/DPS面板")
		call MultiboardSetItemValue(MultiboardGetItem(lb2[i],0,0),"项目")
		call MultiboardSetItemValue(MultiboardGetItem(lb2[i],0,1),"总伤害量")
		call MultiboardSetItemValue(MultiboardGetItem(lb2[i],0,2),"总治疗量")
		call MultiboardSetItemValue(MultiboardGetItem(lb2[i],0,3),"对单位总伤害")
		call MultiboardSetItemValue(MultiboardGetItem(lb2[i],0,4),"秒伤")
		call MultiboardSetItemValue(MultiboardGetItem(lb2[i],0,5),"仇恨值")
		set h = 1
		loop
			exitwhen h > zxwjs
			call MultiboardSetItemValue(MultiboardGetItem(lb2[i],h,0),GetPlayerName(Player(zxwjid[h])))
			set h = h + 1
		endloop
		set h = 0
		loop
			exitwhen h > zxwjs
			call MultiboardSetItemWidth(MultiboardGetItem(lb2[i],h,0),0.07)
			set h = h + 1
		endloop
		set m = 0
		loop
		    exitwhen m > zxwjs
			call MultiboardSetItemWidth(MultiboardGetItem(lb2[i],m,1),0.05)
			call MultiboardSetItemWidth(MultiboardGetItem(lb2[i],m,2),0.05)
			call MultiboardSetItemWidth(MultiboardGetItem(lb2[i],m,3),0.06)
			call MultiboardSetItemWidth(MultiboardGetItem(lb2[i],m,4),0.04)
			call MultiboardSetItemWidth(MultiboardGetItem(lb2[i],m,5),0.04)
			set m = m + 1
		endloop
		set i = i + 1
    endloop
endfunction

function DisplayHatredAndDPSMultiboard takes integer i ,boolean b returns nothing
	call DisplayMultibosrdToPlayer(Player(i),lb2[i],b)
endfunction

function SetItemPredicableMultiboardItemBuyItem takes player p, integer m, item whichitem returns nothing
	local integer n = 0
	local integer itemid
	set itemid = GetItemTypeId(whichitem)
	set n = GetPlayerId(p)
	if m <= 1 then
		set m = 1
	elseif m >= 6 then
	    set m = 6
    endif
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],1,m),GetObjectName(itemid))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],2,m),ItemPredicableMultiboardData(whichitem,2))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],3,m),ItemPredicableMultiboardData(whichitem,4))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],4,m),ItemPredicableMultiboardData(whichitem,5))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],5,m),ItemPredicableMultiboardData(whichitem,6))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],6,m),ItemPredicableMultiboardData(whichitem,7))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],7,m),ItemPredicableMultiboardData(whichitem,8))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],8,m),ItemPredicableMultiboardData(whichitem,9))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],9,m),ItemPredicableMultiboardData(whichitem,10))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],10,m),ItemPredicableMultiboardData(whichitem,11))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],11,m),ItemPredicableMultiboardData(whichitem,12))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],12,m),ItemPredicableMultiboardData(whichitem,13))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],13,m),ItemPredicableMultiboardData(whichitem,14))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],14,m),ItemPredicableMultiboardData(whichitem,15))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],15,m),ItemPredicableMultiboardData(whichitem,17))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],16,m),ItemPredicableMultiboardData(whichitem,18))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],17,m),ItemPredicableMultiboardData(whichitem,19))

	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],18,m),ItemPredicableMultiboardData(whichitem,21))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],19,m),ItemPredicableMultiboardData(whichitem,23))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],20,m),ItemPredicableMultiboardData(whichitem,24))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],21,m),ItemPredicableMultiboardData(whichitem,25))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],22,m),ItemPredicableMultiboardData(whichitem,26))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],23,m),ItemPredicableMultiboardData(whichitem,27))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],24,m),ItemPredicableMultiboardData(whichitem,28))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],25,m),ItemPredicableMultiboardData(whichitem,29))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],26,m),ItemPredicableMultiboardData(whichitem,30))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],27,m),ItemPredicableMultiboardData(whichitem,31))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],28,m),ItemPredicableMultiboardData(whichitem,32))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],29,m),ItemPredicableMultiboardData(whichitem,33))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],30,m),ItemPredicableMultiboardData(whichitem,34))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],31,m),ItemPredicableMultiboardData(whichitem,36))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],32,m),ItemPredicableMultiboardData(whichitem,37))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],33,m),ItemPredicableMultiboardData(whichitem,38))

	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],34,m),ItemPredicableMultiboardData(whichitem,39))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],35,m),ItemPredicableMultiboardData(whichitem,40))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],36,m),ItemPredicableMultiboardData(whichitem,41))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],37,m),ItemPredicableMultiboardData(whichitem,42))
	call MultiboardSetItemValue(MultiboardGetItem(lb1[n],38,m),ItemPredicableMultiboardData(whichitem,43))
	call MultiboardSetItemValue(MultiboardGetItem(lb3[n],1,m),GetObjectName(itemid))	
	call MultiboardSetItemValue(MultiboardGetItem(lb3[n],2,m),ItemPredicableMultiboardData(whichitem,62))
	call MultiboardSetItemValue(MultiboardGetItem(lb3[n],3,m),ItemPredicableMultiboardData(whichitem,63))
	call MultiboardSetItemValue(MultiboardGetItem(lb3[n],4,m),ItemPredicableMultiboardData(whichitem,64))
	call MultiboardSetItemValue(MultiboardGetItem(lb3[n],5,m),ItemPredicableMultiboardData(whichitem,65))
	call MultiboardSetItemValue(MultiboardGetItem(lb3[n],6,m),ItemPredicableMultiboardData(whichitem,66))
	call MultiboardSetItemValue(MultiboardGetItem(lb3[n],7,m),ItemPredicableMultiboardData(whichitem,67))		
endfunction

function SetItemPredicableMultiboardItem takes unit whichunit returns nothing
	local integer n
	local integer m
	local integer i
	local integer itemid
	set n = GetPlayerId(GetOwningPlayer(whichunit))
	set m = 1
    loop
    	exitwhen m > 6
    	if UnitItemInSlot(whichunit,(m - 1)) != null then
	    	set itemid = GetItemTypeId(UnitItemInSlot(whichunit,(m - 1)))
    	    call MultiboardSetItemValue(MultiboardGetItem(lb1[n],1,m),GetObjectName(itemid))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],2,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),2))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],3,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),4))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],4,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),5))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],5,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),6))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],6,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),7))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],7,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),8))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],8,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),9))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],9,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),10))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],10,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),11))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],11,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),12))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],12,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),13))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],13,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),14))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],14,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),15))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],15,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),17))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],16,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),18))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],17,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),19))
	        
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],18,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),21))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],19,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),23))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],20,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),24))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],21,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),25))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],22,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),26))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],23,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),27))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],24,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),28))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],25,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),29))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],26,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),30))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],27,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),31))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],28,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),32))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],29,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),33))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],30,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),34))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],31,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),36))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],32,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),37))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],33,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),38))
	        
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],34,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),39))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],35,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),40))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],36,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),41))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],37,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),42))
	        call MultiboardSetItemValue(MultiboardGetItem(lb1[n],38,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),43))
	        call MultiboardSetItemValue(MultiboardGetItem(lb3[n],1,m),GetObjectName(itemid))
	        call MultiboardSetItemValue(MultiboardGetItem(lb3[n],2,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),62))
	        call MultiboardSetItemValue(MultiboardGetItem(lb3[n],3,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),63))
	        call MultiboardSetItemValue(MultiboardGetItem(lb3[n],4,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),64))
	        call MultiboardSetItemValue(MultiboardGetItem(lb3[n],5,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),65))
	        call MultiboardSetItemValue(MultiboardGetItem(lb3[n],6,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),66))
	        call MultiboardSetItemValue(MultiboardGetItem(lb3[n],7,m),ItemPredicableMultiboardData(UnitItemInSlot(whichunit,(m - 1)),67))	        
	    elseif UnitItemInSlot(whichunit,(m - 1)) == null then
	        set i = 1
	        loop
	            exitwhen i > 38
	            call MultiboardSetItemValue(MultiboardGetItem(lb1[n],i,m),"")
	            set i = i + 1
	        endloop
	        set i = 1
	        loop
	            exitwhen i > 7
	                call MultiboardSetItemValue(MultiboardGetItem(lb3[n],i,m),"")	            
	            set i = i + 1
	        endloop     
	    endif
    	set m = m + 1
    endloop
endfunction

function MultiboardRefresh takes nothing returns nothing
    call SetItemPredicableMultiboardItem(LoadUnitHandle(DATA,GetHandleId(GetExpiredTimer()),StringHash("TriggerUnit")))
    if ( LoadBoolean(DATA,GetHandleId(GetExpiredTimer()),StringHash("Boolean")) == true ) then
        call UnitPredicable(LoadUnitHandle(DATA,GetHandleId(GetExpiredTimer()),StringHash("TriggerUnit")))
    endif
    call FlushChildHashtable(DATA,GetHandleId(GetExpiredTimer()))
	call DestroyTimer(GetExpiredTimer())
endfunction

function InitItemPredicableMultiboard takes nothing returns nothing
	local integer i
	local integer n
	local integer m
	local integer h
	set i = 0
	loop
		exitwhen i > zxwjs
		set lb1[i] = CreateMultiboard()
        call MultiboardSetRowCount(lb1[i], 39)
        call MultiboardSetColumnCount(lb1[i], 7)
        call MultiboardSetItemStyle(MultiboardGetItem(lb1[i],0,0), true, false)
        set n = 1
        loop
        	exitwhen n > 6
        	call MultiboardSetItemStyle(MultiboardGetItem(lb1[i],0,n), true, false)
        	set n = n + 1
        endloop
        set m = 1
        loop
        	exitwhen m > 38
        	call MultiboardSetItemStyle(MultiboardGetItem(lb1[i],m,0), true, false)
        	set m = m + 1
        endloop
        set n = 1
        loop
        	exitwhen n > 6
        	set m = 1
        	loop
        		exitwhen m > 38
        		call MultiboardSetItemStyle(MultiboardGetItem(lb1[i],m,n), true, false)
        		set m = m + 1
        	endloop
        	set n = n + 1
        endloop
        call MultiboardSetTitleText(lb1[i],"物品属性面板")
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],0,0),"项目（按物品栏顺序）")
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],0,1),"物品一属性")
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],0,2),"物品二属性")
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],0,3),"物品三属性")
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],0,4),"物品四属性")
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],0,5),"物品五属性")
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],0,6),"物品六属性")
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],1,0),"物品名称")
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],2,0),TypeId2S(2))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],3,0),TypeId2S(4))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],4,0),TypeId2S(5))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],5,0),TypeId2S(6))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],6,0),TypeId2S(7))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],7,0),TypeId2S(8))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],8,0),TypeId2S(9))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],9,0),TypeId2S(10))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],10,0),TypeId2S(11))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],11,0),TypeId2S(12))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],12,0),TypeId2S(13))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],13,0),TypeId2S(14))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],14,0),TypeId2S(15))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],15,0),TypeId2S(17))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],16,0),TypeId2S(18))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],17,0),TypeId2S(19))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],18,0),TypeId2S(21))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],19,0),TypeId2S(23))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],20,0),TypeId2S(24))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],21,0),TypeId2S(25))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],22,0),TypeId2S(26))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],23,0),TypeId2S(27))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],24,0),TypeId2S(28))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],25,0),TypeId2S(29))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],26,0),TypeId2S(30))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],27,0),TypeId2S(31))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],28,0),TypeId2S(32))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],29,0),TypeId2S(33))		
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],30,0),TypeId2S(34))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],31,0),TypeId2S(36))
	    call MultiboardSetItemValue(MultiboardGetItem(lb1[i],32,0),TypeId2S(37))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],33,0),TypeId2S(38))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],34,0),TypeId2S(39))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],35,0),TypeId2S(40))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],36,0),TypeId2S(41))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],37,0),TypeId2S(42))
		call MultiboardSetItemValue(MultiboardGetItem(lb1[i],38,0),TypeId2S(43))
		set h = 0
		loop
			exitwhen h > 38
			call MultiboardSetItemWidth(MultiboardGetItem(lb1[i],h,0),0.06)
			set h = h + 1
		endloop
		set n = 1
		loop
			exitwhen n > 6
			set m = 0
			loop
				exitwhen m > 38
				call MultiboardSetItemWidth(MultiboardGetItem(lb1[i],m,n),0.04)
				set m = m + 1
			endloop
			set n = n + 1
		endloop
		set i = i + 1
	endloop
endfunction

function DisplayItemPredicableMultiboard takes integer i ,boolean b returns nothing
    call DisplayMultibosrdToPlayer(Player(i),lb1[i],b)
endfunction

function SetUnitPredicableMultiboardItemForPlayer takes player p,unit whichunit returns nothing
	local integer n = 0
    set n = GetPlayerId(p)	
    call UnitPredicable(whichunit)
	call MultiboardSetItemValue(MultiboardGetItem(lb[n],1,1),TypeId2S(GetType(GetHandleId(whichunit),1)))
	call MultiboardSetItemValue(MultiboardGetItem(lb[n],2,1),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(2))))
	call MultiboardSetItemValue(MultiboardGetItem(lb[n],3,1),TypeId2S(GetType(GetHandleId(whichunit),3)))
	call MultiboardSetItemValue(MultiboardGetItem(lb[n],4,1),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(4))))
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],5,1),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(5)) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],6,1),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(6)) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],7,1),R2S((GetTypeData(GetHandleId(whichunit),TypeKey0(7)) + 1.0) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],8,1),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(8)) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],9,1),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(9)) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],10,1),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(10)) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],11,1),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(11)) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],12,1),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(12)) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],13,1),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(13))))
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],14,1),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(14)) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],15,1),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(15)) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],16,1),R2S((GetTypeData(GetHandleId(whichunit),TypeKey0(17)) + 1.0) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],17,1),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(18)) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],18,1),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(19))))

	call MultiboardSetItemValue(MultiboardGetItem(lb[n],1,3),TypeId2S(GetType(GetHandleId(whichunit),20)))
	call MultiboardSetItemValue(MultiboardGetItem(lb[n],2,3),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(21))))
	call MultiboardSetItemValue(MultiboardGetItem(lb[n],3,3),TypeId2S(GetType(GetHandleId(whichunit),22)))
	call MultiboardSetItemValue(MultiboardGetItem(lb[n],4,3),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(23))))
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],5,3),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(24)) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],6,3),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(25)) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],7,3),R2S((GetTypeData(GetHandleId(whichunit),TypeKey0(26)) + 1.0) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],8,3),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(27)) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],9,3),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(28)) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],10,3),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(29)) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],11,3),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(30)) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],12,3),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(31)) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],13,3),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(32))))
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],14,3),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(33)) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],15,3),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(34)) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],16,3),R2S((GetTypeData(GetHandleId(whichunit),TypeKey0(36)) + 1.0) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],17,3),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(37)) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],18,3),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(38))))
	if (GetTypeBoolean(GetHandleId(whichunit),68) == false) then
	    call MultiboardSetItemValue(MultiboardGetItem(lb[n],1,5),"物理伤害")
	else
	    call MultiboardSetItemValue(MultiboardGetItem(lb[n],1,5),"法术伤害")
	endif
	if (GetTypeBoolean(GetHandleId(whichunit),69) == true) then
	    call MultiboardSetItemValue(MultiboardGetItem(lb[n],2,5),"物理伤害")
	else
	    call MultiboardSetItemValue(MultiboardGetItem(lb[n],2,5),"法术伤害")
	endif
	call MultiboardSetItemValue(MultiboardGetItem(lb[n],3,5),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(39))))
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],4,5),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(40)) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],5,5),R2S((GetTypeData(GetHandleId(whichunit),TypeKey0(41)) + 1.0) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],6,5),R2S((GetTypeData(GetHandleId(whichunit),TypeKey0(42)) + 1.0) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],7,5),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(43)) * 100.0)+"%")
    
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],8,5),R2S((GetTypeData(GetHandleId(whichunit),TypeKey0(45)) + 1.0) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],9,5),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(46)) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],10,5),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(47))))
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],11,5),R2S((GetTypeData(GetHandleId(whichunit),TypeKey0(70)) + 1.0) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],12,5),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(71)) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],13,5),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(72))))
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],14,5),R2S((GetTypeData(GetHandleId(whichunit),TypeKey0(73)) + 1.0) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],15,5),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(74)) * 100.0)+"%")
    call MultiboardSetItemValue(MultiboardGetItem(lb[n],16,5),R2S(GetTypeData(GetHandleId(whichunit),TypeKey0(75))))
endfunction	

function SetUnitPredicableMultiboardItem takes unit whichunit returns nothing
    call SetUnitPredicableMultiboardItemForPlayer(GetOwningPlayer(whichunit),whichunit)
endfunction

function InitUnitPredicableMultiboard takes nothing returns nothing
	local integer i
	local integer m
	local integer h
	set i = 0
	loop
		exitwhen i > zxwjs
		set lb[i] = CreateMultiboard()
        call MultiboardSetRowCount(lb[i], 19)
        call MultiboardSetColumnCount(lb[i], 6)
        set m = 0
        loop
        	exitwhen m > 18
            call MultiboardSetItemStyle(MultiboardGetItem(lb[i],m,0), true, false)
            call MultiboardSetItemStyle(MultiboardGetItem(lb[i],m,1), true, false)
            call MultiboardSetItemStyle(MultiboardGetItem(lb[i],m,2), true, false)
            call MultiboardSetItemStyle(MultiboardGetItem(lb[i],m,3), true, false)
            call MultiboardSetItemStyle(MultiboardGetItem(lb[i],m,4), true, false)
            call MultiboardSetItemStyle(MultiboardGetItem(lb[i],m,5), true, false)            
        	set m = m + 1
        endloop
		call MultiboardSetTitleText(lb[i],"单位属性面板")
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],0,0),"项目")
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],0,1),"属性值")
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],0,2),"项目")
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],0,3),"属性值")
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],0,4),"项目")
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],0,5),"属性值")

		call MultiboardSetItemValue(MultiboardGetItem(lb[i],1,0),TypeId2S(1))
        call MultiboardSetItemValue(MultiboardGetItem(lb[i],2,0),TypeId2S(2))
        call MultiboardSetItemValue(MultiboardGetItem(lb[i],3,0),TypeId2S(3))
        call MultiboardSetItemValue(MultiboardGetItem(lb[i],4,0),TypeId2S(4))
        call MultiboardSetItemValue(MultiboardGetItem(lb[i],5,0),TypeId2S(5))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],6,0),TypeId2S(6))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],7,0),TypeId2S(7))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],8,0),TypeId2S(8))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],9,0),TypeId2S(9))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],10,0),TypeId2S(10))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],11,0),TypeId2S(11))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],12,0),TypeId2S(12))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],13,0),TypeId2S(13))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],14,0),TypeId2S(14))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],15,0),TypeId2S(15))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],16,0),TypeId2S(17))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],17,0),TypeId2S(18))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],18,0),TypeId2S(19))
		
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],1,2),TypeId2S(20))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],2,2),TypeId2S(21))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],3,2),TypeId2S(22))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],4,2),TypeId2S(23))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],5,2),TypeId2S(24))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],6,2),TypeId2S(25))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],7,2),TypeId2S(26))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],8,2),TypeId2S(27))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],9,2),TypeId2S(28))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],10,2),TypeId2S(29))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],11,2),TypeId2S(30))
        call MultiboardSetItemValue(MultiboardGetItem(lb[i],12,2),TypeId2S(31))
        call MultiboardSetItemValue(MultiboardGetItem(lb[i],13,2),TypeId2S(32))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],14,2),TypeId2S(33))
        call MultiboardSetItemValue(MultiboardGetItem(lb[i],15,2),TypeId2S(34))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],16,2),TypeId2S(36))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],17,2),TypeId2S(37))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],18,2),TypeId2S(38))

		call MultiboardSetItemValue(MultiboardGetItem(lb[i],1,4),"普攻伤害类型")
        call MultiboardSetItemValue(MultiboardGetItem(lb[i],2,4),"技能伤害类型")
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],3,4),TypeId2S(39))
        call MultiboardSetItemValue(MultiboardGetItem(lb[i],4,4),TypeId2S(40))
        call MultiboardSetItemValue(MultiboardGetItem(lb[i],5,4),TypeId2S(41))
        call MultiboardSetItemValue(MultiboardGetItem(lb[i],6,4),TypeId2S(42))
        call MultiboardSetItemValue(MultiboardGetItem(lb[i],7,4),TypeId2S(43))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],8,4),TypeId2S(45))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],9,4),TypeId2S(46))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],10,4),TypeId2S(47))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],11,4),TypeId2S(70))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],12,4),TypeId2S(71))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],13,4),TypeId2S(72))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],14,4),TypeId2S(73))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],15,4),TypeId2S(74))
		call MultiboardSetItemValue(MultiboardGetItem(lb[i],16,4),TypeId2S(75))	
		set h = 0
		loop
			exitwhen h > 18
			call MultiboardSetItemWidth(MultiboardGetItem(lb[i],h,0),0.06)
			call MultiboardSetItemWidth(MultiboardGetItem(lb[i],h,1),0.04)
			call MultiboardSetItemWidth(MultiboardGetItem(lb[i],h,2),0.06)
			call MultiboardSetItemWidth(MultiboardGetItem(lb[i],h,3),0.04)
			call MultiboardSetItemWidth(MultiboardGetItem(lb[i],h,4),0.06)
			call MultiboardSetItemWidth(MultiboardGetItem(lb[i],h,5),0.04)			
			set h = h + 1
		endloop
		set i = i + 1
	endloop
endfunction

function DisplayUnitPredicableMultiboard takes integer i , boolean b returns nothing
	call DisplayMultibosrdToPlayer(Player(i),lb[i],b)
endfunction

function SwitchMultiboard_Actions takes nothing returns nothing
    if ((Switch[GetPlayerId(GetTriggerPlayer())] == 0)) then
	    call DisplayHatredAndDPSMultiboard(GetPlayerId(GetTriggerPlayer()),true)
    elseif ((Switch[GetPlayerId(GetTriggerPlayer())] == 1)) then
        call DisplayUnitPredicableMultiboard(GetPlayerId(GetTriggerPlayer()),true)
    elseif ((Switch[GetPlayerId(GetTriggerPlayer())] == 2)) then
        if (DisplayItemLevelBool == false) then
            set Switch[GetPlayerId(GetTriggerPlayer())] = -1
            call DisplayItemLevelPredicableMultiboard(GetPlayerId(GetTriggerPlayer()),false)
        endif
        call DisplayItemPredicableMultiboard(GetPlayerId(GetTriggerPlayer()),true)
    elseif ((Switch[GetPlayerId(GetTriggerPlayer())] == 3)) then 
        if (DisplayItemLevelBool == true) then
            set Switch[GetPlayerId(GetTriggerPlayer())] = -1
            call DisplayItemLevelPredicableMultiboard(GetPlayerId(GetTriggerPlayer()),true)
        endif    
    endif
	set Switch[GetPlayerId(GetTriggerPlayer())] = Switch[GetPlayerId(GetTriggerPlayer())] + 1
endfunction

function SwitchMultiboard takes nothing returns nothing
    local trigger tr = CreateTrigger()
    local integer n = 0
    loop
        exitwhen n > 11
        call TriggerRegisterPlayerEvent(tr, Player(n), EVENT_PLAYER_END_CINEMATIC)
        set n = n + 1
    endloop
    call TriggerAddAction(tr, function SwitchMultiboard_Actions)
    set tr = null
endfunction

//============================================================================================================================================================
//=============================================单位操作物品触发===============================================================================================
//============================================================================================================================================================

function SetItemTypeName takes integer itemid,string typename returns nothing
    if (typename == "") then
        set typename = "null"
    endif
    call SaveStr(DSITHT,itemid,60,typename)
endfunction

function SetItemTypeNumberMax takes string typename,integer number returns nothing
    call SaveInteger(DSITHT,StringHash(typename),61,number)
endfunction

function GetItemTypeNumberMax takes string typename returns integer
    return LoadInteger(DSITHT,StringHash(typename),61)
endfunction

function GetItemTypeName takes integer itemid returns string
    return LoadStr(DSITHT,itemid,60)
endfunction

function TimerRunAction takes unit whichunit, boolean b returns nothing
	local timer t
	set t = CreateTimer()
	call SaveUnitHandle(DATA,GetHandleId(t),StringHash("TriggerUnit"),whichunit)
	call SaveBoolean(DATA,GetHandleId(t),StringHash("Boolean"),b)
	call TimerStart(t,0.00,false,function MultiboardRefresh)
	set t = null
endfunction

function func_B takes nothing returns nothing
	local unit whichunit = LoadUnitHandle(DATA,GetHandleId(GetExpiredTimer()),StringHash("TriggerUnit"))
	local item whichitem = LoadItemHandle(DATA,GetHandleId(GetExpiredTimer()),StringHash("ManipulatedItem"))
    local integer UnitHandleId = StringHash(I2S(10)+I2S(GetHandleId(whichunit))+I2S(1))
    local integer i = LoadInteger(DATA,GetHandleId(GetExpiredTimer()),StringHash("i"))	
    call UnitRemoveItem(whichunit,whichitem)
    call DestroyIndex( UnitHandleId, i )
    call FlushChildHashtable(DSITHT,GetHandleId(GetManipulatedItem()))
    call DisplayTextToPlayer(GetOwningPlayer(whichunit),0,0,str1)    
	call FlushChildHashtable(DATA,GetHandleId(GetExpiredTimer()))
	call DestroyTimer(GetExpiredTimer())
	set whichunit = null
	set whichitem = null
endfunction

function UNIT_PICKUP_ITEM_Actions takes nothing returns nothing
    local unit u = null
    local integer i = 0
    local integer n = 0
    local integer k = 1
    local integer UnitHandleId = StringHash(I2S(10)+I2S(GetHandleId(GetTriggerUnit()))+I2S(1))
    local boolean b = false
    local boolean b0 = false
	local timer t  
    if (GetUnitTypeId(GetTriggerUnit()) != ITEM_SLOT_UNIT_TYPE) and (GetItemTypeId(GetManipulatedItem()) != 'stpg') then
        set i = 1
        loop
            exitwhen i > GetMaxIndex(UnitHandleId)
            if ((LoadInteger(DSITHT, GetHandleId(GetTriggerUnit()), i) == GetHandleId(GetManipulatedItem()))) then
                set b = true
                exitwhen true
            else
                set b = false
            endif
            set i = i + 1
        endloop
        if (b == false) then
            set n = 1
            loop
                exitwhen n > GetMaxIndex(UnitHandleId)
                if (GetItemTypeName((GetItemTypeId(LoadItemHandle(DSITHT, LoadInteger(DSITHT,GetHandleId(GetTriggerUnit()),n),0x100001)))) == GetItemTypeName(GetItemTypeId(GetManipulatedItem()))) then
                    if (GetItemTypeNumberMax(GetItemTypeName(GetItemTypeId(GetManipulatedItem()))) > 0) then
                        set k = k + 1
                        if (k > GetItemTypeNumberMax(GetItemTypeName(GetItemTypeId(GetManipulatedItem())))) then
	                        set t = CreateTimer()  
                        	call SaveUnitHandle(DATA,GetHandleId(t),StringHash("TriggerUnit"),GetTriggerUnit())
							call SaveItemHandle(DATA,GetHandleId(t),StringHash("ManipulatedItem"),GetManipulatedItem())
							call SaveInteger(DATA,GetHandleId(t),StringHash("i"),i)
							call TimerStart(t,0.00,false,function func_B)
							set t = null
                            set b0 = true
                            exitwhen true
                        else
                            set b0 = false
                        endif
                    endif
                else
                    set b0 = false
                endif
                set n = n + 1
            endloop
            if (b0 == false) then
                call SaveInteger(DSITHT, GetHandleId(GetTriggerUnit()), CreateIndex(UnitHandleId), GetHandleId(GetManipulatedItem()) )
                call SaveItemHandle(DSITHT, GetHandleId(GetManipulatedItem()),0x100001, GetManipulatedItem() )
                if ((GetItemCharges(GetManipulatedItem()) >= 1)) then
                    call SaveBoolean(DSITHT, GetItemTypeId(GetManipulatedItem()),0, true )
                else
                    call SaveBoolean(DSITHT, GetItemTypeId(GetManipulatedItem()),0, false )
                endif
            endif
        endif
    else
        set u = LoadUnitHandle(DSITHT,GetHandleId(GetManipulatedItem()),0x100002)
        call SaveInteger(DSITHT, GetHandleId(u), CreateIndex(StringHash(I2S(10)+I2S(GetHandleId(u))+I2S(1))), GetHandleId(GetManipulatedItem()) )
        call SaveItemHandle(DSITHT, GetHandleId(GetManipulatedItem()),0x100001, GetManipulatedItem() )
        if ((GetItemCharges(GetManipulatedItem()) >= 1)) then
            call SaveBoolean(DSITHT, GetItemTypeId(GetManipulatedItem()),0, true )
        else
            call SaveBoolean(DSITHT, GetItemTypeId(GetManipulatedItem()),0, false )
        endif
    endif
    call SetUnitPredicableMultiboardItem( GetTriggerUnit() )
    call SetItemPredicableMultiboardItem( GetTriggerUnit() )
    call TimerRunAction(GetTriggerUnit(),true)
    set u = null
endfunction

function UNIT_PICKUP_ITEM takes nothing returns nothing
    local trigger tr
    set tr = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( tr, EVENT_PLAYER_UNIT_PICKUP_ITEM )
    call TriggerAddAction(tr, function UNIT_PICKUP_ITEM_Actions)
    set tr = null
endfunction

function UNIT_USE_ITEM_Actions takes nothing returns nothing
    local integer i
    local integer UnitHandleId = StringHash(I2S(10)+I2S(GetHandleId(GetTriggerUnit()))+I2S(1))
    if ((LoadBoolean(DSITHT, GetItemTypeId(GetManipulatedItem()), 0) == true) and (GetItemCharges(GetManipulatedItem()) == 0)) then
        set i = 1
        loop
            exitwhen i > GetMaxIndex(UnitHandleId)
            if ((LoadInteger(DSITHT, GetHandleId(GetTriggerUnit()), i) == GetHandleId(GetManipulatedItem()))) then
                call SaveInteger(DSITHT, GetHandleId(GetTriggerUnit()), i, 0 )
                call DestroyIndex( UnitHandleId, i )
                call FlushChildHashtable(DSITHT,GetHandleId(GetManipulatedItem()))
            endif
            set i = i + 1
        endloop
    endif
    call SetUnitPredicableMultiboardItem( GetTriggerUnit() )
    call SetItemPredicableMultiboardItem( GetTriggerUnit() )
    call TimerRunAction(GetTriggerUnit(),true)
endfunction

function UNIT_USE_ITEM takes nothing returns nothing
    local trigger tr
    set tr = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(tr, EVENT_PLAYER_UNIT_USE_ITEM )
    call TriggerAddAction(tr, function UNIT_USE_ITEM_Actions)
    set tr = null
endfunction

function UNIT_DROP_ITEM_Actions takes nothing returns nothing
    local integer i
    local integer UnitHandleId = StringHash(I2S(10)+I2S(GetHandleId(GetTriggerUnit()))+I2S(1))
    set i = 1
    loop
        exitwhen i > GetMaxIndex(UnitHandleId)
        if ((LoadInteger(DSITHT, GetHandleId(GetTriggerUnit()), i) == GetHandleId(GetManipulatedItem()))) then
            call SaveInteger(DSITHT, GetHandleId(GetTriggerUnit()), i, 0 )
            call DestroyIndex( UnitHandleId, i )
            if (GetUnitTypeId(GetTriggerUnit()) != ITEM_SLOT_UNIT_TYPE) and (GetItemTypeId(GetManipulatedItem()) != 'stpg') then
                call SaveUnitHandle(DSITHT,GetHandleId(GetManipulatedItem()),0x100002,GetTriggerUnit())
            endif
        endif
        set i = i + 1
    endloop
    call SetUnitPredicableMultiboardItem( GetTriggerUnit() )
    call SetItemPredicableMultiboardItem( GetTriggerUnit() )
    call TimerRunAction(GetTriggerUnit(),true)
endfunction

function UNIT_DROP_ITEM takes nothing returns nothing
    local trigger tr
    set tr = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(tr, EVENT_PLAYER_UNIT_DROP_ITEM )
    call TriggerAddAction(tr, function UNIT_DROP_ITEM_Actions)
    set tr = null
endfunction

function UNIT_SELL_ITEM_Actions takes nothing returns nothing
    local integer i
    local integer UnitHandleId = StringHash(I2S(10)+I2S(GetHandleId(GetTriggerUnit()))+I2S(1))
    set i = 1
    loop
        exitwhen i > GetMaxIndex(UnitHandleId)
        if ((LoadInteger(DSITHT, GetHandleId(GetTriggerUnit()), i) == GetHandleId(GetManipulatedItem()))) then
            call SaveInteger(DSITHT, GetHandleId(GetTriggerUnit()), i, 0 )
            call DestroyIndex( UnitHandleId, i )
            call FlushChildHashtable(DSITHT,GetHandleId(GetManipulatedItem()))
        endif
        set i = i + 1
    endloop
    call SetUnitPredicableMultiboardItem( GetTriggerUnit() )
    call SetItemPredicableMultiboardItem( GetTriggerUnit() )
    call TimerRunAction(GetTriggerUnit(),true)
endfunction

function UNIT_SELL_ITEM takes nothing returns nothing
    local trigger tr
    set tr = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(tr, EVENT_PLAYER_UNIT_SELL_ITEM )
    call TriggerRegisterAnyUnitEventBJ(tr, EVENT_PLAYER_UNIT_PAWN_ITEM )
    call TriggerAddAction(tr, function UNIT_DROP_ITEM_Actions)
    set tr = null
endfunction

function UNIT_MOVE_ITEM_Actions takes nothing returns nothing
	call SetUnitPredicableMultiboardItem( GetTriggerUnit() )
	call SetItemPredicableMultiboardItem( GetTriggerUnit() )
    call TimerRunAction(GetTriggerUnit(),false)
endfunction

function UNIT_MOVE_ITEM takes nothing returns nothing
    local trigger tr
    set tr = CreateTrigger()
    call YDWESyStemItemUnmovableRegistTrigger(tr)
    call TriggerAddAction(tr, function UNIT_MOVE_ITEM_Actions)
    set tr = null
endfunction

//============================================================================================================================================================
//=============================================物品等级及强化函数定义============================================================================================
//============================================================================================================================================================

function GetItemUpgradeEventItem takes nothing returns item
    return LoadItemHandle(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("TriggeredItem"))
endfunction

function GetItemUpgradeEventUnit takes nothing returns unit
    return LoadUnitHandle(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("OperatingUnit"))
endfunction

function TriggerRegisterAnyItemUpgradeEvent takes trigger t returns nothing
    set ItemLevelListEnd = ItemLevelListEnd + 1
    set ItemLevelNextIndex[ItemLevelListEnd - 1] = ItemLevelListEnd
    set ItemLevelLastIndex[ItemLevelListEnd] = ItemLevelListEnd - 1
    set ItemLevelTriggerList[ItemLevelListEnd] = t
endfunction

function ItemUpgradeEventTriggerListExecute takes unit OperatingUnit, item TriggeredItem returns nothing
    local integer index = 0
    set index = ItemLevelNextIndex[0]
    loop
        exitwhen (index == 0)
        exitwhen (index > ItemLevelListEnd)
        if (IsTriggerEnabled(ItemLevelTriggerList[index])) and (TriggerEvaluate(ItemLevelTriggerList[index])) then
            call SaveItemHandle(DATA,GetHandleId(ItemLevelTriggerList[index]),StringHash("TriggeredItem"),TriggeredItem)
            call SaveUnitHandle(DATA,GetHandleId(ItemLevelTriggerList[index]),StringHash("OperatingUnit"),OperatingUnit)
            call TriggerExecute(ItemLevelTriggerList[index])
        endif
        set index = ItemLevelNextIndex[index]
    endloop
endfunction

function DestroyAnyItemUpgradeEvent takes trigger t returns nothing
    local integer index = 0
    set index = ItemLevelNextIndex[0]
    loop
        exitwhen (index == 0)
        exitwhen (ItemLevelTriggerList[index] == t)
        set index = ItemLevelNextIndex[index]
    endloop
    call FlushChildHashtable(DATA,GetHandleId(t))
    if (index > 0) then
        set ItemLevelNextIndex[ItemLevelLastIndex[index]] = ItemLevelNextIndex[index]
        set ItemLevelLastIndex[ItemLevelNextIndex[index]] = ItemLevelLastIndex[index]
    endif
endfunction

function ItemUpgrade takes unit whichunit, item whichitem returns nothing
	local integer Level = GetItemIntegerData(whichitem,62) + 1
	local integer MaxLevel = GetItemTypeIntegerData(GetItemTypeId(whichitem),63) + GetItemIntegerData(whichitem,63) + 1
	if ((Level + 1) <= MaxLevel ) then
		set Level = Level + 1
	    call SetItemIntegerData(whichitem,62,Level - 1)
	    call ItemUpgradeEventTriggerListExecute(whichunit,whichitem)
	    call DisplayTextToPlayer(GetOwningPlayer(whichunit),0.0,0.0,"|c000EEE00"+GetPlayerName(GetOwningPlayer(whichunit))+"的"+GetItemName(whichitem)+"已经成功升级！|r")
	elseif ((Level + 1) > MaxLevel ) then
        call DisplayTextToPlayer(GetOwningPlayer(whichunit),0.0,0.0,"|cFFF00000"+GetPlayerName(GetOwningPlayer(whichunit))+"的"+GetItemName(whichitem)+"已经达到最大级别！|r")
    endif
    call SetItemPredicableMultiboardItem(whichunit)
endfunction

function SetItemExperience takes unit whichunit, item whichitem, integer Experience returns nothing
    local integer Max = GetItemTypeIntegerData(GetItemTypeId(whichitem),65) + GetItemIntegerData(whichitem,65) + 1
    if (Experience <= 0) then
	    call SetItemIntegerData(whichitem,64,0)
	elseif (Experience > 0) then
	    call SetItemIntegerData(whichitem,64,GetItemIntegerData(whichitem,64) + Experience)
    endif
    if (GetItemIntegerData(whichitem,64) >= Max) then
        loop
            exitwhen GetItemIntegerData(whichitem,64) < Max
            call ItemUpgrade(whichunit,whichitem)
            call SetItemIntegerData(whichitem,64,GetItemIntegerData(whichitem,64) - Max)
        endloop
    endif
    call SetItemPredicableMultiboardItem(whichunit)
endfunction

function SetUnitItemExperience takes unit whichunit, integer index, integer Experience returns nothing
	call SetItemExperience(whichunit,UnitItemInSlot(whichunit,index),Experience)
endfunction

function TriggerRegisterAnyItemPowerEvent takes trigger t, integer a returns nothing
	if (a == 0) then
	    set IPUL_ListEnd = IPUL_ListEnd + 1
	    set IPUL_NextIndex[IPUL_ListEnd - 1] = IPUL_ListEnd
	    set IPUL_LastIndex[IPUL_ListEnd] = IPUL_ListEnd - 1
	    set IPUL_TriggerList[IPUL_ListEnd] = t
	elseif (a == 1) then
	    set IPDL_ListEnd = IPDL_ListEnd + 1
	    set IPDL_NextIndex[IPDL_ListEnd - 1] = IPDL_ListEnd
	    set IPDL_LastIndex[IPDL_ListEnd] = IPDL_ListEnd - 1
	    set IPDL_TriggerList[IPDL_ListEnd] = t
	endif
endfunction

function GetItemPowerUpEventItem takes nothing returns item
    return LoadItemHandle(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("PowerUpItem"))
endfunction

function GetItemPowerUpEventUnit takes nothing returns unit
    return LoadUnitHandle(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("OPU_Unit"))
endfunction

function ItemPowerUpEventTriggerListExecute takes unit OperatingUnit, item TriggeredItem returns nothing
    local integer index = 0
    set index = IPUL_NextIndex[0]
    loop
        exitwhen (index == 0)
        exitwhen (index > IPUL_ListEnd)
        if (IsTriggerEnabled(IPUL_TriggerList[index])) and (TriggerEvaluate(IPUL_TriggerList[index])) then
            call SaveItemHandle(DATA,GetHandleId(IPUL_TriggerList[index]),StringHash("PowerUpItem"),TriggeredItem)
            call SaveUnitHandle(DATA,GetHandleId(IPUL_TriggerList[index]),StringHash("OPU_Unit"),OperatingUnit)
            call TriggerExecute(IPUL_TriggerList[index])
        endif
        set index = IPUL_NextIndex[index]
    endloop
endfunction

function DestroyAnyItemPowerUpEvent takes trigger t returns nothing
    local integer index = 0
    set index = IPUL_NextIndex[0]
    loop
        exitwhen (index == 0)
        exitwhen (IPUL_TriggerList[index] == t)
        set index = IPUL_NextIndex[index]
    endloop
    call FlushChildHashtable(DATA,GetHandleId(t))
    if (index > 0) then
        set IPUL_NextIndex[IPUL_LastIndex[index]] = IPUL_NextIndex[index]
        set IPUL_LastIndex[IPUL_NextIndex[index]] = IPUL_LastIndex[index]
    endif
endfunction

function GetItemPowerDownEventItem takes nothing returns item
    return LoadItemHandle(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("PowerDownItem"))
endfunction

function GetItemPowerDownEventUnit takes nothing returns unit
    return LoadUnitHandle(DATA,GetHandleId(GetTriggeringTrigger()),StringHash("OPD_Unit"))
endfunction

function ItemPowerDownEventTriggerListExecute takes unit OperatingUnit, item TriggeredItem returns nothing
    local integer index = 0
    set index = IPDL_NextIndex[0]
    loop
        exitwhen (index == 0)
        exitwhen (index > IPDL_ListEnd)
        if (IsTriggerEnabled(IPDL_TriggerList[index])) and (TriggerEvaluate(IPDL_TriggerList[index])) then
            call SaveItemHandle(DATA,GetHandleId(IPDL_TriggerList[index]),StringHash("PowerDownItem"),TriggeredItem)
            call SaveUnitHandle(DATA,GetHandleId(IPDL_TriggerList[index]),StringHash("OPD_Unit"),OperatingUnit)
            call TriggerExecute(IPDL_TriggerList[index])
        endif
        set index = IPDL_NextIndex[index]
    endloop
endfunction

function DestroyAnyItemPowerDownEvent takes trigger t returns nothing
    local integer index = 0
    set index = IPDL_NextIndex[0]
    loop
        exitwhen (index == 0)
        exitwhen (IPDL_TriggerList[index] == t)
        set index = IPDL_NextIndex[index]
    endloop
    call FlushChildHashtable(DATA,GetHandleId(t))
    if (index > 0) then
        set IPDL_NextIndex[IPDL_LastIndex[index]] = IPDL_NextIndex[index]
        set IPDL_LastIndex[IPDL_NextIndex[index]] = IPDL_LastIndex[index]
    endif
endfunction

function SetItemPowerUpLevel takes unit whichunit, item whichitem returns nothing
	local integer Level = GetItemIntegerData(whichitem,66) + 1
	local integer MaxLevel = GetItemTypeIntegerData(GetItemTypeId(whichitem),67) + GetItemIntegerData(whichitem,67) + 1
	if ((Level + 1) <= MaxLevel ) then
	    set Level = Level + 1
        call SetItemIntegerData(whichitem,66,Level - 1)
	    call ItemPowerUpEventTriggerListExecute(whichunit,whichitem)
	    call DisplayTextToPlayer(GetOwningPlayer(whichunit),0.0,0.0,"|c000EEE00"+GetPlayerName(GetOwningPlayer(whichunit))+"的"+GetItemName(whichitem)+"已经成功强化！|r")
	elseif ((Level + 1) > MaxLevel ) then
        call DisplayTextToPlayer(GetOwningPlayer(whichunit),0.0,0.0,"|cFFF00000"+GetPlayerName(GetOwningPlayer(whichunit))+"的"+GetItemName(whichitem)+"已经达到最大强化级别！|r")
    endif
    call SetItemPredicableMultiboardItem(whichunit)
endfunction

function SetItemPowerDownLevel takes unit whichunit, item whichitem returns nothing
	local integer Level = GetItemIntegerData(whichitem,66) + 1
	local integer MaxLevel = GetItemTypeIntegerData(GetItemTypeId(whichitem),67) + GetItemIntegerData(whichitem,67) + 1
	if ((Level - 1) >= 1 ) then
	    set Level = Level - 1
        call SetItemIntegerData(whichitem,66,Level - 1)
	    call ItemPowerDownEventTriggerListExecute(whichunit,whichitem)
	    call DisplayTextToPlayer(GetOwningPlayer(whichunit),0.0,0.0,"|cFFF00000"+GetPlayerName(GetOwningPlayer(whichunit))+"的"+GetItemName(whichitem)+"强化失败，强化等级降低！|r")
    endif
    call SetItemPredicableMultiboardItem(whichunit)
endfunction

function SetItemPowerLevel takes unit whichunit, integer a, item whichitem returns nothing
	if (a == 0) then
	    call SetItemPowerUpLevel(whichunit,whichitem)
	elseif (a == 1) then
	    call SetItemPowerDownLevel(whichunit,whichitem)
	endif
endfunction

//============================================================================================================================================================
//=============================================删除对象数据函数定义===========================================================================================
//============================================================================================================================================================

function DeleteUnitAndData takes unit whichunit returns nothing
	call RemoveUnit(whichunit)
	call EliminateHatredUnit(whichunit)
	call FlushChildHashtable(DSHT,GetHandleId(whichunit))
endfunction

function DeleteItemAndData takes item whichitem returns nothing
	call RemoveItem(whichitem)
	call FlushChildHashtable(DSITHT,GetHandleId(whichitem))
endfunction

//============================================================================================================================================================
//=============================================其他UI接口函数定义=============================================================================================
//============================================================================================================================================================

function InitMultiboardSystem takes boolean b returns nothing
    call InitUnitPredicableMultiboard()
    call InitItemPredicableMultiboard()
    call InitHatredAndDPSMultiboard()
    call InitItemLevelMultiboard()
    call UNIT_MOVE_ITEM()
    if (b == true) then
        call SwitchMultiboard()
    endif
endfunction

function func_A takes nothing returns nothing
	call InitMultiboardSystem( true )
    call DisableTrigger( GetTriggeringTrigger() )
    call DestroyTrigger( GetTriggeringTrigger() )
endfunction

function AutoInitMultiboardSystem takes nothing returns nothing
    local trigger tr = CreateTrigger()
    call TriggerRegisterTimerEvent(tr, 0.00, false)
    call TriggerAddAction(tr, function func_A)
    set tr = null
endfunction

function HERO_LEVELActions takes nothing returns nothing
    local integer unitid = GetUnitTypeId(GetTriggerUnit())
    local real a = 0.0
    local real array b
    local real c = 0.0
    local real array d
    local integer i = 0
    local integer n = 0
    set a = GetTypeData(unitid,TypeKey(2))
    call SetTypeData(GetHandleId(GetTriggerUnit()),TypeKey(2),a*(GetHeroLevel(GetTriggerUnit())-1))
    set i = 4
    loop
        exitwhen i > 12
        set b[i-4] = GetTypeData(unitid,TypeKey(i))
        call SetTypeData(GetHandleId(GetTriggerUnit()),TypeKey(i),b[i-4]*(GetHeroLevel(GetTriggerUnit())-1))
        set i = i + 1
    endloop
    set c = GetTypeData(unitid,TypeKey(21))
    call SetTypeData(GetHandleId(GetTriggerUnit()),TypeKey(21),c*(GetHeroLevel(GetTriggerUnit())-1))
    set n = 23
    loop
        exitwhen n > 31
        set d[n-23] = GetTypeData(unitid,TypeKey(n))
        call SetTypeData(GetHandleId(GetTriggerUnit()),TypeKey(n),d[n-23]*(GetHeroLevel(GetTriggerUnit())-1))
        set n = n + 1
    endloop
    call UnitPredicable(GetTriggerUnit())
    call SetUnitPredicableMultiboardItem( GetTriggerUnit() )
endfunction

function HeroLevelUpTrigger takes nothing returns nothing
    local trigger tr
    set tr = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(tr, EVENT_PLAYER_HERO_LEVEL)
    call TriggerAddAction(tr, function HERO_LEVELActions)
    set tr = null
endfunction

function HeroLevelUp takes integer unitid, real a, real b, real c, real d returns nothing
    call SetTypeData(unitid,TypeKey(2),a)     
    call SetTypeData(unitid,TypeKey(4),b)     
    call SetTypeData(unitid,TypeKey(21),c)     
    call SetTypeData(unitid,TypeKey(23),d)     
endfunction

function HeroLevelUpAddData takes integer unitid, integer typeid, real a returns nothing
    call SetTypeData(unitid,TypeKey(typeid),a)        
endfunction

function SetDisplayDamage takes boolean b returns nothing
    set DisplayDamageBool = b
    if (DisplayDamageBool == true) then
        call EnableTrigger(DisplayTriggerA)
        call EnableTrigger(DisplayTriggerB)
    elseif  (DisplayDamageBool == false) then
        call DisableTrigger(DisplayTriggerA)
        call DisableTrigger(DisplayTriggerB)
    endif
endfunction

function SetItemSlotUnitType takes integer unitid returns nothing
    set ITEM_SLOT_UNIT_TYPE = unitid
endfunction

function InitPlayerData takes nothing returns nothing
	local integer i = 0
	loop
		exitwhen i > 11
		if ((GetPlayerController(Player(i)) == MAP_CONTROL_USER) and (GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING)) then
		    set zxwjs = zxwjs + 1
		    set zxwjid[zxwjs] = i
	    endif
	    set i = i + 1
	endloop
endfunction

function UNIT_SPELL_CHANNEL_Actions takes nothing returns nothing
	call SaveInteger(DSHT,GetHandleId(GetSpellAbilityUnit()),StringHash("SpellAbility"),GetSpellAbilityId())
endfunction

function UNIT_SPELL_CHANNEL takes nothing returns nothing
    local trigger tr = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( tr, EVENT_PLAYER_UNIT_SPELL_CHANNEL )
    call TriggerAddAction(tr, function UNIT_SPELL_CHANNEL_Actions)
    set tr = null
endfunction

function SetUnitTypePhysicalCommonAttribute takes integer UnitID, integer AttackTypeID, real AttackValue, real RandomFactor, integer DefenseTypeID, real DefenseValue returns nothing
    call SetType(UnitID,1,AttackTypeID)
    call SetTypeData(UnitID,2,PositiveRange(AttackValue))
    call SetTypeData(UnitID,52,RandomFactor)
    call SetType(UnitID,3,DefenseTypeID) 
    call SetTypeData(UnitID,4,DefenseValue)   
endfunction

function SetUnitTypePhysicalAttribute takes integer UnitID, real a, real b, real c, real d, real e, real f, real g, real h, real i returns nothing
//==========参数表（物理）（暴击，暴击抵抗，暴击加成，暴击减免，闪避，命中，格挡，格挡减伤，破甲）
    call SetTypeData(UnitID,5,ProbabilityRange(a))
    call SetTypeData(UnitID,6,PositiveRange(b))
    call SetTypeData(UnitID,7,ProbabilityRange(c))
    call SetTypeData(UnitID,8,PositiveRange(d))
    call SetTypeData(UnitID,9,ProbabilityRange(e))
    call SetTypeData(UnitID,10,ProbabilityRange(f))
    call SetTypeData(UnitID,11,ProbabilityRange(g))
    call SetTypeData(UnitID,12,ParryDamageReductionRange(h))
    call SetTypeData(UnitID,13,PositiveRange(i))
endfunction

function SetUnitTypeMagicCommonAttribute takes integer UnitID, integer MagicAttackTypeID, real MagicAttackValue, integer MagicDefenseTypeID, real MagicDefenseValue returns nothing
    call SetType(UnitID,20,MagicAttackTypeID)
    call SetTypeData(UnitID,21,PositiveRange(MagicAttackValue))
    call SetType(UnitID,22,MagicDefenseTypeID) 
    call SetTypeData(UnitID,23,MagicDefenseValue)   
endfunction

function SetUnitTypeMagicAttribute takes integer UnitID, real a, real b, real c, real d, real e, real f, real g, real h, real i returns nothing
//==========参数表（法术）（暴击，暴击抵抗，暴击加成，暴击减免，闪避，命中，格挡，格挡减伤，破甲）
    call SetTypeData(UnitID,24,ProbabilityRange(a))
    call SetTypeData(UnitID,25,PositiveRange(b))
    call SetTypeData(UnitID,26,ProbabilityRange(c))
    call SetTypeData(UnitID,27,PositiveRange(d))
    call SetTypeData(UnitID,28,ProbabilityRange(e))
    call SetTypeData(UnitID,29,ProbabilityRange(f))
    call SetTypeData(UnitID,30,ProbabilityRange(g))
    call SetTypeData(UnitID,31,ParryDamageReductionRange(h))
    call SetTypeData(UnitID,32,PositiveRange(i))
endfunction

function SetUnitTypeHealingAttribute takes integer UnitID, real HealingValue, real HealingThump, real HealingThumpMultiple returns nothing
    call SetTypeData(UnitID,39,PositiveRange(HealingValue))
    call SetTypeData(UnitID,40,ProbabilityRange(HealingThump))
    call SetTypeData(UnitID,41,PositiveRange(HealingThumpMultiple))
endfunction	

function SetItemTypeCommonAttribute takes integer ItemID, real AttackValue, real DefenseValue, real MagicAttackValue, real MagicDefenseValue returns nothing
    call SetItemTypeData(ItemID,2,PositiveRange(AttackValue))
    call SetItemTypeData(ItemID,4,DefenseValue) 
    call SetItemTypeData(ItemID,21,PositiveRange(MagicAttackValue))
    call SetItemTypeData(ItemID,23,MagicDefenseValue) 
endfunction

function SetItemTypePhysicalAttribute takes integer ItemID, real a, real b, real c, real d, real e, real f, real g, real h, real i, real j, real k, real l returns nothing
//==========参数表（物理）（暴击，暴击抵抗，暴击加成，暴击减免，闪避，命中，格挡，格挡减伤，破甲，吸血，反伤，物理伤害增加（百分比））
    call SetItemTypeData(ItemID,5,ProbabilityRange(a))
    call SetItemTypeData(ItemID,6,PositiveRange(b))
    call SetItemTypeData(ItemID,7,ProbabilityRange(c))
    call SetItemTypeData(ItemID,8,PositiveRange(d))
    call SetItemTypeData(ItemID,9,ProbabilityRange(e))
    call SetItemTypeData(ItemID,10,ProbabilityRange(f))
    call SetItemTypeData(ItemID,11,ProbabilityRange(g))
    call SetItemTypeData(ItemID,12,ParryDamageReductionRange(h))
    call SetItemTypeData(ItemID,13,PositiveRange(i))
    call SetItemTypeData(ItemID,14,ProbabilityRange(j))
    call SetItemTypeData(ItemID,15,ProbabilityRange(k))
    call SetItemTypeData(ItemID,17,ProbabilityRange(l))
endfunction

function SetItemTypeMagicAttribute takes integer ItemID, real a, real b, real c, real d, real e, real f, real g, real h, real i, real j, real k, real l returns nothing
//==========参数表（法术）（暴击，暴击抵抗，暴击加成，暴击减免，闪避，命中，格挡，格挡减伤，破甲，吸血，反伤，法术伤害增加（百分比））
    call SetItemTypeData(ItemID,24,ProbabilityRange(a))
    call SetItemTypeData(ItemID,25,PositiveRange(b))
    call SetItemTypeData(ItemID,26,ProbabilityRange(c))
    call SetItemTypeData(ItemID,27,PositiveRange(d))
    call SetItemTypeData(ItemID,28,ProbabilityRange(e))
    call SetItemTypeData(ItemID,29,ProbabilityRange(f))
    call SetItemTypeData(ItemID,30,ProbabilityRange(g))
    call SetItemTypeData(ItemID,31,ParryDamageReductionRange(h))
    call SetItemTypeData(ItemID,32,PositiveRange(i))
    call SetItemTypeData(ItemID,33,ProbabilityRange(j))
    call SetItemTypeData(ItemID,34,ProbabilityRange(k))
    call SetItemTypeData(ItemID,36,ProbabilityRange(l))
endfunction

function SetItemTypeHealingAttribute takes integer ItemID, real HealingValue, real HealingThump, real HealingThumpMultiple returns nothing
    call SetItemTypeData(ItemID,39,PositiveRange(HealingValue))
    call SetItemTypeData(ItemID,40,ProbabilityRange(HealingThump))
    call SetItemTypeData(ItemID,41,PositiveRange(HealingThumpMultiple))
endfunction	

function GetUnitTotalAttribute takes unit whichunit, integer ID returns real
	call UnitPredicable(whichunit)
	return GetTypeData(GetHandleId(whichunit),TypeKey0(ID))
endfunction

function InheritUnitTypeAttribute takes integer UnitTypeA, integer UnitTypeB, real a returns nothing
	local integer i = 0
	set a = PositiveRange(a)
    call SetType(UnitTypeA,1,GetType(UnitTypeB,1))
    call SetTypeData(UnitTypeA,2,GetTypeData(UnitTypeB,2) * a)
    call SetType(UnitTypeA,3,GetType(UnitTypeB,3)) 
    call SetTypeData(UnitTypeA,4,GetTypeData(UnitTypeB,4) * a)
    set i = 5
    loop
        exitwhen i > 15
        call SetTypeData(UnitTypeA,i,GetTypeData(UnitTypeB,i) * a)        
        set i = i + 1
    endloop
    call SetType(UnitTypeA,20,GetType(UnitTypeB,20))
    call SetTypeData(UnitTypeA,21,GetTypeData(UnitTypeB,21) * a)
    call SetType(UnitTypeA,22,GetType(UnitTypeB,22)) 
    call SetTypeData(UnitTypeA,23,GetTypeData(UnitTypeB,23) * a)
    set i = 24
    loop
        exitwhen i > 34
        call SetTypeData(UnitTypeA,i,GetTypeData(UnitTypeB,i) * a)        
        set i = i + 1
    endloop
    set i = 39
    loop
        exitwhen i > 43
        call SetTypeData(UnitTypeA,i,GetTypeData(UnitTypeB,i) * a)        
        set i = i + 1
    endloop
    call SetTypeData(UnitTypeA,52,GetTypeData(UnitTypeB,52))
    call SetTypeData(UnitTypeA,56,GetTypeData(UnitTypeB,56))
    call SetTypeData(UnitTypeA,57,GetTypeData(UnitTypeB,57))
    call SetTypeBoolean(UnitTypeA,68,GetTypeBoolean(UnitTypeB,68))
    call SetTypeBoolean(UnitTypeA,69,GetTypeBoolean(UnitTypeB,69))
endfunction

function InheritUnitAttributeAll takes unit UnitA, unit UnitB, real a returns nothing
	local integer s = 0
	local integer UnitAID = GetHandleId(UnitA)
	local integer UnitBID = GetHandleId(UnitB)
	set a = PositiveRange(a)
	call FlushChildHashtable(DSHT,GetUnitTypeId(UnitA))
    call SetType(GetUnitTypeId(UnitA),1,GetType(GetUnitTypeId(UnitB),1))
    call SetTypeData(UnitAID,2,GetUnitTotalAttribute(UnitB,2) * a)
    call SetType(GetUnitTypeId(UnitA),3,GetType(GetUnitTypeId(UnitB),3)) 
    call SetTypeData(UnitAID,4,GetUnitTotalAttribute(UnitB,4) * a)	
    set s = 5
    loop
        exitwhen s > 15
        call SetTypeData(UnitAID,s,GetUnitTotalAttribute(UnitB,s) * a)        
        set s = s + 1
    endloop
    call SetType(GetUnitTypeId(UnitA),20,GetType(GetUnitTypeId(UnitB),20))
    call SetTypeData(UnitAID,21,GetUnitTotalAttribute(UnitB,21) * a)
    call SetType(GetUnitTypeId(UnitA),22,GetType(GetUnitTypeId(UnitB),22)) 
    call SetTypeData(UnitAID,23,GetUnitTotalAttribute(UnitB,23) * a)
    set s = 24
    loop
        exitwhen s > 34
        call SetTypeData(UnitAID,s,GetUnitTotalAttribute(UnitB,s) * a)        
        set s = s + 1
    endloop
    set s = 39
    loop
        exitwhen s > 43
        call SetTypeData(UnitAID,s,GetUnitTotalAttribute(UnitB,s) * a)        
        set s = s + 1
    endloop
    call SetTypeData(UnitAID,52,GetUnitTotalAttribute(UnitB,52))
    call SetTypeData(UnitAID,56,GetUnitTotalAttribute(UnitB,56))
    call SetTypeData(UnitAID,57,GetUnitTotalAttribute(UnitB,57))
    call SetTypeBoolean(UnitAID,68,GetTypeBoolean(UnitBID,68))
    call SetTypeBoolean(UnitAID,69,GetTypeBoolean(UnitBID,69))
endfunction

function InheritItemTypeAttribute takes integer ItemTypeA, integer ItemTypeB, real a returns nothing
	local integer m = 0
	set a = PositiveRange(a)
    call SetItemTypeData(ItemTypeA,2,GetItemTypeData(ItemTypeB,2) * a)
    call SetItemTypeData(ItemTypeA,4,GetItemTypeData(ItemTypeB,4) * a)
    set m = 5
    loop
        exitwhen m > 15
        call SetItemTypeData(ItemTypeA,m,GetItemTypeData(ItemTypeB,m) * a)        
        set m = m + 1
    endloop
    call SetItemTypeData(ItemTypeA,17,GetItemTypeData(ItemTypeB,17) * a)
    call SetItemTypeData(ItemTypeA,18,GetItemTypeData(ItemTypeB,18) * a)
    call SetItemTypeData(ItemTypeA,19,GetItemTypeData(ItemTypeB,19) * a)
    call SetItemTypeData(ItemTypeA,21,GetItemTypeData(ItemTypeB,21) * a)
    call SetItemTypeData(ItemTypeA,23,GetItemTypeData(ItemTypeB,23) * a)
    set m = 24
    loop
        exitwhen m > 34
        call SetItemTypeData(ItemTypeA,m,GetItemTypeData(ItemTypeB,m) * a)        
        set m = m + 1
    endloop
    set m = 39
    loop
        exitwhen m > 46
        call SetItemTypeData(ItemTypeA,m,GetItemTypeData(ItemTypeB,m) * a)        
        set m = m + 1
    endloop
    call SetItemTypeIntegerData(ItemTypeA,63,GetItemTypeIntegerData(ItemTypeB,63))
    call SetItemTypeIntegerData(ItemTypeA,65,GetItemTypeIntegerData(ItemTypeB,65))
    call SetItemTypeIntegerData(ItemTypeA,67,GetItemTypeIntegerData(ItemTypeB,67))
endfunction

function InheritItemAttribute takes item ItemA, item ItemB, real a returns nothing
	local integer n = 0
	set a = PositiveRange(a)
    call SetItemData(ItemA,2,GetItemData(ItemB,2) * a)
    call SetItemData(ItemA,4,GetItemData(ItemB,4) * a)
    set n = 5
    loop
        exitwhen n > 15
        call SetItemData(ItemA,n,GetItemData(ItemB,n) * a)        
        set n = n + 1
    endloop
    call SetItemData(ItemA,17,GetItemData(ItemB,17) * a)
    call SetItemData(ItemA,18,GetItemData(ItemB,18) * a)
    call SetItemData(ItemA,19,GetItemData(ItemB,19) * a)
    call SetItemData(ItemA,21,GetItemData(ItemB,21) * a)
    call SetItemData(ItemA,23,GetItemData(ItemB,23) * a)
    set n = 24
    loop
        exitwhen n > 34
        call SetItemData(ItemA,n,GetItemData(ItemB,n) * a)        
        set n = n + 1
    endloop
    set n = 39
    loop
        exitwhen n > 46
        call SetItemData(ItemA,n,GetItemData(ItemB,n) * a)        
        set n = n + 1
    endloop
    call SetItemIntegerData(ItemA,63,GetItemIntegerData(ItemB,63))
    call SetItemIntegerData(ItemA,65,GetItemIntegerData(ItemB,65))
    call SetItemIntegerData(ItemA,67,GetItemIntegerData(ItemB,67))
endfunction

function GetUnitAttribute takes unit whichunit, integer ID returns real
    return GetTypeData(GetHandleId(whichunit),ID)
endfunction	

function GetUnitAttributeType takes unit whichunit, integer ID returns integer
    return GetType(GetHandleId(whichunit),ID)
endfunction	

function GetUnitPredicableMultiboard takes integer i returns multiboard
	return lb[i]
endfunction

function GetItemPredicableMultiboard takes integer i returns multiboard
	return lb1[i]
endfunction

function GetHatredAndDPSMultiboard takes integer i returns multiboard
	return lb2[i]
endfunction

function GetItemLevelMultiboard takes integer i returns multiboard
	return lb3[i]
endfunction

function SetItemLevelMultiboardDisplay takes boolean b returns nothing
	set DisplayItemLevelBool = b
endfunction

function SetHealingThumpAllow takes boolean b returns nothing
    set HealingThumpBool = b
endfunction

function SetDisplayHealing takes boolean b returns nothing
    set DisplayHealingBool = b
    if (DisplayHealingBool == true) then
        call EnableTrigger(DisplayTriggerC)
    elseif  (DisplayHealingBool == false) then
        call DisableTrigger(DisplayTriggerC)
    endif
endfunction

function GetAppointUnit takes nothing returns unit
	return AppointUnit
endfunction

function SetHatredcoefficient takes real A1, real B1, real A2, real B2, real R returns nothing
    set a1 = A1
    set b1 = B1
    set a2 = A2
    set b2 = B2
    set radius = R
endfunction

function GetPlayerUnit takes player p returns unit
    return PlayerUnit[GetPlayerId(p)]
endfunction

function GetRefurbishTimer takes nothing returns timer
    return TIMER
endfunction

function AddPlayerUnit takes unit whichunit returns nothing
    set PlayerUnit[GetPlayerId(GetOwningPlayer(whichunit))] = whichunit
endfunction

function CountTotalData takes boolean b returns nothing
	set Count = b
endfunction

function GetSystemHashtable takes nothing returns hashtable
    return DSHT
endfunction

function GetItemSystemHashtable takes nothing returns hashtable
    return DSITHT
endfunction

function SetDefaultDamageBool takes boolean b returns nothing
	set DamageBool = b
endfunction

function SetAOEBool takes boolean b returns nothing
	set AOEBool = b
endfunction

function SetSkillDamageType takes integer skillid, integer value returns nothing
    call SaveInteger(DSHT, skillid, 76, value)
endfunction

function GetSkillDamageType takes integer skillid returns integer
    return LoadInteger(DSHT, skillid, 76)
endfunction

function DamageSystemInitialization takes integer ImmuneDamageSkill, integer MimeticSkill0, integer MimeticSkill1, integer MimeticBuff1, boolean b returns nothing
    // 系统基本数据初始化
    call SetItemTypeNumberMax("null",0)
    set str1 = "|cFFFF0000同|r|cFFFF1300类|r|cFFFF2500物|r|cFFFF3800品|r|cFFFF4A00携|r|cFFFF5D00带|r|cFFFF6F00数|r|cFFFF8200超|r|cFFFF9400过|r|cFFFFA700上|r|cFFFFB900限|r|cFFFFCC00！|r"
    set RANDOM_Factor = 1.5
    set ImmuneDamageSkillID = ImmuneDamageSkill
    set MIMETIC_SKILL_0 = MimeticSkill0    //捕获单体普攻技能的封装技能//
    set MIMETIC_SKILL_1 = MimeticSkill1    //捕获单体普攻技能//
    set MIMETIC_BUFF_1 = MimeticBuff1      //捕获单体普攻buff//   
    call SetType_System()
    call SetTypeNamePreinstall()
    call AttackDefensePreinstallDATA()
    call AnyUnitEnterRegionAddData()
    call InitPlayerData()
    call UNIT_PICKUP_ITEM()
    call UNIT_USE_ITEM()
    call UNIT_DROP_ITEM()
    call UNIT_SELL_ITEM()
    call HeroLevelUpTrigger()
    call PackageMimeticdSkillDispose()
    call Unit_Death_Event()
    call EXPSet()
    call InitDisplaySystem_Melee()
    call InitDisplaySystem_Magic()
    call InitDisplaySystem_Healing()
    call UNIT_SPELL_CHANNEL()
    call SetDisplayDamageColor(1,0.0,255,0,0)
    call SetDisplayDamageColor(2,0.0,228,61,12)
    call SetDisplayDamageColor(3,0.0,128,128,255)
    call SetDisplayDamageColor(4,0.0,163,70,255)
    call SetDisplayDamageColor(5,0.0,0,255,0)
    call SetDisplayDamageColor(6,0.0,0,255,255)
    call SetDisplayDamageColor(7,0.0,215,215,215)
    call SetDisplayDamageColor(8,0.0,170,244,255)
    call SetDisplayDamageColor(9,0.0,170,244,255)
    call SetDisplayDamageColor(10,0.0,114,253,47)
    call SetDisplayDamageSize(1,14.0)
    call SetDisplayDamageSize(2,14.0)
    call SetDisplayDamageSize(3,14.0)
    call SetDisplayDamageSize(4,14.0)
    call SetDisplayDamageSize(5,11.0)
    call SetDisplayDamageSize(6,11.0)
    call SetDisplayDamageSize(7,10.0)
    call SetDisplayDamageSize(8,10.0)
    call SetDisplayDamageSize(9,10.0)
    call SetDisplayDamageSize(10,11.0)
    if (b == true) then
        call Melee_Damage_Event()
        call Magic_Damage_Event()
    endif
endfunction

function AutoDamageSystemInitialization takes boolean b0, boolean b1, boolean b2, boolean b3, boolean b4, boolean b5 returns nothing
	<? local slk = require 'slk' ?>
    <? local obj = slk.buff.BNcg:new ("普攻判断BUFF") ?>
    <?       
        obj.EditorName = "普通攻击（单体）"
        obj.Bufftip = ""
        obj.Buffubertip = ""
    ?>
    <? local obj0 = slk.ability.Apoi:new ("普攻判断技能") ?>
    <?
        obj0.DataA1 = 0.00
        obj0.EditorSuffix = ""
        obj0.Name = "普攻判断技能"
        obj0.Art = ""
        obj0.Missileart = ""
        obj0.Missilespeed = 0
        obj0.BuffID1 = obj:get_id()..","..obj:get_id()
        obj0.targs1 = "ground,structure,air"
        obj0.Dur1 = 0.010
        obj0.HeroDur1 = 0.010
    ?>
    <? local obj1 = slk.ability.Aspb:new ("普攻判断技能封装") ?>
    <?
        obj1.DataA1 = obj0:get_id()
        obj1.DataD1 = 1
        obj1.DataC1 = 1
        obj1.EditorSuffix = ""
        obj1.Name = "普攻判断封装技能"
        obj1.Art = ""
        obj1.item = 0
    ?>
    <? local obj2 = slk.ability.AIl2:new ("伤害抵挡技能") ?>
    <?
        obj2.DataA1 = 1000000
        obj2.EditorSuffix = ""
        obj2.Name = "抵挡伤害技能"
        obj2.Art = ""
        obj2.item = 0
    ?>
    call DamageSystemInitialization('<?=obj2:get_id()?>','<?=obj1:get_id()?>','<?=obj0:get_id()?>','<?=obj:get_id()?>',b0)
    call SetDefaultDamageBool(b1)
    call SetDisplayDamage(b2)
    call SetDisplayHealing(b3)
    call SetHealingThumpAllow(b4)
    if (b5 == true) then
        call AutoInitMultiboardSystem()
    endif
endfunction

endlibrary

#endif