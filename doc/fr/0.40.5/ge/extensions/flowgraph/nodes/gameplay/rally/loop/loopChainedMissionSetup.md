# `flowgraph_nodes_gameplay_rally_loop_loopChainedMissionSetup`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/loopChainedMissionSetup.lua` · VM : Game Engine (GE) · 43 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/loop/loopChainedMissionSetup")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Loop Chained Mission Setup » (catégorie once_instant, tag rally, sans pin). Prépare la mission suivante de la boucle rally après un transfert d'exécution : met le drapeau de transfert à false (gameplay_rallyLoop.setMissionExecutionTransferFlag(false)) puis appelle gameplay_rallyLoop.setupForNewMission(). À l'arrêt du graphe, décharge l'extension de boucle rally sauf si un transfert d'exécution est en cours.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Décharge l'extension rally loop si elle est chargée et qu'aucun transfert d'exécution de mission n'est signalé. | 21 |
| `C:workOnce()` | Réinitialise le drapeau de transfert et appelle setupForNewMission si gameplay_rallyLoop existe. | 33 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/loopChainedMissionSetup.lua`.*
