# `flowgraph_nodes_gameplay_traffic_signals_sequenceSettings`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/sequenceSettings.lua` · VM : Game Engine (GE) · 42 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/signals/sequenceSettings")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Signal Sequence Settings » (once_instant). Règle une séquence de feux : active (setActive), timed (enableTimer), stepIndex (setStep, prioritaire) ou phaseIndex (setPhase). Seuls les pins non nil sont appliqués.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Applique activation, minuterie, puis saute à l'étape (ou, à défaut, à la phase) demandée. | 25 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/sequenceSettings.lua`.*
