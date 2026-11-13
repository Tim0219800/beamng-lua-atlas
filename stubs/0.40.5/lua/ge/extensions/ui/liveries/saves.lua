---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/liveries/saves.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_liveries_saves` : `extensions.load("ui_liveries_saves")`, puis la globale `ui_liveries_saves`
---@class ui_liveries_saves
ui_liveries_saves = {}

---Source : lua/ge/extensions/ui/liveries/saves.lua:115
function ui_liveries_saves.clearCurrentSave() end

---Source : lua/ge/extensions/ui/liveries/saves.lua:120
function ui_liveries_saves.consumeStagedApplySkin() end

---Source : lua/ge/extensions/ui/liveries/saves.lua:52
---@param filename any
function ui_liveries_saves.create(filename) end

---Source : lua/ge/extensions/ui/liveries/saves.lua:90
---@param filename any
function ui_liveries_saves.delete(filename) end

---Source : lua/ge/extensions/ui/liveries/saves.lua:32
---@param filename any
function ui_liveries_saves.exists(filename) end

---Source : lua/ge/extensions/ui/liveries/saves.lua:36
function ui_liveries_saves.getAll() end

---Source : lua/ge/extensions/ui/liveries/saves.lua:111
function ui_liveries_saves.getCurrentSaveName() end

---Source : lua/ge/extensions/ui/liveries/saves.lua:19
---@param file any
function ui_liveries_saves.getFilename(file) end

---Source : lua/ge/extensions/ui/liveries/saves.lua:163
---@param filename any
function ui_liveries_saves.load(filename) end

---Source : lua/ge/extensions/ui/liveries/saves.lua:62
---@param filename any
---@param newFilename any
function ui_liveries_saves.rename(filename, newFilename) end

---Source : lua/ge/extensions/ui/liveries/saves.lua:137
---@param filename any
---@param applySkin any
function ui_liveries_saves.save(filename, applySkin) end

