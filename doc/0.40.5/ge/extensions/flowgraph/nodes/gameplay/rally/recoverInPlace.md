# `flowgraph_nodes_gameplay_rally_recoverInPlace`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverInPlace.lua` · VM : Game Engine (GE) · 132 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/recoverInPlace")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` |  | 43 |
| `C:_executionStopped()` |  | 47 |
| `C:init()` |  | 39 |
| `C:onNodeReset()` |  | 51 |
| `C:runRecovery()` |  | 56 |
| `C:startRecovery()` |  | 85 |
| `C:work()` |  | 125 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRallyRouteRecoveryComplete` — écouté par 1 module(s)
- `onVehicleTeleportedToLastRoad`

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/recoverInPlace.lua`.*
