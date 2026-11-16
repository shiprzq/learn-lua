local function filter(t, pred)
  local out = {}
  for _, v in ipairs(t) do
    if pred(v) then out[#out + 1] = v end
  end
  return out
end

local function reduce(t, f, init)
  local acc = init
  for _, v in ipairs(t) do acc = f(acc, v) end
  return acc
end

local nums = {}
for i = 1, 10 do nums[i] = i end

local evens = filter(nums, function(x) return x % 2 == 0 end)
print(reduce(evens, function(a, b) return a + b end, 0)) --> 30
