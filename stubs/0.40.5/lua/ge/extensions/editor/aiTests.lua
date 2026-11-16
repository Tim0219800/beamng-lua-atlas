---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/aiTests.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor tool "Vehicle AI Path/Plan Debug" (Debug menu of the editor windows). Two tabs: "Route" lets you define a start, an end and waypoints (draggable markers, or the player vehicle's / camera's position), computes the route on the navgraph (gameplay/route/route), displays it with debugDrawer and can send it to the ground markers; "AI Vehicles" lets you select AI vehicles, adjust their parameters (aggression, turnForceCoef, awarenessForceCoef, edgeDist, lookAheadKv, staticFrictionCoefMult), then launch, stop, reposition or reload all the vehicles on the current route or a random 2000 m path. Useful to compare the AI's behavior with different settings.
--- Access: extension `editor_aiTests`: `extensions.load("editor_aiTests")`, then the global `editor_aiTests`
---@class editor_aiTests
editor_aiTests = {}

--- Hook emitted when the editor is closed: re-enables dynamic collisions if the tool had disabled them.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/aiTests.lua:404
function editor_aiTests.onEditorDeactivated() end

--- Editor drawing hook: displays the Route / AI Vehicles tabbed window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/aiTests.lua:384
function editor_aiTests.onEditorGui() end

--- Hook emitted when the editor initializes: registers the window (520x420) and its menu entry in the Debug group.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/aiTests.lua:410
function editor_aiTests.onEditorInitialized() end

