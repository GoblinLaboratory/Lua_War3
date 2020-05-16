AttributeDota = {
    ResistanceAttribute = "",
    BasicsAttribute = {},
    ExtendAttribute = {},
    BasicsInformation = {},
    Rarity = {},
    AttackEffects = {},
    Buff = {},
    Effects = {},
    Number = {
        ResistanceAttribute = 11,
        BasicsInformation = 12,
        BasicsAttribute = 12,
        ExtendAttribute = 7,
        Rarity = 9
    }
}
function AttributeDota:new(o)
    o = o or {}
    setmetatable(o, self)
    --
    o.ResistanceAttribute = [[ [
        {
            "Name": "伤害减免",
            "Explain": "单位伤害减免百分比。",
            "Value": 0,
            "Probability": 0,
            "Duration": 0
        },
        {
            "Name": "物理伤害吸收",
            "Explain": "物理伤害吸收数值。",
            "Value": 0,
            "Probability": 0,
            "Duration": 0
        },
        {
            "Name": "法术伤害吸收",
            "Explain": "法术伤害吸收数值。",
            "Value": 0,
            "Probability": 0,
            "Duration": 0
        },
        {
            "Name": "火焰抗性",
            "Explain": "火焰伤害减少百分比。",
            "Value": 0,
            "Probability": 0,
            "Duration": 0
        },
        {
            "Name": "冰霜抗性",
            "Explain": "冰霜伤害减少百分比。",
            "Value": 0,
            "Probability": 0,
            "Duration": 0
        },
        {
            "Name": "暗影抗性",
            "Explain": "暗影伤害减少百分比。",
            "Value": 0,
            "Probability": 0,
            "Duration": 0
        },
        {
            "Name": "神圣抗性",
            "Explain": "神圣伤害减少百分比。",
            "Value": 0,
            "Probability": 0,
            "Duration": 0
        },
        {
            "Name": "邪能抗性",
            "Explain": "邪能伤害减少百分比。",
            "Value": 0,
            "Probability": 0,
            "Duration": 0
        },
        {
            "Name": "毒抗性",
            "Explain": "毒伤害减少百分比。",
            "Value": 0,
            "Probability": 0,
            "Duration": 0
        },
        {
            "Name": "雷抗性",
            "Explain": "雷伤害减少百分比。",
            "Value": 0,
            "Probability": 0,
            "Duration": 0
        },
        {
            "Name": "眩晕抗性",
            "Explain": "眩晕时间减少百分比。",
            "Value": 0,
            "Probability": 0,
            "Duration": 0
        }
    ] ]]
    o.BasicsAttribute = [[
        [
    {
        "Name": "生命值",
        "Explain": "单位的生命值，由基础生命值与额外生命值提供。",
        "Value": 0,
        "Probability": 0,
        "Duration": 0
    },
    {
        "Name": "生命回复速度",
        "Explain": "单位每1秒自动回复的生命值，由基础生命回复速度与额外生命回复速度提供。",
        "Value": 0,
        "Probability": 0,
        "Duration": 0
    },
    {
        "Name": "魔法值",
        "Explain": "单位的魔法值，由基础魔法值与额外魔法值提供。",
        "Value": 0,
        "Probability": 0,
        "Duration": 0
    },
    {
        "Name": "魔法回复速度",
        "Explain": "单位每1秒自动回复的魔法值，由基础魔法回复速度与额外魔法回复速度提供。",
        "Value": 0,
        "Probability": 0,
        "Duration": 0
    },
    {
        "Name": "护甲",
        "Explain": "单位的护甲。",
        "Value": 0,
        "Probability": 0,
        "Duration": 0
    },
    {
        "Name": "魔法抗性",
        "Explain": "单位的魔法抗性。",
        "Value": 0,
        "Probability": 0,
        "Duration": 0
    },
    {
        "Name": "攻击力",
        "Explain": "单位的攻击力，由基础攻击力、主属性和附加攻击力提供。每点主属性提供1点攻击力。",
        "Value": 0,
        "Probability": 0,
        "Duration": 0
    },
    {
        "Name": "法术强度",
        "Explain": "单位的法术强度。",
        "Value": 0,
        "Probability": 0,
        "Duration": 0
    },
    {
        "Name": "移动速度",
        "Explain": "单位每1秒能够移动的距离，由基础移动速度和附加移动速度提供。",
        "Value": 0,
        "Probability": 0,
        "Duration": 0
    },
    {
        "Name": "攻击速度",
        "Explain": "单位攻击速度。",
        "Value": 0,
        "Probability": 0,
        "Duration": 0
    },
    {
        "Name": "闪避",
        "Explain": "单位闪避。",
        "Value": 0,
        "Probability": 0,
        "Duration": 0
    },
    {
        "Name": "格挡",
        "Explain": "单位格挡。",
        "Value": 0,
        "Probability": 0,
        "Duration": 0
    },
    {
        "Name": "反弹",
        "Explain": "反弹伤害。",
        "Value": 0,
        "Probability": 0,
        "Duration": 0
    }
    ,
    {
        "Name": "致命一击",
        "Explain": "致命一击。",
        "Value": 0,
        "Probability": 0,
        "Duration": 0
    },
    {
        "Name": "神圣一击",
        "Explain": "无视护甲。",
        "Value": 0,
        "Probability": 0,
        "Duration": 0
    },
    {
        "Name": "吸血",
        "Explain": "物理攻击吸血。",
        "Value": 0,
        "Probability": 0,
        "Duration": 0
    },
    {
        "Name": "法术吸血",
        "Explain": "法术攻击吸血。",
        "Value": 0,
        "Probability": 0,
        "Duration": 0
    },
    {
        "Name": "法力损毁",
        "Explain": "法力损毁会使攻击燃烧目标的一部分魔法值，并基于燃烧的魔法值造成伤害。",
        "Value": 0,
        "Probability": 0,
        "Duration": 0
    },
    {
        "Name": "魔力恢复",
        "Explain": "造成伤害恢复一定魔力。",
        "Value": 0,
        "Probability": 0,
        "Duration": 0
    }
    ]
    ]]
    o.ExtendAttribute = [[
        [
            {
                "Name": "力量",
                "Explain": "单位的力量。",
                "Value": 0,
                "Probability": 0,
                "Duration": 0
            },
            {
                "Name": "敏捷",
                "Explain": "单位的敏捷。",
                "Value": 0,
                "Probability": 0,
                "Duration": 0
            },
            {
                "Name": "智力",
                "Explain": "单位的智力。",
                "Value": 0,
                "Probability": 0,
                "Duration": 0
            },
            {
                "Name": "幸运",
                "Explain": "单位的幸运。",
                "Value": 0,
                "Probability": 0,
                "Duration": 0
            },
            {
                "Name": "体质",
                "Explain": "单位的体质。",
                "Value": 0,
                "Probability": 0,
                "Duration": 0
            },
            {
                "Name": "感知",
                "Explain": "单位的感知。",
                "Value": 0,
                "Probability": 0,
                "Duration": 0
            },
            {
                "Name": "魅力",
                "Explain": "单位的魅力。",
                "Value": 0,
                "Probability": 0,
                "Duration": 0
            }
        ]
    ]]
    o.BasicsInformation = [[
        [
            {
                "Name": "ID",
                "Explain": "单位的ID。",
                "Value": 0,
                "Probability": 0,
                "Duration": 0
            },
            {
                "Name": "Name",
                "Explain": "单位的名称。",
                "Value": 0,
                "Probability": 0,
                "Duration": 0
            },
            {
                "Name": "Types",
                "Explain": "单位的类型。",
                "Value": 0,
                "Probability": 0,
                "Duration": 0
            },
            {
                "Name": "品质",
                "Explain": "单位的品质。",
                "Value": 0,
                "Probability": 0,
                "Duration": 0
            },
            {
                "Name": "Position",
                "Explain": "单位的位置。",
                "Value": 0,
                "Probability": 0,
                "Duration": 0
            },
            {
                "Name": "星",
                "Explain": "单位的星。",
                "Value": 0,
                "Probability": 0,
                "Duration": 0
            },
            {
                "Name": "词缀",
                "Explain": "单位的词缀。",
                "Value": 0,
                "Probability": 0,
                "Duration": 0
            },
            {
                "Name": "强化",
                "Explain": "单位的强化。",
                "Value": 0,
                "Probability": 0,
                "Duration": 0
            },
            {
                "Name": "图标",
                "Explain": "单位的图标。",
                "Value": 0,
                "Probability": 0,
                "Duration": 0
            },
            {
                "Name": "自定义值",
                "Explain": "单位的自定义值。",
                "Value": 0,
                "Probability": 0,
                "Duration": 0
            },
            {
                "Name": "Explain",
                "Explain": "单位的说明。",
                "Value": 0,
                "Probability": 0,
                "Duration": 0
            },
            {
                "Name": "等级",
                "Explain": "单位的等级。",
                "Value": 0,
                "Probability": 0,
                "Duration": 0
            }
        ]
    ]]
    -- 稀有度 基数200000000
    o.Rarity = [[
        [
            {
                "Name": "普通",
                "Explain": "普通等级。",
                "Value": 0,
                "Probability": 0,
                "Duration": 0
            },
            {
                "Name": "精良",
                "Explain": "精良等级。",
                "Value": 1,
                "Probability": 2,
                "Duration": 1
            },
            {
                "Name": "优秀",
                "Explain": "优秀等级。",
                "Value": 1,
                "Probability": 4,
                "Duration": 2
            },
            {
                "Name": "稀有",
                "Explain": "稀有等级。",
                "Value": 2,
                "Probability": 5,
                "Duration": 3
            },
            {
                "Name": "史诗",
                "Explain": "史诗等级。",
                "Value": 3,
                "Probability": 7,
                "Duration": 5
            },
            {
                "Name": "传说",
                "Explain": "传说等级。",
                "Value": 1000,
                "Probability": 10,
                "Duration": 8
            },
            {
                "Name": "远古",
                "Explain": "远古等级。",
                "Value": 20,
                "Probability": 15,
                "Duration": 12
            },
            {
                "Name": "不朽",
                "Explain": "不朽等级。",
                "Value": 10,
                "Probability": 19,
                "Duration": 17
            },
            {
                "Name": "神器",
                "Explain": "神器等级。",
                "Value": 1,
                "Probability": 25,
                "Duration": 22
            }
        ]
    ]]
    o.AttackEffects = [[
        [
            {
                "Name": "毒性攻击",
                "Explain": "中毒：使得攻击可以造成减速效果。",
                "ID": 1,
                "BuffID": 1,
                "Effects" = "毒性攻击",
                "Value": 0,
                "MaxProbability": 100,
                "MinProbability": 25,
                "Duration": 6
            }
        ]
    ]]
    o.Buff = [[
        [
            {
                "Name": "中毒",
                "Explain": "造成持续伤害。",
                "ID": 1,
                "Buff": 1,
                "Value": 0,
                "MaxProbability": 0,
                "MinProbability": 0,
                "Duration": 0
            },
            {
                "Name": "冰冻",
                "Explain": "使得攻击可以造成减速效果。",
                "ID": 2,
                "Buff": 2,
                "Value": 0,
                "MaxProbability": 0,
                "MinProbability": 0,
                "Duration": 0
            },
            {
                "Name": "净化",
                "Explain": "移动速度减少。",
                "ID": 4,
                "Buff": 4,
                "Value": 0,
                "MaxProbability": 0,
                "MinProbability": 0,
                "Duration": 0
            },
            {
                "Name": "灼烧",
                "Explain": "造成持续伤害。",
                "ID": 4,
                "Buff": 4,
                "Value": 0,
                "MaxProbability": 0,
                "MinProbability": 0,
                "Duration": 0
            },
            {
                "Name": "伤害加深",
                "Explain": "伤害加深。",
                "ID": 5,
                "Buff": 5,
                "Value": 0,
                "MaxProbability": 0,
                "MinProbability": 0,
                "Duration": 0
            },
            {
                "Name": "移动速度减少",
                "Explain": "移动速度减少。",
                "ID": 6,
                "Buff": 6,
                "Value": 0,
                "MaxProbability": 0,
                "MinProbability": 0,
                "Duration": 0
            },
            {
                "Name": "眩晕",
                "Explain": "眩晕。",
                "ID": 7,
                "Buff": 7,
                "Value": 0,
                "MaxProbability": 0,
                "MinProbability": 0,
                "Duration": 0
            },
            {
                "Name": "致盲",
                "Explain": "致盲。",
                "ID": 8,
                "Buff": 8,
                "Value": 0,
                "MaxProbability": 0,
                "MinProbability": 0,
                "Duration": 0
            },
        ]
    ]]
    o.Effects = [[
        [
            {
                "Name": "毒性攻击",
                "Beneficial": false,
                "ID": 1,
                "Hero": true,
                "Unit": true,
                "BuffID": "0000",
                "Attribute": [
                    {
                        "Name": "移动速度降低"
                    }
                ]
            },
            {
                "Name": "灼烧攻击",
                "Beneficial": false,
                "ID": 2,
                "Hero": true,
                "Unit": true,
                "BuffID": "0000",
                "Attribute": [
                    {
                        "Name": "受到持续伤害"
                    },
                    {
                        "Name": "护甲降低"
                    }
                ]
            },
            {
                "Name": "毒刺",
                "Beneficial": false,
                "ID": 3,
                "Hero": true,
                "Unit": true,
                "BuffID": "0000",
                "Attribute": [
                    {
                        "Name": "移动速度降低"
                    },
                    {
                        "Name": "受到持续伤害"
                    }
                ]
            },
            {
                "Name": "腐蚀",
                "Beneficial": false,
                "ID": 4,
                "Hero": true,
                "Unit": true,
                "BuffID": "0000",
                "Attribute": [
                    {
                        "Name": "护甲降低"
                    }
                ]
            },
            {
                "Name": "极寒之触",
                "Beneficial": false,
                "ID": 5,
                "Hero": true,
                "Unit": true,
                "BuffID": "0000",
                "Attribute": [
                    {
                        "Name": "移动速度降低"
                    },
                    {
                        "Name": "攻击速度降低"
                    }
                ]
            },
            {
                "Name": "霜冻之箭",
                "Beneficial": false,
                "ID": 6,
                "Hero": true,
                "Unit": true,
                "BuffID": "0000",
                "Attribute": [
                    {
                        "Name": "移动速度降低"
                    }
                ]
            },
            {
                "Name": "沸血之矛",
                "Beneficial": false,
                "ID": 7,
                "Hero": true,
                "Unit": true,
                "BuffID": "0000",
                "Attribute": [
                    {
                        "Name": "受到持续伤害"
                    }
                ]
            },
            {
                "Name": "暗影侵袭",
                "Beneficial": false,
                "ID": 8,
                "Hero": true,
                "Unit": true,
                "BuffID": "0000"
                "Attribute": [
                    {
                        "Name": "受到持续伤害"
                    }
                ]
            },
            {
                "Name": "破甲",
                "Beneficial": false,
                "ID": 9,
                "Hero": true,
                "Unit": true,
                "BuffID": "0000",
                "Attribute": [
                    {
                        "Name": "护甲降低"
                    }
                ]
            }
        ]
    ]]
    o.Number.ResistanceAttribute = 11
    o.Number.BasicsInformation = 12
    o.Number.BasicsAttribute = 12
    o.Number.ExtendAttribute = 7
    o.Number.Rarity = 9
    --
    return o
end
AttributeDota.__index = AttributeDota
function AttributeDota:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end
return AttributeDota
