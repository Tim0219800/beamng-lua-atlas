# `editor_audioRibbonEditor`

*File: `lua/ge/extensions/editor/audioRibbonEditor.lua` · VM: Game Engine (GE) · 969 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_audioRibbonEditor`: `extensions.load("editor_audioRibbonEditor")`, then the global `editor_audioRibbonEditor`

"Audio Ribbon Editor" edit mode of the level editor: creates and edits sound "ribbons" (rivers, etc.) stored in the runtime module core/audioRibbon. A ribbon is a polyline of nodes with depth and speed; it carries either a single emitter ("Single Emitter Only") or four emitters (front, back, left, right) on the top surface, the bottom surface or the whole volume. The default events are 'event:>Ambient>Water>River'. The tool handles adding ribbons, moving nodes with the gizmo, snapping to the underlying surface (terrain, river, water plane), undo/redo through editor.history and a pan camera.

## Notes

- Depends on core/audioRibbon and the editor/toolUtilities/(ribbonInput, render/transport, util, style, panCamera) utilities.
- Default speed 1.0 (range 0 to 10), default depth 10.0, ray cast up to 10000 m.
- onActivate and onDeactivate are local and not exported; they are hooked up via editor.editModes.audioRibbonEditMode.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_audioRibbonEditor.onEditorGui()` | Called every editor frame: if the mode is active, draws the tool window, displays the ribbons, handles editing (selection, node dragging, gizmo) and drives the pan camera. *(internal)* *(hook)* | 900 |
| `editor_audioRibbonEditor.onEditorInitialized()` | Registers the audioRibbonEditMode edit mode (simobject_sfxspace icon) and the "audioRibbonEditor" window (500x500). *(internal)* *(hook)* | 948 |
| `editor_audioRibbonEditor.onInit()` | Initialization: if core/audioRibbon does not yet have a ribbon list, creates it empty and clears the ribbon names and the near/far lists. *(internal)* *(hook)* | 325 |

## Calls into the engine (C++)

- `Engine.` `generateUUID`
- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/audioRibbonEditor.lua`.*
