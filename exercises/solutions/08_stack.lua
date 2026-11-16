local Stack = {}
Stack.__index = Stack

function Stack.new() return setmetatable({ items = {} }, Stack) end
function Stack:push(v) self.items[#self.items + 1] = v end
function Stack:pop() return table.remove(self.items) end
function Stack:peek() return self.items[#self.items] end
function Stack:size() return #self.items end
Stack.__tostring = function(s)
  local parts = {}
  for i, v in ipairs(s.items) do parts[i] = tostring(v) end
  return "Stack[" .. table.concat(parts, ", ") .. "]"
end

local s = Stack.new()
s:push(1); s:push(2); s:push(3)
print(tostring(s))       --> Stack[1, 2, 3]
print(s:pop(), s:peek()) --> 3  2
print(s:size())          --> 2
