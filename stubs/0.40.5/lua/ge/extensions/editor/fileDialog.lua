---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/fileDialog.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_fileDialog` : `extensions.load("editor_fileDialog")`, puis la globale `editor_fileDialog`
---@class editor_fileDialog
editor_fileDialog = {}

---Source : lua/ge/extensions/editor/fileDialog.lua:918
function editor_fileDialog.onEditorActivated() end

---Source : lua/ge/extensions/editor/fileDialog.lua:921
function editor_fileDialog.onEditorDeactivated() end

--- public interface
---Source : lua/ge/extensions/editor/fileDialog.lua:409
function editor_fileDialog.onEditorGui() end

---Source : lua/ge/extensions/editor/fileDialog.lua:924
function editor_fileDialog.onEditorInitialized() end

---Source : lua/ge/extensions/editor/fileDialog.lua:956
---@param prefsRegistry any
function editor_fileDialog.onEditorRegisterPreferences(prefsRegistry) end

---Source : lua/ge/extensions/editor/fileDialog.lua:915
function editor_fileDialog.onExtensionLoaded() end

---Source : lua/ge/extensions/editor/fileDialog.lua:907
---@param callbackFn any
---@param filenameSuffix any
---@param selectFolder any
---@param defaultPath any
---@param preview any
---@param caseSensitivePattern any
function editor_fileDialog.openFile(callbackFn, filenameSuffix, selectFolder, defaultPath, preview, caseSensitivePattern) end

---Source : lua/ge/extensions/editor/fileDialog.lua:911
---@param callbackFn any
---@param filenameSuffix any
---@param selectFolder any
---@param defaultPath any
---@param overwriteDialogText any
function editor_fileDialog.saveFile(callbackFn, filenameSuffix, selectFolder, defaultPath, overwriteDialogText) end

