local function is_palindrome(s)
  local clean = s:lower():gsub("%s", "")
  return clean == clean:reverse()
end

print(is_palindrome("Race car"))  --> true
print(is_palindrome("Lua"))       --> false
