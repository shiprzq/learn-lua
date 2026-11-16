local function reverse_words(s)
  local words = {}
  for w in s:gmatch("%S+") do table.insert(words, 1, w) end
  return table.concat(words, " ")
end

print(reverse_words("hello lua world")) --> world lua hello
