# `flowgraph_nodes_scene_storeStatics`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua` · VM : Game Engine (GE) · 329 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/storeStatics")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` |  | 224 |
| `C:_executionStopped()` |  | 233 |
| `C:_onDeserialized(nodeData)` |  | 321 |
| `C:_onSerialize(res)` |  | 317 |
| `C:clearObjects()` |  | 239 |
| `C:createObject(pos, rot, scl, shape)` |  | 194 |
| `C:destroy()` |  | 309 |
| `C:drawCustomProperties()` |  | 33 |
| `C:init(mgr, ...)` |  | 28 |
| `C:onClientEndMission()` |  | 305 |
| `C:spawnObjects(force)` |  | 265 |
| `C:updateStoredObjects(ids)` |  | 145 |
| `C:work()` |  | 292 |

## Appels vers le moteur (C++)

- `obj:` `delete`, `getId`, `getPosition`, `getRotation`, `getScale`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua`.*
