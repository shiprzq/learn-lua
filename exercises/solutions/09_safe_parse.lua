local function safe_number(s)
  local n = tonumber(s)
  if n == nil then
    error(("expected a number, got %q"):format(tostring(s)), 2)
  end
  return n
end

for _, input in ipairs({ "42", "3.5", "abc" }) do
  local ok, result = pcall(safe_number, input)
  print(input, ok and result or ("error: " .. result))
end
