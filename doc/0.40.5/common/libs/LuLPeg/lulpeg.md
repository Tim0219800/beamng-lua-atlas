# `libs_LuLPeg_lulpeg`

*File: `lua/common/libs/LuLPeg/lulpeg.lua` · VM: Common (GE + vehicle) · 2965 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/LuLPeg/lulpeg")`

LuLPeg: third-party library (Pierre-Yves Gérardy, "Romantic WTF" license), a pure-Lua port of LPeg (Parsing Expression Grammars by Roberto Ierusalimschy). The file is a bundle of several internal submodules (util, compiler, datastructures, re, charsets, evaluator, printers, analyzer, locale, match, factorizer, API, constructors, init, compat, optimizer) and ends with `return require"init"`: require("libs/LuLPeg/lulpeg") directly returns the LL object (equivalent to the lpeg module) with the `re` submodule. Used to write text parsers (grammars, patterns, captures).

## Example

```lua
local lpeg = require("libs/LuLPeg/lulpeg")
local P, C, R = lpeg.P, lpeg.C, lpeg.R
local number = C(R"09"^1)
print(number:match("123abc")) --> "123"
```

## Notes

- The file declares no global function to document: the public API is that of the returned object (LL), built by the submodules.
- Main LL API (read from the code): P, S, R, V, B, L (pattern constructors); C, Cs, Ct, Cc, Cg, Cb, Cf, Cmt, Cp, Carg (captures); match, dmatch (execution), ispattern, type, locale, pprint, cprint, evaluate, compile, resetptcache; version() returns "0.12", luversion() "0.1.0"; setmaxstack is a stub with no effect; new(options) creates an independent instance; global(env) and register(env) install lpeg/re in an environment; LL.re submodule (textual grammars).
- Lua operators are overloaded on patterns: p1 * p2 (sequence), p1 + p2 (choice), p1 - p2 (difference), p^n (repetition), -p (negation), #p ("and" predicate), p / x (replacement capture).
- The returned table has an `__index` field pointing to itself, so patterns also have the methods (e.g. pattern:match(s)).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/LuLPeg/lulpeg.lua`.*
