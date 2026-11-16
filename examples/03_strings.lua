-- Chapter 3: Operators & strings

print(7 / 2, 7 // 2, 7 % 2, 2 ^ 10)

local s = "Lua is fun"
print(s:upper(), #s, s:sub(1, 3), s:sub(-3))
print(("%s was born in %d"):format("Lua", 1993))

local y, m, d = ("2026-11-16"):match("(%d+)-(%d+)-(%d+)")
print("year:", y, "month:", m, "day:", d)

for word in ("the quick brown fox"):gmatch("%a+") do
  io.write("[", word, "] ")
end
print()

local replaced, count = ("hello world"):gsub("o", "0")
print(replaced, count .. " replacements")
