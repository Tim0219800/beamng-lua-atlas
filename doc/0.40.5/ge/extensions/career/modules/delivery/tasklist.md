# `career_modules_delivery_tasklist`

*Fichier : `lua/ge/extensions/career/modules/delivery/tasklist.lua` · VM : Game Engine (GE) · 305 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_delivery_tasklist` : `extensions.load("career_modules_delivery_tasklist")`, puis la globale `career_modules_delivery_tasklist`

**Dépendances (chargées avant) :** `core_vehicleBridge`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_delivery_tasklist.clearAll()` |  | 150 |
| `career_modules_delivery_tasklist.clearTasklistForOfferId(offerId)` |  | 143 |
| `career_modules_delivery_tasklist.onCareerActivated()` | *(hook)* | 8 |
| `career_modules_delivery_tasklist.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 301 |
| `career_modules_delivery_tasklist.sendCargoToTasklist()` |  | 22 |
| `career_modules_delivery_tasklist.updateCargoTasklistElements()` |  | 159 |
| `career_modules_delivery_tasklist.updateTasklistForCargoId(cargoId)` |  | 129 |
| `career_modules_delivery_tasklist.updateTasklistForOfferId(offerId)` |  | 136 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

**Évènements UI (guihooks.trigger) :** `DiscardTasklistItem`, `SetTasklistHeader`, `SetTasklistTask`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/delivery/tasklist.lua`.*
