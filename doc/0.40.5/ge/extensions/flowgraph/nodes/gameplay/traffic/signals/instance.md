# `flowgraph_nodes_gameplay_traffic_signals_instance`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/instance.lua` · VM : Game Engine (GE) · 46 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/signals/instance")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Signal Instance » (repeat_instant). Lit une instance de feu (signalInstanceData) : pos (position d'arrêt), dirVec, targetPos (pos si absent), stateName, stateAction, active, sequenceData et controllerData (tables vides si absents).

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:work(args)` | Recopie les propriétés de l'instance et son état courant (instance:getState()) sur les sorties. | 29 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/instance.lua`.*
