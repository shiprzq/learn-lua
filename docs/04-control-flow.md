# 4 · Control flow

[← Previous](03-operators-and-strings.md) · [🏠 Home](../README.md) · [Next →](05-functions.md)

## if / elseif / else

```lua
local score = 85

if score >= 90 then
  print("A")
elseif score >= 80 then
  print("B")
else
  print("Keep going!")
end
```

Note: it's `elseif` (one word) and every block ends with `end`.

## while

```lua
local i = 1
while i <= 3 do
  print(i)
  i = i + 1        -- no ++ or += in Lua
end
```

## repeat ... until

Runs at least once, like `do ... while` in other languages.

```lua
local n
repeat
  n = math.random(1, 6)
  print("rolled", n)
until n == 6
```

## Numeric for

```lua
for i = 1, 5 do print(i) end          -- 1 2 3 4 5
for i = 10, 1, -2 do print(i) end     -- 10 8 6 4 2
```

The loop variable is local to the loop.

## Generic for

```lua
local fruits = {"apple", "banana", "cherry"}
for index, fruit in ipairs(fruits) do
  print(index, fruit)
end

local ages = {ali = 22, sara = 25}
for name, age in pairs(ages) do
  print(name, age)                    -- order is NOT guaranteed
end
```

## break and goto

```lua
for i = 1, 10 do
  if i > 3 then break end
  print(i)
end

-- Lua has no `continue`. Use goto (5.2+):
for i = 1, 5 do
  if i % 2 == 0 then goto continue end
  print(i)                            -- 1 3 5
  ::continue::
end
```

---

✅ **Try it:** [`examples/04_control_flow.lua`](../examples/04_control_flow.lua)
