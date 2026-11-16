# `gameplay_discover`

*File: `lua/ge/extensions/gameplay/discover.lua` · VM: Game Engine (GE) · 537 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_discover`: `extensions.load("gameplay_discover")`, then the global `gameplay_discover`

Manages the "discovers" (experiences of the Discover/Play screen). It loads all *.lua files in /gameplay/discover/: each one can export pageInfo (page with sections and discoverIds), experiences (list of experiences with id, type 'mission' or 'freeroam', trigger, onLoaded, onUnloaded, playerCount...) and getProgressTag. getDiscoverPages assembles the pages for the UI (cards, images, official/mod/players/duration tags), startDiscover starts an experience (mission or trigger function), and the module handles navigation after the loading fade, intro popups and the split screen configuration (splitscreen).

## Example

```lua
gameplay_discover.startDiscover('myExperienceId')
```

## Notes

- Can be launched from the command line: -discover <id>; -discover firstStart shows the welcome window again (onboardingPopupShown = false).
- Extensions loaded via discover (loadExt) are tracked; the experience's onUnloaded function is called when the extension is unloaded (onExtensionUnloaded is wrapped).
- Only one experience loading at a time: startDiscover ignores the call if there is already one (lastDiscover not nil).
- After a level loads, the UI route (playRoute, 'play' by default) is opened at the loading screen fade-out (onLoadingScreenFadeout), unless a mission start/end screen is active.
- Fallback image: /gameplay/discover/images/freeroamTBD.jpg when the image is absent.
- In formatDiscover, the local variable 'mission' is only defined in an inner branch (local scope): the second 'if mission' block does not see it, so the official/mod info of a mission is always inferred from the folder path and never from mission.modID. Game inconsistency.
- The comment in loadDiscovers (code excerpt for listing vehicle positions/partConfig) is a help block left there by the developers, unrelated to the function.
- startDiscover returns false (with logging) if the split screen player configuration is not valid; in other failure cases, it returns nil.

**Dependencies (loaded first):** `ui_multiseat_multiseatConfiguration`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_discover.basicControlsIntroPopup()` | Shows the basic controls intro window, choosing the first existing basicDriving_<imagePack> popup according to the detected devices (wheel, joystick, xinput, gamepad, mouse, keyboard, then fallback). | 437 |
| `gameplay_discover.canStartSplitscreenDiscover(minPlayers, maxPlayers)` | Indicates whether the experience can start with the number of signed-up players. | 523 |
| `gameplay_discover.clearTasksOnClientEndMission()` | Requests that the UI event 'ClearTasklist' be sent at the next level end. | 369 |
| `gameplay_discover.cycleSplitscreenDevicePlayer(deviceId, operation, direction)` | Changes the player associated with a device: 'toggle' switches, 'move' moves according to direction, otherwise moves to the next player. | 500 |
| `gameplay_discover.getDiscoverPages()` | Builds the list of pages for the UI: each page is copied, its sections filled with cards (formatDiscover), the tags (players, version, duration, type, progress, official, mod) added, the image chosen, then everything is sorted by descending date then sortBias. | 213 |
| `gameplay_discover.getSplitscreenOptedInPlayers()` | Lists the players signed up to split screen. | 519 |
| `gameplay_discover.getSplitscreenPlayerOptIns()` | Returns the sign-up state of players in split screen (module gameplay/discover/multiseat/splitscreen). | 496 |
| `gameplay_discover.introPopup(id)` | Opens an intro popup (/gameplay/discover/popups/<id>/content.json) via ui_popup, only once per id and per session. | 466 |
| `gameplay_discover.joinSplitscreenDeviceGroup(groupId)` | Makes a device group join the split screen configuration. | 511 |
| `gameplay_discover.leaveSplitscreenMenuSetup()` | Leaves the menu's split screen configuration. | 527 |
| `gameplay_discover.loadDiscovers()` | Loads all /gameplay/discover/*.lua files once: registers their pageInfo (with folder and official/mod metadata), their experiences by id and their progress tags. Called automatically by getDiscoverPages and startDiscover. | 125 |
| `gameplay_discover.loadExt(extensionName)` | Loads an extension only once (extensions.load) and, if the current experience has onUnloaded, wraps the extension's onExtensionUnloaded to call onUnloaded when it is unloaded. | 386 |
| `gameplay_discover.navigateToPostLoadRoute()` | Releases lastDiscover and, if a navigation was pending, opens the end-of-loading UI route (playRoute or 'play'), unless a mission start/end screen is active. *(internal)* | 350 |
| `gameplay_discover.onClientEndMission()` | Hook called at the end of a level: resets the navigation if no experience is loading, and empties the task list if requested. *(internal)* *(hook)* | 375 |
| `gameplay_discover.onInit()` | Initialization hook: sets the unload mode to manual and handles the command line arguments -discover <id> and -discover firstStart. *(internal)* *(hook)* | 420 |
| `gameplay_discover.onLanguageChanged()` | Hook called on language change: forgets the loaded experiences so they are reloaded (translations). *(internal)* *(hook)* | 152 |
| `gameplay_discover.onLoadingScreenFadeout()` | Hook called at the loading screen fade-out; same function as navigateToPostLoadRoute. *(internal)* *(hook)* | 350 |
| `gameplay_discover.setSplitscreenDevicePlayer(deviceId, personaNumber)` | Associates a device with a player (persona). | 507 |
| `gameplay_discover.setSplitscreenPlayerOptIn(player, optedIn)` | Signs a player up to or out of split screen. | 515 |
| `gameplay_discover.startDiscover(discoverId)` | Starts an experience by id. For a mission (missionId), starts via gameplay_missions_missionManager.startWithLoadingLevel; for an experience with a trigger function, calls trigger(M) then onLoaded(M). First validates the split screen configuration if playerCount is set. | 285 |

### Parameter details

#### `gameplay_discover.canStartSplitscreenDiscover(minPlayers, maxPlayers)`

Indicates whether the experience can start with the number of signed-up players.

- `minPlayers` (*integer*) : Minimum number of players.
- `maxPlayers` (*integer*) : Maximum number of players.
- **returns**: boolean Result of canStartWithOptIns (inferred from code).

#### `gameplay_discover.cycleSplitscreenDevicePlayer(deviceId, operation, direction)`

Changes the player associated with a device: 'toggle' switches, 'move' moves according to direction, otherwise moves to the next player.

- `deviceId` (*any*) : Device identifier.
- `operation` (*string|nil*) : 'toggle', 'move' or other to cycle.
- `direction` (*any*) : Direction for 'move'.
- **returns**: any Result of the splitscreen module function.

#### `gameplay_discover.getDiscoverPages()`

Builds the list of pages for the UI: each page is copied, its sections filled with cards (formatDiscover), the tags (players, version, duration, type, progress, official, mod) added, the image chosen, then everything is sorted by descending date then sortBias.

- **returns**: table[] Pages with title, image, description, sections[].cards[], tagList, pageKind ('minor' by default), date, version, duration, isOfficial, isMod, modID, modName, modTitle, showMultiseatControllers.

#### `gameplay_discover.getSplitscreenOptedInPlayers()`

Lists the players signed up to split screen.

- **returns**: any Signed-up players (inferred from code).

#### `gameplay_discover.getSplitscreenPlayerOptIns()`

Returns the sign-up state of players in split screen (module gameplay/discover/multiseat/splitscreen).

- **returns**: table Sign-up state (inferred from code).

#### `gameplay_discover.introPopup(id)`

Opens an intro popup (/gameplay/discover/popups/<id>/content.json) via ui_popup, only once per id and per session.

- `id` (*string*) : Popup identifier.

#### `gameplay_discover.joinSplitscreenDeviceGroup(groupId)`

Makes a device group join the split screen configuration.

- `groupId` (*any*) : Group identifier.
- **returns**: any Result of the splitscreen module function.

#### `gameplay_discover.leaveSplitscreenMenuSetup()`

Leaves the menu's split screen configuration.

- **returns**: any Result of the splitscreen module function.

#### `gameplay_discover.loadExt(extensionName)`

Loads an extension only once (extensions.load) and, if the current experience has onUnloaded, wraps the extension's onExtensionUnloaded to call onUnloaded when it is unloaded.

- `extensionName` (*string*) : Name of the extension to load.

#### `gameplay_discover.navigateToPostLoadRoute()`

Releases lastDiscover and, if a navigation was pending, opens the end-of-loading UI route (playRoute or 'play'), unless a mission start/end screen is active.

- **returns**: boolean true if the navigation took place.

#### `gameplay_discover.onLoadingScreenFadeout()`

Hook called at the loading screen fade-out; same function as navigateToPostLoadRoute.

- **returns**: boolean true if the navigation took place.

#### `gameplay_discover.setSplitscreenDevicePlayer(deviceId, personaNumber)`

Associates a device with a player (persona).

- `deviceId` (*any*) : Device identifier.
- `personaNumber` (*integer*) : Player number.
- **returns**: any Result of the splitscreen module function.

#### `gameplay_discover.setSplitscreenPlayerOptIn(player, optedIn)`

Signs a player up to or out of split screen.

- `player` (*integer*) : Player index.
- `optedIn` (*boolean*) : true to sign up.
- **returns**: any Result of the splitscreen module function.

#### `gameplay_discover.startDiscover(discoverId)`

Starts an experience by id. For a mission (missionId), starts via gameplay_missions_missionManager.startWithLoadingLevel; for an experience with a trigger function, calls trigger(M) then onLoaded(M). First validates the split screen configuration if playerCount is set.

- `discoverId` (*string*) : Experience id (id key in experiences).
- **returns**: boolean|nil false if the split screen configuration is invalid; nil otherwise (even on failure or success).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded beforehand: {'ui_multiseat_multiseatConfiguration'}. |

**UI events (guihooks.trigger):** `ClearTasklist`

## Calls into the engine (C++)

- `Engine.` `getStartingArgs`
- `FS:` `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/discover.lua`.*
