---@meta
-- tim19Atlas stub generated from lua/ge/serverConnection.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Disconnection of the local session (stopping the simulation, cleanup) and transition of the world-ready state. It is used when leaving a level to return to the menu: stopping the physics, restoring the cursor, stopping the mission lighting, destroying the local server and clearing the mission name. It also moves worldReadyState from 0 to 1 once the first camera is set.
--- Access: global `serverConnection`
---@class serverConnection
serverConnection = {}

--- Leaves the current session: displays the loading screen (by default), then stops the physics, restores the cursor, turns off the mission lighting, destroys the server (server.destroy), clears the mission name, leaves the loading screen and calls callback.
---Source: lua/ge/serverConnection.lua:63
---@param callback function|nil Function called at the end of the disconnection; its return value is ignored (disconnectWrapper returns nothing).
---@param loadingScreen boolean|nil true by default (nil counts as true). false: disconnects immediately without a loading screen.
---@param p table|nil Optional profiler (object with :add(label)) to measure the steps.
function serverConnection.disconnect(callback, loadingScreen, p) end

--- Immediate disconnection without a loading screen and without a callback (disconnect(nop, false, p)). Used from external code ('.cs' comment).
---Source: lua/ge/serverConnection.lua:79
---@param p table|nil Optional profiler.
function serverConnection.noLoadingScreenDisconnect(p) end

--- Hook called when the first camera/control object is set by the server. If worldReadyState is 0, enables hiding of the idle cursor, sets worldReadyState to 1 and broadcasts the onWorldReadyState(1) hook.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/serverConnection.lua:8
function serverConnection.onCameraHandlerSetInitial() end

