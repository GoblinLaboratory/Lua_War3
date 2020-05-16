local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
require "Global"
require "Bonus"
require "struct\\Attribute"

Aura = {
    Level = 1,--等级
    Priority  = 0,--优先级
    Allow = true,--是否开启
    TriggerUnit = 0,--技能拥有单位

    DanWeZu = nil,--单位组
    LinShiDanWeZu = nil,--临时单位组

    MoFaXiaoGuo = 0,--，魔法效果

    Ally = true,--是否为盟友
    Hero = false,--只选择英雄
    Unit = false,--只选择普通单位
    
    JuLi = 900,--距离

    JiNeng = 0,--马甲技能
    
    Life = 0,--生命
    Attributes = {

    }, 

    JiShiQI = nil,--计时器
}