# `flowgraph_nodes_activity_activityStop`

*Fichier : `lua/ge/extensions/flowgraph/nodes/activity/activityStop.lua` · VM : Game Engine (GE) · 46 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/activity/activityStop")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Finish Mission » (tag activity). Arrête la mission en cours : quand le flux arrive, il arrête l'exécution du graphe (mgr:setRunning(false)) après le déclenchement des nœuds de la frame. Pins d'entrée : flow, « attempt » (table attemptData). Sans activité associée, la tentative est jetée avec un log W et l'écran de fondu est arrêté (ui_fadeScreen.stop(0)).

## Remarques

- La tentative lue (pin attempt, sinon newAttempt('attempted', {})) n'est plus enregistrée : l'appel à missionManager.stop est commenté, seul setRunning(false) arrête le graphe.
- La catégorie n'est pas définie dans ce fichier.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_afterTrigger()` | Appelée après le déclenchement des nœuds : si stopping, arrête le graphe (setRunning(false)) ; sans activité, loggue l'abandon de la tentative et arrête le fondu d'écran. | 27 |
| `C:work()` | Marque self.stopping = true quand le nœud est exécuté. | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/activity/activityStop.lua`.*
