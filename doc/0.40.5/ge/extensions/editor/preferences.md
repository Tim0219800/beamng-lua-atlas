# `editor_preferences`

*File: `lua/ge/extensions/editor/preferences.lua` · VM: Game Engine (GE) · 461 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_preferences`: `extensions.load("editor_preferences")`, then the global `editor_preferences`

"Preferences" window of the world editor. It displays on the left the list of pages (categories of the editor.preferencesRegistry registry) and on the right the preferences of the chosen page via a valueInspector, with a search filter and a "Reset All To Defaults" button. The module also registers the general, camera and ui categories with their default preferences (UI scale, free camera speed, etc.) and reacts to value changes. An editor tool modder can open the window with editor.showPreferences(category).

## Example

```lua
editor.showPreferences('camera')  -- opens the window on the Camera page
local v = editor.getPreference('ui.general.scale')
```

## Notes

- Declared preferences: general.internal (cleanExit, lastLevel, hidden), ui.general (floatDigitCount, hexColorInput, scale 0.92 by default [0.4 to 3], dpiAware, iconButtonSize 28, singleLineToolbar, enableVehicleControls, sceneMetric, useSlidersInInspector, showCompleteSceneTree, showInternalName, playSoundOnNotifications, muteGameAudioOnEditorActivate, lockedObjectTextColor, inspectorFieldNameHoverCopyPaste, forceExpandWindowOnFirstShow, recentWindowMenuCount), camera.general (freeCameraMoveSmoothness 0.3, freeCameraRotateSmoothness 0.3, freeCameraMoveSpeed 30, smoothCameraMove, smoothCameraRotate, setVehicleCameraWhenExitingEditor).
- Preference changes go through editor.setPreference without undo support (TODO comment in the code).
- "Reset All To Defaults" is irreversible (modal confirmation).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_preferences.onDeserialized(state)` | Called when the extension is reloaded (after a Lua reload) with the saved state; restores the current preferences page (currentCategoryName). *(internal)* *(hook)* | 435 |
| `editor_preferences.onEditorActivated()` | Called when the editor opens; applies the UI scale from the ui.general.scale preference. *(internal)* *(hook)* | 447 |
| `editor_preferences.onEditorDeactivated()` | Called when the editor closes; sets the UI scale back to 1 and, if the camera.general.setVehicleCameraWhenExitingEditor preference is true (and it is not the game's free camera nor editor.skipCameraOnExit), switches back to the game camera. *(internal)* *(hook)* | 439 |
| `editor_preferences.onEditorGui()` | Called every frame by the editor. Draws the Preferences window: list of pages, search, page content (or all pages if "All") and the reset button. *(internal)* *(hook)* | 237 |
| `editor_preferences.onEditorInitialized()` | Registers the window (800x600), configures the valueInspector (name "preferencesInspector", class "Preferences", write callback via editor.setPreference), builds the pages and installs editor.showPreferences and editor.updatePreferencePages. *(internal)* *(hook)* | 408 |
| `editor_preferences.onEditorPreferenceValueChanged(path, value)` | Called when a preference changes. Immediately applies some values: ui.general.scale / dpiAware (UI scale), iconButtonSize, showCompleteSceneTree (refreshes the scene tree), and the free camera settings (speed, movement and rotation smoothing). *(internal)* *(hook)* | 321 |
| `editor_preferences.onEditorRegisterPreferences(prefsRegistry)` | Called when preferences are registered: declares the categories general, camera, ui ("User Interface") and their subcategories with default values, descriptions and bounds. *(internal)* *(hook)* | 341 |
| `editor_preferences.onExtensionLoaded()` | Called when the extension loads; does nothing. *(internal)* *(hook)* | 309 |
| `editor_preferences.onSerialize(state)` | Called before a Lua reload; returns {currentCategoryName = ...} to keep the displayed page. *(internal)* *(hook)* | 431 |

### Parameter details

#### `editor_preferences.onDeserialized(state)`

Called when the extension is reloaded (after a Lua reload) with the saved state; restores the current preferences page (currentCategoryName).

- `state` (*table*) : Table returned by onSerialize ({currentCategoryName}).

#### `editor_preferences.onEditorPreferenceValueChanged(path, value)`

Called when a preference changes. Immediately applies some values: ui.general.scale / dpiAware (UI scale), iconButtonSize, showCompleteSceneTree (refreshes the scene tree), and the free camera settings (speed, movement and rotation smoothing).

- `path` (*string*) : Preference path, e.g. "camera.general.freeCameraMoveSpeed".
- `value` (*any*) : New value.

#### `editor_preferences.onEditorRegisterPreferences(prefsRegistry)`

Called when preferences are registered: declares the categories general, camera, ui ("User Interface") and their subcategories with default values, descriptions and bounds.

- `prefsRegistry` (*table*) : Editor preferences registry (registerCategory, registerSubCategory).

#### `editor_preferences.onSerialize(state)`

Called before a Lua reload; returns {currentCategoryName = ...} to keep the displayed page.

- `state` (*table*) : Not used.
- **returns**: table State to save.

## Class `editor`

The global editor table (not created here): the module installs two functions in it during onEditorInitialized.

Object `editor` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `editor.showPreferences(categoryName)` | Opens the Preferences window. If categoryName is given, selects that page. | 304 |
| `editor.updatePreferencePages()` | Rebuilds the page list from the registry: registers the "general" category, keeps only categories with at least one non-hidden item, and adds the "All" page. | 386 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/preferences.lua`.*
