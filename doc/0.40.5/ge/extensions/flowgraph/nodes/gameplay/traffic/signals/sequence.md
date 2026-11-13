# `flowgraph_nodes_gameplay_traffic_signals_sequence`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/sequence.lua` · VM : Game Engine (GE) · 39 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/signals/sequence")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Signal Sequence » (repeat_instant). Lit une séquence de feux (signalSequenceData) : step (currStep), maxSteps (#timelineTimes), duration (totalDuration), phase (currPhase), active, timed (not ignoreTimer).

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:work(args)` | Recopie les propriétés de la séquence sur les sorties. | 27 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/sequence.lua`.*
