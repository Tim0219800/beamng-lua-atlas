# `flowgraph_nodes_gameplay_rally_handleLapChange`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/handleLapChange.lua` · VM : Game Engine (GE) · 37 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/handleLapChange")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Mode Handle Lap Change » (tag rally). Prévu pour mettre à jour les infos de tour. Entrées : lapChange (impulsion), currLap, maxLap.

## Remarques

- Nœud vide en pratique : work() teste lapChange mais n'exécute rien (corps du if vide, code commenté).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Ne fait rien : le traitement du changement de tour est vide. | 30 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/handleLapChange.lua`.*
