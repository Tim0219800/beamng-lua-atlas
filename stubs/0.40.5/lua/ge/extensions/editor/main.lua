---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/main.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_main` : `extensions.load("editor_main")`, puis la globale `editor_main`
---@class editor_main
---@field active boolean
---@field additionalActionMaps table
---@field allExtensionNames table
---@field dependencies table
---@field extensionNames table
---@field initialized boolean
---@field preferencesRegistry any
---@field safeMode boolean
editor_main = {}

---Source : lua/ge/extensions/editor/main.lua:294
function editor_main.initializeModules() end

---Source : lua/ge/extensions/editor/main.lua:594
function editor_main.isEditorActive() end

---Source : lua/ge/extensions/editor/main.lua:140
---@param name any
function editor_main.loadEditorExtension(name) end

---Source : lua/ge/extensions/editor/main.lua:171
---@param names any
function editor_main.loadEditorExtensions(names) end

---Source : lua/ge/extensions/editor/main.lua:85
function editor_main.loadExtensionsSettings() end

---Source : lua/ge/extensions/editor/main.lua:74
function editor_main.loadPreferences() end

---Source : lua/ge/extensions/editor/main.lua:368
---@param filePath any
function editor_main.loadState(filePath) end

---Source : lua/ge/extensions/editor/main.lua:50
---@param msg any
function editor_main.log(msg) end

---Source : lua/ge/extensions/editor/main.lua:54
---@param msg any
function editor_main.logDebug(msg) end

---Source : lua/ge/extensions/editor/main.lua:58
---@param msg any
function editor_main.logError(msg) end

---Source : lua/ge/extensions/editor/main.lua:50
---@param msg any
function editor_main.logInfo(msg) end

---Source : lua/ge/extensions/editor/main.lua:62
---@param msg any
function editor_main.logWarn(msg) end

---Source : lua/ge/extensions/editor/main.lua:623
function editor_main.onClientEndMission() end

---Source : lua/ge/extensions/editor/main.lua:608
function editor_main.onClientStartMission() end

---Source : lua/ge/extensions/editor/main.lua:733
---@param data any
function editor_main.onDeserialized(data) end

---Source : lua/ge/extensions/editor/main.lua:678
function editor_main.onExit() end

---Source : lua/ge/extensions/editor/main.lua:683
function editor_main.onExtensionLoaded() end

---Source : lua/ge/extensions/editor/main.lua:686
function editor_main.onExtensionUnloaded() end

---Source : lua/ge/extensions/editor/main.lua:747
function editor_main.onFirstUpdate() end

---Source : lua/ge/extensions/editor/main.lua:620
function editor_main.onPreExit() end

---Source : lua/ge/extensions/editor/main.lua:614
function editor_main.onPreWindowClose() end

---Source : lua/ge/extensions/editor/main.lua:690
function editor_main.onSerialize() end

---Source : lua/ge/extensions/editor/main.lua:634
function editor_main.onUpdate() end

---Source : lua/ge/extensions/editor/main.lua:89
function editor_main.saveExtensionsSettings() end

---Source : lua/ge/extensions/editor/main.lua:81
function editor_main.savePreferences() end

---Source : lua/ge/extensions/editor/main.lua:356
---@param filePath any
function editor_main.saveState(filePath) end

---Source : lua/ge/extensions/editor/main.lua:587
---@param activate any
---@param safeMode any
function editor_main.setEditorActive(activate, safeMode) end

---Source : lua/ge/extensions/editor/main.lua:598
function editor_main.shutdown() end

---Source : lua/ge/extensions/editor/main.lua:674
---@param safeMode any
function editor_main.toggleActive(safeMode) end

---Source : lua/ge/extensions/editor/main.lua:213
---@param extName any
function editor_main.unloadEditorExtension(extName) end

---@type any
editor = nil
