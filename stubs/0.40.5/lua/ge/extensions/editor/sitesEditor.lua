---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/sitesEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_sitesEditor` : `extensions.load("editor_sitesEditor")`, puis la globale `editor_sitesEditor`
---@class editor_sitesEditor
---@field onExtensionLoaded any
editor_sitesEditor = {}

---Source : lua/ge/extensions/editor/sitesEditor.lua:387
function editor_sitesEditor.allowGizmo() end

---Source : lua/ge/extensions/editor/sitesEditor.lua:389
function editor_sitesEditor.getCurrentLocation() end

---Source : lua/ge/extensions/editor/sitesEditor.lua:391
function editor_sitesEditor.getCurrentParkingSpot() end

---Source : lua/ge/extensions/editor/sitesEditor.lua:388
function editor_sitesEditor.getCurrentSites() end

---Source : lua/ge/extensions/editor/sitesEditor.lua:390
function editor_sitesEditor.getCurrentZone() end

---Source : lua/ge/extensions/editor/sitesEditor.lua:30
---@param loadPath any
function editor_sitesEditor.loadSites(loadPath) end

---Source : lua/ge/extensions/editor/sitesEditor.lua:216
function editor_sitesEditor.managerSites() end

---Source : lua/ge/extensions/editor/sitesEditor.lua:364
---@param data any
function editor_sitesEditor.onDeserialized(data) end

---Source : lua/ge/extensions/editor/sitesEditor.lua:79
function editor_sitesEditor.onEditorGui() end

---Source : lua/ge/extensions/editor/sitesEditor.lua:307
function editor_sitesEditor.onEditorInitialized() end

---Source : lua/ge/extensions/editor/sitesEditor.lua:378
---@param windowName any
function editor_sitesEditor.onEditorToolWindowGotFocus(windowName) end

---Source : lua/ge/extensions/editor/sitesEditor.lua:372
---@param windowName any
function editor_sitesEditor.onEditorToolWindowHide(windowName) end

---Source : lua/ge/extensions/editor/sitesEditor.lua:357
function editor_sitesEditor.onSerialize() end

---Source : lua/ge/extensions/editor/sitesEditor.lua:21
---@param sites any
---@param savePath any
function editor_sitesEditor.saveSites(sites, savePath) end

---Source : lua/ge/extensions/editor/sitesEditor.lua:392
---@param elem any
---@param mode any
function editor_sitesEditor.selectZone(elem, mode) end

---Source : lua/ge/extensions/editor/sitesEditor.lua:284
function editor_sitesEditor.show() end

