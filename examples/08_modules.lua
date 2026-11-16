-- Chapter 8: Modules
-- Make `require` find examples/lib/*.lua no matter where you run from
local here = (arg and arg[0] or ""):match("(.*[/\\])") or "./"
package.path = here .. "lib/?.lua;" .. package.path

local mathx = require("mathx")
print(mathx.lerp(0, 100, 0.25))
print(mathx.round(2.6), mathx.TAU)
print("cached:", require("mathx") == mathx)
