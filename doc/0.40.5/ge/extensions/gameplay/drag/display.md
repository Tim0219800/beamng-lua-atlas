# `gameplay_drag_display`

*Fichier : `lua/ge/extensions/gameplay/drag/display.lua` · VM : Game Engine (GE) · 1770 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drag_display` : `extensions.load("gameplay_drag_display")`, puis la globale `gameplay_drag_display`

**Dépendances (chargées avant) :** `gameplay_drag_core`, `gameplay_drag_phaseHandlers`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drag_display.broadcastTreeLightStaging(visible)` |  | 117 |
| `gameplay_drag_display.clearAll()` |  | 684 |
| `gameplay_drag_display.dragRaceEndLineReached(vehId)` |  | 1651 |
| `gameplay_drag_display.dragRaceVehicleStopped()` |  | 1655 |
| `gameplay_drag_display.onBeforeDragUnloadAllExtensions()` | *(hook)* | 684 |
| `gameplay_drag_display.onDragClear(options)` | *(hook)* | 1724 |
| `gameplay_drag_display.onDragDataSet(data)` | Called when general sets drag data (setDragRaceData). Inits tree lights and display digits for current strip.<br>In MP, display digits are preserved (cleared only at race start or gamemode stop). *(hook)* | 1733 |
| `gameplay_drag_display.onDragRaceTimerUpdated(raceId, mpPlayerId, timerName, timerValue)` | When a remote racer's timer values arrive via network, update their display signs and UI. *(hook)* | 1758 |
| `gameplay_drag_display.onDragReset(options)` | *(hook)* | 1711 |
| `gameplay_drag_display.onExtensionLoaded()` | *(hook)* | 695 |
| `gameplay_drag_display.onPreRender(dtReal, dtSim, dtRaw)` | *(hook)* | 1350 |
| `gameplay_drag_display.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 1303 |
| `gameplay_drag_display.onWinnerLightOn(lane)` | *(hook)* | 1365 |
| `gameplay_drag_display.preStageLightOff(vehId)` |  | 1472 |
| `gameplay_drag_display.preStageLightOn(vehId)` |  | 1437 |
| `gameplay_drag_display.resetDragRaceValues()` |  | 1681 |
| `gameplay_drag_display.setDisqualifiedLights(vehId)` |  | 1597 |
| `gameplay_drag_display.stageLightOff(vehId)` |  | 1537 |
| `gameplay_drag_display.stageLightOn(vehId)` |  | 1500 |
| `gameplay_drag_display.startDragCountdown(vehId, dial)` |  | 1568 |
| `gameplay_drag_display.stoppingVehicleDrag(vehId)` |  | 1644 |
| `gameplay_drag_display.updateTreeLightsFromNetwork(lane, lightState)` |  | 455 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `alwaysShowStageApp` | boolean |  |
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onDragCountdownStarted` — écouté par 1 module(s)
- `startRaceFromTree`

**Évènements UI (guihooks.trigger) :** `ScenarioFlashMessage`, `TopCenterAppsFlashMessage`, `updateTreeLightApp`, `updateTreeLightDistance`, `updateTreeLightPhase`, `updateTreeLightStaging`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drag/display.lua`.*
