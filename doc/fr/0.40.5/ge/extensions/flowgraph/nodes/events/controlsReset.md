# `flowgraph_nodes_events_controlsReset`

*Fichier : `lua/ge/extensions/flowgraph/nodes/events/controlsReset.lua` · VM : Game Engine (GE) · 78 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/events/controlsReset")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Controls Reset » (catégorie logic, événement). Laisse passer le flux quand le joueur appuie sur Reset. Quand il est utilisé, le reset par défaut du freeroam n'a plus lieu (data.blocksOnResetGameplay = true). Pins : flow (entrée), flow (sortie impulsion) et value (bool caché).

## Remarques

- Enregistre un événement dans le log du flowgraph (logEvent) à chaque appui.
- Ajoute un bouton « Reset » à l'interface de contexte de jeu (onGatherGameContextUiButtons), actif seulement si le nœud est dans un état actif et a été utilisé à la frame courante.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_afterTrigger()` | Remet self.reset à false après le déclenchement. | 43 |
| `C:_executionStarted()` | Remet self.reset à false. | 34 |
| `C:_executionStopped()` | Remet self.reset à false. | 29 |
| `C:drawMiddle(builder, style)` | Dessin du nœud dans l'éditeur. | 47 |
| `C:init(mgr, ...)` | Initialise self.reset et data.blocksOnResetGameplay. | 24 |
| `C:onGatherGameContextUiButtons(results)` | Hook : ajoute à results le bouton {id='controlsReset', label='Reset', order=0, active}. | 64 |
| `C:onResetGameplay()` | Hook appelé par extensions.hook("onResetGameplay") : mémorise l'appui. | 39 |
| `C:work(args)` | Met flow et value à vrai une frame après un reset, sinon à faux. | 51 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/events/controlsReset.lua`.*
