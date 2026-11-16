---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/metrics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_metrics`: performance display window (FPS, CPU/GPU times, memory, render statistics). It is displayed at the top left with ImGui, or as 3D debug text if ImGui is hidden. The toggle() function cycles through the display modes. A modder mainly uses it to measure the effect of their mod on the framerate.
--- Access: extension `core_metrics`: `extensions.load("core_metrics")`, then the global `core_metrics`
---@class core_metrics
---@field currentMode integer Current display mode: 0 disabled, 1 small, 2 simple, 3 full. Saved in onSerialize.
---@field dependencies string[] { 'ui_imgui', 'ui_visibility' }.
core_metrics = {}

--- After a Lua reload: restores currentMode (d.currentMode, without default value) and the GPU overlay.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/metrics.lua:307
---@param d table Table returned by onSerialize.
function core_metrics.onDeserialized(d) end

--- Initialization hook: manual unloading and GPU overlay state according to currentMode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/metrics.lua:298
function core_metrics.onInit() end

--- Before a Lua reload: stores the current mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/metrics.lua:303
---@return table  { currentMode }
function core_metrics.onSerialize() end

--- Per-frame hook: draws the metrics window (ImGui) or, if ImGui is hidden, debug text in the 3D view. Does nothing in mode 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/metrics.lua:44
---@param dtReal number Elapsed real time (s), unused.
---@param dtSim number Elapsed simulation time (s), unused.
---@param dtRaw number Raw elapsed time (s), unused.
function core_metrics.onUpdate(dtReal, dtSim, dtRaw) end

--- Switches to the next display mode (0 -> 1 -> 2 -> 3 -> 0). On returning to 0, the extension unloads itself.
---Source: lua/ge/extensions/core/metrics.lua:15
function core_metrics.toggle() end

