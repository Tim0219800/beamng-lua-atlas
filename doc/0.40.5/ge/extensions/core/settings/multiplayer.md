# `core_settings_multiplayer`

*File: `lua/ge/extensions/core/settings/multiplayer.lua` · VM: Game Engine (GE) · 78 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_settings_multiplayer`: `extensions.load("core_settings_multiplayer")`, then the global `core_settings_multiplayer`

Provides the "option helpers" of the multiplayer settings. Each helper has a set(value) function that forwards the setting to the matching multiplayer_* extension if it is loaded. Used by core_settings_settings to link the mp* options to their extensions.

## Notes

- The get functions are commented out in the code: only set functions exist.
- Each set checks that the target extension (multiplayer_nametags, multiplayer_vehicleSync, multiplayer_multiplayer, multiplayer_sessionManager) exists before writing.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_settings_multiplayer.buildOptionHelpers()` | Builds and returns the helpers table. Keys: mpNametagsEnabled (multiplayer_nametags.nametagsEnabled), mpNametagDistance (multiplayer_nametags.nametagDistance), mpEnableSwitchingToPlayerVehicles (multiplayer_vehicleSync.enableSwitchingToPlayerVehicles(value)), mpDebugMode (multiplayer_multiplayer.debugMode), mpUseCustomServiceURL (multiplayer_sessionManager.useCustomServiceURL), mpCustomServiceURL (multiplayer_sessionManager.customServiceURL). | 7 |

### Parameter details

#### `core_settings_multiplayer.buildOptionHelpers()`

Builds and returns the helpers table. Keys: mpNametagsEnabled (multiplayer_nametags.nametagsEnabled), mpNametagDistance (multiplayer_nametags.nametagDistance), mpEnableSwitchingToPlayerVehicles (multiplayer_vehicleSync.enableSwitchingToPlayerVehicles(value)), mpDebugMode (multiplayer_multiplayer.debugMode), mpUseCustomServiceURL (multiplayer_sessionManager.useCustomServiceURL), mpCustomServiceURL (multiplayer_sessionManager.customServiceURL).

- **returns**: table<string, {set: fun(value: any)}> Table option name -> {set = function}.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/settings/multiplayer.lua`.*
