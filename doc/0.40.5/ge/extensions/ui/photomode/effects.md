# `ui_photomode_effects`

*File: `lua/ge/extensions/ui/photomode/effects.lua` · VM: Game Engine (GE) · 907 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_photomode_effects`: `extensions.load("ui_photomode_effects")`, then the global `ui_photomode_effects`

Photo mode post-processing effects: depth of field (DOF, with autofocus), SSAO, specular occlusion, screen-space shadows, SSR reflections, motion blur, dynamic reflections and mirror quality, occupant visibility, plus the flash state (delegated to ui_photomode_flash). The module reads and writes these values via the scenetree postFX objects, the $DOFPostFx::* variables and the graphics settings, saves the session's starting state (including to disk with ui_photomode_postFxPersistence) and restores it at the end.

## Example

```lua
local res = ui_photomode_effects.setEffectsState({dofEnabled = true, dofAutofocus = true, ssrQualityMode = "High"})
if not res.ok then log('W', 'x', res.reason) end
```

## Notes

- The write functions require an active photo mode session (ui_photomode_shared.S.sessionActive), otherwise they return {ok = false, reason = "session_inactive"}.
- Possible failure reasons: effects_state_invalid, effects_patch_empty, effect_unavailable, effect_set_failed, ssao_quality_invalid, ssr_quality_invalid, reflection_quality_invalid, mirrors_quality_invalid, screen_space_shadows_set_failed, effects_defaults_unavailable, preset_part_invalid, flash_set_failed.
- Bounds applied by clamping (default on invalid value): dofMaxBlurNear 0 to 1 (0), dofMaxBlurFar 0 to 1 (0.15), dofFocusRange -100 to 250 (50), dofAperture 0.1 to 100 (8), dofFalloffSharpness 0.1 to 100 (1), motionBlurStrength 0 to 2 (0.5).
- Mapping to engine variables: dofMaxBlurNear = $DOFPostFx::BlurMin, dofMaxBlurFar = BlurMax, dofFocusRange = FocusRangeMax, dofAperture = BlurCurveFar, dofFalloffSharpness = FocusRangeMin.
- With dofAutofocus active and no dofFocusRange provided, the manual range is stored then FocusRangeMax is set to 0; it is restored when autofocus is disabled.
- Accepted modes: reflectionQualityMode and mirrorsQualityMode = Disabled, Lowest, Low, Normal, High, Ultra; ssrQualityMode = Off, Low, Medium, High; ssaoQualityMode = Off, Normal, High (Low is mapped to Normal; a sample count >= 64 gives High).
- applyPresetState accepts options.part (all, dof, ssao, specularOcclusion, screenSpaceShadows, ssr, motionBlur, reflections, occupants, flash) to apply only part of a preset; in this split, mirrorsQualityMode is part of "reflections".
- In resetEffectsToDefaults, the results of applyEffectsStatePatch and restoreDofEffectsState are not checked: the function returns ok = true even if a step failed.

**Dependencies (loaded first):** `ui_photomode_shared`, `ui_photomode_postFxPersistence`, `ui_photomode_flash`, `core_settings_graphic`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_photomode_effects.applyPresetState(state, options)` | Applies an effects preset, in full or for a part (options.part), then delegates the flash sub-table to ui_photomode_flash.applyPresetState. | 854 |
| `ui_photomode_effects.buildMetadataState()` | Subset of the state to write into a photo's metadata: the 16 effect settings plus flash. | 882 |
| `ui_photomode_effects.buildState()` | Builds the effects display state (same function as the local buildEffectsState). | 406 |
| `ui_photomode_effects.captureDefaultPresetState()` | Default state for a preset (the session's starting state, with the default flash), or nil if the starting state was not captured. | 798 |
| `ui_photomode_effects.capturePresetState()` | State to save in a preset (same as buildMetadataState). | 794 |
| `ui_photomode_effects.captureRestoreState()` | Captures the session's starting state and saves it via ui_photomode_postFxPersistence.saveRestoreState (merged with the persisted version), for restoration at the end. Called at the start of a photo mode session. *(internal)* | 420 |
| `ui_photomode_effects.captureSerializableState()` | Reads the current values directly from the engine (postFX objects, $DOFPostFx::* variables, graphics settings) and returns them in raw form; unreadable values are nil. | 355 |
| `ui_photomode_effects.getEffectsState()` | Returns the current effects state (values, availability, defaults, defaultsAvailable, sessionActive, flash) with ok = session active, and reason = session_inactive otherwise. | 785 |
| `ui_photomode_effects.resetEffectsToDefaults()` | Reapplies the state captured at the start of the session, including the flash. | 755 |
| `ui_photomode_effects.restoreState()` | Restores the starting state (re-read from persistence if it succeeded, otherwise from memory): first the non-DOF effects, then the DOF. Called at the end of a session. *(internal)* | 707 |
| `ui_photomode_effects.setEffectsState(partialState)` | Applies a partial effects patch: dofEnabled, dofAutofocus, dofMaxBlurNear, dofMaxBlurFar, dofFocusRange, dofAperture, dofFalloffSharpness, ssaoQualityMode (aliases ssaoQuality, ssaoSamples, ssaoEnabled), screenSpaceShadowsEnabled, specularOcclusionEnabled, ssrQualityMode, motionBlurEnabled, motionBlurStrength, reflectionQualityMode, mirrorsQualityMode, occupantsVisible. Numeric values clamped, modes validated. Stops at the first error (fields already applied stay applied). | 726 |

### Parameter details

#### `ui_photomode_effects.applyPresetState(state, options)`

Applies an effects preset, in full or for a part (options.part), then delegates the flash sub-table to ui_photomode_flash.applyPresetState.

- `state` (*table*) : Preset state
- `options` (*table|nil*) : {part = part name} (optional)
- **returns**: table {state} on success, otherwise {ok = false, reason}

#### `ui_photomode_effects.buildMetadataState()`

Subset of the state to write into a photo's metadata: the 16 effect settings plus flash.

- **returns**: table Settings

#### `ui_photomode_effects.buildState()`

Builds the effects display state (same function as the local buildEffectsState).

- **returns**: table State with values, availability, defaults, sessionActive, flash

#### `ui_photomode_effects.captureDefaultPresetState()`

Default state for a preset (the session's starting state, with the default flash), or nil if the starting state was not captured.

- **returns**: table|nil Initial settings

#### `ui_photomode_effects.capturePresetState()`

State to save in a preset (same as buildMetadataState).

- **returns**: table Settings

#### `ui_photomode_effects.captureSerializableState()`

Reads the current values directly from the engine (postFX objects, $DOFPostFx::* variables, graphics settings) and returns them in raw form; unreadable values are nil.

- **returns**: table Raw state

#### `ui_photomode_effects.getEffectsState()`

Returns the current effects state (values, availability, defaults, defaultsAvailable, sessionActive, flash) with ok = session active, and reason = session_inactive otherwise.

- **returns**: table Display state

#### `ui_photomode_effects.resetEffectsToDefaults()`

Reapplies the state captured at the start of the session, including the flash.

- **returns**: table {ok, reason?, state?}

#### `ui_photomode_effects.setEffectsState(partialState)`

Applies a partial effects patch: dofEnabled, dofAutofocus, dofMaxBlurNear, dofMaxBlurFar, dofFocusRange, dofAperture, dofFalloffSharpness, ssaoQualityMode (aliases ssaoQuality, ssaoSamples, ssaoEnabled), screenSpaceShadowsEnabled, specularOcclusionEnabled, ssrQualityMode, motionBlurEnabled, motionBlurStrength, reflectionQualityMode, mirrorsQualityMode, occupantsVisible. Numeric values clamped, modes validated. Stops at the first error (fields already applied stay applied).

- `partialState` (*table*) : Fields to change
- **returns**: table {ok, reason?, state}

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | ui_photomode_shared, ui_photomode_postFxPersistence, ui_photomode_flash, core_settings_graphic |

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/photomode/effects.lua`.*
