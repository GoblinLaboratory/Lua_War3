-- BL = require "ECS\\Blizzard"
-- require "ECS\\Skill\\Data\\Crit"
SkillData = {}
-- 暴击
-- SkillData.Crit = Crit:new()
SkillData.Skill = [[
    [
        {
            "Name": "暴击",
            "Trigger": "单位造成伤害",
            "ID": 1,
            "Explain" : "攻击时有一定几率造成2倍的伤害。",
            "Duration" : 0,
            "TargetUnit" : "被攻击单位",
            "Probability" : 30,
            "Condition" : [
                {
                    "Name": "物理伤害",
                    "Value" : true
                },
                {
                    "Name": "攻击伤害",
                    "Value" : true
                }
            ],
            "Action" : [
                {
                    "Name": "暴击",
                    "ID": 1,
                    "BuffID" : 0,
                    "Typrs" : "瞬时",
                    "Beneficial" : false,
                    "SuperPosition" : false,
                    "Duration" : 0,
                    "Action" : [
                        {
                            "Name": "暴击",
                            "Value" : 2
                        }
                    ]
                }
            ]
        },
        {
            "Name": "背刺",
            "Trigger": "单位造成伤害",
            "ID": 2,
            "Explain" : "从背后攻击单位时可以造成基于敏捷的额外物理伤害。",
            "Duration" : 0,
            "TargetUnit" : "被攻击单位",
            "Probability" : 100,
            "Condition" : [
                {
                    "Name": "物理伤害",
                    "Value" : true
                },
                {
                    "Name": "攻击伤害",
                    "Value" : true
                }
            ],
            "Action" : [
                {
                    "Name": "背刺",
                    "ID": 1,
                    "BuffID" : 0,
                    "Typrs" : "瞬时",
                    "Beneficial" : false,
                    "SuperPosition" : true,
                    "Duration" : 0,
                    "Action" : [
                        {
                            "Name": "背刺",
                            "Value" : 2
                        }
                    ]
                }
            ]
        },
        {
            "Name": "荒芜",
            "Trigger": "单位造成伤害",
            "ID": 3,
            "Explain" : "对落单的敌人造成额外的纯粹伤害。",
            "Duration" : 0,
            "TargetUnit" : "被攻击单位",
            "Probability" : 100,
            "Condition" : [
                {
                    "Name": "物理伤害",
                    "Value" : true
                },
                {
                    "Name": "攻击伤害",
                    "Value" : true
                }
            ],
            "Action" : [
                {
                    "Name": "荒芜",
                    "ID": 1,
                    "BuffID" : 0,
                    "Typrs" : "瞬时",
                    "Beneficial" : false,
                    "SuperPosition" : true,
                    "Duration" : 0,
                    "Action" : [
                        {
                            "Name": "荒芜",
                            "Value" : 2
                        }
                    ]
                }
            ]
        },
        {
            "Name": "吸血",
            "Trigger": "单位造成伤害",
            "ID": 4,
            "Explain" : "携带者把给对手造成的伤害的15%转化为自己的生命。",
            "Duration" : 0,
            "TargetUnit" : "被攻击单位",
            "Probability" : 100,
            "Condition" : [
                {
                    "Name": "物理伤害",
                    "Value" : true
                },
                {
                    "Name": "攻击伤害",
                    "Value" : true
                }
            ],
            "Action" : [
                {
                    "Name": "吸血",
                    "ID": 1,
                    "BuffID" : 0,
                    "Typrs" : "瞬时",
                    "Beneficial" : false,
                    "SuperPosition" : true,
                    "Duration" : 0,
                    "Action" : [
                        {
                            "Name": "吸血",
                            "Value" : 15
                        }
                    ]
                }
            ]
        },
        {
            "Name": "法术吸血",
            "Trigger": "单位造成伤害",
            "ID": 5,
            "Explain" : "携带者把给对手造成的魔法伤害的15%转化为自己的生命。",
            "Duration" : 0,
            "TargetUnit" : "被攻击单位",
            "Probability" : 100,
            "Condition" : [
                {
                    "Name": "物理伤害",
                    "Value" : true
                },
                {
                    "Name": "攻击伤害",
                    "Value" : true
                }
            ],
            "Action" : [
                {
                    "Name": "法术吸血",
                    "ID": 1,
                    "BuffID" : 0,
                    "Typrs" : "瞬时",
                    "Beneficial" : false,
                    "SuperPosition" : true,
                    "Duration" : 0,
                    "Action" : [
                        {
                            "Name": "法术吸血",
                            "Value" : 15
                        }
                    ]
                }
            ]
        },
        {
            "Name": "重击",
            "Trigger": "单位发动攻击",
            "ID": 6,
            "Explain" : "有一定的机率使攻击目标眩晕。",
            "Duration" : 0,
            "TargetUnit" : "被攻击单位",
            "Probability" : 30,
            "Condition" : [
                {
                    "Name": "无",
                    "Value" : true
                }
            ],
            "Action" : [
                {
                    "Name": "重击",
                    "ID": 1,
                    "BuffID" : 0,
                    "Typrs" : "瞬时",
                    "Beneficial" : false,
                    "SuperPosition" : true,
                    "Duration" : 0,
                    "Action" : [
                        {
                            "Name": "重击",
                            "Value" : 2
                        }
                    ]
                }
            ]
        },
        {
            "Name": "毒性攻击",
            "Trigger": "单位发动攻击",
            "ID": 2,
            "Explain" : "使得攻击可以造成减速效果。",
            "Duration" : 7,
            "TargetUnit" : "被攻击单位",
            "Probability" : 100,
            "Condition" : [
                {
                    "Name": "无",
                    "Value" : true
                }
            ],
            "Action" : [
                {
                    "Name": "毒性攻击",
                    "ID": 1,
                    "BuffID" : 0,
                    "Typrs" : "持续",
                    "Beneficial" : false,
                    "SuperPosition" : false,
                    "Duration" : 6,
                    "Action" : [
                        {
                            "Name": "移动速度降低",
                            "Value" : 25
                        }
                    ]
                }
            ]
        }
    ]
]]
return SkillData
