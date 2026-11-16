---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/engineAudioDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor window "Engine Audio Debug" (Audio menu) to tune the player vehicle's engine sound live. It fetches the engine sound data on the vehicle side (sounds.getEngineSoundData via queueLuaCommand), offers a list of engines/sounds and sliders (main gain, on/off-load, low/high shelves, low/high EQ, fundamental frequency per cylinder count, muffling), displays the exhaust direction, and lets you copy the values as JSON to the clipboard or reset everything to 0. Frequencies in Hz are converted to FMOD values (table 20 Hz to 22 kHz).
--- Access: extension `editor_engineAudioDebug`: `extensions.load("editor_engineAudioDebug")`, then the global `editor_engineAudioDebug`
---@class editor_engineAudioDebug
---@field onDebugDrawActive nil Exported but always nil (undefined local variable).
---@field onUpdate function nop while the window is closed; draw/update function when it is open.
editor_engineAudioDebug = {}

--- Hook: reloads the engine data on entering the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/engineAudioDebug.lua:297
function editor_engineAudioDebug.onEditorActivated() end

--- Hook: hides the display of the exhaust direction of the selected engine.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/engineAudioDebug.lua:290
function editor_engineAudioDebug.onEditorDeactivated() end

--- Registers the window (500x200) and the menu entry (Audio group).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/engineAudioDebug.lua:279
function editor_engineAudioDebug.onEditorInitialized() end

--- Hook called when a tool window is hidden; if it is the module's window, resets onUpdate to nop.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/engineAudioDebug.lua:301
---@param windowName string Window name
function editor_engineAudioDebug.onEditorToolWindowHide(windowName) end

--- Hook called when a tool window is shown; if it is the module's window, enables onUpdate.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/engineAudioDebug.lua:308
---@param windowName string Window name
function editor_engineAudioDebug.onEditorToolWindowShow(windowName) end

--- Hook called on load: reads the engine sound data of the player vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/engineAudioDebug.lua:275
function editor_engineAudioDebug.onExtensionLoaded() end

--- Hook called on vehicle switch; reloads the data if the editor is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/engineAudioDebug.lua:284
---@param oldVehicle any Old vehicle
---@param newVehicle any New vehicle
---@param player any Player concerned
function editor_engineAudioDebug.onVehicleSwitched(oldVehicle, newVehicle, player) end

--- Displays the "Engine Audio Debug" window and forces a refresh of the values.
---Source: lua/ge/extensions/editor/engineAudioDebug.lua:269
function editor_engineAudioDebug.open() end

