# 9 · Error handling

[← Previous](08-modules.md) · [🏠 Home](../README.md) · [Next →](10-coroutines.md)

## Raising errors

```lua
local function divide(a, b)
  if b == 0 then
    error("cannot divide by zero")
  end
  return a / b
end
```

`error` can throw any value, including a table:

```lua
error({ code = 404, msg = "not found" })
```

## Catching with `pcall`

`pcall` ("protected call") returns `true` plus results, or `false` plus the error.

```lua
local ok, result = pcall(divide, 10, 0)
if ok then
  print("result:", result)
else
  print("failed:", result)   --> failed: file.lua:3: cannot divide by zero
end
```

## Tracebacks with `xpcall`

```lua
xpcall(function() divide(1, 0) end, function(err)
  print(debug.traceback(err, 2))
end)
```

## `assert`

```lua
local f = assert(io.open("config.txt"), "config file missing")
```

`assert(v, msg)` returns `v` if it's truthy, otherwise raises `msg`.

## The `nil, err` convention

Many Lua functions return `nil` and an error message instead of throwing:

```lua
local file, err = io.open("missing.txt")
if not file then
  print("could not open:", err)
end
```

---

✅ **Try it:** [`examples/09_errors.lua`](../examples/09_errors.lua)
