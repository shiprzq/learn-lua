-- Chapter 9: Error handling

local function divide(a, b)
  if b == 0 then error("cannot divide by zero", 2) end
  return a / b
end

print(pcall(divide, 10, 2))
local ok, err = pcall(divide, 1, 0)
print(ok, err)

-- Throwing a table
local ok2, e = pcall(function() error({ code = 404, msg = "not found" }) end)
print(ok2, e.code, e.msg)

-- The nil, err convention
local f, open_err = io.open("this-file-does-not-exist.txt")
print(f, open_err)

-- assert
print(pcall(assert, false, "assertion failed!"))
