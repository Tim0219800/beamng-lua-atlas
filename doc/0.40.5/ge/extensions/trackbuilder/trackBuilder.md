# `trackbuilder_trackBuilder`

*Fichier : `lua/ge/extensions/trackbuilder/trackBuilder.lua` · VM : Game Engine (GE) · 3654 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `trackbuilder_trackBuilder` : `extensions.load("trackbuilder_trackBuilder")`, puis la globale `trackbuilder_trackBuilder`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `trackbuilder_trackBuilder.enter(levelName, forceLoad)` |  | 3577 |
| `trackbuilder_trackBuilder.exit()` |  | 3599 |
| `trackbuilder_trackBuilder.exitToMainMenu()` |  | 3609 |
| `trackbuilder_trackBuilder.hideTrackBuilder()` |  | 3530 |
| `trackbuilder_trackBuilder.isActive()` |  | 3573 |
| `trackbuilder_trackBuilder.onClientEndMission()` | *(hook)* | 3631 |
| `trackbuilder_trackBuilder.onRouteEnter(context, toRoute, fromRoute, data)` | *(hook)* | 3617 |
| `trackbuilder_trackBuilder.onRouteLeave(context, toRoute, fromRoute, data)` | *(hook)* | 3625 |
| `trackbuilder_trackBuilder.onUpdate()` | shows either the main window, the drive window or nothing when a screenshot is taken. *(hook)* | 2894 |
| `trackbuilder_trackBuilder.onWindowResized(size)` | *(hook)* | 3343 |
| `trackbuilder_trackBuilder.showTrackBuilder()` |  | 3521 |
| `trackbuilder_trackBuilder.showTrackBuilderWindow(show)` |  | 3477 |
| `trackbuilder_trackBuilder.toggleTrackBuilder()` |  | 3552 |

## Classe `tbFunctions`

| Méthode | Description | Ligne |
|---|---|---|
| `tbFunctions.drive(index)` | starts the drive mode. | 3102 |
| `tbFunctions.mergeMultiTrack(segments)` |  | 3148 |
| `tbFunctions.modifierChange(field)` | called after a modifier is changed. | 3070 |
| `tbFunctions.modifierRemove(field)` | called when a modifier is removed. | 3078 |
| `tbFunctions.modifierShift(name, offset)` | shifts a modifier forward or backward. | 3085 |
| `tbFunctions.navigate(off)` | moved the cursor by a given amount. | 2966 |
| `tbFunctions.pieceDeleted()` | attempts to delete a piece. | 3020 |
| `tbFunctions.pieceUpdated(replace)` | called when a parameter of a piece is changed. | 3031 |
| `tbFunctions.refreshPieceInfo()` | reads all the infos of the current piece, including modifiers. | 2983 |
| `tbFunctions.refreshTrackPositionRotation()` | refreshes the track position and rotation. | 3127 |
| `tbFunctions.switchSubTrack(index)` |  | 3135 |
| `tbFunctions.unDrive()` | ends the drive mode. | 3117 |

**Globales affectées :** `i`

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onTrackBuilderWindowToggled` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `ShowApps`

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `be:` `resetVehicle`
- `core_environment.` `getFogDensity`, `getTimeOfDay`, `setFogDensity`, `setTimeOfDay`
- `debugDrawer:` `drawLine`, `drawSphere`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/trackbuilder/trackBuilder.lua`.*
