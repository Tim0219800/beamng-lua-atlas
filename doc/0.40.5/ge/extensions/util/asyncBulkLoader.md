# `util_asyncBulkLoader`

*Fichier : `lua/ge/extensions/util/asyncBulkLoader.lua` · VM : Game Engine (GE) · 333 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_asyncBulkLoader` : `extensions.load("util_asyncBulkLoader")`, puis la globale `util_asyncBulkLoader`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_asyncBulkLoader.addCount(count)` |  | 30 |
| `util_asyncBulkLoader.addTotal(total)` |  | 23 |
| `util_asyncBulkLoader.isGameplaySelectorLoaded()` |  | 102 |
| `util_asyncBulkLoader.isLevelsLoaded()` |  | 106 |
| `util_asyncBulkLoader.isLoading()` |  | 135 |
| `util_asyncBulkLoader.isMissionsLoaded()` |  | 98 |
| `util_asyncBulkLoader.isVehiclesLoaded()` |  | 94 |
| `util_asyncBulkLoader.loadGameplaySelector()` |  | 228 |
| `util_asyncBulkLoader.loadGameplaySelectorDirect()` |  | 122 |
| `util_asyncBulkLoader.loadLevels()` |  | 268 |
| `util_asyncBulkLoader.loadLevelsDirect()` |  | 128 |
| `util_asyncBulkLoader.loadMissions()` |  | 193 |
| `util_asyncBulkLoader.loadMissionsDirect()` |  | 116 |
| `util_asyncBulkLoader.loadVehicles()` |  | 155 |
| `util_asyncBulkLoader.loadVehiclesDirect()` |  | 110 |
| `util_asyncBulkLoader.reportScanPercent(percent)` | File-scan progress for vehicle decode: 0-100 = determinate, -1 = indeterminate. | 18 |
| `util_asyncBulkLoader.reportStream()` |  | 13 |
| `util_asyncBulkLoader.sendAllCareerSaveSlotsDataAsync()` |  | 304 |
| `util_asyncBulkLoader.setupYield(job)` |  | 139 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `yield` | any |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `asyncGameplaySelectorLoadComplete`
- `asyncLevelLoadComplete`
- `asyncVehicleLoadComplete`

**Évènements UI (guihooks.trigger) :** `asyncGameplaySelectorLoadComplete`, `asyncLevelLoadComplete`, `asyncMissionLoadComplete`, `asyncVehicleLoadComplete`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/asyncBulkLoader.lua`.*
