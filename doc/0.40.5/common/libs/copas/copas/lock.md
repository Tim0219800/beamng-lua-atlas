# `libs_copas_copas_lock`

*Fichier : `lua/common/libs/copas/copas/lock.lua` · VM : Commun (GE + véhicule) · 194 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/copas/copas/lock")`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_copas_copas_lock.get(self, timeout)` | Acquires the lock.<br> If the lock is owned by another thread, this will yield control, until the<br> lock becomes available, or it times out.<br> If `timeout == 0` then it will immediately return (without yielding).<br> @param timeout (optional) timeout in seconds, if given overrides the timeout passed to `new`.<br> @return wait-time on success, or nil+error+wait_time on failure. Errors can be "timeout", "destroyed", or "lock is not re-entrant" | 99 |
| `libs_copas_copas_lock.new(seconds, not_reentrant)` | Creates a new lock.<br> @param seconds (optional) default timeout in seconds when acquiring the lock (defaults to 10)<br> @param not_reentrant (optional) if truthy the lock will not allow a coroutine to grab the same lock multiple times<br> @return the lock object | 19 |
| `libs_copas_copas_lock.release(self)` | Releases the lock currently held.<br> Releasing a lock that is not owned by the current co-routine will return<br> an error.<br> returns true, or nil+err on an error | 153 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `__index` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/copas/copas/lock.lua`.*
