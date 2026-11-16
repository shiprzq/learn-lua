local function memoize(f)
  local cache = {}
  return function(n)
    if cache[n] == nil then cache[n] = f(n) end
    return cache[n]
  end
end

local fib
fib = memoize(function(n)
  if n < 2 then return n end
  return fib(n - 1) + fib(n - 2)
end)

print(fib(80)) --> 23416728348467685 (instant!)
