# `gameplay_freeformDelivery_tasklist`

*Fichier : `lua/ge/extensions/gameplay/freeformDelivery/tasklist.lua` · VM : Game Engine (GE) · 429 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_freeformDelivery_tasklist` : `extensions.load("gameplay_freeformDelivery_tasklist")`, puis la globale `gameplay_freeformDelivery_tasklist`

**Dépendances (chargées avant) :** `gameplay_freeformDelivery_utils`, `gameplay_freeformDelivery_routes`, `core_groundMarkers`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_freeformDelivery_tasklist.cleanup()` |  | 409 |
| `gameplay_freeformDelivery_tasklist.setup(delivery)` |  | 314 |
| `gameplay_freeformDelivery_tasklist.update(profiler)` |  | 345 |
| `gameplay_freeformDelivery_tasklist.updateRouteMessage()` | Update route message in tasklist (called by routes.lua) | 122 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

**Évènements UI (guihooks.trigger) :** `ClearTasklist`, `DiscardTasklistItem`, `SetTasklistHeader`, `SetTasklistTask`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/freeformDelivery/tasklist.lua`.*
