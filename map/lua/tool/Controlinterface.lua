--           0               1         2            3
--0    | wispharvest | windwalk |   whirlwind  |  webon          |
--1    |  weboff     | web      | wateryminion |  waterlemental  |
--2    |  ward       | voodoo   | volcano      |  vengenceon     |

--           0               1         2            3
--0    | FWXA        | FWXB     |   FWXC       |  FWXD           |
--1    | FWXAE       | FWXF     |   FWXG       |  FWXH           |
--2    | FWXI        | FWXJ     |   FWXK       |  FWXL          |

--           0               1         2            3
--0    |     A       |       B   |     C       |    D          |
--1    |     E       |       F   |     G       |    H          |
--2    |     I       |       J   |     K       |    L           |

local CJ = require 'jass.common'
local BJ = require 'blizzard'
local japi = require 'jass.japi'
require 'Global'
require 'GameManager'
require 'Attribute'
require 'UnitManager'
require 'HeroDota'

Controlinterface = {
    interfacevalue = 0
}

function Controlinterface:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end
Controlinterface.__index = Controlinterface
function Controlinterface:Instance()
    if self.instance == nil then
        self.instance = self:new()
    end
    return self.instance
end

--初始化
function Controlinterface:Int(id)
    local GM = GameManager:Instance()
    local u = GM.Players[id].Interface
    GM.Players[id].interfacevalue = 0

    self:Intinterface(u, id)
end

--清空技能
function Controlinterface:RemoveAbility(u, id)
    --清空技能
    CJ.UnitRemoveAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'A'))
    CJ.UnitRemoveAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'B'))
    CJ.UnitRemoveAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'C'))
    CJ.UnitRemoveAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'D'))
    CJ.UnitRemoveAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'E'))
    CJ.UnitRemoveAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'F'))
    CJ.UnitRemoveAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'G'))
    CJ.UnitRemoveAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'H'))
    CJ.UnitRemoveAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'I'))
    CJ.UnitRemoveAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'J'))
    CJ.UnitRemoveAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'K'))
    CJ.UnitRemoveAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'L'))
end

--初始选择界面
function Controlinterface:Intinterface(u, id)
    self:RemoveAbility(u, id)
    self:ChoiceTianFu(u, id)
    self:ChoiceRenWu(u, id)
    self:ChoiceBeiBao(u, id)
end
--添加天赋选择按钮
function Controlinterface:ChoiceTianFu(u, id)
    CJ.UnitAddAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'A'))
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'A')), 1, 215, '技能符文')
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'A')),
        1,
        218,
        '选择技能符文'
    )
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'A')),
        1,
        204,
        'ReplaceableTextures\\CommandButtons\\BTNSpellBookBLS.blp'
    )
end
--添加任务按钮
function Controlinterface:ChoiceRenWu(u, id)
    CJ.UnitAddAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'B'))
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'B')), 1, 215, '任务列表')
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'B')),
        1,
        218,
        '查看任务列表 -  暂时无法使用'
    )
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'B')),
        1,
        204,
        'ReplaceableTextures\\CommandButtons\\BTNNecromancerMaster.blp'
    )
end
--添加背包按钮
function Controlinterface:ChoiceBeiBao(u, id)
    CJ.UnitAddAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'C'))
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'C')), 1, 215, '背包')
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'C')),
        1,
        218,
        '查看背包 -  暂时无法使用'
    )
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'C')),
        1,
        204,
        'ReplaceableTextures\\CommandButtons\\BTNPackBeast.blp'
    )
end
--添加返回主界面按钮
function Controlinterface:ReturnAbility(u, id)
    CJ.UnitAddAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'L'))
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'L')), 1, 215, '返回')
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'L')),
        1,
        218,
        '返回主界面'
    )
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'L')),
        1,
        204,
        'ReplaceableTextures\\CommandButtons\\BTNCancel.blp'
    )
end

--天赋界面
function Controlinterface:ChoiceComtrolinterFace(u, id)
    --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, tostring(GM.Players[id].Hero_ID))
    local GM = GameManager:Instance()
    local i = Global:GetStrId(CJ.GetUnitTypeId(GM.Players[id].Hero_ID))
    CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, i)
    --清楚所有技能
    self:RemoveAbility(u, id)
    --技能一天赋
    CJ.UnitAddAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'A'))
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'A')),
        1,
        215,
        HeroDota[i]['技能1'].Name
    )
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'A')),
        1,
        218,
        HeroDota[i]['技能1'].Explain
    )
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'A')),
        1,
        204,
        HeroDota[i]['技能1'].TuBiao
    )
    --技能2天赋
    CJ.UnitAddAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'B'))
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'B')),
        1,
        215,
        HeroDota[i]['技能2'].Name
    )
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'B')),
        1,
        218,
        HeroDota[i]['技能2'].Explain
    )
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'B')),
        1,
        204,
        HeroDota[i]['技能2'].TuBiao
    )
    --技能3天赋
    CJ.UnitAddAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'C'))
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'C')),
        1,
        215,
        HeroDota[i]['技能3'].Name
    )
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'C')),
        1,
        218,
        HeroDota[i]['技能3'].Explain
    )
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'C')),
        1,
        204,
        HeroDota[i]['技能3'].TuBiao
    )
    --技能4天赋
    CJ.UnitAddAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'D'))
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'D')),
        1,
        215,
        HeroDota[i]['技能4'].Name
    )
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'D')),
        1,
        218,
        HeroDota[i]['技能4'].Explain
    )
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'D')),
        1,
        204,
        HeroDota[i]['技能4'].TuBiao
    )
    --技能5天赋
    CJ.UnitAddAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'E'))
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'E')),
        1,
        215,
        HeroDota[i]['技能5'].Name
    )
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'E')),
        1,
        218,
        HeroDota[i]['技能5'].Explain
    )
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'E')),
        1,
        204,
        HeroDota[i]['技能5'].TuBiao
    )
    --技能6天赋
    CJ.UnitAddAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'F'))
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'F')),
        1,
        215,
        HeroDota[i]['技能6'].Name
    )
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'F')),
        1,
        218,
        HeroDota[i]['技能6'].Explain
    )
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'F')),
        1,
        204,
        HeroDota[i]['技能6'].TuBiao
    )
    --添加返回按钮
    self:ReturnAbility(u, id)
end
--技能符文界面
function Controlinterface:ChoiceFuWEn(u, id, jn)
    local GM = GameManager:Instance()
    local i = Global:GetStrId(CJ.GetUnitTypeId(GM.Players[id].Hero_ID))
    CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, i)
    --清楚所有技能
    self:RemoveAbility(u, id)
    --符文一符文
    CJ.UnitAddAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'A'))
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'A')),
        1,
        215,
        HeroDota[i]['技能' .. jn]['符文1'].Name
    )
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'A')),
        1,
        218,
        HeroDota[i]['技能' .. jn]['符文1'].Explain
    )
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'A')),
        1,
        204,
        HeroDota[i]['技能' .. jn]['符文1'].TuBiao
    )
    --符文2天赋
    CJ.UnitAddAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'B'))
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'B')),
        1,
        215,
        HeroDota[i]['技能' .. jn]['符文2'].Name
    )
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'B')),
        1,
        218,
        HeroDota[i]['技能' .. jn]['符文2'].Explain
    )
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'B')),
        1,
        204,
        HeroDota[i]['技能' .. jn]['符文2'].TuBiao
    )
    --符文3天赋
    CJ.UnitAddAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'C'))
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'C')),
        1,
        215,
        HeroDota[i]['技能' .. jn]['符文3'].Name
    )
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'C')),
        1,
        218,
        HeroDota[i]['技能' .. jn]['符文3'].Explain
    )
    japi.EXSetAbilityDataString(
        japi.EXGetUnitAbility(u, Global:GetId('FW' .. tostring(id - 1) .. 'C')),
        1,
        204,
        HeroDota[i]['技能' .. jn]['符文3'].TuBiao
    )

    --添加返回按钮
    self:ReturnAbility(u, id)
end
return Controlinterface
