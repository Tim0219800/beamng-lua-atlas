---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/apps/minimap/topomap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_apps_minimap_topomap` : `extensions.load("ui_apps_minimap_topomap")`, puis la globale `ui_apps_minimap_topomap`
---@class ui_apps_minimap_topomap
ui_apps_minimap_topomap = {}

---Source : lua/ge/extensions/ui/apps/minimap/topomap.lua:385
---@param td any
---@param width any
---@param height any
---@param scale any
---@param camPos any
---@param worldToMapXYZ any
function ui_apps_minimap_topomap.drawContours(td, width, height, scale, camPos, worldToMapXYZ) end

---Source : lua/ge/extensions/ui/apps/minimap/topomap.lua:415
function ui_apps_minimap_topomap.getContourQuadtree() end

---Source : lua/ge/extensions/ui/apps/minimap/topomap.lua:414
function ui_apps_minimap_topomap.getContourSegments() end

---Source : lua/ge/extensions/ui/apps/minimap/topomap.lua:413
function ui_apps_minimap_topomap.getHeightmapBounds() end

---Source : lua/ge/extensions/ui/apps/minimap/topomap.lua:412
function ui_apps_minimap_topomap.getHeightmapData() end

---Source : lua/ge/extensions/ui/apps/minimap/topomap.lua:411
function ui_apps_minimap_topomap.isLoaded() end

--- Main function to load the topo map
---Source : lua/ge/extensions/ui/apps/minimap/topomap.lua:357
function ui_apps_minimap_topomap.loadTopoMap() end

--- Reset function for mission changes
---Source : lua/ge/extensions/ui/apps/minimap/topomap.lua:418
function ui_apps_minimap_topomap.onClientEndMission() end

---Source : lua/ge/extensions/ui/apps/minimap/topomap.lua:426
function ui_apps_minimap_topomap.onClientStartMission() end

