# `gameplay_walk`

*Fichier : `lua/ge/extensions/gameplay/walk.lua` · VM : Game Engine (GE) · 697 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_walk` : `extensions.load("gameplay_walk")`, puis la globale `gameplay_walk`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_walk.addVehicleToBlacklist(vehId)` |  | 561 |
| `gameplay_walk.canSetWalkingMode(enabled, force, player)` |  | 306 |
| `gameplay_walk.canToggleWalkingMode(force, player)` | pos and rot are optional | 298 |
| `gameplay_walk.clearBlacklist()` |  | 573 |
| `gameplay_walk.enableToggling(enabled)` |  | 553 |
| `gameplay_walk.getBlacklist()` |  | 577 |
| `gameplay_walk.getCurrentUnicycle(player)` | returns the unicycle a player is currently in, no matter if it's the one saved under unicycleIds or not | 114 |
| `gameplay_walk.getDoorsidePosRot(veh)` | returns a position near the driver's door | 215 |
| `gameplay_walk.getFacePart(player)` | priority: the unicycle part (part selector), the splitscreen setting, the last known face, a random face | 135 |
| `gameplay_walk.getInVehicle(vehicle, player)` |  | 252 |
| `gameplay_walk.getPaint(player)` | priority: the splitscreen persona paint, the unicycle paint (vehicle config menu), the last known paint, the saved color | 150 |
| `gameplay_walk.getPosRot(player)` |  | 530 |
| `gameplay_walk.getPosXYZ(player)` |  | 538 |
| `gameplay_walk.getRotXYZW(player)` |  | 546 |
| `gameplay_walk.getStoredUnicycleId(player)` |  | 357 |
| `gameplay_walk.getVehicleInFront(player)` |  | 510 |
| `gameplay_walk.isAtParkingSpeed(player)` |  | 181 |
| `gameplay_walk.isTogglingEnabled()` |  | 557 |
| `gameplay_walk.isVehicleBlacklisted(vehId)` |  | 569 |
| `gameplay_walk.isWalking(player)` |  | 177 |
| `gameplay_walk.onCameraChanged(player, camName, vid)` | hide the unicycle in that player's own render view while they use the unicycle camera, or while the big map transition flies away from them *(hook)* | 598 |
| `gameplay_walk.onClientEndMission(levelPath)` | *(hook)* | 586 |
| `gameplay_walk.onClientStartMission(levelPath)` | *(hook)* | 581 |
| `gameplay_walk.onDeserialize(data)` | *(hook)* | 518 |
| `gameplay_walk.onSerialize()` | *(hook)* | 514 |
| `gameplay_walk.onSplitScreenChanged(enabled, playerCount, layout, mode)` | *(hook)* | 593 |
| `gameplay_walk.onUpdate(dtReal, dtSim)` | *(hook)* | 502 |
| `gameplay_walk.onVehicleColorChanged(vehId, index, paint)` | *(hook)* | 628 |
| `gameplay_walk.onVehicleDestroyed(vehId)` | *(hook)* | 654 |
| `gameplay_walk.onVehicleReplaced(vehId)` | *(hook)* | 650 |
| `gameplay_walk.onVehicleSwitched(oldId, newId, player)` | *(hook)* | 617 |
| `gameplay_walk.removeVehicleFromBlacklist(vehId)` |  | 565 |
| `gameplay_walk.setFacePart(player, facePart)` | a walking player gets their unicycle respawned with the new face, otherwise the stored unicycle is dropped and respawned later | 163 |
| `gameplay_walk.setRot(front, up, player)` |  | 287 |
| `gameplay_walk.setWalkingMode(enabled, pos, rot, force, player)` |  | 311 |
| `gameplay_walk.toggleWalkingMode(player)` |  | 361 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onBeforeWalkingModeToggled` — écouté par 2 module(s)

**Évènements UI (guihooks.trigger) :** `Message`

## Appels vers le moteur (C++)

- `be:` `enterVehicle`, `exitVehicle`, `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfAxisXYZ`, `getObjectOOBBIsInitialized`, `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/walk.lua`.*
