# `editor_measuresInspectorHeader`

*File: `lua/ge/extensions/editor/measuresInspectorHeader.lua` · VM: Game Engine (GE) · 60 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_measuresInspectorHeader`: `extensions.load("editor_measuresInspectorHeader")`, then the global `editor_measuresInspectorHeader`

Small editor extension that adds a "Size: X x Y x Z" line to the object inspector header. It shows the size (bounding box, scale included) of the selected object, or of the selection's bounding box if there are several. It only acts once the editor is initialized.

## Notes

- For a single object: getObjBox() then scale3F(getScale()), then getExtents(); for several objects: editor.objectSelectionBBox:getExtents().
- Nothing is displayed if the selection contains no objects (selection.object nil) or if the object lacks getObjBox/getScale.
- Values displayed with 2 decimals, in meters (world units).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_measuresInspectorHeader.onEditorInitialized()` | Hook called when the editor is initialized; enables the size display. *(internal)* *(hook)* | 52 |
| `editor_measuresInspectorHeader.onEditorInspectorHeaderGui(inspectorInfo)` | Hook called by the editor inspector to draw its header. Draws the "Size" text and its tooltip. Uses inspectorInfo.selection if present, otherwise editor.selection. Does nothing until the editor is initialized. *(internal)* *(hook)* | 10 |
| `editor_measuresInspectorHeader.onExtensionLoaded()` | Extension load hook; does nothing. *(internal)* *(hook)* | 49 |

### Parameter details

#### `editor_measuresInspectorHeader.onEditorInspectorHeaderGui(inspectorInfo)`

Hook called by the editor inspector to draw its header. Draws the "Size" text and its tooltip. Uses inspectorInfo.selection if present, otherwise editor.selection. Does nothing until the editor is initialized.

- `inspectorInfo` (*table*) : Inspector information; the optional selection field replaces editor.selection.

## Calls into the engine (C++)

- `obj:` `getObjBox`, `getScale`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/measuresInspectorHeader.lua`.*
