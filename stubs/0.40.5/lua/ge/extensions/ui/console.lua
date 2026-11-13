---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/console.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_console` : `extensions.load("ui_console")`, puis la globale `ui_console`
---@class ui_console
---@field dependencies table
---@field inputCallback any
---@field onExtensionUnloaded any
ui_console = {}

---Source : lua/ge/extensions/ui/console.lua:172
function ui_console.hide() end

---Source : lua/ge/extensions/ui/console.lua:1215
---@param data any
function ui_console.onDeserialized(data) end

---Source : lua/ge/extensions/ui/console.lua:1230
function ui_console.onExtensionLoaded() end

---Source : lua/ge/extensions/ui/console.lua:1239
---@param filename any
---@param type any
function ui_console.onFileChanged(filename, type) end

---Source : lua/ge/extensions/ui/console.lua:1199
function ui_console.onSerialize() end

---Source : lua/ge/extensions/ui/console.lua:556
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function ui_console.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/ui/console.lua:1178
function ui_console.onVehicleActiveChanged() end

---Source : lua/ge/extensions/ui/console.lua:1178
function ui_console.onVehicleDestroyed() end

---Source : lua/ge/extensions/ui/console.lua:1178
function ui_console.onVehicleSpawned() end

---Source : lua/ge/extensions/ui/console.lua:1178
function ui_console.onVehicleSwitched() end

---Source : lua/ge/extensions/ui/console.lua:168
function ui_console.show() end

---Source : lua/ge/extensions/ui/console.lua:176
function ui_console.toggle() end

---Source : lua/ge/extensions/ui/console.lua:429
---@param data any
function ConsoleInputCallback(data) end

