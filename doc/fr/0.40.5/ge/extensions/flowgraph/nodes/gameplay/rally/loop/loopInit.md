# `flowgraph_nodes_gameplay_rally_loop_loopInit`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/loopInit.lua` · VM : Game Engine (GE) · 89 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/loop/loopInit")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Loop Init » (catégorie once_instant, tag rally). Initialise la boucle rally : recharge l'extension de boucle (déchargement puis chargement), détecte l'id et le dossier de la mission (RallyUtil.detectMissionIdHelper), applique la date et l'heure de l'environnement de la mission si activé (RallyLoopTime.applyCurrentDate, et RallyLoopTime.setPlaying(false, heure) si _rallyForceStatic), active le debug logging puis appelle gameplay_rallyLoop.setup(missionId, missionDir). Sorties : success (flow) ou failed (flow) si aucun id de mission n'est détecté.

## Remarques

- En cas d'échec, un encadré d'erreur dans le log rappelle de choisir une spéciale rally dans l'éditeur de missions et d'ouvrir le fichier de course.
- À l'arrêt du graphe, l'extension de boucle rally est déchargée.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Décharge l'extension rally loop si chargée. | 30 |
| `C:loadExt()` | Charge l'extension rally loop si elle n'est pas chargée. | 45 |
| `C:unloadExt()` | Décharge l'extension rally loop si elle est chargée. | 38 |
| `C:workOnce()` | Recharge l'extension, détecte la mission, configure l'environnement et lance gameplay_rallyLoop.setup ; met success ou failed à vrai. | 52 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/loopInit.lua`.*
