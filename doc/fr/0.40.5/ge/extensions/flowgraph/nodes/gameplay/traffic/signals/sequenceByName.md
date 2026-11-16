# `flowgraph_nodes_gameplay_traffic_signals_sequenceByName`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/sequenceByName.lua` · VM : Game Engine (GE) · 50 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/signals/sequenceByName")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Sequence by Name » (once_instant). Cherche une séquence de feux (groupe de signaux / logique de phases) par nom dans signalsData.sequences. Sorties : exists (caché), sequenceData.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelle onNodeReset(). | 31 |
| `C:init()` | Appelle onNodeReset(). | 27 |
| `C:onNodeReset()` | Vide la sortie sequenceData. | 23 |
| `C:work(args)` | Parcourt signalsData.sequences et publie la séquence de même nom. | 35 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/sequenceByName.lua`.*
