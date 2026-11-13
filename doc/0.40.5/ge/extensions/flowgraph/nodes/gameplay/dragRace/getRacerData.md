# `flowgraph_nodes_gameplay_dragRace_getRacerData`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/getRacerData.lua` · VM : Game Engine (GE) · 85 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/dragRace/getRacerData")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Drag Racer Data » (catégorie repeat_instant, LEGACY). Nœud de commodité qui donne l'état d'un pilote (vehId) : isPlayable, lane, isDesqualified, desqualifiedReason, isFinished. Le code recommande plutôt « Get Drag Racer Status » et « Get Drag Racer Spawn Point ».

## Remarques

- Écrit les sorties seulement si elles sont utilisées (isUsed).
- Si les données ne sont pas prêtes, les sorties gardent leur valeur précédente.
- L'orthographe « desqualified » (sans i) est celle du jeu.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Vide data et dragData. | 27 |
| `C:work()` | Lit dragBridge.getData et getRacerData(vehId), puis alimente les pins utilisés. | 32 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/getRacerData.lua`.*
