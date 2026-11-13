# `flowgraph_nodes_gameplay_traffic_signals_instanceState`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/instanceState.lua` · VM : Game Engine (GE) · 33 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/signals/instanceState")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Predict Signal State » (once_instant). Prédit l'état futur d'une instance de feu après `seconds` secondes (positives uniquement) via instance:getStateAfterTime. Sorties : stateName, stateAction.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Calcule l'état prédit et écrit stateName / stateAction. | 24 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/instanceState.lua`.*
