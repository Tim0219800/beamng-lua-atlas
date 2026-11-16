---@meta
-- tim19Atlas stub generated from lua/ge/extensions/trackbuilder/trackBuilder.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- ImGui interface of the track editor (Track Builder). It drives the spline engine `util_trackBuilder_splineTrack` (loaded via `extensions['util_trackBuilder_splineTrack']`): adding and removing pieces, modifiers (width, banking, etc.), materials, borders, sub-tracks, saving with screenshot, drive mode and paint modes (Select, Paint, ChangeMesh, Merge). A modder mostly uses it to open or close the editor (enter, exit, toggleTrackBuilder) and to know whether it is active (isActive). The editor opens through the UI route `trackBuilder`, on the `glow_city` level by default.
--- Access: extension `trackbuilder_trackBuilder`: `extensions.load("trackbuilder_trackBuilder")`, then the global `trackbuilder_trackBuilder`
---@class trackbuilder_trackBuilder
trackbuilder_trackBuilder = {}

--- Opens the Track Builder. If the requested level is not already loaded (or if forceLoad is true), loads it in freeroam then opens the editor; otherwise opens it directly. A level that cannot be found is logged as an error and nothing is done.
---Source: lua/ge/extensions/trackbuilder/trackBuilder.lua:3577
---@param levelName string|nil Level name (for example "glow_city").
---@param forceLoad boolean|nil Forces the level to reload even if it is already loaded.
function trackbuilder_trackBuilder.enter(levelName, forceLoad) end

--- Closes the Track Builder if it is active, without navigating itself (the router keeps the navigation), and releases the gameplay route.
---Source: lua/ge/extensions/trackbuilder/trackBuilder.lua:3599
function trackbuilder_trackBuilder.exit() end

--- Cancels a pending entry, closes the editor if it is active, then calls `returnToMainMenu()`.
---Source: lua/ge/extensions/trackbuilder/trackBuilder.lua:3609
function trackbuilder_trackBuilder.exitToMainMenu() end

--- Closes the editor window, restores the BeamNG ImGui style and resets the state. If the closing is not driven by the router, gives the gameplay route back by navigating to `play`. No effect if not initialized.
---Source: lua/ge/extensions/trackbuilder/trackBuilder.lua:3530
function trackbuilder_trackBuilder.hideTrackBuilder() end

--- Indicates whether the editor is initialized and its window open.
---Source: lua/ge/extensions/trackbuilder/trackBuilder.lua:3573
---@return boolean  true if active.
function trackbuilder_trackBuilder.isActive() end

--- Hook called at the end of a mission/level. Closes the editor unless an entry is waiting for a level to load.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/trackbuilder/trackBuilder.lua:3631
function trackbuilder_trackBuilder.onClientEndMission() end

--- Hook called by the UI router on entering the `trackBuilder` route. Reserves the gameplay route and calls enter with `params.level` ("glow_city" by default) and `params.forceLoad`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/trackbuilder/trackBuilder.lua:3617
---@param context any Route context (not used).
---@param toRoute table Destination route; its `params` field is read.
---@param fromRoute any Source route (not used).
---@param data any Route data (not used).
function trackbuilder_trackBuilder.onRouteEnter(context, toRoute, fromRoute, data) end

--- Hook called by the UI router when leaving the route: closes the editor if it is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/trackbuilder/trackBuilder.lua:3625
---@param context any Route context (not used).
---@param toRoute any Destination route (not used).
---@param fromRoute any Source route (not used).
---@param data any Route data (not used).
function trackbuilder_trackBuilder.onRouteLeave(context, toRoute, fromRoute, data) end

--- Hook called every frame. Shows the main window or the drive mode bar, or nothing while the save screenshot is being taken.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/trackbuilder/trackBuilder.lua:2894
function trackbuilder_trackBuilder.onUpdate() end

--- Hook called when the game window is resized. Remembers the display size used by the style.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/trackbuilder/trackBuilder.lua:3343
---@param size table Screen size with fields `x` and `y`.
function trackbuilder_trackBuilder.onWindowResized(size) end

--- Shows the editor: switches to the game camera if the camera is not free, then opens the window.
---Source: lua/ge/extensions/trackbuilder/trackBuilder.lua:3521
function trackbuilder_trackBuilder.showTrackBuilder() end

--- Opens or closes the ImGui window. On open: initializes, gets the spline engine and applies the style; on close: deselects, hides the markers, and deletes the track if it has 2 pieces or fewer (except glow_city). Always emits the hook `onTrackBuilderWindowToggled(open)`.
---Source: lua/ge/extensions/trackbuilder/trackBuilder.lua:3477
---@param show boolean true to open, false to close.
function trackbuilder_trackBuilder.showTrackBuilderWindow(show) end

--- Opens the editor (by setting the gameplay route and navigating to `trackBuilder`) or closes it if it is open.
---Source: lua/ge/extensions/trackbuilder/trackBuilder.lua:3552
function trackbuilder_trackBuilder.toggleTrackBuilder() end

--- Local table of internal interface functions (not exported). They modify the track through the spline engine then refresh the displayed values; `currentIndex` is the selected piece.
---@class trackbuilder_trackBuilder_tbFunctions
local trackbuilder_trackBuilder_tbFunctions = {}

--- Starts drive mode: high-quality track, markers hidden, reset of vehicle 0 and placement on the given piece, game camera.
---Source: lua/ge/extensions/trackbuilder/trackBuilder.lua:3102
---@param index integer|nil Index of the starting piece.
function trackbuilder_trackBuilder_tbFunctions.drive(index) end

--- Merges track segments via the spline engine.
---Source: lua/ge/extensions/trackbuilder/trackBuilder.lua:3148
---@param segments table Segments to merge.
function trackbuilder_trackBuilder_tbFunctions.mergeMultiTrack(segments) end

--- Applies a modifier's value to the current piece and rebuilds the track.
---Source: lua/ge/extensions/trackbuilder/trackBuilder.lua:3070
---@param field string Modifier name.
function trackbuilder_trackBuilder_tbFunctions.modifierChange(field) end

--- Removes a modifier from the current piece.
---Source: lua/ge/extensions/trackbuilder/trackBuilder.lua:3078
---@param field string Modifier name.
function trackbuilder_trackBuilder_tbFunctions.modifierRemove(field) end

--- Moves a modifier to the previous or next piece.
---Source: lua/ge/extensions/trackbuilder/trackBuilder.lua:3085
---@param name string Modifier name.
---@param offset integer 1 or -1.
function trackbuilder_trackBuilder_tbFunctions.modifierShift(name, offset) end

--- Moves the cursor: 1 next, -1 previous (with wraparound), 'first' or 'last'. Recenters the marker and rereads the piece info.
---Source: lua/ge/extensions/trackbuilder/trackBuilder.lua:2966
---@param off integer|string 1, -1, 'first' or 'last'.
function trackbuilder_trackBuilder_tbFunctions.navigate(off) end

--- Deletes the current piece (if the index is greater than 2), rebuilds the track and steps back one piece.
---Source: lua/ge/extensions/trackbuilder/trackBuilder.lua:3020
function trackbuilder_trackBuilder_tbFunctions.pieceDeleted() end

--- Adds or replaces a piece with the interface parameters. Ctrl replaces, Shift inserts after the current piece, no key appends at the end. Puts the cursor back at the start if the track has just closed.
---Source: lua/ge/extensions/trackbuilder/trackBuilder.lua:3031
---@param replace boolean|nil true replaces, false inserts; nil is inferred from the Ctrl/Shift keys.
function trackbuilder_trackBuilder_tbFunctions.pieceUpdated(replace) end

--- Rereads the current piece's parameters and the modifier values into the interface.
---Source: lua/ge/extensions/trackbuilder/trackBuilder.lua:2983
function trackbuilder_trackBuilder_tbFunctions.refreshPieceInfo() end

--- Rereads the track's position and heading (heading converted to degrees) into the interface.
---Source: lua/ge/extensions/trackbuilder/trackBuilder.lua:3127
function trackbuilder_trackBuilder_tbFunctions.refreshTrackPositionRotation() end

--- Switches to another sub-track and selects its last piece.
---Source: lua/ge/extensions/trackbuilder/trackBuilder.lua:3135
---@param index integer Sub-track index.
function trackbuilder_trackBuilder_tbFunctions.switchSubTrack(index) end

--- Ends drive mode: free camera, markers shown again, Select mode.
---Source: lua/ge/extensions/trackbuilder/trackBuilder.lua:3117
function trackbuilder_trackBuilder_tbFunctions.unDrive() end

---@type number
i = nil
