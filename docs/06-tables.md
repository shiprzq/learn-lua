# 6 · Tables

[← Previous](05-functions.md) · [🏠 Home](../README.md) · [Next →](07-metatables-and-oop.md)

Tables are Lua's **only** data structure. They're arrays, dictionaries, objects, modules, and sets — all at once.

## As arrays

```lua
local colors = {"red", "green", "blue"}
print(colors[1])        --> red        ⚠️ indexes start at 1!
print(#colors)          --> 3

colors[#colors + 1] = "yellow"         -- append
table.insert(colors, "purple")         -- append
table.insert(colors, 1, "black")       -- insert at position 1
table.remove(colors)                   -- remove last
table.remove(colors, 1)                -- remove first
```

## As dictionaries

```lua
local user = {
  name = "Shipr",
  age = 24,
  ["favorite color"] = "green",   -- keys with spaces need brackets
}

print(user.name)                -- dot syntax
print(user["favorite color"])   -- bracket syntax
user.email = "me@example.com"   -- add a field
user.age = nil                  -- delete a field
```

## Iterating

```lua
for i, v in ipairs(colors) do ... end   -- array part, in order, stops at first nil
for k, v in pairs(user) do ... end      -- every key, any order
```

## Nested tables

```lua
local game = {
  player = { x = 10, y = 20, inventory = {"sword", "potion"} },
}
print(game.player.inventory[2])   --> potion
```

## The table library

```lua
local nums = {5, 2, 8, 1}
table.sort(nums)                               --> {1, 2, 5, 8}
table.sort(nums, function(a, b) return a > b end)  --> {8, 5, 2, 1}
print(table.concat(nums, ", "))                --> 8, 5, 2, 1
print(table.unpack({1, 2, 3}))                 --> 1  2  3
```

## Tables are references

```lua
local a = {1, 2}
local b = a
b[1] = 99
print(a[1])   --> 99   (same table!)
```

## Sets

```lua
local seen = {}
seen["apple"] = true
if seen["apple"] then print("already seen") end
```

---

✅ **Try it:** [`examples/06_tables.lua`](../examples/06_tables.lua)
