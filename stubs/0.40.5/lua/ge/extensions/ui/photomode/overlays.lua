---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/overlays.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_photomode_overlays` : `extensions.load("ui_photomode_overlays")`, puis la globale `ui_photomode_overlays`
---@class ui_photomode_overlays
ui_photomode_overlays = {}

---Source : lua/ge/extensions/ui/photomode/overlays.lua:288
---@param sourceId any
---@param destId any
function ui_photomode_overlays.cloneOverlay(sourceId, destId) end

---Source : lua/ge/extensions/ui/photomode/overlays.lua:251
---@param destId any
---@param payload any
function ui_photomode_overlays.createOverlay(destId, payload) end

---Source : lua/ge/extensions/ui/photomode/overlays.lua:494
---@param id any
function ui_photomode_overlays.deleteOverlay(id) end

---Source : lua/ge/extensions/ui/photomode/overlays.lua:206
function ui_photomode_overlays.discover() end

---Source : lua/ge/extensions/ui/photomode/overlays.lua:211
function ui_photomode_overlays.getOverlays() end

---Source : lua/ge/extensions/ui/photomode/overlays.lua:443
function ui_photomode_overlays.listLiveryGraphics() end

---Source : lua/ge/extensions/ui/photomode/overlays.lua:401
function ui_photomode_overlays.listUiApps() end

---Source : lua/ge/extensions/ui/photomode/overlays.lua:536
function ui_photomode_overlays.onExtensionLoaded() end

---Source : lua/ge/extensions/ui/photomode/overlays.lua:541
function ui_photomode_overlays.onExtensionUnloaded() end

---Source : lua/ge/extensions/ui/photomode/overlays.lua:525
---@param files any
function ui_photomode_overlays.onFilesChanged(files) end

---Source : lua/ge/extensions/ui/photomode/overlays.lua:545
function ui_photomode_overlays.onUiReady() end

---Source : lua/ge/extensions/ui/photomode/overlays.lua:316
---@param sourceId any
---@param destId any
---@param newName any
function ui_photomode_overlays.renameOverlay(sourceId, destId, newName) end

---Source : lua/ge/extensions/ui/photomode/overlays.lua:215
---@param id any
---@param payload any
function ui_photomode_overlays.saveOverlay(id, payload) end

