# `flowgraph_nodes_events_controlsAction`

*Fichier : `lua/ge/extensions/flowgraph/nodes/events/controlsAction.lua` · VM : Game Engine (GE) · 67 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/events/controlsAction")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Controls Action » (catégorie logic, événement). Laisse passer le flux quand l'action (Ctrl + Space) est pressée. Pousse automatiquement l'action map « FlowgraphActions » au démarrage du graphe et la retire à l'arrêt. Pins : flow (entrée), flow (sortie impulsion une fois à l'appui) et value (bool caché, vrai à l'appui).

## Remarques

- L'événement est valide s'il date de moins de 2 frames du manager (mgr.frameCount).
- todo du code : interaction incertaine si plusieurs flowgraphs utilisent ce nœud.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Réinitialise l'état et appelle pushActionMap("FlowgraphActions"). | 36 |
| `C:_executionStopped()` | Réinitialise l'état et appelle popActionMap("FlowgraphActions"). | 30 |
| `C:drawMiddle(builder, style)` | Dessin du nœud dans l'éditeur. | 47 |
| `C:init(mgr, ...)` | Initialise self.reset = false. | 26 |
| `C:onControlsAction()` | Hook appelé quand l'action est déclenchée : mémorise le numéro de frame. | 42 |
| `C:work(args)` | Met flow et value à vrai pendant la frame qui suit l'appui, sinon à faux. | 53 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/events/controlsAction.lua`.*
