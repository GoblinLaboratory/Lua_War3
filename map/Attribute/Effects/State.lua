State = {}
function State:new(o)
    o = o or {}
    setmetatable(o, self)
    -- o.__index = self
    -----
    o["眩晕"] = {
        Update = function()
            -- statements
        end,
        Launch = function(u,s)
            -- statements
        end
    }
    -----
    return o
end
State.__index = State
return State
