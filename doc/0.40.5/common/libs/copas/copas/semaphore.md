# `libs_copas_copas_semaphore`

*Fichier : `lua/common/libs/copas/copas/semaphore.lua` · VM : Commun (GE + véhicule) · 169 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/copas/copas/semaphore")`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_copas_copas_semaphore.get_count(self)` | returns current available resources | 154 |
| `libs_copas_copas_semaphore.get_wait(self)` | returns total shortage for requested resources | 159 |
| `libs_copas_copas_semaphore.give(self, given)` | Gives resources.<br> @param given (optional, default 1) number of resources to return. If more<br> than the maximum are returned then it will be capped at the maximum and<br> error "too many" will be returned. | 44 |
| `libs_copas_copas_semaphore.new(max, start, seconds)` | create a new semaphore<br> @param max maximum number of resources the semaphore can hold (this maximum does NOT include resources that have been given but not yet returned).<br> @param seconds (optional, default 10) default semaphore timeout in seconds<br> @param start (optional, default 0) the initial resources available | 17 |
| `libs_copas_copas_semaphore.take(self, requested, timeout)` | Requests resources from the semaphore.<br> Waits if there are not enough resources available before returning.<br> @param requested (optional, default 1) the number of resources requested<br> @param timeout (optional, defaults to semaphore timeout) timeout in<br> seconds. If 0 it will either succeed or return immediately with error "timeout"<br> @return true | 111 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `__index` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/copas/copas/semaphore.lua`.*
