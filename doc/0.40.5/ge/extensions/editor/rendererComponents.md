# `editor_rendererComponents`

*File: `lua/ge/extensions/editor/rendererComponents.lua` · VM: Game Engine (GE) · 977 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_rendererComponents`: `extensions.load("editor_rendererComponents")`, then the global `editor_rendererComponents`

Editor "Renderer Components" window (Debug menu) to adjust rendering effects live: depth of field (DOF), HDR, SSAO, anti-aliasing, motion blur, bloom, screen-space shadows, CloudLayer, and in non-shipping builds Coconut, Cluster Shading and Shadows. Each tab only appears if the corresponding post-effect object exists in the scene. A "Reset All" menu and per-tab reset buttons restore the default values. Relies on core/settings/graphic and client/postFx/ssao.

## Notes

- The file's comment says it is a utility for level creators.
- The CloudLayer's Weather tab lets you regenerate the weather map with a random seed (max 2147483647).
- onEditorActivated applies the saved state to DOFPostEffect (debugModeEnabled, enable/disable); it assumes DOFSettings is initialized.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_rendererComponents.onEditorActivated()` | Hook: on editor activation, initializes the settings if needed and reapplies the DOFPostEffect state (debug mode, enable/disable). *(internal)* *(hook)* | 955 |
| `editor_rendererComponents.onEditorGui()` | Hook: draws the window with a menu bar and tab bar; a tab is only displayed if the post-effect/object exists. *(internal)* *(hook)* | 866 |
| `editor_rendererComponents.onEditorInitialized()` | Hook: adds the Debug menu entries (Renderer Components, and Cluster Shading outside shipping), registers the window (300x500), initializes the settings and captures the default screen-space shadow values. *(internal)* *(hook)* | 944 |

## Calls into the engine (C++)

- `Sim.` `upcast`
- `obj:` `getField`, `setField`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rendererComponents.lua`.*
