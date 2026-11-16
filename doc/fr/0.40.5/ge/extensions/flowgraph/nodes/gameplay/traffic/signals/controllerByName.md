# `flowgraph_nodes_gameplay_traffic_signals_controllerByName`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/controllerByName.lua` · VM : Game Engine (GE) · 50 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/signals/controllerByName")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Controller by Name » (once_instant). Cherche un contrôleur de feux (type de signal) par nom dans signalsData.controllers. Sorties : exists (caché), controllerData.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelle onNodeReset(). | 31 |
| `C:init()` | Appelle onNodeReset(). | 27 |
| `C:onNodeReset()` | Vide la sortie controllerData. | 23 |
| `C:work(args)` | Parcourt signalsData.controllers et publie le contrôleur de même nom. | 35 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/controllerByName.lua`.*
