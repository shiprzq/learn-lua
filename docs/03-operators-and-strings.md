# 3 · Operators & strings

[← Previous](02-variables-and-types.md) · [🏠 Home](../README.md) · [Next →](04-control-flow.md)

## Arithmetic

| Op | Meaning | Example |
|---|---|---|
| `+ - *` | add, subtract, multiply | `2 * 3 --> 6` |
| `/` | float division | `7 / 2 --> 3.5` |
| `//` | floor division ⚠️ 5.3+ | `7 // 2 --> 3` |
| `%` | modulo | `7 % 2 --> 1` |
| `^` | power (always float) | `2 ^ 3 --> 8.0` |
| `-` | negation | `-x` |

## Comparison & logic

```lua
1 == 1      --> true
1 ~= 2      --> true    (not equal is ~=, not !=)
not true    --> false
true and "yes" or "no"   --> "yes"   (Lua's ternary idiom)
```

## Strings

```lua
local s = "Hello"
local t = 'single quotes work too'
local long = [[
Multi-line strings
keep their line breaks.
]]

print(s .. ", world")    -- concatenation with ..
print(#s)                -- length --> 5
```

### The string library

Every string has methods via `:`.

```lua
local s = "Lua is fun"
s:upper()               --> "LUA IS FUN"
s:lower()               --> "lua is fun"
s:len()                 --> 10
s:sub(1, 3)             --> "Lua"   (1-based, inclusive)
s:sub(-3)               --> "fun"   (negative counts from the end)
s:rep(2, "-")           --> "Lua is fun-Lua is fun"
s:reverse()             --> "nuf si auL"
s:find("is")            --> 5  6
("%s is %d"):format("Lua", 30)   --> "Lua is 30"
```

### Patterns (Lua's lightweight regex)

| Pattern | Matches |
|---|---|
| `.` | any character |
| `%a` `%d` `%s` `%w` | letter, digit, space, alphanumeric |
| `%A` `%D` ... | the opposite (uppercase = negated) |
| `+` `*` `-` `?` | 1+, 0+, 0+ lazy, optional |
| `^` `$` | start, end |
| `( )` | capture |

```lua
("2026-11-16"):match("(%d+)-(%d+)-(%d+)")   --> "2026" "11" "16"

for word in ("one two three"):gmatch("%a+") do
  print(word)
end

("hello world"):gsub("o", "0")   --> "hell0 w0rld"  2
```

> ⚠️ To match a literal `.`, `%`, `-` etc., escape it with `%` — e.g. `%.`

---

✅ **Try it:** [`examples/03_strings.lua`](../examples/03_strings.lua)
