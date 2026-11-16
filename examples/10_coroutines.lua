-- Chapter 10: Coroutines

local co = coroutine.create(function(a, b)
  local c = coroutine.yield(a + b)
  return "got " .. c
end)
print(coroutine.resume(co, 1, 2))
print(coroutine.status(co))
print(coroutine.resume(co, "hi"))
print(coroutine.status(co))

-- Generator
local function range(n, step)
  step = step or 1
  return coroutine.wrap(function()
    for i = 1, n, step do coroutine.yield(i) end
  end)
end
for i in range(10, 3) do io.write(i, " ") end
print()

-- Fibonacci generator
local fib = coroutine.wrap(function()
  local a, b = 0, 1
  while true do
    coroutine.yield(a)
    a, b = b, a + b
  end
end)
for _ = 1, 10 do io.write(fib(), " ") end
print()
