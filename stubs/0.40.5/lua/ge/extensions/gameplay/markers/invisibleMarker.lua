---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/invisibleMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/markers/invisibleMarker.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_markers_invisibleMarker
local gameplay_markers_invisibleMarker = {}

--- destorys/cleans up all objects created by this
---Source : lua/ge/extensions/gameplay/markers/invisibleMarker.lua:38
function gameplay_markers_invisibleMarker:clearObjects() end

--- creates neccesary objects
---Source : lua/ge/extensions/gameplay/markers/invisibleMarker.lua:23
function gameplay_markers_invisibleMarker:createObjects() end

---Source : lua/ge/extensions/gameplay/markers/invisibleMarker.lua:30
function gameplay_markers_invisibleMarker:hide() end

--- called when this object is created. initialize variables here (but dont spawn objects)
---Source : lua/ge/extensions/gameplay/markers/invisibleMarker.lua:8
function gameplay_markers_invisibleMarker:init() end

---Source : lua/ge/extensions/gameplay/markers/invisibleMarker.lua:42
---@param visible any
function gameplay_markers_invisibleMarker:instantFade(visible) end

--- Interactivity
---Source : lua/ge/extensions/gameplay/markers/invisibleMarker.lua:47
---@param interactData any
---@param interactableElements any
function gameplay_markers_invisibleMarker:interactInPlayMode(interactData, interactableElements) end

---Source : lua/ge/extensions/gameplay/markers/invisibleMarker.lua:27
---@param value any
function gameplay_markers_invisibleMarker:setHidden(value) end

---Source : lua/ge/extensions/gameplay/markers/invisibleMarker.lua:18
---@param cluster any
function gameplay_markers_invisibleMarker:setup(cluster) end

---Source : lua/ge/extensions/gameplay/markers/invisibleMarker.lua:33
function gameplay_markers_invisibleMarker:show() end

--- called every frame to update the visuals.
---Source : lua/ge/extensions/gameplay/markers/invisibleMarker.lua:13
---@param data any
function gameplay_markers_invisibleMarker:update(data) end

