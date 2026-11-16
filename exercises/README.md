# 🧩 Exercises

[🏠 Home](../README.md)

Try each one yourself first, then compare with the [solution](solutions/). Difficulty: 🟢 easy · 🟡 medium · 🔴 hard.

| # | Exercise | Chapter | Level |
|:-:|---|:-:|:-:|
| 1 | **FizzBuzz** — print 1–100, but `Fizz` for multiples of 3, `Buzz` for 5, `FizzBuzz` for both. | 4 | 🟢 |
| 2 | **Reverse words** — `"hello lua world"` → `"world lua hello"`. | 3, 6 | 🟢 |
| 3 | **Palindrome** — return `true` if a string reads the same backwards, ignoring case and spaces. | 3 | 🟢 |
| 4 | **Sum & average** — write `stats(...)` that returns the sum and the average of its arguments. | 5 | 🟢 |
| 5 | **Word count** — count how often each word appears in a sentence; print them alphabetically. | 6 | 🟡 |
| 6 | **Filter / reduce** — write `filter(t, pred)` and `reduce(t, f, init)`; use them to sum the even numbers in 1..10. | 5, 6 | 🟡 |
| 7 | **Memoize** — write `memoize(f)` that caches results; use it to make a fast recursive Fibonacci. | 5 | 🟡 |
| 8 | **Stack class** — a `Stack` with `push`, `pop`, `peek`, `size`, and `__tostring`. | 7 | 🟡 |
| 9 | **Safe parse** — `safe_number(s)` returns the number or raises a helpful error; catch it with `pcall`. | 9 | 🟡 |
| 10 | **Prime generator** — an endless coroutine generator of primes; print the first 15. | 10 | 🔴 |

Run a solution:

```bash
lua exercises/solutions/08_stack.lua
```
