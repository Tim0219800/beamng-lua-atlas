# `libs_timerwheel_timerwheel`

*Fichier : `lua/common/libs/timerwheel/timerwheel.lua` · VM : Commun (GE + véhicule) · 305 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/timerwheel/timerwheel")`

Timer wheel implementation
 Efficient timer for timeout related timers: fast insertion, deletion, and
 execution (all as O(1) implemented), but with lesser precision.
 This module will not provide the timer/runloop itself. Use your own runloop
 and call `wheel:step` to check and execute timers.
 Implementation:
 Consider a stack of rings, a timer beyond the current ring size is in the
 next ring (or beyond). Precision is based on a slot with a specific size.
 The code explicitly avoids using `pairs`, `ipairs` and `next` to ensure JIT
 compilation when using LuaJIT

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_timerwheel_timerwheel.new(opts)` | Creates a new timer wheel.<br> The options are:<br>  - `precision` (optional) precision of the timer wheel in seconds (slot size),<br> defaults to 0.050<br>  - `ringsize` (optional) number of slots in each ring, defaults to 72000 (1<br> hour span, based on default `precision`)<br>  - `now` (optional) a function returning the curent time in seconds. Defaults<br> to `luasocket.gettime` or `ngx.now` if available.<br>  - `err_handler` (optional) a function to use as error handler in a `xpcall` when<br> executing the callback. The default will send the stacktrace on `stderr`.<br> @param opts the options table<br> @return the timerwheel object | 59 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/timerwheel/timerwheel.lua`.*
