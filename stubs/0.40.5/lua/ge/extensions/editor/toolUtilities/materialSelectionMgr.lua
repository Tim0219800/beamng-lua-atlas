---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/materialSelectionMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_materialSelectionMgr` : `extensions.load("editor_toolUtilities_materialSelectionMgr")`, puis la globale `editor_toolUtilities_materialSelectionMgr`
---@class editor_toolUtilities_materialSelectionMgr
editor_toolUtilities_materialSelectionMgr = {}

--- Closes the material selection window.
---Source : lua/ge/extensions/editor/toolUtilities/materialSelectionMgr.lua:63
function editor_toolUtilities_materialSelectionMgr.closeWindow() end

--- Gets the texture object for a given absolute path.
---Source : lua/ge/extensions/editor/toolUtilities/materialSelectionMgr.lua:43
---@param absPath any
function editor_toolUtilities_materialSelectionMgr.getTexObj(absPath) end

--- Handles the material selection window.
---Source : lua/ge/extensions/editor/toolUtilities/materialSelectionMgr.lua:66
---@param isDecal any
---@param onSelectMaterialFunct any
function editor_toolUtilities_materialSelectionMgr.handleMaterialSelectionSubWindow(isDecal, onSelectMaterialFunct) end

--- Opens the material selection window.
---Source : lua/ge/extensions/editor/toolUtilities/materialSelectionMgr.lua:60
function editor_toolUtilities_materialSelectionMgr.openWindow() end

--- Registers the material selection window.
---Source : lua/ge/extensions/editor/toolUtilities/materialSelectionMgr.lua:57
function editor_toolUtilities_materialSelectionMgr.registerWindow() end

