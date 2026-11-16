# 8 · Modules

[← Previous](07-metatables-and-oop.md) · [🏠 Home](../README.md) · [Next →](09-error-handling.md)

A module is just a file that **returns a table**.

## Writing a module

`mathx.lua`:

```lua
local M = {}

local function clamp(x, lo, hi)      -- private: not in M
  return math.max(lo, math.min(hi, x))
end

function M.lerp(a, b, t)
  return a + (b - a) * clamp(t, 0, 1)
end

M.PI2 = math.pi * 2

return M
```

## Using it

```lua
local mathx = require("mathx")     -- no .lua extension
print(mathx.lerp(0, 100, 0.25))    --> 25.0
```

- `require` runs the file **once** and caches the result in `package.loaded`.
- Dots map to folders: `require("utils.strings")` loads `utils/strings.lua`.
- The search path lives in `package.path`.

```lua
package.path = "./lib/?.lua;" .. package.path
```

## Installing packages with LuaRocks

```bash
luarocks install inspect      # pretty-printer for tables
```

```lua
local inspect = require("inspect")
print(inspect({a = 1, b = {2, 3}}))
```

---

✅ **Try it:** [`examples/08_modules.lua`](../examples/08_modules.lua) (uses [`examples/lib/mathx.lua`](../examples/lib/mathx.lua))
