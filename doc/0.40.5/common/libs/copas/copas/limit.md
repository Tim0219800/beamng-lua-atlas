# `libs_copas_copas_limit`

*Fichier : `lua/common/libs/copas/copas/limit.lua` · VM : Commun (GE + véhicule) · 137 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/copas/copas/limit")`

Limits resource usage while executing tasks.
 Tasks added will be run in parallel, with a maximum of
 simultaneous tasks to prevent consuming all/too many resources.
 Every task added will immediately be scheduled (if there is room)
 using the `wait` method one can wait for completion.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_copas_copas_limit.new(maxt)` | creats a new tasksrunner, with maximum maxt simultaneous threads | 121 |

## Classe `ll`

| Méthode | Description | Ligne |
|---|---|---|
| `ll.new()` |  | 57 |
| `ll:pop()` |  | 28 |
| `ll:push(item)` |  | 20 |
| `ll:remove(item)` |  | 41 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/copas/copas/limit.lua`.*
