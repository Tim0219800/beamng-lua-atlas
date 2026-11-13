---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/invisibleTrigger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_markers_invisibleTrigger` : `extensions.load("gameplay_markers_invisibleTrigger")`, puis la globale `gameplay_markers_invisibleTrigger`
---@class gameplay_markers_invisibleTrigger
gameplay_markers_invisibleTrigger = {}

--- zoneMarkers are not grouped/merged - each poi will be one cluster.
---Source : lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:81
---@param pois any
---@param allClusters any
function gameplay_markers_invisibleTrigger.cluster(pois, allClusters) end

---Source : lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:72
---@param ... any
function gameplay_markers_invisibleTrigger.create(...) end

--- Classe locale `C` de lua/ge/extensions/gameplay/markers/invisibleTrigger.lua
---@class gameplay_markers_invisibleTrigger_C
local gameplay_markers_invisibleTrigger_C = {}

--- destorys/cleans up all objects created by this
---Source : lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:68
function gameplay_markers_invisibleTrigger_C:clearObjects() end

--- creates neccesary objects
---Source : lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:60
function gameplay_markers_invisibleTrigger_C:createObjects() end

---Source : lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:63
function gameplay_markers_invisibleTrigger_C:hide() end

--- called when this object is created. initialize variables here (but dont spawn objects)
---Source : lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:11
function gameplay_markers_invisibleTrigger_C:init() end

---Source : lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:70
---@param visible any
function gameplay_markers_invisibleTrigger_C:instantFade(visible) end

--- Interactivity
---Source : lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:23
---@param interactData any
---@param interactableElements any
function gameplay_markers_invisibleTrigger_C:interactInPlayMode(interactData, interactableElements) end

---Source : lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:24
---@param interactData any
function gameplay_markers_invisibleTrigger_C:interactWhileMoving(interactData) end

---Source : lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:61
---@param value any
function gameplay_markers_invisibleTrigger_C:setHidden(value) end

---Source : lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:48
---@param cluster any
function gameplay_markers_invisibleTrigger_C:setup(cluster) end

---Source : lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:62
function gameplay_markers_invisibleTrigger_C:show() end

--- called every frame to update the visuals.
---Source : lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:14
---@param data any
function gameplay_markers_invisibleTrigger_C:update(data) end

