BuffAttribute = {
    -- 增益buff列表
    BeneficialBuffList = {},
    -- 减益buff列表
    BenefitReductionBuffList = {}
}
function BuffAttribute:new(o)
    o = o or {}
    setmetatable(o, self)
    -- o.__index = self
    -----
    -----
    return o
end
BuffAttribute.__index = BuffAttribute

return BuffAttribute