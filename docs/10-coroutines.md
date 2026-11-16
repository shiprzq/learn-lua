# 10 · Coroutines

[← Previous](09-error-handling.md) · [🏠 Home](../README.md) · [Next →](11-gotchas.md)

A coroutine is a function that can **pause** (`yield`) and later **continue** (`resume`) where it left off. Perfect for generators, game scripts, and state machines.

```lua
local co = coroutine.create(function(a, b)
  print("start", a, b)
  local c = coroutine.yield(a + b)   -- pause, hand back a + b
  print("resumed with", c)
  return "done"
end)

print(coroutine.resume(co, 1, 2))    --> start 1 2   then: true 3
print(coroutine.status(co))          --> suspended
print(coroutine.resume(co, "hi"))    --> resumed with hi   then: true done
print(coroutine.status(co))          --> dead
```

## Generators with `coroutine.wrap`

`wrap` gives you a plain function — great for `for` loops.

```lua
local function range(n)
  return coroutine.wrap(function()
    for i = 1, n do coroutine.yield(i) end
  end)
end

for i in range(3) do print(i) end   --> 1 2 3
```

## Producer / consumer

```lua
local producer = coroutine.wrap(function()
  for _, line in ipairs({"a", "b", "c"}) do
    coroutine.yield(line)
  end
end)

while true do
  local item = producer()
  if not item then break end
  print("consumed", item)
end
```

## Game-style scripting

```lua
-- each "frame" the game resumes the script once
local cutscene = coroutine.wrap(function()
  print("Hero walks in")   ; coroutine.yield()
  print("Hero waves")      ; coroutine.yield()
  print("Hero leaves")
end)

cutscene(); cutscene(); cutscene()
```

---

✅ **Try it:** [`examples/10_coroutines.lua`](../examples/10_coroutines.lua)
