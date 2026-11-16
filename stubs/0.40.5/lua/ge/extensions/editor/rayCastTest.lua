---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rayCastTest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor debug tool (menu Debug > Raycast Test) to compare two types of raycasts. Mode 0 "Gameengine Raycast": a translation gizmo places a point, a vertical Engine.castRay (±4 m) draws the impact point and the normal. Mode 1 "Physics Raycast": a grid of castRayStatic rays is fired around the cursor and the impacts are colored according to the distance to the camera. The mode is stored in the raycastTest.general.rayCastMode preference.
--- Access: extension `editor_rayCastTest`: `extensions.load("editor_rayCastTest")`, then the global `editor_rayCastTest`
---@class editor_rayCastTest
editor_rayCastTest = {}

--- Hook: draws the "Raycast Test" window with a combo to choose the ray mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rayCastTest.lua:32
function editor_rayCastTest.onEditorGui() end

--- Hook: declares the checkTerrainCastRay edit mode (action map "RayCastTest"), registers the window and the Debug menu entry.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rayCastTest.lua:133
function editor_rayCastTest.onEditorInitialized() end

--- Hook: registers the raycastTest/general preferences category with rayCastMode (number, default 0, hidden).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rayCastTest.lua:123
---@param prefsRegistry table Editor preferences registry.
function editor_rayCastTest.onEditorRegisterPreferences(prefsRegistry) end

--- Hook: if the hidden window is "raycastTest", switches back to objectSelect edit mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rayCastTest.lua:145
---@param wndName string Name of the hidden window.
function editor_rayCastTest.onEditorToolWindowHide(wndName) end

--- Hook called when the extension loads; empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rayCastTest.lua:47
function editor_rayCastTest.onExtensionLoaded() end

