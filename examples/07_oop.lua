-- Chapter 7: Metatables & OOP

-- Operator overloading
local Vec = {}
Vec.__index = Vec
function Vec.new(x, y) return setmetatable({ x = x, y = y }, Vec) end
Vec.__add = function(a, b) return Vec.new(a.x + b.x, a.y + b.y) end
Vec.__tostring = function(v) return ("(%g, %g)"):format(v.x, v.y) end
function Vec:length() return math.sqrt(self.x ^ 2 + self.y ^ 2) end

local v = Vec.new(1, 2) + Vec.new(2, 2)
print(tostring(v), v:length())

-- Classes & inheritance
local Animal = {}
Animal.__index = Animal
function Animal.new(name, sound)
  return setmetatable({ name = name, sound = sound }, Animal)
end
function Animal:speak() return self.name .. " says " .. self.sound end

local Dog = setmetatable({}, { __index = Animal })
Dog.__index = Dog
function Dog.new(name) return setmetatable(Animal.new(name, "woof"), Dog) end
function Dog:fetch() return self.name .. " fetches the ball!" end

local rex = Dog.new("Rex")
print(Animal.new("Cat", "meow"):speak())
print(rex:speak())
print(rex:fetch())
