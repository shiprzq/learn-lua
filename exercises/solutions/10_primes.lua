local function primes()
  return coroutine.wrap(function()
    local found = {}
    local n = 2
    while true do
      local is_prime = true
      for _, p in ipairs(found) do
        if p * p > n then break end
        if n % p == 0 then is_prime = false; break end
      end
      if is_prime then
        found[#found + 1] = n
        coroutine.yield(n)
      end
      n = n + 1
    end
  end)
end

local gen = primes()
local out = {}
for i = 1, 15 do out[i] = gen() end
print(table.concat(out, " ")) --> 2 3 5 7 11 13 17 19 23 29 31 37 41 43 47
