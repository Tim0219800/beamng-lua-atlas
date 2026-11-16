# `editor_heroRoadEditor_placeablesUI`

*File: `lua/ge/extensions/editor/heroRoadEditor/placeablesUI.lua` · VM: Game Engine (GE) · 512 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_heroRoadEditor_placeablesUI`: `extensions.load("editor_heroRoadEditor_placeablesUI")`, then the global `editor_heroRoadEditor_placeablesUI`

ImGui interface of the Features tab of the Hero Road Editor, for the elements that can be placed on the road: crosswalks, repair patch clusters, potholes, widenings, intersections and barriers. It displays a unified list (rename, "go to" button that moves the camera, delete), a row of placement buttons (mode via roadPlaceables.setPlaceMode) then the sliders of the selected element. Changes go through groupMgr (deep copy of the group) and editor.history for undo.

## Notes

- Each slider (itemSlider) applies to a field of an element (item[key]), not to group[key]; a button to reset to the default value appears when the value differs from the default.
- For barriers, the sliders lengthM (4 to 500 m), offsetM (0 to 5 m) and zOffsetM (-2 to 1 m) rebuild the furniture live (barrierMgr.updateGroup then be:reloadCollision).
- Crosswalk: depthM slider from 1.5 to 8.0 m; its position t is adjusted within the road ends (groupMgr.clampCrossingT).
- If the group has previewMesh == false and a placement mode is enabled, previewMesh goes back to true (and isDirty) because the mesh collision is needed to place the elements.
- The liveDrag flag is set by a held 'live' slider; heroRoadEditor reads it with consumeLiveDrag at the start of the next frame (1-frame-delayed pipeline).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_heroRoadEditor_placeablesUI.consumeLiveDrag()` | Indicates whether a 'live' slider was held in the previous frame and resets the flag to false. The tool window is drawn after the drag pipeline, so heroRoadEditor calls it at the start of the next frame. *(internal)* | 31 |
| `editor_heroRoadEditor_placeablesUI.draw(selGroup, selectedGroupIdx)` | Draws the whole Features tab for the selected road: unified list of placeable elements (crossings, repairs, potholes, widenings, junctions, barriers), row of add buttons, then the controls of the selected element. | 377 |

### Parameter details

#### `editor_heroRoadEditor_placeablesUI.consumeLiveDrag()`

Indicates whether a 'live' slider was held in the previous frame and resets the flag to false. The tool window is drawn after the drag pipeline, so heroRoadEditor calls it at the start of the next frame.

- **returns**: boolean true if a live slider was held.

#### `editor_heroRoadEditor_placeablesUI.draw(selGroup, selectedGroupIdx)`

Draws the whole Features tab for the selected road: unified list of placeable elements (crossings, repairs, potholes, widenings, junctions, barriers), row of add buttons, then the controls of the selected element.

- `selGroup` (*table|nil*) : Selected Hero Road group; nil displays an empty list ('No features yet.').
- `selectedGroupIdx` (*integer*) : Index of the selected group, compared with the roadPlaceables selection.

## Calls into the engine (C++)

- `be:` `reloadCollision`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/heroRoadEditor/placeablesUI.lua`.*
