-- Chapter 5: Functions

local function minmax(t)
  local lo, hi = math.huge, -math.huge
  for _, v in ipairs(t) do
    lo, hi = math.min(lo, v), math.max(hi, v)
  end
  return lo, hi
end
print("min/max:", minmax({ 4, 9, 1, 7 }))

local function sum(...)
  local total = 0
  for _, v in ipairs({ ... }) do total = total + v end
  return total
end
print("sum:", sum(1, 2, 3, 4))

-- Closure
local function counter()
  local count = 0
  return function()
    count = count + 1
    return count
  end
end
local next_id = counter()
print("ids:", next_id(), next_id(), next_id())

-- Higher-order
local function map(t, f)
  local out = {}
  for i, v in ipairs(t) do out[i] = f(v) end
  return out
end
print("doubled:", table.concat(map({ 1, 2, 3 }, function(x) return x * 2 end), ", "))
