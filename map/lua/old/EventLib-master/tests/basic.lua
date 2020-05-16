local el = require'EventLib-master/EventLib'
local e = el:new()

e:connect(function(...) print("Fired", ...) end)

e:Fire("test", 1, 2, 3, { }, nil, [[bleh]])
