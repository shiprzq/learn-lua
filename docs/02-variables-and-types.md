# 2 · Variables & types

[← Previous](01-getting-started.md) · [🏠 Home](../README.md) · [Next →](03-operators-and-strings.md)

## Variables

```lua
local name = "Lua"     -- local: visible only in this block (use this!)
count = 10             -- global: visible everywhere (avoid)

local a, b, c = 1, 2   -- multiple assignment; c is nil
a, b = b, a            -- swap in one line
```

> ⭐ **Rule of thumb:** always write `local`. Globals are slower and cause bugs that are hard to find.

## The 8 types

| Type | Example | Notes |
|---|---|---|
| `nil` | `nil` | "no value". Unset variables are `nil` |
| `boolean` | `true`, `false` | |
| `number` | `42`, `3.14`, `0xFF`, `1e3` | Integers and floats (5.3+) |
| `string` | `"hi"`, `'hi'`, `[[multi-line]]` | Immutable |
| `table` | `{1, 2, x = 3}` | The *only* data structure |
| `function` | `function() end` | First-class values |
| `userdata` | — | C data, from host programs |
| `thread` | — | A coroutine |

```lua
print(type(42))         --> number
print(type("42"))       --> string
print(type(nil))        --> nil
print(type(print))      --> function
print(type({}))         --> table
print(math.type(1))     --> integer
print(math.type(1.0))   --> float
```

## Truthiness

Only **`false`** and **`nil`** are falsy. Everything else is truthy — **including `0` and `""`**.

```lua
if 0 then print("0 is true in Lua!") end
if "" then print("so is the empty string") end
```

## Default values with `or`

```lua
local function greet(name)
  name = name or "stranger"
  print("Hi, " .. name)
end
greet()          --> Hi, stranger
```

## Converting

```lua
tonumber("42")      --> 42
tonumber("0x10")    --> 16
tonumber("abc")     --> nil
tostring(3.5)       --> "3.5"
math.floor(3.7)     --> 3
```

---

✅ **Try it:** [`examples/02_types.lua`](../examples/02_types.lua)
