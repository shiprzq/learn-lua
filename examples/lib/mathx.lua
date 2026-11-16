-- A tiny example module (Chapter 8)
local M = {}

local function clamp(x, lo, hi) -- private helper
  return math.max(lo, math.min(hi, x))
end

function M.lerp(a, b, t)
  return a + (b - a) * clamp(t, 0, 1)
end

function M.round(x)
  return math.floor(x + 0.5)
end

M.TAU = math.pi * 2

return M
