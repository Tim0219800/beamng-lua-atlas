# `flowgraph_modules_prefabModule`

*Fichier : `lua/ge/extensions/flowgraph/modules/prefabModule.lua` · VM : Game Engine (GE) · 340 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/modules/prefabModule")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:addPrefab(id, moreData)` |  | 152 |
| `C:afterTrigger()` |  | 20 |
| `C:clear()` |  | 14 |
| `C:deletePrefab(id, force)` |  | 284 |
| `C:executionStopped()` |  | 307 |
| `C:getPrefab(id)` |  | 135 |
| `C:getVehicleIdsForPrefab(id)` |  | 239 |
| `C:init()` |  | 7 |
| `C:originalVehicleTransforms(data)` |  | 92 |
| `C:restoreVehiclePositions(id)` |  | 225 |
| `C:setKeepPrefab(id, keep)` |  | 277 |
| `C:setUnpackVehiclesBeforeDeletion(id, set)` |  | 271 |
| `C:spawnPrefab(fileName)` |  | 139 |
| `C:unpackPrefabAndDelete(id, obj)` |  | 248 |

## Appels vers le moteur (C++)

- `Sim.` `upcast`
- `be:` `reloadCollision`
- `obj:` `at`, `delete`, `explode`, `getChildrenObjectIds`, `getClassName`, `getId`, `isSubClassOf`, `size`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/modules/prefabModule.lua`.*
