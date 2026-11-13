---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/engineAudioDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_engineAudioDebug` : `extensions.load("editor_engineAudioDebug")`, puis la globale `editor_engineAudioDebug`
---@class editor_engineAudioDebug
---@field onDebugDrawActive any
---@field onUpdate any
editor_engineAudioDebug = {}

---Source : lua/ge/extensions/editor/engineAudioDebug.lua:297
function editor_engineAudioDebug.onEditorActivated() end

---Source : lua/ge/extensions/editor/engineAudioDebug.lua:290
function editor_engineAudioDebug.onEditorDeactivated() end

---Source : lua/ge/extensions/editor/engineAudioDebug.lua:279
function editor_engineAudioDebug.onEditorInitialized() end

---Source : lua/ge/extensions/editor/engineAudioDebug.lua:301
---@param windowName any
function editor_engineAudioDebug.onEditorToolWindowHide(windowName) end

---Source : lua/ge/extensions/editor/engineAudioDebug.lua:308
---@param windowName any
function editor_engineAudioDebug.onEditorToolWindowShow(windowName) end

--- called when the extension is loaded (might be invisible still)
---Source : lua/ge/extensions/editor/engineAudioDebug.lua:275
function editor_engineAudioDebug.onExtensionLoaded() end

---Source : lua/ge/extensions/editor/engineAudioDebug.lua:284
---@param oldVehicle any
---@param newVehicle any
---@param player any
function editor_engineAudioDebug.onVehicleSwitched(oldVehicle, newVehicle, player) end

--- helper function to open the window
---Source : lua/ge/extensions/editor/engineAudioDebug.lua:269
function editor_engineAudioDebug.open() end

