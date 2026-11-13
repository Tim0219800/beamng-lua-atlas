---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/walkingMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_markers_walkingMarker` : `extensions.load("gameplay_markers_walkingMarker")`, puis la globale `gameplay_markers_walkingMarker`
---@class gameplay_markers_walkingMarker
gameplay_markers_walkingMarker = {}

--- walkingmarker are clustered if the area and icon names are identical
---Source : lua/ge/extensions/gameplay/markers/walkingMarker.lua:278
---@param pois any
---@param allClusters any
function gameplay_markers_walkingMarker.cluster(pois, allClusters) end

---Source : lua/ge/extensions/gameplay/markers/walkingMarker.lua:269
---@param ... any
function gameplay_markers_walkingMarker.create(...) end

--- Classe locale `C` de lua/ge/extensions/gameplay/markers/walkingMarker.lua
---@class gameplay_markers_walkingMarker_C
local gameplay_markers_walkingMarker_C = {}

---Source : lua/ge/extensions/gameplay/markers/walkingMarker.lua:174
function gameplay_markers_walkingMarker_C:clearObjects() end

---Source : lua/ge/extensions/gameplay/markers/walkingMarker.lua:147
function gameplay_markers_walkingMarker_C:createObjects() end

---Source : lua/ge/extensions/gameplay/markers/walkingMarker.lua:204
---@param corner any
---@param x any
---@param y any
---@param z any
---@param clr any
function gameplay_markers_walkingMarker_C:drawAxisBox(corner, x, y, z, clr) end

--- minimap
---Source : lua/ge/extensions/gameplay/markers/walkingMarker.lua:262
---@param td any
function gameplay_markers_walkingMarker_C:drawOnMinimap(td) end

---Source : lua/ge/extensions/gameplay/markers/walkingMarker.lua:151
function gameplay_markers_walkingMarker_C:hide() end

---Source : lua/ge/extensions/gameplay/markers/walkingMarker.lua:21
function gameplay_markers_walkingMarker_C:init() end

---Source : lua/ge/extensions/gameplay/markers/walkingMarker.lua:200
---@param visible any
function gameplay_markers_walkingMarker_C:instantFade(visible) end

---Source : lua/ge/extensions/gameplay/markers/walkingMarker.lua:190
---@param interactData any
---@param interactableElements any
function gameplay_markers_walkingMarker_C:interactInPlayMode(interactData, interactableElements) end

---Source : lua/ge/extensions/gameplay/markers/walkingMarker.lua:25
---@param cluster any
function gameplay_markers_walkingMarker_C:setup(cluster) end

---Source : lua/ge/extensions/gameplay/markers/walkingMarker.lua:169
function gameplay_markers_walkingMarker_C:show() end

---Source : lua/ge/extensions/gameplay/markers/walkingMarker.lua:83
---@param data any
function gameplay_markers_walkingMarker_C:update(data) end

