# `editor_editorRenderSettings`

*File: `lua/ge/extensions/editor/editorRenderSettings.lua` · VM: Game Engine (GE) · 533 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_editorRenderSettings`: `extensions.load("editor_editorRenderSettings")`, then the global `editor_editorRenderSettings`

"Editor Render Settings" window of the editor: lets you use graphics settings in the editor that differ from those of the game (anti-aliasing, resolution, quality of meshes/terrain/clusters/clouds, grass, shadows, dynamic reflections, SSAO, DOF, motion blur, FPS limit). Values are stored in the preferences editor.renderSettings.* (followGameSettings, values). On editor activation the game's graphics state is captured, then restored on deactivation, on editor shutdown or on extension unload.

## Notes

- If "followGameSettings" is true (default), the game settings are used as-is; otherwise the saved values are applied on editor activation.
- Some settings are only offered if the matching object exists in the scene (CloudLayer, ScreenSpaceShadowsPostFx, SSAOPostFx, DOFPostEffect, PostFxMotionBlur).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_editorRenderSettings.onEditorActivated()` | Captures the game's graphics state; if followGameSettings is false, saves and applies the editor values. *(internal)* *(hook)* | 504 |
| `editor_editorRenderSettings.onEditorDeactivated()` | Restores the game's graphics state captured at activation. *(internal)* *(hook)* | 520 |
| `editor_editorRenderSettings.onEditorGui()` | Draws the window: "follow game settings" checkbox, sync-from-game button, quality presets, then the sections Antialiasing, Scene Quality, Shadows, Reflections, Post-processing and FPS Limit. *(internal)* *(hook)* | 426 |
| `editor_editorRenderSettings.onEditorInitialized()` | Registers the "editorRenderSettings" window (420x700). *(internal)* *(hook)* | 500 |
| `editor_editorRenderSettings.onEditorRegisterPreferences(prefsRegistry)` | Registers the "editor" category and the renderSettings subcategory (followGameSettings = true by default, values = {}). *(internal)* *(hook)* | 492 |
| `editor_editorRenderSettings.onEditorShutdown()` | Same function as the game state restoration (alias). *(internal)* *(hook)* | 513 |
| `editor_editorRenderSettings.onExtensionUnloaded()` | Same function as the game state restoration (alias). *(internal)* *(hook)* | 513 |

### Parameter details

#### `editor_editorRenderSettings.onEditorRegisterPreferences(prefsRegistry)`

Registers the "editor" category and the renderSettings subcategory (followGameSettings = true by default, values = {}).

- `prefsRegistry` (*table*) : Editor preferences registry

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/editorRenderSettings.lua`.*
