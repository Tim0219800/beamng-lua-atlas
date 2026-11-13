# `flowgraph_nodes_scene_spawnLight`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/spawnLight.lua` · VM : Game Engine (GE) · 140 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/spawnLight")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` |  | 76 |
| `C:clearObjects()` |  | 79 |
| `C:createObject(objectName)` |  | 38 |
| `C:destroy()` |  | 134 |
| `C:init(mgr, ...)` |  | 33 |
| `C:onClientEndMission()` |  | 129 |
| `C:work()` |  | 92 |

## Appels vers le moteur (C++)

- `obj:` `delete`, `getId`
- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/spawnLight.lua`.*
