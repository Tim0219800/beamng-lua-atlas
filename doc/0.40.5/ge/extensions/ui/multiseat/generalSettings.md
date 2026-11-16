# `ui_multiseat_generalSettings`

*File: `lua/ge/extensions/ui/multiseat/generalSettings.lua` · VM: Game Engine (GE) · 226 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_multiseat_generalSettings`: `extensions.load("ui_multiseat_generalSettings")`, then the global `ui_multiseat_generalSettings`

"general" settings provider of the multiseat settings window. It declares the fields: same vehicle for everyone, gather vehicles, reseat all players, automatic color, player markers and split screen layout for 2 to 9+ players; then it handles their actions, changes, validation and application via the onXxxMultiseatGameSetting(s) hooks.

## Notes

- Settings written to settings: multiseatAutomaticColor and multiseatLayout2 to multiseatLayout9 (9 = "9+", only the value "automatic" is accepted). The multiseatTags setting (markers) is written immediately (applyMode = immediate).
- A stored "shared" layout is converted to "automatic" for display and refused at validation.
- Validation refusal reasons: missing_general_multiseat_settings, invalid_player_marker_mode, invalid_automatic_color_mode, invalid_multiseat_layout.
- After application, the fields gatherVehicles and reseatAllPlayers are reset to their neutral value ("" and false) via result.valueOverrides.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_multiseat_generalSettings.onApplyMultiseatGameSettings(stagedSettings, _activeSettings, result)` | Saves automatic color and layouts, refreshes render_splitScreen, gathers the vehicles (gatherVehicles) and reseats the players (reseatAllPlayers) if requested, then resets these two fields to zero via result.valueOverrides. *(internal)* *(hook)* | 201 |
| `ui_multiseat_generalSettings.onGetMultiseatGameSettings(providers)` | Adds the "general" provider (placement afterVehicles, applyMode apply) with all its fields to providers. *(internal)* *(hook)* | 107 |
| `ui_multiseat_generalSettings.onMultiseatGameSettingAction(providerId, fieldId, result, value)` | Handles the action of the sameVehicleForEveryone field: "selector" opens the vehicle selector for all players, otherwise the chosen vehicle is staged for all. The result is written to result.success. Ignored for other providers. *(internal)* *(hook)* | 142 |
| `ui_multiseat_generalSettings.onMultiseatGameSettingChanged(providerId, fieldId, value)` | Reacts to a field change: automaticColor is staged for all players; showPlayerMarkers is applied immediately (core_multiseat.setPlayerMarkersEnabled, otherwise the multiseatTags setting). *(internal)* *(hook)* | 153 |
| `ui_multiseat_generalSettings.onValidateMultiseatGameSettings(stagedSettings, _activeSettings, result)` | Validates the staged settings: provider presence, boolean showPlayerMarkers and automaticColor, valid layouts for each player count. Writes result.success = false and result.reason on error. *(internal)* *(hook)* | 166 |

### Parameter details

#### `ui_multiseat_generalSettings.onApplyMultiseatGameSettings(stagedSettings, _activeSettings, result)`

Saves automatic color and layouts, refreshes render_splitScreen, gathers the vehicles (gatherVehicles) and reseats the players (reseatAllPlayers) if requested, then resets these two fields to zero via result.valueOverrides.

- `stagedSettings` (*table*) : Settings staged per provider.
- `_activeSettings` (*table*) : Active settings (unused).
- `result` (*table*) : Result table (valueOverrides).

#### `ui_multiseat_generalSettings.onGetMultiseatGameSettings(providers)`

Adds the "general" provider (placement afterVehicles, applyMode apply) with all its fields to providers.

- `providers` (*table[]*) : List of settings providers to complete.

#### `ui_multiseat_generalSettings.onMultiseatGameSettingAction(providerId, fieldId, result, value)`

Handles the action of the sameVehicleForEveryone field: "selector" opens the vehicle selector for all players, otherwise the chosen vehicle is staged for all. The result is written to result.success. Ignored for other providers.

- `providerId` (*string*) : Provider identifier ("general").
- `fieldId` (*string*) : Field identifier.
- `result` (*table*) : Result table (success).
- `value` (*any*) : Chosen value.

#### `ui_multiseat_generalSettings.onMultiseatGameSettingChanged(providerId, fieldId, value)`

Reacts to a field change: automaticColor is staged for all players; showPlayerMarkers is applied immediately (core_multiseat.setPlayerMarkersEnabled, otherwise the multiseatTags setting).

- `providerId` (*string*) : Provider identifier.
- `fieldId` (*string*) : Field identifier.
- `value` (*any*) : New value.

#### `ui_multiseat_generalSettings.onValidateMultiseatGameSettings(stagedSettings, _activeSettings, result)`

Validates the staged settings: provider presence, boolean showPlayerMarkers and automaticColor, valid layouts for each player count. Writes result.success = false and result.reason on error.

- `stagedSettings` (*table*) : Settings staged per provider.
- `_activeSettings` (*table*) : Active settings (unused).
- `result` (*table*) : Result table (success, reason).

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/multiseat/generalSettings.lua`.*
