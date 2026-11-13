# `flowgraph_nodes_gameplay_rally_sessionStart`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/sessionStart.lua` · VM : Game Engine (GE) · 129 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/sessionStart")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Mode Session Start » (catégorie once_instant, tag rally). Charge ce qu'il faut pour le mode rally : extensions gameplay_rally, pont de boucle rally (extRallyLoop) et gameplay_rallyStartClock ; détermine la mission (via le gestionnaire de boucle rally si chargé, sinon RallyUtil.detectMissionIdHelper) ; appelle gameplay_rally.loadMission(missionId, missionDir, nil, voicepackPick, {owner = 'mission'}) ; si disableOnStart, désactive le traitement des pacenotes ; en mode boucle, appelle gameplay_rallyLoop.setupForNewMission() et sort le chemin du préfab de boucle (loopPrefab, rm:getLoopPrefabPath()). Si fireEvents, déclenche le hook onRallySessionStart. Entrées : fireEvents (défaut true), disableOnStart (défaut false). Sortie : loopPrefab (string).

## Remarques

- À l'arrêt du graphe, décharge gameplay_rallyStartClock et gameplay_rally (et le pont de boucle s'il a été chargé par ce nœud et qu'aucun gestionnaire de boucle n'existe) puis déclenche onRallySessionEnd si fireEvents.
- Si la mission n'est pas détectée, un encadré d'erreur est loggé et rien n'est chargé.
- La pin loopPrefab est déclarée type string avec default = false (incohérent).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Décharge les extensions rally et émet onRallySessionEnd si fireEvents. | 25 |
| `C:loadExt()` | Charge l'extension gameplay_rally si besoin. | 47 |
| `C:loadRallyLoopBridge()` | Charge le pont de boucle rally s'il n'est pas chargé et mémorise si c'est ce nœud qui l'a chargé. | 54 |
| `C:unloadExt()` | Décharge gameplay_rallyStartClock, gameplay_rally et, sous conditions, le pont de boucle rally. | 33 |
| `C:workOnce()` | Exécute la séquence de démarrage de session décrite dans la description du module. | 63 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRallySessionEnd` — écouté par 1 module(s)
- `onRallySessionStart`

**Charge les extensions :** `gameplay_rally`, `gameplay_rallyStartClock`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/sessionStart.lua`.*
