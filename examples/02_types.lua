-- Chapter 2: Variables & types

local values = { 42, 3.14, "hello", true, {}, print }
for _, v in ipairs(values) do
  print(tostring(v):sub(1, 12), "->", type(v))
end

print(math.type(10), math.type(10.0))

-- Truthiness: only nil and false are falsy
for _, v in ipairs({ 0, "", false }) do
  print(("%-7s is %s"):format(tostring(v) == "" and '""' or tostring(v), v and "truthy" or "falsy"))
end

-- Defaults with `or`
local function greet(name)
  name = name or "stranger"
  return "Hi, " .. name
end
print(greet(), greet("Shipr"))

-- Conversions
print(tonumber("42") + 1, tonumber("0x10"), tonumber("abc"))
