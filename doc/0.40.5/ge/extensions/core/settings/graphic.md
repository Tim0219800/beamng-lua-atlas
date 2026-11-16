# `core_settings_graphic`

*File: `lua/ge/extensions/core/settings/graphic.lua` · VM: Game Engine (GE) · 2181 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_settings_graphic`: `extensions.load("core_settings_graphic")`, then the global `core_settings_graphic`

Graphics settings: display mode (windowed, fullscreen, borderless), resolution, refresh rate, display driver, HDR, anti-aliasing, upscaling, quality groups (meshes, textures, lighting, shadows, terrain, clouds, dynamic reflections and mirrors, clustered lighting), post-processing (DOF, motion blur, SSAO, SSR, screen-space shadows) and global presets (settingsPresets.json). It provides core_settings_settings with the "option helpers" (get/set) of these settings and applies the video state to the Canvas. A modder mostly uses it via core_settings_settings.setValue; setPresetOverride lets you temporarily enforce a preset.

## Example

```lua
-- enforce the 'Low' preset without changing the saved choice
core_settings_graphic.setPresetOverride({name = 'Low', enforce = true})
-- release
core_settings_graphic.setPresetOverride(nil)
```

## Notes

- The file is very large (over 2000 lines): most of it is in buildOptionHelpers, which returns a table whose keys are: GraphicDisplayModes, GraphicDisplayResolutions, GraphicDisplayRefreshRates, GraphicDisplayDriver, GraphicGPU, WindowPlacement, uiUpscaling, vulkanEnabled, GraphicHDRSupported/Enabled/PaperWhiteNits/PeakWhiteNits/UiMultiplier/OutputModeName, GraphicEVCompensation, vsync, GraphicAntialiasType, GraphicUpscalingQuality, GraphicUpscalingSharpness, GraphicAntialias, GraphicAnisotropic, GraphicPlatformPreset, GraphicOverallQuality, GraphicMeshQuality, GraphicTerrainQuality, GraphicTextureQuality, GraphicLightingQuality, GraphicShadowsQuality, GraphicDynReflectionQuality, GraphicDynReflectionFacesPerupdate, GraphicDynMirrorsQuality, GraphicCloudsQuality, PostFXDOFGeneralEnabled, PostFXMotionBlurEnabled/Strength/PlayerVehicle, PostFXSSAOGeneralEnabled/Quality, PostFXSpecularOcclusionEnabled, PostFXSSRAvailable/Enabled/Quality, PostFXScreenSpaceShadowsAvailable/Enabled, GraphicGrassDensity, GraphicMaxDecalCount, lastSplitCastersEnabled, vehicleShadowEnabled, GraphicClusteredQuality.
- The quality groups use core_settings_graphicsQualityGroup with the modules lightingQuality, shadowsQuality, textureQuality, meshQuality and terrainQuality; clusteredQuality and dynCaptureQuality are called directly.
- autoDetectApplyGraphicsQuality is empty (the whole body is commented out, with a TODO from 2021): calling this function does nothing. openMonitorConfiguration is also empty.
- In onInitSettings, setting Vulkan from the settings is disabled by an 'if false'.
- The keys PostFXDOFGeneralEnabled and PostFXMotionBlur* keep the user's value when a platform preset is applied (platformPresetUserOwnedKeys).
- setPresetOverride: while an override is active, the saved GraphicOverallQuality choice can change but stays unapplied; with enforce, the preset values are re-enforced on every settings change.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_settings_graphic.applyGraphicsState()` | Applies the chosen video mode to the engine: requests saving, sets the display device (GFXDevice.setDisplayDevice) and the video mode (width, height, refresh rate, mode), applies HDR, restores the window position, then sets the rendering mode (SingleMonitor or MultiMonitor depending on GraphicTripleMonitorEnabled and the triple-screen FOVs). Ignored if already in progress, or if the Canvas is absent (after the save request). | 263 |
| `core_settings_graphic.autoDetectApplyGraphicsQuality()` | Intended to automatically choose a quality based on video memory; entirely commented out in the code, so inactive. | 2032 |
| `core_settings_graphic.buildOptionHelpers()` | Builds and stores the table of graphics options (get/set/getModes and optionally sanitize, init, onSettingsChanged per option). Called by core_settings_settings.initSettings. *(internal)* | 494 |
| `core_settings_graphic.getDisplayInformation()` | Returns the display information collected at startup (GPU, screens...) for the UI. | 2117 |
| `core_settings_graphic.getOptions(optionName)` | Returns a specific option helper or the whole graphics options table. | 2113 |
| `core_settings_graphic.getOverallQualityPresets()` | Returns the table of global presets read from lua/ge/extensions/core/settings/settingsPresets.json. | 2179 |
| `core_settings_graphic.getPresetOverride()` | Returns the active preset override. | 2178 |
| `core_settings_graphic.load(newState)` | Called by core_settings_settings.load: refreshGraphicsState(newState) then applyGraphicsState(). *(internal)* | 2014 |
| `core_settings_graphic.onFirstUpdateSettings()` | Hook called at the end of settings initialization: if $forceFullscreen is true, forces the default settings in fullscreen; shows the window (canvas:showWindow), collects display information and cleans up the anti-aliasing type. No effect if the Canvas does not exist. *(internal)* *(hook)* | 1880 |
| `core_settings_graphic.onInitSettings(data)` | Hook called by core_settings_settings.initSettings: calls init(value) on each graphics option that has one, with the value read. *(internal)* *(hook)* | 1867 |
| `core_settings_graphic.onSettingsChanged()` | Called after every settings save. With an active override: re-enforces the preset if enforce, otherwise does nothing. Without an override: reruns GraphicPlatformPreset.onSettingsChanged and GraphicOverallQuality.onSettingsChanged. *(internal)* *(hook)* | 2156 |
| `core_settings_graphic.onUiChangedState(toState, fromState)` | UI state change hook. On entering 'menu.options.graphics', stores the display state; on leaving, if the changes were not applied, restores the old mode, resolution and refresh rate. *(internal)* *(hook)* | 1997 |
| `core_settings_graphic.onUpdate(dtReal)` | Update hook: counts down the deferred timers for the render scale and the HDR output mode, then applies them on expiry. *(internal)* *(hook)* | 2083 |
| `core_settings_graphic.openCoconutWindow()` | Opens the rendering "Coconut" debug window (Engine.Render.setCoconutWindowOpen(true)). No effect in a shipping build. | 2022 |
| `core_settings_graphic.openMonitorConfiguration()` | Empty body: does nothing. | 2019 |
| `core_settings_graphic.refreshGraphicsState(newState)` | Synchronizes the internal state (mode, driver, resolution, refresh rate, window placement) with a new settings state, cleans up invalid values (sanitize), notifies the UI and emits the hook onDisplayModeChanged(oldMode, newMode) if the mode changed. A WindowPlacement change is saved immediately. | 1904 |
| `core_settings_graphic.setPresetOverride(override)` | Enforces a global preset without changing the saved GraphicOverallQuality choice. Passing nil releases the override and restores the saved preset. With enforce = true, the values are re-enforced on every settings change. | 2148 |
| `core_settings_graphic.toggleFullscreen()` | Toggles fullscreen/windowed on the Canvas (canvas:toggleFullscreen) if it exists. | 2105 |

### Parameter details

#### `core_settings_graphic.buildOptionHelpers()`

Builds and stores the table of graphics options (get/set/getModes and optionally sanitize, init, onSettingsChanged per option). Called by core_settings_settings.initSettings.

- **returns**: table<string, table> Helpers by setting name.

#### `core_settings_graphic.getDisplayInformation()`

Returns the display information collected at startup (GPU, screens...) for the UI.

- **returns**: table Display information (structure inferred from gatherDisplayInformation).

#### `core_settings_graphic.getOptions(optionName)`

Returns a specific option helper or the whole graphics options table.

- `optionName` (*string|nil*) : Option name (e.g. 'GraphicDisplayModes'). nil = the whole table.
- **returns**: table|nil Option helper, or full table.

#### `core_settings_graphic.getOverallQualityPresets()`

Returns the table of global presets read from lua/ge/extensions/core/settings/settingsPresets.json.

- **returns**: table<string, table> Presets by name.

#### `core_settings_graphic.getPresetOverride()`

Returns the active preset override.

- **returns**: table|nil {name, enforce} or nil.

#### `core_settings_graphic.load(newState)`

Called by core_settings_settings.load: refreshGraphicsState(newState) then applyGraphicsState().

- `newState` (*table<string, any>*) : Full settings.

#### `core_settings_graphic.onInitSettings(data)`

Hook called by core_settings_settings.initSettings: calls init(value) on each graphics option that has one, with the value read.

- `data` (*table<string, any>*) : Values read from the settings.

#### `core_settings_graphic.onUiChangedState(toState, fromState)`

UI state change hook. On entering 'menu.options.graphics', stores the display state; on leaving, if the changes were not applied, restores the old mode, resolution and refresh rate.

- `toState` (*string*) : New state.
- `fromState` (*string*) : Old state.

#### `core_settings_graphic.onUpdate(dtReal)`

Update hook: counts down the deferred timers for the render scale and the HDR output mode, then applies them on expiry.

- `dtReal` (*number|nil*) : Real frame duration in seconds.

#### `core_settings_graphic.refreshGraphicsState(newState)`

Synchronizes the internal state (mode, driver, resolution, refresh rate, window placement) with a new settings state, cleans up invalid values (sanitize), notifies the UI and emits the hook onDisplayModeChanged(oldMode, newMode) if the mode changed. A WindowPlacement change is saved immediately.

- `newState` (*table<string, any>*) : Settings containing GraphicDisplayDriver, GraphicDisplayModes, GraphicDisplayResolutions, GraphicDisplayRefreshRates, WindowPlacement (all optional).

#### `core_settings_graphic.setPresetOverride(override)`

Enforces a global preset without changing the saved GraphicOverallQuality choice. Passing nil releases the override and restores the saved preset. With enforce = true, the values are re-enforced on every settings change.

- `override` (*{name: string, enforce: boolean}|nil*) : name = name of a preset from settingsPresets.json.
- **returns**: boolean false if the preset is not found, otherwise true.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onDisplayModeChanged` — listened to by 1 module(s)

## Calls into the engine (C++)

- `Engine.` `getVulkanEnabled`, `setRenderMode`, `setVulkanEnabled`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/settings/graphic.lua`.*
