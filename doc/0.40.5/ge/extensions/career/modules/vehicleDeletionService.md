# `career_modules_vehicleDeletionService`

*Fichier : `lua/ge/extensions/career/modules/vehicleDeletionService.lua` · VM : Game Engine (GE) · 110 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_vehicleDeletionService` : `extensions.load("career_modules_vehicleDeletionService")`, puis la globale `career_modules_vehicleDeletionService`

Service de suppression différée de véhicules en carrière : un véhicule « marqué » est supprimé (avec appel d'un callback) quand il est à plus de 100 m de la caméra et derrière elle, pour qu'il disparaisse sans que le joueur le voie. Les véhicules d'inventaire sont retirés via career_modules_inventory.removeVehicleObject, les autres via obj:delete(). Le hook onUpdate n'est branché que tant qu'au moins un véhicule est marqué.

## Remarques

- Bug potentiel : onUpdate appelle obj:getPositionXYZ() sans vérifier que getObjectByID a retourné un objet ; un véhicule supprimé ailleurs sans passer par onVehicleDestroyed provoquerait une erreur.
- onExtensionLoaded retourne false si la carrière n'est pas active, ce qui empêche le chargement du module.
- À chaque démarrage de mission (onAnyMissionChanged, état started), tous les véhicules marqués sont supprimés immédiatement (sans callback).

**Dépendances (chargées avant) :** `career_career`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_vehicleDeletionService.clearFlags(vehId)` | Retire le marquage d'un véhicule (et débranche onUpdate s'il ne reste rien). | 78 |
| `career_modules_vehicleDeletionService.deleteFlaggedVehicles()` | Supprime immédiatement tous les véhicules marqués. | 65 |
| `career_modules_vehicleDeletionService.flagForDeletion(vehId, callback)` | Marque un véhicule pour suppression différée et active la boucle onUpdate. | 71 |
| `career_modules_vehicleDeletionService.onAnyMissionChanged(state, mission)` | Hook émis à chaque changement d'état de mission : à « started » en carrière, supprime les véhicules marqués. *(interne)* *(hook)* | 88 |
| `career_modules_vehicleDeletionService.onClientStartMission()` | Hook de démarrage de niveau : vide la liste des véhicules marqués. *(interne)* *(hook)* | 83 |
| `career_modules_vehicleDeletionService.onExtensionLoaded()` | Hook de chargement : retourne false si la carrière n'est pas active. *(interne)* *(hook)* | 12 |
| `career_modules_vehicleDeletionService.onVehicleDestroyed(vehId)` | Hook émis quand un véhicule est détruit : retire son marquage. *(interne)* *(hook)* | 97 |

### Détail des paramètres

#### `career_modules_vehicleDeletionService.clearFlags(vehId)`

Retire le marquage d'un véhicule (et débranche onUpdate s'il ne reste rien).

- `vehId` (*integer*) : Id du véhicule.

#### `career_modules_vehicleDeletionService.flagForDeletion(vehId, callback)`

Marque un véhicule pour suppression différée et active la boucle onUpdate.

- `vehId` (*integer*) : Id du véhicule.
- `callback` (*function|nil*) : Appelé juste avant la suppression (défaut nop).

#### `career_modules_vehicleDeletionService.onAnyMissionChanged(state, mission)`

Hook émis à chaque changement d'état de mission : à « started » en carrière, supprime les véhicules marqués.

- `state` (*string*) : État de la mission.
- `mission` (*table|nil*) : Mission concernée.

#### `career_modules_vehicleDeletionService.onExtensionLoaded()`

Hook de chargement : retourne false si la carrière n'est pas active.

- **renvoie** : boolean|nil false pour refuser le chargement.

#### `career_modules_vehicleDeletionService.onVehicleDestroyed(vehId)`

Hook émis quand un véhicule est détruit : retire son marquage.

- `vehId` (*integer*) : Id du véhicule.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'career_career'}. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onUpdate` — écouté par 186 module(s)

## Appels vers le moteur (C++)

- `obj:` `delete`, `getPositionXYZ`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/vehicleDeletionService.lua`.*
