---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/assetBrowser.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_assetBrowser` : `extensions.load("editor_assetBrowser")`, puis la globale `editor_assetBrowser`
---@class editor_assetBrowser
editor_assetBrowser = {}

---Source : lua/ge/extensions/editor/assetBrowser.lua:813
function editor_assetBrowser.clearSelectedAsset() end

---Source : lua/ge/extensions/editor/assetBrowser.lua:1736
---@param path any
function editor_assetBrowser.getAssetByPath(path) end

---Source : lua/ge/extensions/editor/assetBrowser.lua:809
function editor_assetBrowser.getSelectedAsset() end

---Source : lua/ge/extensions/editor/assetBrowser.lua:5819
---@param up any
function editor_assetBrowser.moveSelectionIndex(up) end

---Source : lua/ge/extensions/editor/assetBrowser.lua:5255
function editor_assetBrowser.onEditorActivated() end

---Source : lua/ge/extensions/editor/assetBrowser.lua:5407
function editor_assetBrowser.onEditorGui() end

---Source : lua/ge/extensions/editor/assetBrowser.lua:5213
function editor_assetBrowser.onEditorInitialized() end

---Source : lua/ge/extensions/editor/assetBrowser.lua:5595
---@param path any
---@param value any
function editor_assetBrowser.onEditorPreferenceValueChanged(path, value) end

---Source : lua/ge/extensions/editor/assetBrowser.lua:5651
---@param prefsRegistry any
function editor_assetBrowser.onEditorRegisterPreferences(prefsRegistry) end

---Source : lua/ge/extensions/editor/assetBrowser.lua:5624
---@param windowName any
function editor_assetBrowser.onEditorToolWindowGotFocus(windowName) end

---Source : lua/ge/extensions/editor/assetBrowser.lua:5630
---@param windowName any
function editor_assetBrowser.onEditorToolWindowLostFocus(windowName) end

---Source : lua/ge/extensions/editor/assetBrowser.lua:5313
---@param path any
---@param type any
function editor_assetBrowser.onFileChanged(path, type) end

--- public interface
---Source : lua/ge/extensions/editor/assetBrowser.lua:1673
---@param path any
function editor_assetBrowser.selectFileByPath(path) end

