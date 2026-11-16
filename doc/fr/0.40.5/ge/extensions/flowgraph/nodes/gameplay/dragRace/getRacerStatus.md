# `flowgraph_nodes_gameplay_dragRace_getRacerStatus`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/getRacerStatus.lua` · VM : Game Engine (GE) · 99 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/dragRace/getRacerStatus")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Drag Racer Status » (catégorie repeat_instant). Donne l'état d'un pilote (pin vehId) : isPlayable, lane, isDesqualified, desqualifiedReason, isFinished. Quand les données manquent, les sorties utilisées valent faux, 0 ou chaîne vide.

## Remarques

- L'orthographe « desqualified » est celle du jeu.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Vide data et dragData. | 26 |
| `C:work()` | Lit dragBridge.getData et getRacerData(vehId) puis écrit les pins utilisés. | 31 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/getRacerStatus.lua`.*
