# `ui_pause_providers_routeData_environment`

*File: `lua/ge/extensions/ui/pause/providers/routeData/environment.lua` · VM: Game Engine (GE) · 247 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_pause_providers_routeData_environment`: `extensions.load("ui_pause_providers_routeData_environment")`, then the global `ui_pause_providers_routeData_environment`

Pause menu data provider for the Environment page: summary (weather, traffic, others), weather/time page, simulation page (gravity, speed) and traffic page. It decides whether editing is allowed (freeroam, multiplayer, freeroamTutorial, or if the restrictScenarios setting is disabled) and takes the First Drive session's capabilities into account. Mods can add buttons to the page via the hook onEnvironmentGetOtherButtons.

## Example

```lua
function M.onEnvironmentGetOtherButtons(buttons, actionState)
  table.insert(buttons, {id = "monBouton", label = "Mon outil", icon = "wrench", callback = function() return true end})
end
```

## Notes

- The hook onEnvironmentGetOtherButtons(candidates, actionState) is only emitted if showOther is true (so not during a First Drive session). Each candidate button must have id, label and callback, otherwise an error is logged and it is ignored; icon and routeTarget are optional.
- The "other" buttons are sorted by label (string comparison); the Simulation button is one of them.
- getEnvironmentWeatherData and getEnvironmentTrafficData call core_environment without a nil check (getTimeOfDayOptions, getInitState).

**Dependencies (loaded first):** `ui_pause_providers_trafficControls`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_pause_providers_routeData_environment.getEnvironmentData(context)` | Returns the Environment summary page: PauseEnvironmentDigest component with weather, traffic and other buttons (simulation included), action states, time of day options, the level's initial values and the current level name. | 79 |
| `ui_pause_providers_routeData_environment.getEnvironmentSimulationData(context)` | Returns the simulation page (PauseEnvironmentSimulation component). During a First Drive session, returns an empty non-editable page. | 194 |
| `ui_pause_providers_routeData_environment.getEnvironmentTrafficData(context)` | Returns the traffic page (PauseEnvironmentTraffic component) with the data from ui_pause_providers_trafficControls.getData({editable = ...}). | 217 |
| `ui_pause_providers_routeData_environment.getEnvironmentWeatherData(context)` | Returns the weather/time page (PauseEnvironmentWeather component) with gravityPresets, simSpeedPresets, timeOfDayOptions and levelDefaults from core_environment. | 163 |
| `ui_pause_providers_routeData_environment.requestEnvironmentTrafficPayload(payload)` | Redirects to ui_pause_providers_trafficControls.getData(payload), to refresh only the traffic data. | 242 |

### Parameter details

#### `ui_pause_providers_routeData_environment.getEnvironmentData(context)`

Returns the Environment summary page: PauseEnvironmentDigest component with weather, traffic and other buttons (simulation included), action states, time of day options, the level's initial values and the current level name.

- `context` (*table*) : Pause context (field read: mode).
- **returns**: table {editable, mainPanelContent, actions, timeOfDayOptions, levelDefaults, currentLevelName}

#### `ui_pause_providers_routeData_environment.getEnvironmentSimulationData(context)`

Returns the simulation page (PauseEnvironmentSimulation component). During a First Drive session, returns an empty non-editable page.

- `context` (*table*) : Pause context.
- **returns**: table {editable, disabledReason, mainPanelContent}

#### `ui_pause_providers_routeData_environment.getEnvironmentTrafficData(context)`

Returns the traffic page (PauseEnvironmentTraffic component) with the data from ui_pause_providers_trafficControls.getData({editable = ...}).

- `context` (*table*) : Pause context.
- **returns**: table {editable, disabledReason, traffic, mainPanelContent}

#### `ui_pause_providers_routeData_environment.getEnvironmentWeatherData(context)`

Returns the weather/time page (PauseEnvironmentWeather component) with gravityPresets, simSpeedPresets, timeOfDayOptions and levelDefaults from core_environment.

- `context` (*table*) : Pause context.
- **returns**: table {editable, disabledReason, mainCardClass, mainPanelContent, gravityPresets, simSpeedPresets, timeOfDayOptions, levelDefaults}

#### `ui_pause_providers_routeData_environment.requestEnvironmentTrafficPayload(payload)`

Redirects to ui_pause_providers_trafficControls.getData(payload), to refresh only the traffic data.

- `payload` (*table*) : Payload passed (field read: editable).
- **returns**: table Traffic data.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"ui_pause_providers_trafficControls"} |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEnvironmentGetOtherButtons`

## Calls into the engine (C++)

- `core_environment.` `getInitState`, `getTimeOfDayOptions`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/pause/providers/routeData/environment.lua`.*
