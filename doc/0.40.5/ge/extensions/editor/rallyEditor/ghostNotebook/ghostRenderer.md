# `editor_rallyEditor_ghostNotebook_ghostRenderer`

*File: `lua/ge/extensions/editor/rallyEditor/ghostNotebook/ghostRenderer.lua` · VM: Game Engine (GE) · 269 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/rallyEditor/ghostNotebook/ghostRenderer")` (file under extensions/ but not a regular extension)

Draws the rally editor's ghost notebook labels in the 3D view. For each pacenote of the ghost notebook, it projects the corner start onto the road (snaproad), sorts the entries by distance along the road and only displays those near the camera. White text on a dark blue background via debugDrawer:drawTextAdvanced. The module returns a constructor (class C).

## Notes

- Drawing the ghost road as prisms is disabled in the code (call to drawRoutePrisms commented out in drawEntry): only the labels are displayed.
- Display distance = preference getPrefPacenoteLabelDistance (100 m by default) around the camera position projected onto the snaproad.
- If a pacenote is selected in the editor, only the nearest ghost (and its neighbors according to the preferences) is labeled; neighbors are at 50% text opacity. With no selection, all nearby labels are drawn.
- The cache (sorted entries) is rebuilt when the notebook or the snaproad changes (compared by reference).

## Class `C`

Object returned by the constructor (new(rallyEditor)). Fields: rallyEditor, cache {path, snaproad, entries}.

The module returns a constructor: `local obj = require("editor_rallyEditor_ghostNotebook_ghostRenderer")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:buildCache(path, snaproad)` | Builds the list of ghost notebook entries: for each non-missing pacenote with a corner start and end, computes the road positions, the label position and the distance along the road, then sorts by distance. Stores the result in self.cache. | 137 |
| `C:draw(path, snaproad, globalOpacity, pacenoteToolsState, activePath)` | Called every frame: locates the camera on the snaproad, selects the entries within the distance window, decides which labels to display (selection and previous/next neighbors according to the preferences) and calls drawEntry. | 205 |
| `C:drawEntry(entry, lineColor, textAlpha, textBgAlpha, drawLabel, prismWidth)` | Draws an entry's label at its corner start position. The text comes from rallyEditor.getGhostNotebookLabelForPacenote, otherwise from the pacenote's name. Draws nothing if drawLabel is false or the text is empty. | 179 |
| `C:getCache(path, snaproad)` | Returns the current cache if it matches the same notebook and snaproad, otherwise rebuilds it. | 172 |
| `C:init(rallyEditor)` | Internal constructor: stores the editor and empties the cache. | 13 |

## Calls into the engine (C++)

- `debugDrawer:` `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rallyEditor/ghostNotebook/ghostRenderer.lua`.*
