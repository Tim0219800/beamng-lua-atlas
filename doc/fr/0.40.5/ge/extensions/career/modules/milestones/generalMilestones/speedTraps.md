# `career_modules_milestones_generalMilestones_speedTraps`

*Fichier : `lua/ge/extensions/career/modules/milestones/generalMilestones/speedTraps.lua` · VM : Game Engine (GE) · 189 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_milestones_generalMilestones_speedTraps` : `extensions.load("career_modules_milestones_generalMilestones_speedTraps")`, puis la globale `career_modules_milestones_generalMilestones_speedTraps`

Jalons liés aux radars (gameplay_speedTraps) en carrière : record de vitesse atteinte devant un radar (velocitySpeedTrapMilestone, paliers 70, 90, 120, 150, 180 et 220 km/h stockés en m/s) et nombre total de déclenchements de radar par le joueur (speedTrapTriggerCounterMilestone, 10 paliers de 15 déclenchements). Les jalons par radar individuel et « tous les radars » sont désactivés (code commenté).

## Remarques

- Bug : `M.onGeneralMilestoneClaimed = registerStastisticCallback` référence une variable qui n'existe pas dans ce fichier (copier-coller de statistic.lua) : elle vaut nil, le champ exporté est donc nil.
- Le compteur de déclenchements ne s'arrête pas à maxStep (10) : getTarget(step) = step*15 n'est jamais nil, donc triggerCount continue d'augmenter et notificationStep aussi.
- onSpeedTrapTriggered ignore les radars sans speedLimit et ceux déclenchés par un autre véhicule que le véhicule joueur 0.
- Les vitesses sont en m/s (km/h / 3.6).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_milestones_generalMilestones_speedTraps.onGeneralMilestonesCollect(milestonesList)` | Hook : crée les deux jalons actifs (record de vitesse et compteur) avec leur sauvegarde (maxVelocityReachedByPlayer, triggerCount) et les ajoute à milestonesList. *(interne)* *(hook)* | 10 |
| `career_modules_milestones_generalMilestones_speedTraps.onSpeedTrapTriggered(speedTrapData, playerSpeed, overSpeed)` | Hook appelé quand un radar se déclenche : met à jour le record de vitesse du joueur, notifie tous les paliers de vitesse franchis, et incrémente le compteur de déclenchements. *(interne)* *(hook)* | 123 |

### Détail des paramètres

#### `career_modules_milestones_generalMilestones_speedTraps.onGeneralMilestonesCollect(milestonesList)`

Hook : crée les deux jalons actifs (record de vitesse et compteur) avec leur sauvegarde (maxVelocityReachedByPlayer, triggerCount) et les ajoute à milestonesList.

- `milestonesList` (*table[]*) : Liste à compléter.

#### `career_modules_milestones_generalMilestones_speedTraps.onSpeedTrapTriggered(speedTrapData, playerSpeed, overSpeed)`

Hook appelé quand un radar se déclenche : met à jour le record de vitesse du joueur, notifie tous les paliers de vitesse franchis, et incrémente le compteur de déclenchements.

- `speedTrapData` (*table*) : Données du radar (speedLimit, subjectID...).
- `playerSpeed` (*number*) : Vitesse mesurée en m/s.
- `overSpeed` (*number*) : Excès de vitesse (non utilisé ici).

## Champs

| Champ | Type | Description |
|---|---|---|
| `onGeneralMilestoneClaimed` | any | after a milestone is claimed, also re-register the watch ⚠ référence `registerStastisticCallback` non définie dans le fichier (vaut probablement nil) |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/milestones/generalMilestones/speedTraps.lua`.*
