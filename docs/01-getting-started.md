# 1 · Getting started

[🏠 Home](../README.md) · [Next: Variables & types →](02-variables-and-types.md)

## Your first program

Create `hello.lua`:

```lua
print("Hello, world!")
```

Run it:

```bash
lua hello.lua
```

That's it. No `main` function, no semicolons, no imports.

## Comments

```lua
-- A single-line comment

--[[
  A multi-line comment.
  Handy for temporarily disabling code.
]]
```

## The REPL

Type `lua` with no arguments to get an interactive prompt. Press `Ctrl+D` (macOS/Linux) or `Ctrl+Z` then Enter (Windows) to quit.

```text
> 1 + 1
2
> print("hi")
hi
```

## `print` vs `io.write`

```lua
print("a", "b", 3)      --> a	b	3   (tab-separated, newline at the end)
io.write("no newline")  -- writes exactly what you give it
io.write("\n")
```

## Which Lua version?

This guide targets **Lua 5.4** (the current release). Almost everything also works in 5.1 / LuaJIT and Luau (Roblox). Version differences are marked with ⚠️.

```lua
print(_VERSION)  --> Lua 5.4
```

---

✅ **Try it:** [`examples/01_hello.lua`](../examples/01_hello.lua)
