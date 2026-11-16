-- Chapter 4: Control flow

local function grade(score)
  if score >= 90 then return "A"
  elseif score >= 80 then return "B"
  elseif score >= 70 then return "C"
  else return "Keep going!" end
end
print(grade(95), grade(85), grade(40))

-- while
local i = 1
while i <= 3 do
  io.write(i, " ")
  i = i + 1
end
print()

-- numeric for, counting down
for n = 10, 1, -3 do io.write(n, " ") end
print()

-- generic for over an array
for idx, fruit in ipairs({ "apple", "banana", "cherry" }) do
  print(idx, fruit)
end

-- "continue" with goto
for n = 1, 6 do
  if n % 2 == 0 then goto continue end
  io.write(n, " ")
  ::continue::
end
print()
