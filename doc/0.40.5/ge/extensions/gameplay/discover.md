# `gameplay_discover`

*Fichier : `lua/ge/extensions/gameplay/discover.lua` · VM : Game Engine (GE) · 537 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_discover` : `extensions.load("gameplay_discover")`, puis la globale `gameplay_discover`

**Dépendances (chargées avant) :** `ui_multiseat_multiseatConfiguration`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_discover.basicControlsIntroPopup()` |  | 437 |
| `gameplay_discover.canStartSplitscreenDiscover(minPlayers, maxPlayers)` |  | 523 |
| `gameplay_discover.clearTasksOnClientEndMission()` |  | 369 |
| `gameplay_discover.cycleSplitscreenDevicePlayer(deviceId, operation, direction)` |  | 500 |
| `gameplay_discover.getDiscoverPages()` |  | 213 |
| `gameplay_discover.getSplitscreenOptedInPlayers()` |  | 519 |
| `gameplay_discover.getSplitscreenPlayerOptIns()` |  | 496 |
| `gameplay_discover.introPopup(id)` |  | 466 |
| `gameplay_discover.joinSplitscreenDeviceGroup(groupId)` |  | 511 |
| `gameplay_discover.leaveSplitscreenMenuSetup()` |  | 527 |
| `gameplay_discover.loadDiscovers()` | -- use this to get the position, rotation and partConfig of all vehicles<br>for id in activeVehiclesIterator() do local veh = scenetree.findObjectById(id) print(veh) dump({veh:getPosition(), quatFromDir(veh:getDirectionVector(), veh:getDirectionVectorUp()), veh.jbeam, veh.partConfig}) end | 125 |
| `gameplay_discover.loadExt(extensionName)` |  | 386 |
| `gameplay_discover.navigateToPostLoadRoute()` |  | 350 |
| `gameplay_discover.onClientEndMission()` | *(hook)* | 375 |
| `gameplay_discover.onInit()` | can be started with -discover <discoverName><br> -discover firstStart replays the first-launch onboarding popup in the main menu instead *(hook)* | 420 |
| `gameplay_discover.onLanguageChanged()` | *(hook)* | 152 |
| `gameplay_discover.onLoadingScreenFadeout()` | *(hook)* | 350 |
| `gameplay_discover.setSplitscreenDevicePlayer(deviceId, personaNumber)` |  | 507 |
| `gameplay_discover.setSplitscreenPlayerOptIn(player, optedIn)` |  | 515 |
| `gameplay_discover.startDiscover(discoverId)` |  | 285 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

**Évènements UI (guihooks.trigger) :** `ClearTasklist`

## Appels vers le moteur (C++)

- `Engine.` `getStartingArgs`
- `FS:` `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/discover.lua`.*
