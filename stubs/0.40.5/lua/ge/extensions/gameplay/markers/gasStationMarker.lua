---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/gasStationMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_markers_gasStationMarker` : `extensions.load("gameplay_markers_gasStationMarker")`, puis la globale `gameplay_markers_gasStationMarker`
---@class gameplay_markers_gasStationMarker
gameplay_markers_gasStationMarker = {}

--- gasstationMarkers are not grouped/merged - each poi will be one cluster.
---Source : lua/ge/extensions/gameplay/markers/gasStationMarker.lua:233
---@param pois any
---@param allClusters any
function gameplay_markers_gasStationMarker.cluster(pois, allClusters) end

---Source : lua/ge/extensions/gameplay/markers/gasStationMarker.lua:224
---@param ... any
function gameplay_markers_gasStationMarker.create(...) end

--- Classe locale `C` de lua/ge/extensions/gameplay/markers/gasStationMarker.lua
---@class gameplay_markers_gasStationMarker_C
local gameplay_markers_gasStationMarker_C = {}

---Source : lua/ge/extensions/gameplay/markers/gasStationMarker.lua:135
function gameplay_markers_gasStationMarker_C:clearObjects() end

---Source : lua/ge/extensions/gameplay/markers/gasStationMarker.lua:113
function gameplay_markers_gasStationMarker_C:createObjects() end

---Source : lua/ge/extensions/gameplay/markers/gasStationMarker.lua:159
---@param corner any
---@param x any
---@param y any
---@param z any
---@param clr any
function gameplay_markers_gasStationMarker_C:drawAxisBox(corner, x, y, z, clr) end

--- minimap
---Source : lua/ge/extensions/gameplay/markers/gasStationMarker.lua:218
---@param td any
function gameplay_markers_gasStationMarker_C:drawOnMinimap(td) end

---Source : lua/ge/extensions/gameplay/markers/gasStationMarker.lua:117
function gameplay_markers_gasStationMarker_C:hide() end

---Source : lua/ge/extensions/gameplay/markers/gasStationMarker.lua:19
function gameplay_markers_gasStationMarker_C:init() end

---Source : lua/ge/extensions/gameplay/markers/gasStationMarker.lua:155
---@param visible any
function gameplay_markers_gasStationMarker_C:instantFade(visible) end

---Source : lua/ge/extensions/gameplay/markers/gasStationMarker.lua:145
---@param interactData any
---@param interactableElements any
function gameplay_markers_gasStationMarker_C:interactInPlayMode(interactData, interactableElements) end

---Source : lua/ge/extensions/gameplay/markers/gasStationMarker.lua:23
---@param cluster any
function gameplay_markers_gasStationMarker_C:setup(cluster) end

---Source : lua/ge/extensions/gameplay/markers/gasStationMarker.lua:130
function gameplay_markers_gasStationMarker_C:show() end

---Source : lua/ge/extensions/gameplay/markers/gasStationMarker.lua:79
---@param data any
function gameplay_markers_gasStationMarker_C:update(data) end

