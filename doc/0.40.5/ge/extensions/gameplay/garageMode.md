# `gameplay_garageMode`

*Fichier : `lua/ge/extensions/gameplay/garageMode.lua` · VM : Game Engine (GE) · 582 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_garageMode` : `extensions.load("gameplay_garageMode")`, puis la globale `gameplay_garageMode`

**Dépendances (chargées avant) :** `core_jobsystem`, `core_vehicle_manager`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_garageMode.garageModeStartStep()` |  | 372 |
| `gameplay_garageMode.getGarageMenuState()` |  | 65 |
| `gameplay_garageMode.getLastOwnedVehicleId()` |  | 541 |
| `gameplay_garageMode.getLighting()` |  | 450 |
| `gameplay_garageMode.initStepFinished()` |  | 362 |
| `gameplay_garageMode.isActive()` |  | 485 |
| `gameplay_garageMode.isObjectsAutohide()` |  | 493 |
| `gameplay_garageMode.onClientPreStartMission(levelPath)` | *(hook)* | 461 |
| `gameplay_garageMode.onClientStartMission(levelPath)` | *(hook)* | 454 |
| `gameplay_garageMode.onDeserialized(v)` | *(hook)* | 481 |
| `gameplay_garageMode.onEnterVehicleFinished(vehicleId)` | *(hook)* | 69 |
| `gameplay_garageMode.onGarageEnter(context, toRoute, fromRoute, data)` | *(hook)* | 146 |
| `gameplay_garageMode.onLoadingScreenFadeout()` | *(hook)* | 545 |
| `gameplay_garageMode.onSerialize()` | *(hook)* | 475 |
| `gameplay_garageMode.onSpawnCCallback(vehicleId)` | *(hook)* | 121 |
| `gameplay_garageMode.onThumbnailTriggered(active)` | *(hook)* | 497 |
| `gameplay_garageMode.onVehicleSaveFinished()` | *(hook)* | 377 |
| `gameplay_garageMode.onVehicleSpawned(vehicleId)` | *(hook)* | 114 |
| `gameplay_garageMode.setCamera(preset)` |  | 84 |
| `gameplay_garageMode.setGarageMenuState(state)` |  | 56 |
| `gameplay_garageMode.setLighting(state)` |  | 318 |
| `gameplay_garageMode.setObjectsAutohide(v)` |  | 489 |
| `gameplay_garageMode.setVehicleDirty(vehicleDirty, switchedToNewVehicle)` |  | 50 |
| `gameplay_garageMode.start(_useCurrentLocation, skipInventoryStep)` |  | 385 |
| `gameplay_garageMode.stop()` |  | 445 |
| `gameplay_garageMode.testVehicle()` |  | 537 |
| `gameplay_garageMode.vehicleByIdOrActive(vehicleId)` |  | 191 |
| `gameplay_garageMode.zoom(value)` |  | 211 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEndGarageMode`
- `onUpdate` — écouté par 186 module(s)

**Évènements UI (guihooks.trigger) :** `FadeScreen`, `GarageModeBlackscreen`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/garageMode.lua`.*
