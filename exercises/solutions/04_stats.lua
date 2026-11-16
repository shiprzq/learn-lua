local function stats(...)
  local n = select("#", ...)
  if n == 0 then return 0, 0 end
  local sum = 0
  for _, v in ipairs({ ... }) do sum = sum + v end
  return sum, sum / n
end

print(stats(2, 4, 6, 8)) --> 20  5.0
