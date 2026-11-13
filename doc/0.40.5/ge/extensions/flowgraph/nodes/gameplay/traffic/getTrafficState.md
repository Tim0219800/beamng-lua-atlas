# `flowgraph_nodes_gameplay_traffic_getTrafficState`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/getTrafficState.lua` · VM : Game Engine (GE) · 38 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/getTrafficState")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Traffic State » (repeat_instant). Lit l'état du trafic (gameplay_traffic.getState : on, off, spawning, loading) et le nombre de véhicules : sorties flow on/spawning/loading/off, onBool, state, amount (getNumOfTraffic), activeAmount (getNumOfTraffic(true), issus du vehicle pool).

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Écrit l'état et les compteurs de trafic sur les sorties à chaque frame. | 28 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/getTrafficState.lua`.*
