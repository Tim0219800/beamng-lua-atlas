# `gameplay_missions_missionTypes_flowMission`

*File: `lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua` · VM: Game Engine (GE) · 655 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/missions/missionTypes/flowMission")` (file under extensions/ but not a regular extension)

Base class for missions driven by a flowgraph ("flowgraph" type and derivatives). The module returns a factory `function(derivedClass, ...)` (same pattern as baseMission). The mission loads a flowgraph file (fgPath), injects the progress variables, the fgVariables variables and the user settings into it, then starts it. It also handles the common "setup modules" (vehicles, traffic, environment/time/wind) through user settings, game context buttons, entry fees and compatibility with old mission formats. A mission modder uses it through gameplay_missions_missions.flowMission(C, ...) in the constructor.lua of a mission type.

## Example

```lua
-- constructor.lua of a flowgraph-based mission type
local C = {}
C.fgPath = '/gameplay/missionTypes/monType/mission.flow.json'
function C:init() self.fgVariables = {} end
return function(...) return gameplay_missions_missions.flowMission(C, ...) end
```

## Notes

- Like baseMission, the factory calls init() twice (before and after copying the derived class keys) and copies the derived keys directly into the object.
- Variables are injected into the flowgraph only if they already exist there: addOrSetVariable silently ignores (D-level log) any variable absent from the flowgraph; the code that adds them is commented out. Values must be bool, string, number, or a table of 3 (vec3) / 4 (quat) elements, otherwise addOrSetVariable returns true (error).
- Inverted return convention: addOrSetVariable, setupFlowgraphManager and onStart return true on ERROR (and nil on success).
- The name "attempts" is reserved: it cannot be used as a progress variable. A fgVariables key also cannot reuse the name of a progress variable.
- The user setting keys ignored when computing active stars are in ignoreUserSettingsKeyForActiveStars: setupModuleEnvironmentTime, useGroundmarkers, missionVehicleClass, shuffleGroup.
- The setupModuleEnvironmentTime setting is the special string "__missionDefaultEnvironmentTime" for "use the mission's default time"; in processCommonSettings, this value does not change the time.
- In startScreen mode, onMissionScreenReady resets the world time of day to the mission time if timeScale > 0 (dayLength = 1800 / timeScale).
- The environment wind (setupModules.environment._windVec) is reapplied every frame to all ready vehicles via obj:setWind.
- The onVehicleReset hook is relayed to the mission script (self.script.onVehicleReset(self, ...)); note that the script receives the mission as its first argument.

## Class `C`

Base class of a flowgraph mission. The object carries the mission fields (id, missionFolder, setupModules, missionTypeData, careerSetup, additionalAttributes, fgPath, fgVariables, progress, userSettings...) and, once started, self.mgr (the flowgraph manager).

The module returns a constructor: `local obj = require("gameplay_missions_missionTypes_flowMission")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:addOrSetVariable(name, value)` | Changes the base value of an existing flowgraph variable. Accepted types: boolean, string, number, table of 3 (vec3) or 4 (quat) elements. If the variable does not exist in the flowgraph, it is ignored. | 569 |
| `C:attemptAbandonMission()` | If the flowgraph contains a node for the onRequestAbandon hook, broadcasts it and returns true (the flowgraph handles the abandon); otherwise returns nil. | 560 |
| `C:getCommonSettingsData()` | Builds the list of user settings common to all mission types: vehicle selection (setupModuleVehicles, with custom vehicle option), traffic (setupModuleTraffic) and time of day (setupModuleEnvironmentTime). While the default settings are being built (_buildingDefaultUserSettings), returns only {key, value} per enabled module. | 111 |
| `C:getDynamicStarReward(key, userSettings)` | Extension point for a star reward that depends on settings; empty in the base (returns nil). | 420 |
| `C:getEntryFee(userSettings)` | Returns the mission's entry fees (careerSetup.entryFee) as an attributeKey -> amount table, or nil if there are none. Accepts the old list format {attributeKey, rewardAmount}. | 409 |
| `C:getGameContextUiButtons()` | Broadcasts the flowgraph hook onGatherGameContextUiButtons, merges the buttons by id (an active button wins over an inactive one) and sorts them by order then label. | 616 |
| `C:getProgressKeyTranslation(progressKey)` | Returns the translation key of a progress key, or the key itself if unknown. | 63 |
| `C:init()` | Called when the mission is created. Defines missionTypeLabel, progressKeyTranslations, defaultPreviewFile (/gameplay/missionTypes/<type>/defaultPreview.jpg if it exists, result cached) and ignoreUserSettingsKeyForActiveStars. Also loads the type's progressSetup data but does not copy it (the copy is commented out). | 37 |
| `C:onFlowgraphStateStarted(stateName, state, transData)` | Relays the start of a flowgraph state to self.script (if it exists). | 491 |
| `C:onFlowgraphStateStopped(stateName, state)` | Relays the stop of a flowgraph state to self.script. | 497 |
| `C:onMissionScreenReady(mode)` | Called when the mission screen (start or end) is ready. Relays to the script; in "startScreen" mode, resets the world time to the mission time if timeScale > 0. | 503 |
| `C:onStart()` | Starts the mission: logs the issues (logMissionIssues), calls onPreStart if it exists, creates the flowgraph if needed (optional preprocessMissionTypeData and getFgPath), injects the progress variables and user settings (then clears them), starts the flowgraph if it is stopped, and calls script:onStart. | 423 |
| `C:onStop(data)` | Stops the flowgraph (instantly if data.stopInstant), creates an "abandoned" attempt if data.abandoned, emits the onMissionProgressChanged hook, relays to script:onStop, then calls onPostStop if it exists. | 537 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` | Called every frame: relays to the script and reapplies the environment wind to all ready vehicles. | 520 |
| `C:onVehicleReset(...)` | Hook relayed to self.script.onVehicleReset if the script defines it (generated in a loop over the scriptHooks list). | dyn |
| `C:processCommonSettings(flatSettings)` | Applies the common settings chosen by the player to self.setupModules: chosen vehicle (index, custom vehicle, usePlayerVehicle, useCustomConfig), traffic (useTraffic) and environment time. Must not be called while a mission is active (otherwise an error is logged). | 295 |
| `C:processUserSettings(settings)` | Stores the user settings in self.userSettings; they are injected into the flowgraph at onStart. | 324 |
| `C:retrieveProgressFromFlowgraph()` | Rereads from the flowgraph the value of each progress variable and copies it into self.progress; logs an error for those not found. | 598 |
| `C:setBackwardsCompatibility(keyAliases)` | Converts old mission formats to the current setupModules: flowgraph variables presetVehicleActive/playerModel/..., old vehicle mode (own/choice/provided), numeric or object timeOfDay to environment, default values for cloudCover/cloudWindSpeed. Also generates the additionalAttributes.vehicle attribute (own/provided/choice) if missing. | 329 |
| `C:setPreviewsForCustomVehicles(userSettings)` | For each vehicle-selection select setting, completes the "custom" options (tied to setupModuleVehiclesCustom) with the thumbnail, the "Custom: <make model>" label and the vehicle class (gameplay_vehiclePerformance.getClassFromConfig). Shows "Custom: (None Selected)" if the model or config is not chosen. | 241 |
| `C:setupFlowgraphManager(fgFile, variables)` | Locates the flowgraph file (path relative to the mission folder, otherwise absolute path), loads it with core_flowgraphManager.loadManager (transient=true, activity=self), then sets the progress variables (saved value takes priority over the last attempt's value) and the variables from `variables`. | 69 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onMissionProgressChanged`

## Calls into the engine (C++)

- `FS:` `fileExists`
- `core_environment.` `getSolarTimeOfDayOptions`, `getSolarTimeOfDayValue`, `getTimeOfDay`, `getTimeOfDayValueForNormalizedTime`, `setTimeOfDay`

**Loads extensions:** `gameplay_vehiclePerformance`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua`.*
