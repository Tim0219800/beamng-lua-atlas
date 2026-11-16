# `flowgraph_nodes_gameplay_traffic_signals_sequenceAdvance`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/sequenceAdvance.lua` · VM : Game Engine (GE) · 29 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/signals/sequenceAdvance")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Advance Sequence » (once_instant). Fait avancer une séquence de feux à l'étape suivante (sequence:advance()).

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Appelle advance() sur la séquence d'entrée si elle existe. | 22 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/sequenceAdvance.lua`.*
