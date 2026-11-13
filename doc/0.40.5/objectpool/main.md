# `main`

*Fichier : `lua/objectpool/main.lua` · VM : Commun (GE + véhicule) · 108 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("main")`

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `__indexHandler(t, key)` |  | 100 |
| `__newIndexHandler(t, key, val)` |  | 96 |
| `_setObj(objId, _obj)` |  | 90 |
| `deleteObject(objId)` |  | 40 |
| `getObject(objId)` |  | 24 |
| `init(path, initData)` | called in object Lua VM | 49 |
| `initPool()` | thread Lua VM | 45 |
| `moveObject(objId)` |  | 28 |
| `onBeamBroke(id, energy)` |  | 81 |
| `onBeamDeformed(id, ratio)` |  | 84 |
| `onNodeCollision(id1, pos, normal, nodeVel, perpendicularVel, slipVec, slipVel, slipForce, normalForce, depth, materialId1, materialId2)` |  | 74 |
| `onVehicleReset(retainDebug)` |  | 78 |
| `print(...)` |  | 18 |
| `setObject(objId, objDataStr)` |  | 35 |

**Globales affectées :** `float3`, `objData`, `vmType`

## Appels vers le moteur (C++)

- `obj:` `getId`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/objectpool/main.lua`.*
