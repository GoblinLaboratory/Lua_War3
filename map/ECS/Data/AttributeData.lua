-- 文件名为 AttributeData.lua
-- 定义一个名为 AttributeData 的模块
AttributeData = {}
-- 定义Base属性
AttributeData.Base = [[
    [
        {
            "Name": "ID",
            "Explain": "数据ID。"
        },
            {
                "Name": "Name",
                "Explain": "单位的名称。"
            },
            {
                "Name": "Types",
                "Explain": "单位的类型。"
            },
            {
                "Name": "自定义值",
                "Explain": "单位的自定义值。"
            },
            {
                "Name": "Explain",
                "Explain": "单位的说明。"
            },
            {
                "Name": "等级",
                "Explain": "单位的等级。"
            }
        ]
        ]]
-------------------------------------
-- 定义单位属性
AttributeData.Unit = [[
        [
            {
                "Name": "生命值",
                "Explain": "单位的生命值，由基础生命值与额外生命值提供。"
            },
            {
                "Name": "生命回复速度",
                "Explain": "单位每1秒自动回复的生命值，由基础生命回复速度与额外生命回复速度提供。"
            },
            {
                "Name": "魔法值",
                "Explain": "单位的魔法值，由基础魔法值与额外魔法值提供。"
            },
            {
                "Name": "魔法回复速度",
                "Explain": "单位每1秒自动回复的魔法值，由基础魔法回复速度与额外魔法回复速度提供。"
            },
            {
                "Name": "护甲",
                "Explain": "单位的护甲。"
            },
            {
                "Name": "魔法抗性",
                "Explain": "单位的魔法抗性。"
            },
            {
                "Name": "攻击力",
                "Explain": "单位的攻击力，由基础攻击力、主属性和附加攻击力提供。每点主属性提供1点攻击力。"
            },
            {
                "Name": "法术强度",
                "Explain": "单位的法术强度。"
            },
            {
                "Name": "移动速度",
                "Explain": "单位每1秒能够移动的距离，由基础移动速度和附加移动速度提供。"
            },
            {
                "Name": "攻击速度",
                "Explain": "单位攻击速度。"
            }
    ]
    ]]
-------------------------------------
-- 定义附加属性
AttributeData.Extra = [[
    [
        {
            "Name": "伤害减免",
            "Explain": "单位伤害减免百分比。"
        },
        {
            "Name": "物理伤害吸收",
            "Explain": "物理伤害吸收数值。"
        },
        {
            "Name": "法术伤害吸收",
            "Explain": "法术伤害吸收数值。"
        },
        {
            "Name": "火焰抗性",
            "Explain": "火焰伤害减少百分比。"
        },
        {
            "Name": "冰霜抗性",
            "Explain": "冰霜伤害减少百分比。"
        },
        {
            "Name": "暗影抗性",
            "Explain": "暗影伤害减少百分比。"
        },
        {
            "Name": "神圣抗性",
            "Explain": "神圣伤害减少百分比。"
        },
        {
            "Name": "邪能抗性",
            "Explain": "邪能伤害减少百分比。"
        },
        {
            "Name": "毒抗性",
            "Explain": "毒伤害减少百分比。"
        },
        {
            "Name": "雷抗性",
            "Explain": "雷伤害减少百分比。"
        },
        {
            "Name": "眩晕抗性",
            "Explain": "眩晕时间减少百分比。"
        }
    ]
]]
-------------------------------------
-- 定义英雄属性
AttributeData.Hero = [[
    [
            {
                "Name": "力量",
                "Explain": "单位的力量。"
            },
            {
                "Name": "敏捷",
                "Explain": "单位的敏捷。"
            },
            {
                "Name": "智力",
                "Explain": "单位的智力。"
            },
            {
                "Name": "幸运",
                "Explain": "单位的幸运。"
            },
            {
                "Name": "体质",
                "Explain": "单位的体质。"
            },
            {
                "Name": "感知",
                "Explain": "单位的感知。"
            },
            {
                "Name": "魅力",
                "Explain": "单位的魅力。"
            }
        ]
]]
-------------------------------------
-- 定义装备属性
AttributeData.Weaponry = [[
    [
        {
            "Name": "品质",
            "Explain": "装备的品质。"
        },
        {
            "Name": "Position",
            "Explain": "装备的部位。"
        },
        {
            "Name": "星",
            "Explain": "单位的星。"
        },
        {
            "Name": "词缀",
            "Explain": "单位的词缀。"
        },
        {
            "Name": "强化",
            "Explain": "单位的强化。"
        },
        {
            "Name": "图标",
            "Explain": "单位的图标。"
        }
    ]
]]
-- 定义装备类型
AttributeData.WeaponryType = [[
    [
        {
            "Name": "Mainhandweapon",
            "Explain": "主手武器。"
        },
        {
            "Name": "OffHandWeapon",
            "Explain": "主手武器。"
        },
        {
            "Name": "HeadEquipment",
            "Explain": "头部装备。"
        },
        {
            "Name": "ChestEquipment",
            "Explain": "胸部装备。"
        },
        {
            "Name": "WaistEquipment",
            "Explain": "腰部装备。"
        },
        {
            "Name": "LegEquipment",
            "Explain": "腿部装备。"
        },
        {
            "Name": "HandEquipment",
            "Explain": "手部装备。"
        },
        {
            "Name": "FootEquipment",
            "Explain": "脚部装备。"
        },
        {
            "Name": "Necklace",
            "Explain": "项链。"
        },
        {
            "Name": "Ring",
            "Explain": "腿部装备。"
        },
        {
            "Name": "Cloak",
            "Explain": "披风。"
        }
    ]
]]
-------------------------------------
return AttributeData
