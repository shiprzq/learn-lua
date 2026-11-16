# 7 · Metatables & OOP

[← Previous](06-tables.md) · [🏠 Home](../README.md) · [Next →](08-modules.md)

A **metatable** is a table that changes how another table behaves. It's how Lua does operator overloading, default values, and classes.

```lua
local t = {}
local mt = {}
setmetatable(t, mt)
print(getmetatable(t) == mt)   --> true
```

## `__index`: fallback lookups

When a key is missing, Lua checks `__index`.

```lua
local defaults = { color = "blue", size = 10 }
local settings = setmetatable({ size = 12 }, { __index = defaults })

print(settings.size)    --> 12   (own field)
print(settings.color)   --> blue (from defaults)
```

## Operator overloading

```lua
local Vec = {}
Vec.__index = Vec

function Vec.new(x, y) return setmetatable({x = x, y = y}, Vec) end
Vec.__add      = function(a, b) return Vec.new(a.x + b.x, a.y + b.y) end
Vec.__eq       = function(a, b) return a.x == b.x and a.y == b.y end
Vec.__tostring = function(v) return ("(%g, %g)"):format(v.x, v.y) end

print(Vec.new(1, 2) + Vec.new(3, 4))   --> (4, 6)
```

Common metamethods:

| Metamethod | Triggered by |
|---|---|
| `__index` | reading a missing key |
| `__newindex` | writing a missing key |
| `__call` | calling the table like a function |
| `__tostring` | `tostring(t)` / `print(t)` |
| `__len` | `#t` |
| `__add` `__sub` `__mul` `__div` | `+ - * /` |
| `__eq` `__lt` `__le` | `== < <=` |
| `__concat` | `..` |

## Classes

```lua
local Animal = {}
Animal.__index = Animal

function Animal.new(name, sound)
  local self = setmetatable({}, Animal)
  self.name, self.sound = name, sound
  return self
end

function Animal:speak()          -- the colon adds a hidden `self` parameter
  return self.name .. " says " .. self.sound
end

local cat = Animal.new("Cat", "meow")
print(cat:speak())               --> Cat says meow
```

> 💡 `obj:method(x)` is just sugar for `obj.method(obj, x)`.

## Inheritance

```lua
local Dog = setmetatable({}, { __index = Animal })
Dog.__index = Dog

function Dog.new(name)
  local self = Animal.new(name, "woof")
  return setmetatable(self, Dog)
end

function Dog:fetch() return self.name .. " fetches the ball!" end

local d = Dog.new("Rex")
print(d:speak())   --> Rex says woof   (inherited)
print(d:fetch())   --> Rex fetches the ball!
```

Lookup chain: `d` → `Dog` → `Animal`.

---

✅ **Try it:** [`examples/07_oop.lua`](../examples/07_oop.lua)
