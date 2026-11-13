# `util_screenshotCreator_vehicleSetup`

*Fichier : `lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua` · VM : Game Engine (GE) · 157 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_vehicleSetup` : `extensions.load("util_screenshotCreator_vehicleSetup")`, puis la globale `util_screenshotCreator_vehicleSetup`

**Dépendances (chargées avant) :** `util_screenshotCreator_thumbnailConfig`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_vehicleSetup.getFloorHeight(bb)` | probed from above the box: props with buried nodes (bollards, posts) put the box bottom under the floor,<br> where the short probe of getGroundHeight misses the floor and reports the buried bottom instead | 46 |
| `util_screenshotCreator_vehicleSetup.getGroundHeight(position)` |  | 29 |
| `util_screenshotCreator_vehicleSetup.getResetTransform(vehicle)` |  | 96 |
| `util_screenshotCreator_vehicleSetup.getThumbnailSpawnTransform()` |  | 89 |
| `util_screenshotCreator_vehicleSetup.onVehicleSpawned(vehicleId)` | *(hook)* | 149 |
| `util_screenshotCreator_vehicleSetup.placeVehicleForThumbnail(vehicle, configName, fallbackPosition, fallbackRotation)` |  | 102 |
| `util_screenshotCreator_vehicleSetup.setLowBeams(vehicle, enabled)` |  | 143 |
| `util_screenshotCreator_vehicleSetup.waitForVehicleToSettle(modelName, configName, options)` |  | 135 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua`.*
