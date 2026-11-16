---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/invisibleMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- No-op marker, instance returned by the module's constructor.
---@class gameplay_markers_invisibleMarker
local gameplay_markers_invisibleMarker = {}

--- Does nothing.
---Source: lua/ge/extensions/gameplay/markers/invisibleMarker.lua:38
function gameplay_markers_invisibleMarker:clearObjects() end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/invisibleMarker.lua:23
function gameplay_markers_invisibleMarker:createObjects() end

--- Does nothing.
---Source: lua/ge/extensions/gameplay/markers/invisibleMarker.lua:30
function gameplay_markers_invisibleMarker:hide() end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/invisibleMarker.lua:8
function gameplay_markers_invisibleMarker:init() end

--- Does nothing.
---Source: lua/ge/extensions/gameplay/markers/invisibleMarker.lua:42
---@param visible boolean Ignored.
function gameplay_markers_invisibleMarker:instantFade(visible) end

--- Does nothing: adds no interactive element.
---Source: lua/ge/extensions/gameplay/markers/invisibleMarker.lua:47
---@param interactData table Ignored.
---@param interactableElements table[] Ignored.
function gameplay_markers_invisibleMarker:interactInPlayMode(interactData, interactableElements) end

--- Does nothing.
---Source: lua/ge/extensions/gameplay/markers/invisibleMarker.lua:27
---@param value boolean Ignored.
function gameplay_markers_invisibleMarker:setHidden(value) end

--- Stores the cluster in self.cluster.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/invisibleMarker.lua:18
---@param cluster table Associated cluster.
function gameplay_markers_invisibleMarker:setup(cluster) end

--- Does nothing.
---Source: lua/ge/extensions/gameplay/markers/invisibleMarker.lua:33
function gameplay_markers_invisibleMarker:show() end

--- Does nothing (called every frame by the marker manager).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/invisibleMarker.lua:13
---@param data table Frame data (ignored).
function gameplay_markers_invisibleMarker:update(data) end

