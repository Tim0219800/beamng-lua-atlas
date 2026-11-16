# `editor_particleEditor2`

*File: `lua/ge/extensions/editor/particleEditor2.lua` · VM: Game Engine (GE) · 541 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_particleEditor2`: `extensions.load("editor_particleEditor2")`, then the global `editor_particleEditor2`

Second, experimental version of the particle editor: a tool window "Particle Editor 2" (Window > Experimental menu) with, on the left, a 3D preview rendered in a dedicated RenderView (orbital camera, grid drawn with debugDrawer) and, on the right, the controls. It uses two genericInspector (ParticleEmitterData and ParticleData) to edit the fields, and handles creation, saving (original file, level, "as...") and deletion of emitters and particles (4 particles max per emitter).

## Notes

- Preview: right-click drag = rotation, middle-click drag = pan, wheel = distance (0.5 to 200), left double-click = recenter.
- The preview camera's pitch is limited to ±1.5 rad; the view mask is 30 and the background is dark gray (20,20,20).
- DefaultEmitter cannot be deleted.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_particleEditor2.onEditorGui()` | Called every frame by the editor. Opens the "Particle Editor 2" window (with menu bar) and draws the preview then the controls. *(internal)* *(hook)* | 463 |
| `editor_particleEditor2.onEditorInitialized()` | Registers the window (900x600), the Experimental menu entry and creates the two generic inspectors (ParticleEmitterData / ParticleData). *(internal)* *(hook)* | 517 |
| `editor_particleEditor2.onEditorToolWindowHide(windowName)` | If the hidden window is particleEditor2, disables the preview and destroys the preview node. *(internal)* *(hook)* | 507 |
| `editor_particleEditor2.onEditorToolWindowShow(windowName)` | If the displayed window is particleEditor2, enables the preview, rereads the datablocks list, creates the preview node and selects the first emitter if none is chosen. *(internal)* *(hook)* | 497 |
| `editor_particleEditor2.onExtensionUnloaded()` | Destroys the preview when the extension unloads. *(internal)* *(hook)* | 528 |
| `editor_particleEditor2.onPreRender()` | Called before rendering; draws the preview grid (debugDrawer lines limited to the preview's view mask) when the preview is active. *(internal)* *(hook)* | 488 |
| `editor_particleEditor2.onUpdate()` | Called every frame; if the editor is active and the preview open, updates the RenderView (size, fov 60, camera matrix). *(internal)* *(hook)* | 492 |

### Parameter details

#### `editor_particleEditor2.onEditorToolWindowHide(windowName)`

If the hidden window is particleEditor2, disables the preview and destroys the preview node.

- `windowName` (*string*) : Name of the hidden tool window.

#### `editor_particleEditor2.onEditorToolWindowShow(windowName)`

If the displayed window is particleEditor2, enables the preview, rereads the datablocks list, creates the preview node and selects the first emitter if none is chosen.

- `windowName` (*string*) : Name of the displayed tool window.

## Calls into the engine (C++)

- `Sim.` `getDataBlockSet`, `getUniqueName`, `upcast`
- `debugDrawer:` `currentRenderViewMaskClear`, `currentRenderViewMaskSet`, `drawLine`
- `scenetree.` `findObject`, `findObjectById`
- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/particleEditor2.lua`.*
