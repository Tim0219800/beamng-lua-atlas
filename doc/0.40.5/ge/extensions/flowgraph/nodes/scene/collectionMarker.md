# `flowgraph_nodes_scene_collectionMarker`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/collectionMarker.lua` · VM : Game Engine (GE) · 100 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/collectionMarker")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` |  | 42 |
| `C:destroy()` |  | 94 |
| `C:hideMarker()` | removes all the markers and then removes the list. | 30 |
| `C:init(mgr, ...)` |  | 25 |
| `C:onClientEndMission()` |  | 89 |
| `C:work()` |  | 47 |

## Appels vers le moteur (C++)

- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/collectionMarker.lua`.*
