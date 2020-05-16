SkillData = {}
function SkillData:new(o)
    o = o or {}
    setmetatable(o, self)
    -----
    o.Skill = [[
        [
            {
                "Name": "毒性攻击",
                "Trigger": "单位发动攻击",
                "ID": 1,
                "Beneficial" : false,
                "Probability" : 100,
                "Duration" : 3,
                "Ability": [
                    {
                        "ID": 1,
                        "Name": "移动速度降低",
                        "Explain" : "降低目标%d%%的移动速度。",
                        "Value": 25,
                        "Duration" : 3
                    }
                ]
            },
            {
                "Name": "毒刺",
                "Trigger": "单位发动攻击",
                "ID": 2,
                "Beneficial" : false,
                "Probability" : 100,
                "Duration" : 7,
                "Ability": [
                    {
                        "ID": 1,
                        "Name": "受到持续伤害",
                        "Explain" : "攻击中附加%d点每秒的毒性伤害。",
                        "Value": 10
                    },
                    {
                        "ID": 2,
                        "Name": "移动速度降低",
                        "Explain" : "降低目标%d%%的移动速度。",
                        "Value": 25
                    }
                ]
            },
            {
                "Name": "寒霜攻击",
                "Trigger": "单位发动攻击",
                "ID": 3,
                "Beneficial" : false,
                "Probability" : 100,
                "Duration" : 3,
                "Ability": [
                    {
                        "ID": 1,
                        "Name": "移动速度降低",
                        "Explain" : "降低目标%d%%的移动速度。",
                        "Value": 25
                    }
                ]
            },
            {
                "Name": "霜冻之箭",
                "Trigger": "单位发动攻击",
                "ID": 3,
                "Beneficial" : false,
                "Probability" : 100,
                "Duration" : 4,
                "Ability": [
                    {
                        "ID": 1,
                        "Name": "移动速度降低",
                        "Explain" : "降低目标%d%%的移动速度。",
                        "Value": 25
                    }
                ]
            },
            {
                "Name": "腐蚀",
                "Trigger": "单位发动攻击",
                "ID": 5,
                "Beneficial" : false,
                "Probability" : 100,
                "Duration" : 3,
                "Ability": [
                    {
                        "ID": 1,
                        "Name": "护甲降低",
                        "Explain" : "攻击会减少%d点护甲。",
                        "Value": 3
                    }
                ]
            },
            {
                "Name": "燃烧",
                "Trigger": "单位发动攻击",
                "ID": 6,
                "Beneficial" : false,
                "Probability" : 100,
                "Duration" : 3,
                "Ability": [
                    {
                        "ID": 1,
                        "Name": "受到持续伤害",
                        "Explain" : "攻击中附加%d点每秒的火焰伤害。",
                        "Value": 3
                    }
                ]
            }
        ]
    ]]
    -----
    return o
end
SkillData.__index = SkillData
function SkillData:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end
return SkillData
