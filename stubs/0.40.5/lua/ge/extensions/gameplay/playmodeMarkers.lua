---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/playmodeMarkers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_playmodeMarkers` : `extensions.load("gameplay_playmodeMarkers")`, puis la globale `gameplay_playmodeMarkers`
---@class gameplay_playmodeMarkers
---@field dependencies table
---@field validPlaymodeMarkersStates table
gameplay_playmodeMarkers = {}

---Source : lua/ge/extensions/gameplay/playmodeMarkers.lua:49
function gameplay_playmodeMarkers.clear() end

---Source : lua/ge/extensions/gameplay/playmodeMarkers.lua:102
function gameplay_playmodeMarkers.getBigmapRendererId() end

---Source : lua/ge/extensions/gameplay/playmodeMarkers.lua:106
function gameplay_playmodeMarkers.getBigmapRendererObj() end

---Source : lua/ge/extensions/gameplay/playmodeMarkers.lua:94
function gameplay_playmodeMarkers.getIconRendererId() end

---Source : lua/ge/extensions/gameplay/playmodeMarkers.lua:98
function gameplay_playmodeMarkers.getIconRendererObj() end

---Source : lua/ge/extensions/gameplay/playmodeMarkers.lua:178
---@param cluster any
function gameplay_playmodeMarkers.getMarkerForCluster(cluster) end

---Source : lua/ge/extensions/gameplay/playmodeMarkers.lua:153
function gameplay_playmodeMarkers.getPlaymodeClusters() end

--- change to KD Tree?
---Source : lua/ge/extensions/gameplay/playmodeMarkers.lua:164
function gameplay_playmodeMarkers.getPlaymodeClustersAsQuadtree() end

---Source : lua/ge/extensions/gameplay/playmodeMarkers.lua:196
function gameplay_playmodeMarkers.isStateWithPlaymodeMarkers() end

---Source : lua/ge/extensions/gameplay/playmodeMarkers.lua:205
function gameplay_playmodeMarkers.onClientEndMission() end

---Source : lua/ge/extensions/gameplay/playmodeMarkers.lua:79
function gameplay_playmodeMarkers.onClientStartMission() end

---Source : lua/ge/extensions/gameplay/playmodeMarkers.lua:211
function gameplay_playmodeMarkers.onSerialize() end

