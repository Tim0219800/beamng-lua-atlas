# `libs_copas_copas_timer`

*Fichier : `lua/common/libs/copas/copas/timer.lua` · VM : Commun (GE + véhicule) · 87 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/copas/copas/timer")`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_copas_copas_timer.cancel(self)` | Cancels a running timer.<br> @return timer object, or nil+error | 49 |
| `libs_copas_copas_timer.new(opts)` | Creates a new timer object.<br> Note: the callback signature is: `function(timer_obj, params)`.<br> @param opts (table) `opts.delay` timer delay in seconds, `opts.callback` function to execute, `opts.recurring` boolean<br> `opts.params` (optional) this value will be passed to the timer callback, `opts.initial_delay` (optional) the first delay to use, defaults to `delay`.<br> @return timer object, or throws an error on bad input | 72 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `__index` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/copas/copas/timer.lua`.*
