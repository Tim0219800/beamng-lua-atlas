---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/gizmo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_gizmo` : `extensions.load("editor_toolUtilities_gizmo")`, puis la globale `editor_toolUtilities_gizmo`
---@class editor_toolUtilities_gizmo
editor_toolUtilities_gizmo = {}

--- Handles the gizmo for translation.
---Source : lua/ge/extensions/editor/toolUtilities/gizmo.lua:112
---@param isRotEnabledIn any
---@param selectedSplineIdx any
---@param selectedNodeIdx any
---@param splinesIn any
---@param isConformToTerrainIn any
---@param isRigidIn any
---@param deepCopyFunctIn any
---@param undoFunctIn any
---@param redoFunctIn any
---@param commitHistoryOverrideIn any
---@param anchorPosIn any
function editor_toolUtilities_gizmo.handleGizmo(isRotEnabledIn, selectedSplineIdx, selectedNodeIdx, splinesIn, isConformToTerrainIn, isRigidIn, deepCopyFunctIn, undoFunctIn, redoFunctIn, commitHistoryOverrideIn, anchorPosIn) end

--- True while an axis-gizmo drag (translate/rotate) is in progress.
---Source : lua/ge/extensions/editor/toolUtilities/gizmo.lua:170
function editor_toolUtilities_gizmo.isDragging() end

