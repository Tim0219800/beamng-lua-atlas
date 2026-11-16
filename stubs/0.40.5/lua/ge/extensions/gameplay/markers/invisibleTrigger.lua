---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/invisibleTrigger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Invisible spherical trigger: from an invisibleTrigger POI (pos, radius, onEnter, onInside, onExit), calls the Lua callbacks when a player's vehicle enters the sphere, stays in it, or leaves it. The inside/outside state is tracked per player (multiseat) and kept by cluster id. The module returns {create, cluster}. Useful for gameplay triggers without any visual.
--- Access: extension `gameplay_markers_invisibleTrigger`: `extensions.load("gameplay_markers_invisibleTrigger")`, then the global `gameplay_markers_invisibleTrigger`
---@class gameplay_markers_invisibleTrigger
gameplay_markers_invisibleTrigger = {}

--- Turns each invisibleTrigger POI into a distinct cluster (no merging) and adds it to allClusters.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:81
---@param pois table[] POIs with markerInfo.invisibleTrigger {pos, radius, onEnter, onInside, onExit}.
---@param allClusters table[] List of clusters completed in place.
function gameplay_markers_invisibleTrigger.cluster(pois, allClusters) end

--- Builds an invisible trigger marker (instance of C).
---Source: lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:72
---@param ... any Arguments passed to C:init (unused).
---@return table  Marker instance.
function gameplay_markers_invisibleTrigger.create(...) end

--- Spherical trigger without visual.
---@class gameplay_markers_invisibleTrigger_C
local gameplay_markers_invisibleTrigger_C = {}

--- Does nothing.
---Source: lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:68
function gameplay_markers_invisibleTrigger_C:clearObjects() end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:60
function gameplay_markers_invisibleTrigger_C:createObjects() end

--- Clears the inside/outside state of all players for this cluster.
---Source: lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:63
function gameplay_markers_invisibleTrigger_C:hide() end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:11
function gameplay_markers_invisibleTrigger_C:init() end

--- Does nothing.
---Source: lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:70
---@param visible boolean Ignored.
function gameplay_markers_invisibleTrigger_C:instantFade(visible) end

--- Does nothing.
---Source: lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:23
---@param interactData table Ignored.
---@param interactableElements table[] Ignored.
function gameplay_markers_invisibleTrigger_C:interactInPlayMode(interactData, interactableElements) end

--- Called every frame: if the player's vehicle is in the sphere, calls onEnter (on the first frame inside) then onInside; when leaving, calls onExit.
---Source: lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:24
---@param interactData table Frame data: vehPos, isWalking, playerIndex.
function gameplay_markers_invisibleTrigger_C:interactWhileMoving(interactData) end

--- Does nothing.
---Source: lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:61
---@param value boolean Ignored.
function gameplay_markers_invisibleTrigger_C:setHidden(value) end

--- Stores cluster, pos, radius and the three callbacks; links the per-player inside/outside state to that of the cluster id.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:48
---@param cluster table Cluster from cluster().
function gameplay_markers_invisibleTrigger_C:setup(cluster) end

--- Does nothing.
---Source: lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:62
function gameplay_markers_invisibleTrigger_C:show() end

--- Does nothing (the debug drawing is commented out).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:14
---@param data table Ignored.
function gameplay_markers_invisibleTrigger_C:update(data) end

