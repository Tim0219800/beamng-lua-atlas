# `flowgraph_nodes_activity_activityFlow`

*Fichier : `lua/ge/extensions/flowgraph/nodes/activity/activityFlow.lua` · VM : Game Engine (GE) · 113 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/activity/activityFlow")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Activity Flow » (catégorie logic, tag activity). Point d'entrée d'un graphe de mission : sort du flux une fois au démarrage (pin « started »), à chaque frame tant que l'activité est en cours (« update »), puis une fois à l'arrêt (« stopped »). Pins cachés de sortie : dtReal, dtSim, dtRaw (delta times). Sans activité associée (graphe autonome), il fonctionne sur onUpdate ; avec une activité, il est piloté par le gestionnaire de missions.

## Remarques

- legacyPins renomme les anciens pins de sortie start -> started et stop -> stopped.
- Le code écrit encore dans self.pinOut.start/stop (anciens noms) ; cela passe grâce au renommage des legacyPins.
- Écrit aussi les delta times dans self.mgr.dtReal, dtSim et dtRaw.
- Au changement d'état 'stopped' avec activité : déclenche stopped puis appelle gameplay_missions_missionManager.stop.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:changedRunningState(newState)` | Hook : quand le graphe passe à 'stopped', déclenche stop() et arrête la mission (si activité en cours). | 82 |
| `C:drawMiddle()` | Éditeur : affiche si une activité est associée et la fin de son id. | 102 |
| `C:drawTooltip()` | Éditeur : infobulle indiquant l'id de l'activité ou le mode de compatibilité limitée. | 106 |
| `C:onExecutionStarted()` | Hook : au démarrage du graphe, si une activité existe et n'est pas en cours, la démarre via gameplay_missions_missionManager.start ; sans activité, appelle start(). | 39 |
| `C:onStartActivity()` | Hook appelé au démarrage de l'activité ; appelle start(). | 48 |
| `C:onStopActivity()` | Hook appelé à l'arrêt de l'activité ; appelle stop(). | 95 |
| `C:onUpdate(...)` | Hook par frame ; n'appelle update que si le graphe n'a pas d'activité. | 65 |
| `C:onUpdateActivity(...)` | Hook par frame envoyé par l'activité ; appelle update. | 70 |
| `C:start()` | Met le flux de « started » à vrai (update et stopped à faux) et déclenche le nœud. | 33 |
| `C:stop()` | Active le flux « stopped » et déclenche le nœud. | 75 |
| `C:update(dtReal, dtSim, dtRaw)` | Met à jour dtReal/dtSim/dtRaw (pins et gestionnaire), active « update » et déclenche le nœud. | 53 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/activity/activityFlow.lua`.*
