# 11 · Gotchas & best practices

[← Previous](10-coroutines.md) · [🏠 Home](../README.md)

## 🪤 Gotchas

**1. Arrays start at 1.**
```lua
local t = {"a", "b"}
print(t[0])   --> nil
print(t[1])   --> a
```

**2. Variables are global by default.**
```lua
function f() x = 5 end   -- oops, x is now a global
```
Use `local` everywhere. Run `luacheck` to catch accidental globals.

**3. `0` and `""` are truthy.** Only `nil` and `false` are falsy.

**4. `#` is unreliable on tables with holes.**
```lua
local t = {1, nil, 3}
print(#t)   --> 3 or 1 — undefined!
```
Don't store `nil` in arrays; use a sentinel like `false` instead.

**5. `~=` means "not equal".** There is no `!=`.

**6. No `+=`, `++`, or `continue`.** Write `x = x + 1` and use `goto continue`.

**7. `.` vs `:`.** `obj:m()` passes `obj` as `self`; `obj.m()` does not.

**8. Strings are immutable.** Building big strings with `..` in a loop is slow — collect pieces in a table and `table.concat` them.

**9. `pairs` order is random.** Sort the keys if you need a stable order.

## ✅ Best practices

- Prefer `local` for everything, including functions: `local function f() end`.
- Cache library functions in hot loops: `local insert = table.insert`.
- Return a single table from every module; never set globals in one.
- Use `("%d items"):format(n)` instead of long `..` chains.
- Use 2-space indentation (the community norm) and `snake_case` names.
- Lint with [luacheck](https://github.com/lunarmodules/luacheck), format with [StyLua](https://github.com/JohnnyMorganz/StyLua).

🎉 **You've finished the guide!** Head to the [exercises](../exercises/README.md) to practise.
