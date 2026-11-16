# `editor_rayCastTest`

*File: `lua/ge/extensions/editor/rayCastTest.lua` · VM: Game Engine (GE) · 157 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_rayCastTest`: `extensions.load("editor_rayCastTest")`, then the global `editor_rayCastTest`

Editor debug tool (menu Debug > Raycast Test) to compare two types of raycasts. Mode 0 "Gameengine Raycast": a translation gizmo places a point, a vertical Engine.castRay (±4 m) draws the impact point and the normal. Mode 1 "Physics Raycast": a grid of castRayStatic rays is fired around the cursor and the impacts are colored according to the distance to the camera. The mode is stored in the raycastTest.general.rayCastMode preference.

## Notes

- onWindowMenuItem, editModeActivate/Update/Deactivate are local: they are wired via editor.editModes.checkTerrainCastRay and the menu, not exported.
- The "Physics Raycast" mode divides by (maxDist - minDist): gives NaN if all impacts are at the same distance.
- The beginDrag/endDrag/dragging functions are empty.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_rayCastTest.onEditorGui()` | Hook: draws the "Raycast Test" window with a combo to choose the ray mode. *(internal)* *(hook)* | 32 |
| `editor_rayCastTest.onEditorInitialized()` | Hook: declares the checkTerrainCastRay edit mode (action map "RayCastTest"), registers the window and the Debug menu entry. *(internal)* *(hook)* | 133 |
| `editor_rayCastTest.onEditorRegisterPreferences(prefsRegistry)` | Hook: registers the raycastTest/general preferences category with rayCastMode (number, default 0, hidden). *(internal)* *(hook)* | 123 |
| `editor_rayCastTest.onEditorToolWindowHide(wndName)` | Hook: if the hidden window is "raycastTest", switches back to objectSelect edit mode. *(internal)* *(hook)* | 145 |
| `editor_rayCastTest.onExtensionLoaded()` | Hook called when the extension loads; empty. *(internal)* *(hook)* | 47 |

### Parameter details

#### `editor_rayCastTest.onEditorRegisterPreferences(prefsRegistry)`

Hook: registers the raycastTest/general preferences category with rayCastMode (number, default 0, hidden).

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_rayCastTest.onEditorToolWindowHide(wndName)`

Hook: if the hidden window is "raycastTest", switches back to objectSelect edit mode.

- `wndName` (*string*) : Name of the hidden window.

## Calls into the engine (C++)

- `Engine.` `castRay`
- `debugDrawer:` `drawLine`, `drawSphere`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/rayCastTest.lua`.*
