---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/debug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Freeform Delivery Debug" imgui debug window of the freeform delivery mode. When enabled (setEnableDebugWindow(true)), it collects the current delivery's state every frame and displays sections: delivery state, setup state, couplings, vehicles, goals, target areas, routes, parking spots and vehicle sleep. Useful to a modder for debugging a delivery.json file.
--- Access: extension `gameplay_freeformDelivery_debug`: `extensions.load("gameplay_freeformDelivery_debug")`, then the global `gameplay_freeformDelivery_debug`
---@class gameplay_freeformDelivery_debug
---@field dependencies string[] ui_imgui and gameplay_freeformDelivery_utils.
gameplay_freeformDelivery_debug = {}

--- Clears the collected debug data.
---Source: lua/ge/extensions/gameplay/freeformDelivery/debug.lua:663
function gameplay_freeformDelivery_debug.clearDebugData() end

--- Tells whether the debug window is enabled.
---Source: lua/ge/extensions/gameplay/freeformDelivery/debug.lua:654
---@return boolean  true if enabled.
function gameplay_freeformDelivery_debug.getEnableDebugWindow() end

--- Hook called before rendering each frame: if the window is enabled, updates the debug data from gameplay_freeformDelivery_freeformDelivery then draws the window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/freeformDelivery/debug.lua:638
---@param dtReal number Real time delta (unused).
---@param dtSim number Simulated time delta (unused).
---@param dtRaw number Raw time delta (unused).
function gameplay_freeformDelivery_debug.onPreRender(dtReal, dtSim, dtRaw) end

--- Enables or disables the display of the debug window. Disabling clears the collected data.
---Source: lua/ge/extensions/gameplay/freeformDelivery/debug.lua:645
---@param enabled boolean true to display the window.
function gameplay_freeformDelivery_debug.setEnableDebugWindow(enabled) end

--- Inverts debugWindowOpen and logs the new state; no visible effect (see notes).
---Source: lua/ge/extensions/gameplay/freeformDelivery/debug.lua:658
function gameplay_freeformDelivery_debug.toggleDebugWindow() end

