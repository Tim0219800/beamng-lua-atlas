# `flowgraph_nodes_gameplay_rally_sessionStart`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/sessionStart.lua` · VM : Game Engine (GE) · 129 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/sessionStart")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | gets called when the project of this node stops execution. | 25 |
| `C:loadExt()` |  | 47 |
| `C:loadRallyLoopBridge()` |  | 54 |
| `C:unloadExt()` |  | 33 |
| `C:workOnce()` |  | 63 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRallySessionEnd` — écouté par 1 module(s)
- `onRallySessionStart`

**Charge les extensions :** `gameplay_rally`, `gameplay_rallyStartClock`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/sessionStart.lua`.*
