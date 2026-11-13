# `career_modules_vehicleDeletionService`

*Fichier : `lua/ge/extensions/career/modules/vehicleDeletionService.lua` · VM : Game Engine (GE) · 110 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_vehicleDeletionService` : `extensions.load("career_modules_vehicleDeletionService")`, puis la globale `career_modules_vehicleDeletionService`

**Dépendances (chargées avant) :** `career_career`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_vehicleDeletionService.clearFlags(vehId)` |  | 78 |
| `career_modules_vehicleDeletionService.deleteFlaggedVehicles()` |  | 65 |
| `career_modules_vehicleDeletionService.flagForDeletion(vehId, callback)` |  | 71 |
| `career_modules_vehicleDeletionService.onAnyMissionChanged(state, mission)` | *(hook)* | 88 |
| `career_modules_vehicleDeletionService.onClientStartMission()` | *(hook)* | 83 |
| `career_modules_vehicleDeletionService.onExtensionLoaded()` | *(hook)* | 12 |
| `career_modules_vehicleDeletionService.onVehicleDestroyed(vehId)` | *(hook)* | 97 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onUpdate` — écouté par 186 module(s)

## Appels vers le moteur (C++)

- `obj:` `delete`, `getPositionXYZ`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/vehicleDeletionService.lua`.*
