# `career_modules_milestones_generalMilestones_speedTraps`

*Fichier : `lua/ge/extensions/career/modules/milestones/generalMilestones/speedTraps.lua` · VM : Game Engine (GE) · 189 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_milestones_generalMilestones_speedTraps` : `extensions.load("career_modules_milestones_generalMilestones_speedTraps")`, puis la globale `career_modules_milestones_generalMilestones_speedTraps`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_milestones_generalMilestones_speedTraps.onGeneralMilestonesCollect(milestonesList)` | *(hook)* | 10 |
| `career_modules_milestones_generalMilestones_speedTraps.onSpeedTrapTriggered(speedTrapData, playerSpeed, overSpeed)` | *(hook)* | 123 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `onGeneralMilestoneClaimed` | any | after a milestone is claimed, also re-register the watch ⚠ référence `registerStastisticCallback` non définie dans le fichier (vaut probablement nil) |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/milestones/generalMilestones/speedTraps.lua`.*
