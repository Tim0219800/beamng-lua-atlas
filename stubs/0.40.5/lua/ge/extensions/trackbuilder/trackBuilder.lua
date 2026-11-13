---@meta
-- tim19Atlas stub generated from lua/ge/extensions/trackbuilder/trackBuilder.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `trackbuilder_trackBuilder` : `extensions.load("trackbuilder_trackBuilder")`, puis la globale `trackbuilder_trackBuilder`
---@class trackbuilder_trackBuilder
trackbuilder_trackBuilder = {}

---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3577
---@param levelName any
---@param forceLoad any
function trackbuilder_trackBuilder.enter(levelName, forceLoad) end

---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3599
function trackbuilder_trackBuilder.exit() end

---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3609
function trackbuilder_trackBuilder.exitToMainMenu() end

---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3530
function trackbuilder_trackBuilder.hideTrackBuilder() end

---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3573
function trackbuilder_trackBuilder.isActive() end

---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3631
function trackbuilder_trackBuilder.onClientEndMission() end

---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3617
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function trackbuilder_trackBuilder.onRouteEnter(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3625
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function trackbuilder_trackBuilder.onRouteLeave(context, toRoute, fromRoute, data) end

--- shows either the main window, the drive window or nothing when a screenshot is taken.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:2894
function trackbuilder_trackBuilder.onUpdate() end

---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3343
---@param size any
function trackbuilder_trackBuilder.onWindowResized(size) end

---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3521
function trackbuilder_trackBuilder.showTrackBuilder() end

---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3477
---@param show any
function trackbuilder_trackBuilder.showTrackBuilderWindow(show) end

---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3552
function trackbuilder_trackBuilder.toggleTrackBuilder() end

--- Classe locale `tbFunctions` de lua/ge/extensions/trackbuilder/trackBuilder.lua
---@class trackbuilder_trackBuilder_tbFunctions
local trackbuilder_trackBuilder_tbFunctions = {}

--- starts the drive mode.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3102
---@param index any
function trackbuilder_trackBuilder_tbFunctions.drive(index) end

---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3148
---@param segments any
function trackbuilder_trackBuilder_tbFunctions.mergeMultiTrack(segments) end

--- called after a modifier is changed.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3070
---@param field any
function trackbuilder_trackBuilder_tbFunctions.modifierChange(field) end

--- called when a modifier is removed.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3078
---@param field any
function trackbuilder_trackBuilder_tbFunctions.modifierRemove(field) end

--- shifts a modifier forward or backward.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3085
---@param name any
---@param offset any
function trackbuilder_trackBuilder_tbFunctions.modifierShift(name, offset) end

--- moved the cursor by a given amount.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:2966
---@param off any
function trackbuilder_trackBuilder_tbFunctions.navigate(off) end

--- attempts to delete a piece.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3020
function trackbuilder_trackBuilder_tbFunctions.pieceDeleted() end

--- called when a parameter of a piece is changed.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3031
---@param replace any
function trackbuilder_trackBuilder_tbFunctions.pieceUpdated(replace) end

--- reads all the infos of the current piece, including modifiers.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:2983
function trackbuilder_trackBuilder_tbFunctions.refreshPieceInfo() end

--- refreshes the track position and rotation.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3127
function trackbuilder_trackBuilder_tbFunctions.refreshTrackPositionRotation() end

---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3135
---@param index any
function trackbuilder_trackBuilder_tbFunctions.switchSubTrack(index) end

--- ends the drive mode.
---Source : lua/ge/extensions/trackbuilder/trackBuilder.lua:3117
function trackbuilder_trackBuilder_tbFunctions.unDrive() end

---@type number
i = nil
