# `gameplay_multiseat_gamemodeManager`

*Fichier : `lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua` · VM : Game Engine (GE) · 722 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_multiseat_gamemodeManager` : `extensions.load("gameplay_multiseat_gamemodeManager")`, puis la globale `gameplay_multiseat_gamemodeManager`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_multiseat_gamemodeManager.deferReady()` |  | 372 |
| `gameplay_multiseat_gamemodeManager.getGamemodeId()` |  | 503 |
| `gameplay_multiseat_gamemodeManager.getMaxPlayers()` |  | 507 |
| `gameplay_multiseat_gamemodeManager.getPhase()` |  | 512 |
| `gameplay_multiseat_gamemodeManager.getPlayerName(playerIndex)` |  | 128 |
| `gameplay_multiseat_gamemodeManager.getVehiclePool()` |  | 394 |
| `gameplay_multiseat_gamemodeManager.goToMainMenu()` |  | 319 |
| `gameplay_multiseat_gamemodeManager.isActive()` |  | 499 |
| `gameplay_multiseat_gamemodeManager.isStartScreenPending()` |  | 516 |
| `gameplay_multiseat_gamemodeManager.notifyReady()` |  | 378 |
| `gameplay_multiseat_gamemodeManager.onAfterRouteChange(context)` | *(hook)* | 591 |
| `gameplay_multiseat_gamemodeManager.onClientEndMission()` | *(hook)* | 686 |
| `gameplay_multiseat_gamemodeManager.onExtensionUnloaded()` | *(hook)* | 599 |
| `gameplay_multiseat_gamemodeManager.onGetIsMissionStartOrEndScreenActive(screensActive)` | *(hook)* | 581 |
| `gameplay_multiseat_gamemodeManager.onLoadingScreenFadeout()` | *(hook)* | 587 |
| `gameplay_multiseat_gamemodeManager.onMissionScreenButtonClicked(button)` | *(hook)* | 557 |
| `gameplay_multiseat_gamemodeManager.onMultiseatSettingsApplied(changeSet, result)` | *(hook)* | 681 |
| `gameplay_multiseat_gamemodeManager.onPauseHomeRailBuildMultiseatActions(actions, context, registerButton)` | *(hook)* | 624 |
| `gameplay_multiseat_gamemodeManager.onPreRender(dtReal, dtSim)` | *(hook)* | 533 |
| `gameplay_multiseat_gamemodeManager.onRequestMissionScreenData(mode)` | *(hook)* | 550 |
| `gameplay_multiseat_gamemodeManager.onScreenFadeState(state)` | *(hook)* | 527 |
| `gameplay_multiseat_gamemodeManager.onVehicleSwitched(oldId, newId, player)` | *(hook)* | 675 |
| `gameplay_multiseat_gamemodeManager.playPendingRound()` |  | 520 |
| `gameplay_multiseat_gamemodeManager.requestGamemodeData()` |  | 144 |
| `gameplay_multiseat_gamemodeManager.restart(name, settings)` |  | 481 |
| `gameplay_multiseat_gamemodeManager.setReadyCallback(callback)` |  | 368 |
| `gameplay_multiseat_gamemodeManager.shouldAssignVehiclePool()` |  | 399 |
| `gameplay_multiseat_gamemodeManager.showEndScreen(resultData)` |  | 252 |
| `gameplay_multiseat_gamemodeManager.start(name, settings, options)` |  | 432 |
| `gameplay_multiseat_gamemodeManager.stop()` |  | 364 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `ModuleName` | string |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onGetMultiseatGamemodeInfos`
- `onMissionScreenReady` — écouté par 1 module(s)
- `onMultiseatGamemodeFinished` — écouté par 1 module(s)
- `onMultiseatGamemodeLaunched` — écouté par 1 module(s)
- `onMultiseatGamemodeStopped` — écouté par 1 module(s)
- `onStartScreenFinishedBuilding` — écouté par 1 module(s)
- `onUIStartButtonClicked` — écouté par 2 module(s)

**Évènements UI (guihooks.trigger) :** `OnGamemodeData`, `onRequestMissionScreenDataReady`

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`

**Charge les extensions :** `ui_multiseat_freeroam`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua`.*
