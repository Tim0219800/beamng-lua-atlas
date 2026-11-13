---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/apps/minimap/minimap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_apps_minimap_minimap` : `extensions.load("ui_apps_minimap_minimap")`, puis la globale `ui_apps_minimap_minimap`
---@class ui_apps_minimap_minimap
---@field dependencies table
---@field onUpdate any
ui_apps_minimap_minimap = {}

---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:720
function ui_apps_minimap_minimap.drawDebugOverlay() end

---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:668
---@param offsetX any
---@param offsetY any
function ui_apps_minimap_minimap.drawOcclusion(offsetX, offsetY) end

--- Getter for debugSettingsData
---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:832
function ui_apps_minimap_minimap.getDebugSettingsData() end

---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:747
function ui_apps_minimap_minimap.getMode() end

---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:41
function ui_apps_minimap_minimap.getScale() end

---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:812
function ui_apps_minimap_minimap.hide() end

---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:836
function ui_apps_minimap_minimap.onClientEndMission() end

---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:844
function ui_apps_minimap_minimap.onClientStartMission() end

---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:11
function ui_apps_minimap_minimap.onInit() end

---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:758
---@param m any
function ui_apps_minimap_minimap.onMinimapSettingsChanged(m) end

---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:803
---@param id any
function ui_apps_minimap_minimap.resetOcclusionTransform(id) end

--- Function to set custom buffers for each direction
---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:771
---@param left any
---@param right any
---@param top any
---@param bottom any
function ui_apps_minimap_minimap.setBuffers(left, right, top, bottom) end

---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:778
---@param x any
---@param y any
---@param width any
---@param height any
function ui_apps_minimap_minimap.setDrawTransform(x, y, width, height) end

---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:795
---@param id any
---@param x any
---@param y any
---@param width any
---@param height any
function ui_apps_minimap_minimap.setOcclusionTransform(id, x, y, width, height) end

---Source : lua/ge/extensions/ui/apps/minimap/minimap.lua:820
function ui_apps_minimap_minimap.toggledebugSettings() end

