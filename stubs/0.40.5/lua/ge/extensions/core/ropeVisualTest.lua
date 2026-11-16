---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/ropeVisualTest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Development sandbox for the engine's rope visuals: an ImGui interface lets you create, clone and tune ropes (anchors A and B, directions, node count, diameter, damping, bending stiffness, XPBD, collisions, stretch limit, Young's modulus, mass, gravity, wind, material), animate the anchors, move nodes with the mouse and measure simulation and rendering times. It is not meant for gameplay: it serves to test the rope system (global functions createRopeVisual, getAllRopeVisuals, getRopeVisual).
--- Access: extension `core_ropeVisualTest`: `extensions.load("core_ropeVisualTest")`, then the global `core_ropeVisualTest`
---@class core_ropeVisualTest
core_ropeVisualTest = {}

--- Hook called after reload: restores the interface state from serializedData.uiState, resets the clone offset to 0, then picks up the ropes that already exist in the engine (base positions, debug settings disabled) and selects the first one.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/ropeVisualTest.lua:2013
---@param serializedData {uiState: table}|nil Table produced by onSerialize.
function core_ropeVisualTest.onDeserialized(serializedData) end

--- Unload hook: resets the base positions, the debug settings, the clone offset and the performance statistics.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/ropeVisualTest.lua:700
function core_ropeVisualTest.onExtensionUnloaded() end

--- Hook called before a reload of the Lua extensions: returns {uiState = ...} with the whole interface state (anchors, directions, rope properties, toggles, physics, rendering, animation, debug).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/ropeVisualTest.lua:617
---@return {uiState: table}  Interface state to restore.
function core_ropeVisualTest.onSerialize() end

--- Per-frame update hook: updates the performance statistics, the animation time, the base positions of the selected rope, applies the anchor animations to all ropes, handles interaction with the nodes and draws the ImGui interface and the debug aids.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/ropeVisualTest.lua:979
---@param dt number Frame duration in seconds.
function core_ropeVisualTest.onUpdate(dt) end

