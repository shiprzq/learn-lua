# 🌙 Lua Cheatsheet

[🏠 Home](../README.md)

```lua
-- COMMENTS
-- single line          --[[ multi
                             line ]]

-- VARIABLES
local x = 10            -- local (use this)
local a, b = 1, 2
a, b = b, a             -- swap

-- TYPES
nil  boolean  number  string  table  function  userdata  thread
type(x)                 -- "number"
-- falsy: only nil and false

-- STRINGS
"double"  'single'  [[long]]
s1 .. s2                -- concat
#s                      -- length
s:upper() s:lower() s:sub(i, j) s:find(p) s:match(p) s:gsub(p, r) s:rep(n)
("%s=%d"):format("a", 1)
tostring(x)  tonumber(s)

-- OPERATORS
+  -  *  /  //  %  ^    -- // floor div, ^ power
==  ~=  <  >  <=  >=    -- ~= is "not equal"
and  or  not
cond and a or b         -- ternary idiom

-- CONTROL FLOW
if c then ... elseif c then ... else ... end
while c do ... end
repeat ... until c
for i = 1, 10, 2 do ... end
for i, v in ipairs(arr) do ... end
for k, v in pairs(tbl) do ... end
break   goto label   ::label::

-- FUNCTIONS
local function f(a, b, ...) return a, b end
local g = function(x) return x * 2 end
local n = select("#", ...)
local args = {...}

-- TABLES
local arr = {10, 20, 30}          -- arr[1] == 10
local obj = {name = "Lua", ["k k"] = 1}
obj.name   obj["k k"]
#arr
table.insert(arr, v)   table.insert(arr, pos, v)
table.remove(arr)      table.remove(arr, pos)
table.sort(arr, cmp)   table.concat(arr, ", ")
table.unpack(arr)

-- METATABLES / OOP
local C = {}; C.__index = C
function C.new(v) return setmetatable({v = v}, C) end
function C:get() return self.v end
-- __index __newindex __call __tostring __len __add __eq __lt __concat

-- MODULES
local M = {} ... return M
local mod = require("mod")

-- ERRORS
error("msg")
local ok, err = pcall(f, args)
assert(v, "msg")

-- COROUTINES
local co = coroutine.create(fn)
coroutine.resume(co, ...)   coroutine.yield(...)
coroutine.status(co)        coroutine.wrap(fn)

-- HANDY
math.floor  math.ceil  math.max  math.min  math.random  math.huge  math.pi
os.time()  os.date("%Y-%m-%d")  os.clock()
io.read("l")  io.write(...)  io.open(path, "r")
```
