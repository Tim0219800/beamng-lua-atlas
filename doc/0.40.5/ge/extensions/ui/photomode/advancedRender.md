# `ui_photomode_advancedRender`

*File: `lua/ge/extensions/ui/photomode/advancedRender.lua` · VM: Game Engine (GE) · 619 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_photomode_advancedRender`: `extensions.load("ui_photomode_advancedRender")`, then the global `ui_photomode_advancedRender`

Advanced photo mode render settings: detail fineness (detailAdjust), terrain LOD scale, grass density, shadow quality, vehicle shadows, "last split casters" and cloud quality. The module reads and writes these values in the graphics settings and engine variables (via ui_photomode_shared), stores the session's initial state so it can be restored, and manages a settings bookmark. It serves as the backend of the photo mode "advanced render" panel and of presets.

## Example

```lua
local res = ui_photomode_advancedRender.setAdvancedRenderState({grassDensity = 0.5, shadowsQualityMode = "High", cloudQualityMode = "Ultra"})
if not res.ok then log('W', 'x', res.reason) end
```

## Notes

- The write functions return {ok, reason, state}. Reasons: advanced_render_disabled, session_inactive, advanced_render_state_invalid, advanced_render_patch_empty, shadow_quality_invalid, cloud_quality_invalid, advanced_render_set_failed, advanced_render_defaults_unavailable, bookmark_unavailable, advanced_render_state_unavailable.
- Bounds applied by clamping: detailAdjust 0.5 to 5 (default 2), terrainLodScale 0.001 to 2 (default 0.75), grassDensity 0 to 1 (default 1).
- shadowsQualityMode accepts Lowest, Low, Normal, High, Ultra. cloudQualityMode accepts Low, Normal, High, Ultra (vrtDownsampleFactor 8/6/4/2 and shadowLutUpdateGroupSize 8/4/2/2); a numeric value is mapped to the nearest mode (<=2 Ultra, <=4 High, <=6 Normal, otherwise Low).
- The setting is enabled by default in non-"shipping" builds (shipping_build ~= true); in a retail version it must be unlocked with setAdvancedRenderTuningEnabled (the UI then shows the unlock, isUnlockVisible).
- All changes require an active photo mode session (ui_photomode_shared.S.sessionActive); the starting state is captured by captureRestoreState and restored by restoreState.
- The module calls ui_photomode_session.buildCapabilities() without declaring it in M.dependencies.

**Dependencies (loaded first):** `ui_photomode_shared`, `core_settings_graphic`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_photomode_advancedRender.applyPresetState(state)` | Applies a preset (partial patch). A non-table state is treated as an empty patch, which returns an advanced_render_patch_empty error. | 589 |
| `ui_photomode_advancedRender.buildMetadataState()` | Subset of the state to write into a photo's metadata: the seven settings without the UI fields. | 602 |
| `ui_photomode_advancedRender.buildState()` | Builds the advanced render display state (same function as the local buildAdvancedRenderState). | 254 |
| `ui_photomode_advancedRender.captureDefaultPresetState()` | Default state for a preset: the session's starting state, or nil if it was not captured. | 581 |
| `ui_photomode_advancedRender.capturePresetState()` | State to save in a preset (same as buildMetadataState). | 577 |
| `ui_photomode_advancedRender.captureRestoreState()` | Captures the session's starting state for later restoration. Called at the start of a photo mode session. *(internal)* | 267 |
| `ui_photomode_advancedRender.getAdvancedRenderState()` | Returns the current state (values, availability, defaults, sessionActive, bookmarkAvailable) with ok (session active and setting enabled) and reason (advanced_render_disabled or session_inactive). | 548 |
| `ui_photomode_advancedRender.getDefaultEnabled()` | Indicates whether advanced render is enabled by default: true when the game is not a shipping build. | 60 |
| `ui_photomode_advancedRender.isTuningEnabled()` | Returns the effective enablement: the override set by setAdvancedRenderTuningEnabled if it exists, otherwise getDefaultEnabled(). | 68 |
| `ui_photomode_advancedRender.isUnlockVisible()` | Indicates whether the UI should offer to unlock advanced render: true only in a shipping build. | 64 |
| `ui_photomode_advancedRender.loadAdvancedRenderBookmark()` | Reapplies the saved bookmark. | 513 |
| `ui_photomode_advancedRender.resetAdvancedRenderToDefaults()` | Resets the settings to the state captured at the start of the session. | 450 |
| `ui_photomode_advancedRender.restoreState()` | Restores the state captured at the start of the session, then forgets it. Called at the end of the session. *(internal)* | 401 |
| `ui_photomode_advancedRender.saveAdvancedRenderBookmark()` | Stores the current state as the session bookmark. | 486 |
| `ui_photomode_advancedRender.setAdvancedRenderState(partialState)` | Applies a partial patch of the settings (detailAdjust, terrainLodScale, grassDensity, shadowsQualityMode, lastSplitCastersEnabled, vehicleShadowEnabled, cloudQualityMode). Numbers are clamped, modes validated. | 415 |
| `ui_photomode_advancedRender.setAdvancedRenderTuningEnabled(value)` | Enables or disables advanced tuning (session override). Also returns the photo mode capabilities and, if enabled during a session, the current state. | 559 |

### Parameter details

#### `ui_photomode_advancedRender.applyPresetState(state)`

Applies a preset (partial patch). A non-table state is treated as an empty patch, which returns an advanced_render_patch_empty error.

- `state` (*table*) : Preset state
- **returns**: table {state} on success, otherwise {ok = false, reason}

#### `ui_photomode_advancedRender.buildMetadataState()`

Subset of the state to write into a photo's metadata: the seven settings without the UI fields.

- **returns**: table Settings only

#### `ui_photomode_advancedRender.buildState()`

Builds the advanced render display state (same function as the local buildAdvancedRenderState).

- **returns**: table State with values, availability, defaults, sessionActive, bookmarkAvailable

#### `ui_photomode_advancedRender.captureDefaultPresetState()`

Default state for a preset: the session's starting state, or nil if it was not captured.

- **returns**: table|nil Initial settings

#### `ui_photomode_advancedRender.capturePresetState()`

State to save in a preset (same as buildMetadataState).

- **returns**: table Settings

#### `ui_photomode_advancedRender.getAdvancedRenderState()`

Returns the current state (values, availability, defaults, sessionActive, bookmarkAvailable) with ok (session active and setting enabled) and reason (advanced_render_disabled or session_inactive).

- **returns**: table Display state

#### `ui_photomode_advancedRender.getDefaultEnabled()`

Indicates whether advanced render is enabled by default: true when the game is not a shipping build.

- **returns**: boolean enabled by default

#### `ui_photomode_advancedRender.isTuningEnabled()`

Returns the effective enablement: the override set by setAdvancedRenderTuningEnabled if it exists, otherwise getDefaultEnabled().

- **returns**: boolean setting active

#### `ui_photomode_advancedRender.isUnlockVisible()`

Indicates whether the UI should offer to unlock advanced render: true only in a shipping build.

- **returns**: boolean unlock visible

#### `ui_photomode_advancedRender.loadAdvancedRenderBookmark()`

Reapplies the saved bookmark.

- **returns**: table {ok, reason?, state?}

#### `ui_photomode_advancedRender.resetAdvancedRenderToDefaults()`

Resets the settings to the state captured at the start of the session.

- **returns**: table {ok, reason?, state?}

#### `ui_photomode_advancedRender.saveAdvancedRenderBookmark()`

Stores the current state as the session bookmark.

- **returns**: table {ok, reason?, state?}

#### `ui_photomode_advancedRender.setAdvancedRenderState(partialState)`

Applies a partial patch of the settings (detailAdjust, terrainLodScale, grassDensity, shadowsQualityMode, lastSplitCastersEnabled, vehicleShadowEnabled, cloudQualityMode). Numbers are clamped, modes validated.

- `partialState` (*table*) : Fields to change
- **returns**: table {ok, reason?, state?}

#### `ui_photomode_advancedRender.setAdvancedRenderTuningEnabled(value)`

Enables or disables advanced tuning (session override). Also returns the photo mode capabilities and, if enabled during a session, the current state.

- `value` (*boolean*) : true by default if the value is not a recognized boolean (inferred from code)
- **returns**: table {ok = true, enabled, capabilities, state?}

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"ui_photomode_shared", "core_settings_graphic"} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/photomode/advancedRender.lua`.*
