# `flowgraph_nodes_activity_requestAbandon`

*Fichier : `lua/ge/extensions/flowgraph/nodes/activity/requestAbandon.lua` · VM : Game Engine (GE) · 64 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/activity/requestAbandon")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Request Abandon » (catégorie logic, tag input). Laisse passer le flux, une seule fois, quand le joueur demande d'abandonner la mission. Pins : entrée flow ; sorties flow (impulsion) et value (bool caché, vrai tant que l'abandon est demandé). Si ce nœud existe, le graphe doit être arrêté manuellement à la fin. data.blocksOnResetGameplay = true.

## Remarques

- L'appui est consommé : le drapeau est remis à faux après le travail et après le déclenchement (_afterTrigger). L'évènement est consigné dans le journal du graphe (logEvent « Player pressed 'Abandon' »).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_afterTrigger()` | Remet reset à faux après le déclenchement. | 43 |
| `C:_executionStarted()` | Remet reset à faux au démarrage du graphe. | 34 |
| `C:_executionStopped()` | Remet reset à faux à l'arrêt du graphe. | 29 |
| `C:drawMiddle(builder, style)` | Éditeur : dessine la zone centrale du nœud. | 47 |
| `C:init(mgr, ...)` | Met reset à faux et data.blocksOnResetGameplay à true. | 24 |
| `C:onRequestAbandon()` | Hook appelé quand le joueur demande l'abandon ; mémorise la demande. | 39 |
| `C:work(args)` | Si une demande d'abandon est en attente, active flow et value (et journalise), sinon les met à faux. | 51 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/activity/requestAbandon.lua`.*
