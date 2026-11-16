-- Chapter 6: Tables

local colors = { "red", "green", "blue" }
table.insert(colors, "yellow")
table.insert(colors, 1, "black")
print(#colors, table.concat(colors, ", "))
table.remove(colors, 1)
print(table.concat(colors, ", "))

local user = { name = "Shipr", langs = { "Lua", "JS" } }
user.city = "Suez"
print(user.name .. " codes in " .. user.langs[1] .. " in " .. user.city)

-- pairs order isn't guaranteed, so sort keys for stable output
local keys = {}
for k in pairs(user) do keys[#keys + 1] = k end
table.sort(keys)
print("keys:", table.concat(keys, ", "))

local nums = { 5, 2, 8, 1 }
table.sort(nums, function(a, b) return a > b end)
print("desc:", table.concat(nums, " "))

-- Word frequency counter
local counts = {}
for w in ("a b a c b a"):gmatch("%a") do
  counts[w] = (counts[w] or 0) + 1
end
print("a=" .. counts.a, "b=" .. counts.b, "c=" .. counts.c)
