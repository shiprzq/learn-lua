# 5 · Functions

[← Previous](04-control-flow.md) · [🏠 Home](../README.md) · [Next →](06-tables.md)

## Defining functions

```lua
local function add(a, b)
  return a + b
end

-- Functions are values, so this is the same thing:
local add2 = function(a, b) return a + b end
```

Missing arguments become `nil`; extra ones are ignored.

## Multiple return values

```lua
local function minmax(t)
  local lo, hi = math.huge, -math.huge
  for _, v in ipairs(t) do
    lo, hi = math.min(lo, v), math.max(hi, v)
  end
  return lo, hi
end

local lo, hi = minmax({4, 9, 1})   --> 1  9
```

## Variadic functions

```lua
local function sum(...)
  local total = 0
  for _, v in ipairs({...}) do total = total + v end
  return total
end

print(sum(1, 2, 3))         --> 6
print(select("#", 1, nil))  --> 2   (counts nils too)
```

## Closures

A function remembers the local variables around it.

```lua
local function counter()
  local count = 0
  return function()
    count = count + 1
    return count
  end
end

local next_id = counter()
print(next_id())  --> 1
print(next_id())  --> 2
```

## Higher-order functions

```lua
local function map(t, f)
  local out = {}
  for i, v in ipairs(t) do out[i] = f(v) end
  return out
end

local doubled = map({1, 2, 3}, function(x) return x * 2 end)
print(table.concat(doubled, ", "))  --> 2, 4, 6
```

## Call sugar

```lua
print "no parentheses with a single string"
setup { width = 800, height = 600 }   -- same as setup({ ... })
```

---

✅ **Try it:** [`examples/05_functions.lua`](../examples/05_functions.lua)
