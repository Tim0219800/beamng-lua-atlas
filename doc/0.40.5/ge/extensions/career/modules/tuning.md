# `career_modules_tuning`

*Fichier : `lua/ge/extensions/career/modules/tuning.lua` · VM : Game Engine (GE) · 412 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_tuning` : `extensions.load("career_modules_tuning")`, puis la globale `career_modules_tuning`

**Dépendances (chargées avant) :** `career_career`, `gameplay_achievement`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_tuning.apply(tuningValues, callback)` |  | 310 |
| `career_modules_tuning.applyShopping()` |  | 152 |
| `career_modules_tuning.cancelShopping()` |  | 346 |
| `career_modules_tuning.close()` |  | 350 |
| `career_modules_tuning.getTuningData()` |  | 183 |
| `career_modules_tuning.onComputerAddFunctions(menuData, computerFunctions)` | *(hook)* | 364 |
| `career_modules_tuning.onVehicleSaveFinished()` | *(hook)* | 168 |
| `career_modules_tuning.removeVarFromShoppingCart(varName)` |  | 333 |
| `career_modules_tuning.start(_inventoryId, _originComputerId)` |  | 289 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onCareerTuningApplied`
- `onCareerTuningStarted` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `sendTuningShoppingData`, `updateTuningVariable`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/tuning.lua`.*
