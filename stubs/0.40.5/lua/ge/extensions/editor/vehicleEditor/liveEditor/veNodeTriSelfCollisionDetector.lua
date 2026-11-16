---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/liveEditor/veNodeTriSelfCollisionDetector.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- 'Node Triangle Self Collision Detector' window of the live Vehicle Editor. The 'Start Analysis' button tests, for each collidable triangle, which vehicle nodes pass within a given radius (0.025 to 0.1 m, 0.025 m being the real collision radius) of the triangle. Ignored: NONCOLLIDABLE triangles, the triangle's nodes, nodes without collision or without selfCollision, coupler nodes or nodes with couplerTag/tag, and nodes in the same first group as a triangle vertex. The pairs found are printed to the console and drawn (orange sphere, green triangle, texts).
--- Access: extension `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector`: `extensions.load("editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector")`, then the global `editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector`
---@class editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector
---@field menuEntry string 'Node Triangle Self Collision Detector'.
editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector = {}

--- Restores the open state and the radius (data.nodeCollisionRadius).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veNodeTriSelfCollisionDetector.lua:213
---@param data table onSerialize table.
function editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.onDeserialized(data) end

--- Returns {windowOpen, nodeCollisionRadius, vehsResultData}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veNodeTriSelfCollisionDetector.lua:205
---@return table  State to restore.
function editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.onSerialize() end

--- Called every frame: draws the window (radius slider, Start Analysis / Clear Results buttons).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veNodeTriSelfCollisionDetector.lua:177
function editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.onUpdate() end

--- Render hook emitted by editor_veMain: draws the analysis results of the current vehicle (node sphere, triangle, labels).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veNodeTriSelfCollisionDetector.lua:40
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation time delta (s).
---@param dtRaw number Raw time delta (s).
function editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw) end

--- Opens the window.
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veNodeTriSelfCollisionDetector.lua:201
function editor_vehicleEditor_liveEditor_veNodeTriSelfCollisionDetector.open() end

