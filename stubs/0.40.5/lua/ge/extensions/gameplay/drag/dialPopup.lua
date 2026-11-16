---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/dialPopup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- ImGui window "Drag - Set Dial" for bracket racing: the local player enters their dial (announced time, in seconds) in a decimal field, from 0 to 999 (10 by default, or the value stored in the vehicle's dial book). On confirmation, in solo the callback applies the dial; in multiplayer the value is sent to the host via drag.updateTimerValue(raceId, vehId, 'dial', val). Only shown if the track is of type bracketRace.
--- Access: extension `gameplay_drag_dialPopup`: `extensions.load("gameplay_drag_dialPopup")`, then the global `gameplay_drag_dialPopup`
---@class gameplay_drag_dialPopup
---@field dependencies string[] gameplay_drag_core, gameplay_drag_saveSystem, ui_imgui.
gameplay_drag_dialPopup = {}

--- Opens the dial entry window for a vehicle. Pre-fills with the stored dial (key importantTimerId, otherwise time_1_4) or 10.
---Source: lua/ge/extensions/gameplay/drag/dialPopup.lua:59
---@param vehId integer Player's vehicle ID (ignored if nil or -1).
---@param callback function|nil Called with the confirmed value (number) after validation.
function gameplay_drag_dialPopup.requestDial(vehId, callback) end

--- Draws the window if it is open (only once per frame). Meant to be called manually every frame, not as an extension hook.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drag/dialPopup.lua:173
---@param dtReal number Real delta time (s), unused.
---@param dtSim number Simulated time delta (s), unused.
---@param dtRaw number Raw delta (s), unused.
function gameplay_drag_dialPopup.tick(dtReal, dtSim, dtRaw) end

