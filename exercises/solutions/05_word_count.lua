local function word_count(text)
  local counts = {}
  for w in text:lower():gmatch("%a+") do
    counts[w] = (counts[w] or 0) + 1
  end
  return counts
end

local counts = word_count("the cat and the hat and the bat")
local words = {}
for w in pairs(counts) do words[#words + 1] = w end
table.sort(words)
for _, w in ipairs(words) do print(w, counts[w]) end
