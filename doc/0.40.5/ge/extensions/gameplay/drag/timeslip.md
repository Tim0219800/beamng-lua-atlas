# `gameplay_drag_timeslip`

*Fichier : `lua/ge/extensions/gameplay/drag/timeslip.lua` · VM : Game Engine (GE) · 347 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drag_timeslip` : `extensions.load("gameplay_drag_timeslip")`, puis la globale `gameplay_drag_timeslip`

Génère le ticket de chronométrage (timeslip) d'une course de drag : infos de piste, météo (température, gravité), et pour chaque racer son nom, ses timers formatés, son dial, son écart au dial, sa disqualification et son résultat (gagnant, tie, breakOut, écart en secondes). Les données sont envoyées à l'UI par gameplay_drag_core.sendTimeslipDataToUi. Fournit aussi la version « panneau » (grille de libellés et lignes) et la capture d'écran du ticket.

## Remarques

- Format des valeurs : temps en secondes à 3 décimales ; vitesses exposées en km/h (x 3.6) et mph (x 2.23694) à 3 décimales ; '-' pour une valeur non définie (< 0).
- Les racers sont triés par couloir décroissant. Le champ winnerResult n'est rempli que s'il y a exactement 2 racers : 'ui.drag.timeslip.dq', '.winner', '.tie', '.breakOut', une chaîne vide (bracket : deux écarts positifs, le plus grand perd) ou '+x.xxx' (heads-up : retard sur l'autre).
- Les entrées en MP utilisent les timers réseau (race.timerValues) en priorité et ajoutent le pseudo du joueur au nom du véhicule.
- Appelle core.setCareerRewards() pour chaque racer : seul le premier appel accorde la récompense (une fois par course), les suivants renvoient une table vide.
- createTimeslipPanelData copie la clé 'tree' de la table du ticket, mais celle-ci n'existe pas au premier niveau (elle est dans stripInfo.tree) : cette clé n'est jamais renvoyée.
- Le ticket requiert dragData.prefabs.christmasTree.treeType (sinon erreur Lua) et utilise gameplay_drag_times (pas déclaré dans dependencies).
- La capture est enregistrée dans screenshots/timeslips/<date-heure> en jpg.

**Dépendances (chargées avant) :** `gameplay_drag_saveSystem`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drag_timeslip.createTimeslipData()` | Construit la table du ticket : stripInfo (stripName, levelName, dateTime, timestamp, tree), env (tempK/tempC/tempF, customGrav, gravity), dragType, laneCount, timerConfig, timeslipRows, importantTimerId et racerInfos (par racer : vehId, displayName, stock, licenseText, lane, finalTime, reactionTime, winTime, rewards, dialDiff, dialDiffStr, disqualification, marque/pays/transmission, timerEntries, timers, displayValues, winnerResult, persona...). | 63 |
| `gameplay_drag_timeslip.createTimeslipPanelData()` | Version panneau : reprend stripInfo, env, racerInfos, timerConfig, timeslipRows, importantTimerId et ajoute grid {labels, rows} (une ligne par racer avec ses valeurs de timers en police fixe). | 304 |
| `gameplay_drag_timeslip.screenshotTimeslip()` | Prend une capture d'écran jpg dans screenshots/timeslips/<date-heure> et affiche un message ui.drag.timeslip.saved. | 336 |

### Détail des paramètres

#### `gameplay_drag_timeslip.createTimeslipData()`

Construit la table du ticket : stripInfo (stripName, levelName, dateTime, timestamp, tree), env (tempK/tempC/tempF, customGrav, gravity), dragType, laneCount, timerConfig, timeslipRows, importantTimerId et racerInfos (par racer : vehId, displayName, stock, licenseText, lane, finalTime, reactionTime, winTime, rewards, dialDiff, dialDiffStr, disqualification, marque/pays/transmission, timerEntries, timers, displayValues, winnerResult, persona...).

- **renvoie** : table|nil Données du ticket, nil (log E) s'il n'y a pas de données de drag.

#### `gameplay_drag_timeslip.createTimeslipPanelData()`

Version panneau : reprend stripInfo, env, racerInfos, timerConfig, timeslipRows, importantTimerId et ajoute grid {labels, rows} (une ligne par racer avec ses valeurs de timers en police fixe).

- **renvoie** : table Données du panneau, {} s'il n'y a pas de ticket.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drag_saveSystem. |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `core_environment.` `getGravity`, `getTemperatureK`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drag/timeslip.lua`.*
